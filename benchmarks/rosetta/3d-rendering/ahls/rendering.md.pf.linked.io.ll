; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.Triangle_2D = type { i8, i8, i8, i8, i8, i8, i8 }
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.CandidatePixel = type { i8, i8, i8, i8 }
%struct.Pixel = type { i8, i8, i8 }

@ops = global %struct.BinOpInfo* null, align 8
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf|\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer = internal global [256 x [256 x i8]] zeroinitializer, align 1, !dbg !0
@filename = private constant [15 x i8] c"data_stats.txt\00"
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.4 = private unnamed_addr constant [28 x i8] c"Failed to open input file!\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [46 x i8] c"%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu\0A\00", align 1
@.str.3.8 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Image After Rendering: \0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  %call = call double @pow(double %13, double 2.000000e+00) #19
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
  %call15 = call double @pow(double %conv14, double 2.000000e+00) #19
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
  %call31 = call double @pow(double %conv30, double 2.000000e+00) #19
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
  %call49 = call double @sqrt(double %59) #19
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
  %call55 = call noalias i8* @malloc(i64 64) #19
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
  %call63 = call double @pow(double %76, double 2.000000e+00) #19
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
  %call71 = call double @pow(double %conv70, double 2.000000e+00) #19
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
  %call77 = call double @pow(double %conv76, double 2.000000e+00) #19
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
  call void @free(i8* %27) #19
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

; Function Attrs: nounwind
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %triangle_2d) #3 !dbg !44 {
entry:
  %"1.cw" = alloca i32, align 4, !opID !57, !stats.instNumber !58, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !60, metadata !DIExpression()), !dbg !61, !opID !62, !stats.instNumber !63, !opSignedness !59
  %"3." = bitcast i32* %"1.cw" to i8*, !dbg !64, !opID !65, !stats.instNumber !66, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"3.") #19, !dbg !64, !opID !67, !stats.instNumber !68, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"1.cw", metadata !69, metadata !DIExpression()), !dbg !70, !opID !71, !stats.instNumber !72, !opSignedness !59
  %"6.x2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !73, !opID !74, !stats.instNumber !75, !opSignedness !59
  %"7." = load i8, i8* %"6.x2", align 1, !dbg !73, !opID !76, !stats.instNumber !77, !opSignedness !59
  %"8.conv" = zext i8 %"7." to i32, !dbg !78, !opID !79, !stats.instNumber !80, !opSignedness !59
  %"9.x0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !81, !opID !82, !stats.instNumber !83, !opSignedness !59
  %"10." = load i8, i8* %"9.x0", align 1, !dbg !81, !opID !84, !stats.instNumber !85, !opSignedness !59
  %"11.conv1" = zext i8 %"10." to i32, !dbg !86, !opID !87, !stats.instNumber !88, !opSignedness !59
  %"12.sub" = sub i32 %"8.conv", %"11.conv1", !dbg !89, !opID !90, !stats.instNumber !91, !opSignedness !59
  %0 = sext i32 %"12.sub" to i64, !dbg !92
  call void @profOp(i64 12, i8 13, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !92
  %"13.y1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !92, !opID !93, !stats.instNumber !94, !opSignedness !59
  %"14." = load i8, i8* %"13.y1", align 1, !dbg !92, !opID !95, !stats.instNumber !96, !opSignedness !59
  %"15.conv2" = zext i8 %"14." to i32, !dbg !97, !opID !98, !stats.instNumber !99, !opSignedness !59
  %"16.y0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !100, !opID !101, !stats.instNumber !102, !opSignedness !59
  %"17." = load i8, i8* %"16.y0", align 1, !dbg !100, !opID !103, !stats.instNumber !104, !opSignedness !59
  %"18.conv3" = zext i8 %"17." to i32, !dbg !105, !opID !106, !stats.instNumber !107, !opSignedness !59
  %"19.sub4" = sub i32 %"15.conv2", %"18.conv3", !dbg !108, !opID !109, !stats.instNumber !110, !opSignedness !59
  %1 = sext i32 %"19.sub4" to i64, !dbg !111
  call void @profOp(i64 19, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !111
  %"20.mul" = mul i32 %"12.sub", %"19.sub4", !dbg !111, !opID !112, !stats.instNumber !113, !opSignedness !59
  %2 = sext i32 %"20.mul" to i64, !dbg !114
  call void @profOp(i64 20, i8 15, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !114
  %"21.y2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !114, !opID !115, !stats.instNumber !116, !opSignedness !59
  %"22." = load i8, i8* %"21.y2", align 1, !dbg !114, !opID !117, !stats.instNumber !118, !opSignedness !59
  %"23.conv5" = zext i8 %"22." to i32, !dbg !119, !opID !120, !stats.instNumber !121, !opSignedness !59
  %"24.y06" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !122, !opID !123, !stats.instNumber !124, !opSignedness !59
  %"25." = load i8, i8* %"24.y06", align 1, !dbg !122, !opID !125, !stats.instNumber !126, !opSignedness !59
  %"26.conv7" = zext i8 %"25." to i32, !dbg !127, !opID !128, !stats.instNumber !129, !opSignedness !59
  %"27.sub8" = sub i32 %"23.conv5", %"26.conv7", !dbg !130, !opID !131, !stats.instNumber !132, !opSignedness !59
  %3 = sext i32 %"27.sub8" to i64, !dbg !133
  call void @profOp(i64 27, i8 13, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !133
  %"28.x1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !133, !opID !134, !stats.instNumber !135, !opSignedness !59
  %"29." = load i8, i8* %"28.x1", align 1, !dbg !133, !opID !136, !stats.instNumber !137, !opSignedness !59
  %"30.conv9" = zext i8 %"29." to i32, !dbg !138, !opID !139, !stats.instNumber !140, !opSignedness !59
  %"31.x010" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !141, !opID !142, !stats.instNumber !143, !opSignedness !59
  %"32." = load i8, i8* %"31.x010", align 1, !dbg !141, !opID !144, !stats.instNumber !145, !opSignedness !59
  %"33.conv11" = zext i8 %"32." to i32, !dbg !146, !opID !147, !stats.instNumber !148, !opSignedness !59
  %"34.sub12" = sub i32 %"30.conv9", %"33.conv11", !dbg !149, !opID !150, !stats.instNumber !151, !opSignedness !59
  %4 = sext i32 %"34.sub12" to i64, !dbg !152
  call void @profOp(i64 34, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !152
  %"35.mul13" = mul i32 %"27.sub8", %"34.sub12", !dbg !152, !opID !153, !stats.instNumber !154, !opSignedness !59
  %5 = sext i32 %"35.mul13" to i64, !dbg !155
  call void @profOp(i64 35, i8 15, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !155
  %"36.sub14" = sub i32 %"20.mul", %"35.mul13", !dbg !155, !opID !156, !stats.instNumber !157, !opSignedness !59
  %6 = sext i32 %"36.sub14" to i64, !dbg !158
  call void @profOp(i64 36, i8 13, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !158
  store i32 %"36.sub14", i32* %"1.cw", align 4, !dbg !158, !opID !159, !stats.instNumber !160, !opSignedness !59
  %"38." = load i32, i32* %"1.cw", align 4, !dbg !161, !opID !162, !stats.instNumber !163, !opSignedness !59
  %"39." = bitcast i32* %"1.cw" to i8*, !dbg !164, !opID !165, !stats.instNumber !166, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"39.") #19, !dbg !164, !opID !167, !stats.instNumber !168, !opSignedness !59
  ret i32 %"38.", !dbg !169, !opID !170, !stats.instNumber !171, !opSignedness !59
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #5

; Function Attrs: nounwind
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d) #6 !dbg !172 {
entry:
  %"42.triangle_2d.addr" = alloca %struct.Triangle_2D*, align 8, !opID !176, !stats.instNumber !177, !opSignedness !59
  %"43.tmp_x" = alloca i8, align 1, !opID !178, !stats.instNumber !179, !opSignedness !59
  %"44.tmp_y" = alloca i8, align 1, !opID !180, !stats.instNumber !181, !opSignedness !59
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !opID !182, !stats.instNumber !183, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %"42.triangle_2d.addr", metadata !184, metadata !DIExpression()), !dbg !185, !opID !186, !stats.instNumber !187, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"43.tmp_x") #19, !dbg !188, !opID !189, !stats.instNumber !190, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"43.tmp_x", metadata !191, metadata !DIExpression()), !dbg !192, !opID !193, !stats.instNumber !194, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"44.tmp_y") #19, !dbg !188, !opID !195, !stats.instNumber !196, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"44.tmp_y", metadata !197, metadata !DIExpression()), !dbg !198, !opID !199, !stats.instNumber !200, !opSignedness !59
  %"51." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !201, !opID !202, !stats.instNumber !203, !opSignedness !59
  %"52.x0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"51.", i32 0, i32 0, !dbg !204, !opID !205, !stats.instNumber !206, !opSignedness !59
  %"53." = load i8, i8* %"52.x0", align 1, !dbg !204, !opID !207, !stats.instNumber !208, !opSignedness !59
  store i8 %"53.", i8* %"43.tmp_x", align 1, !dbg !209, !opID !210, !stats.instNumber !211, !opSignedness !59
  %"55." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !212, !opID !213, !stats.instNumber !214, !opSignedness !59
  %"56.y0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"55.", i32 0, i32 1, !dbg !215, !opID !216, !stats.instNumber !217, !opSignedness !59
  %"57." = load i8, i8* %"56.y0", align 1, !dbg !215, !opID !218, !stats.instNumber !219, !opSignedness !59
  store i8 %"57.", i8* %"44.tmp_y", align 1, !dbg !220, !opID !221, !stats.instNumber !222, !opSignedness !59
  %"59." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !223, !opID !224, !stats.instNumber !225, !opSignedness !59
  %"60.x1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"59.", i32 0, i32 2, !dbg !226, !opID !227, !stats.instNumber !228, !opSignedness !59
  %"61." = load i8, i8* %"60.x1", align 1, !dbg !226, !opID !229, !stats.instNumber !230, !opSignedness !59
  %"62." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !231, !opID !232, !stats.instNumber !233, !opSignedness !59
  %"63.x01" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"62.", i32 0, i32 0, !dbg !234, !opID !235, !stats.instNumber !236, !opSignedness !59
  store i8 %"61.", i8* %"63.x01", align 1, !dbg !237, !opID !238, !stats.instNumber !239, !opSignedness !59
  %"65." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !240, !opID !241, !stats.instNumber !242, !opSignedness !59
  %"66.y1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"65.", i32 0, i32 3, !dbg !243, !opID !244, !stats.instNumber !245, !opSignedness !59
  %"67." = load i8, i8* %"66.y1", align 1, !dbg !243, !opID !246, !stats.instNumber !247, !opSignedness !59
  %"68." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !248, !opID !249, !stats.instNumber !250, !opSignedness !59
  %"69.y02" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"68.", i32 0, i32 1, !dbg !251, !opID !252, !stats.instNumber !253, !opSignedness !59
  store i8 %"67.", i8* %"69.y02", align 1, !dbg !254, !opID !255, !stats.instNumber !256, !opSignedness !59
  %"71." = load i8, i8* %"43.tmp_x", align 1, !dbg !257, !opID !258, !stats.instNumber !259, !opSignedness !59
  %"72." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !260, !opID !261, !stats.instNumber !262, !opSignedness !59
  %"73.x13" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"72.", i32 0, i32 2, !dbg !263, !opID !264, !stats.instNumber !265, !opSignedness !59
  store i8 %"71.", i8* %"73.x13", align 1, !dbg !266, !opID !267, !stats.instNumber !268, !opSignedness !59
  %"75." = load i8, i8* %"44.tmp_y", align 1, !dbg !269, !opID !270, !stats.instNumber !271, !opSignedness !59
  %"76." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"42.triangle_2d.addr", align 8, !dbg !272, !opID !273, !stats.instNumber !274, !opSignedness !59
  %"77.y14" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"76.", i32 0, i32 3, !dbg !275, !opID !276, !stats.instNumber !277, !opSignedness !59
  store i8 %"75.", i8* %"77.y14", align 1, !dbg !278, !opID !279, !stats.instNumber !280, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"44.tmp_y") #19, !dbg !281, !opID !282, !stats.instNumber !283, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"43.tmp_x") #19, !dbg !281, !opID !284, !stats.instNumber !285, !opSignedness !59
  ret void, !dbg !281, !opID !286, !stats.instNumber !287, !opSignedness !59
}

; Function Attrs: nounwind
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval align 1 %triangle_2d) #7 !dbg !288 {
entry:
  %"82.x.addr" = alloca i8, align 1, !opID !292, !stats.instNumber !293, !opSignedness !59
  %"83.y.addr" = alloca i8, align 1, !opID !294, !stats.instNumber !295, !opSignedness !59
  %"84.pi0" = alloca i32, align 4, !opID !296, !stats.instNumber !297, !opSignedness !59
  %"85.pi1" = alloca i32, align 4, !opID !298, !stats.instNumber !299, !opSignedness !59
  %"86.pi2" = alloca i32, align 4, !opID !300, !stats.instNumber !301, !opSignedness !59
  store i8 %x, i8* %"82.x.addr", align 1, !opID !302, !stats.instNumber !303, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"82.x.addr", metadata !304, metadata !DIExpression()), !dbg !305, !opID !306, !stats.instNumber !307, !opSignedness !59
  store i8 %y, i8* %"83.y.addr", align 1, !opID !308, !stats.instNumber !309, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"83.y.addr", metadata !310, metadata !DIExpression()), !dbg !311, !opID !312, !stats.instNumber !313, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !314, metadata !DIExpression()), !dbg !315, !opID !316, !stats.instNumber !317, !opSignedness !59
  %"92." = bitcast i32* %"84.pi0" to i8*, !dbg !318, !opID !319, !stats.instNumber !320, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"92.") #19, !dbg !318, !opID !321, !stats.instNumber !322, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"84.pi0", metadata !323, metadata !DIExpression()), !dbg !324, !opID !325, !stats.instNumber !326, !opSignedness !59
  %"95." = bitcast i32* %"85.pi1" to i8*, !dbg !318, !opID !327, !stats.instNumber !328, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"95.") #19, !dbg !318, !opID !329, !stats.instNumber !330, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"85.pi1", metadata !331, metadata !DIExpression()), !dbg !332, !opID !333, !stats.instNumber !334, !opSignedness !59
  %"98." = bitcast i32* %"86.pi2" to i8*, !dbg !318, !opID !335, !stats.instNumber !336, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"98.") #19, !dbg !318, !opID !337, !stats.instNumber !338, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"86.pi2", metadata !339, metadata !DIExpression()), !dbg !340, !opID !341, !stats.instNumber !342, !opSignedness !59
  %"101." = load i8, i8* %"82.x.addr", align 1, !dbg !343, !opID !344, !stats.instNumber !345, !opSignedness !59
  %"102.conv" = zext i8 %"101." to i32, !dbg !343, !opID !346, !stats.instNumber !347, !opSignedness !59
  %"103.x0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !348, !opID !349, !stats.instNumber !350, !opSignedness !59
  %"104." = load i8, i8* %"103.x0", align 1, !dbg !348, !opID !351, !stats.instNumber !352, !opSignedness !59
  %"105.conv1" = zext i8 %"104." to i32, !dbg !353, !opID !354, !stats.instNumber !355, !opSignedness !59
  %"106.sub" = sub i32 %"102.conv", %"105.conv1", !dbg !356, !opID !357, !stats.instNumber !358, !opSignedness !59
  %0 = sext i32 %"106.sub" to i64, !dbg !359
  call void @profOp(i64 106, i8 13, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !359
  %"107.y1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !359, !opID !360, !stats.instNumber !361, !opSignedness !59
  %"108." = load i8, i8* %"107.y1", align 1, !dbg !359, !opID !362, !stats.instNumber !363, !opSignedness !59
  %"109.conv2" = zext i8 %"108." to i32, !dbg !364, !opID !365, !stats.instNumber !366, !opSignedness !59
  %"110.y0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !367, !opID !368, !stats.instNumber !369, !opSignedness !59
  %"111." = load i8, i8* %"110.y0", align 1, !dbg !367, !opID !370, !stats.instNumber !371, !opSignedness !59
  %"112.conv3" = zext i8 %"111." to i32, !dbg !372, !opID !373, !stats.instNumber !374, !opSignedness !59
  %"113.sub4" = sub i32 %"109.conv2", %"112.conv3", !dbg !375, !opID !376, !stats.instNumber !377, !opSignedness !59
  %1 = sext i32 %"113.sub4" to i64, !dbg !378
  call void @profOp(i64 113, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !378
  %"114.mul" = mul i32 %"106.sub", %"113.sub4", !dbg !378, !opID !379, !stats.instNumber !380, !opSignedness !59
  %2 = sext i32 %"114.mul" to i64, !dbg !381
  call void @profOp(i64 114, i8 15, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !381
  %"115." = load i8, i8* %"83.y.addr", align 1, !dbg !381, !opID !382, !stats.instNumber !383, !opSignedness !59
  %"116.conv5" = zext i8 %"115." to i32, !dbg !381, !opID !384, !stats.instNumber !385, !opSignedness !59
  %"117.y06" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !386, !opID !387, !stats.instNumber !388, !opSignedness !59
  %"118." = load i8, i8* %"117.y06", align 1, !dbg !386, !opID !389, !stats.instNumber !390, !opSignedness !59
  %"119.conv7" = zext i8 %"118." to i32, !dbg !391, !opID !392, !stats.instNumber !393, !opSignedness !59
  %"120.sub8" = sub i32 %"116.conv5", %"119.conv7", !dbg !394, !opID !395, !stats.instNumber !396, !opSignedness !59
  %3 = sext i32 %"120.sub8" to i64, !dbg !397
  call void @profOp(i64 120, i8 13, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !397
  %"121.x1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !397, !opID !398, !stats.instNumber !399, !opSignedness !59
  %"122." = load i8, i8* %"121.x1", align 1, !dbg !397, !opID !400, !stats.instNumber !401, !opSignedness !59
  %"123.conv9" = zext i8 %"122." to i32, !dbg !402, !opID !403, !stats.instNumber !404, !opSignedness !59
  %"124.x010" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !405, !opID !406, !stats.instNumber !407, !opSignedness !59
  %"125." = load i8, i8* %"124.x010", align 1, !dbg !405, !opID !408, !stats.instNumber !409, !opSignedness !59
  %"126.conv11" = zext i8 %"125." to i32, !dbg !410, !opID !411, !stats.instNumber !412, !opSignedness !59
  %"127.sub12" = sub i32 %"123.conv9", %"126.conv11", !dbg !413, !opID !414, !stats.instNumber !415, !opSignedness !59
  %4 = sext i32 %"127.sub12" to i64, !dbg !416
  call void @profOp(i64 127, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !416
  %"128.mul13" = mul i32 %"120.sub8", %"127.sub12", !dbg !416, !opID !417, !stats.instNumber !418, !opSignedness !59
  %5 = sext i32 %"128.mul13" to i64, !dbg !419
  call void @profOp(i64 128, i8 15, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !419
  %"129.sub14" = sub i32 %"114.mul", %"128.mul13", !dbg !419, !opID !420, !stats.instNumber !421, !opSignedness !59
  %6 = sext i32 %"129.sub14" to i64, !dbg !422
  call void @profOp(i64 129, i8 13, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !422
  store i32 %"129.sub14", i32* %"84.pi0", align 4, !dbg !422, !opID !423, !stats.instNumber !424, !opSignedness !59
  %"131." = load i8, i8* %"82.x.addr", align 1, !dbg !425, !opID !426, !stats.instNumber !427, !opSignedness !59
  %"132.conv15" = zext i8 %"131." to i32, !dbg !425, !opID !428, !stats.instNumber !429, !opSignedness !59
  %"133.x116" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !430, !opID !431, !stats.instNumber !432, !opSignedness !59
  %"134." = load i8, i8* %"133.x116", align 1, !dbg !430, !opID !433, !stats.instNumber !434, !opSignedness !59
  %"135.conv17" = zext i8 %"134." to i32, !dbg !435, !opID !436, !stats.instNumber !437, !opSignedness !59
  %"136.sub18" = sub i32 %"132.conv15", %"135.conv17", !dbg !438, !opID !439, !stats.instNumber !440, !opSignedness !59
  %7 = sext i32 %"136.sub18" to i64, !dbg !441
  call void @profOp(i64 136, i8 13, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !441
  %"137.y2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !441, !opID !442, !stats.instNumber !443, !opSignedness !59
  %"138." = load i8, i8* %"137.y2", align 1, !dbg !441, !opID !444, !stats.instNumber !445, !opSignedness !59
  %"139.conv19" = zext i8 %"138." to i32, !dbg !446, !opID !447, !stats.instNumber !448, !opSignedness !59
  %"140.y120" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !449, !opID !450, !stats.instNumber !451, !opSignedness !59
  %"141." = load i8, i8* %"140.y120", align 1, !dbg !449, !opID !452, !stats.instNumber !453, !opSignedness !59
  %"142.conv21" = zext i8 %"141." to i32, !dbg !454, !opID !455, !stats.instNumber !456, !opSignedness !59
  %"143.sub22" = sub i32 %"139.conv19", %"142.conv21", !dbg !457, !opID !458, !stats.instNumber !459, !opSignedness !59
  %8 = sext i32 %"143.sub22" to i64, !dbg !460
  call void @profOp(i64 143, i8 13, i64 %8, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !460
  %"144.mul23" = mul i32 %"136.sub18", %"143.sub22", !dbg !460, !opID !461, !stats.instNumber !462, !opSignedness !59
  %9 = sext i32 %"144.mul23" to i64, !dbg !463
  call void @profOp(i64 144, i8 15, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !463
  %"145." = load i8, i8* %"83.y.addr", align 1, !dbg !463, !opID !464, !stats.instNumber !465, !opSignedness !59
  %"146.conv24" = zext i8 %"145." to i32, !dbg !463, !opID !466, !stats.instNumber !467, !opSignedness !59
  %"147.y125" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !468, !opID !469, !stats.instNumber !470, !opSignedness !59
  %"148." = load i8, i8* %"147.y125", align 1, !dbg !468, !opID !471, !stats.instNumber !472, !opSignedness !59
  %"149.conv26" = zext i8 %"148." to i32, !dbg !473, !opID !474, !stats.instNumber !475, !opSignedness !59
  %"150.sub27" = sub i32 %"146.conv24", %"149.conv26", !dbg !476, !opID !477, !stats.instNumber !478, !opSignedness !59
  %10 = sext i32 %"150.sub27" to i64, !dbg !479
  call void @profOp(i64 150, i8 13, i64 %10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !479
  %"151.x2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !479, !opID !480, !stats.instNumber !481, !opSignedness !59
  %"152." = load i8, i8* %"151.x2", align 1, !dbg !479, !opID !482, !stats.instNumber !483, !opSignedness !59
  %"153.conv28" = zext i8 %"152." to i32, !dbg !484, !opID !485, !stats.instNumber !486, !opSignedness !59
  %"154.x129" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !487, !opID !488, !stats.instNumber !489, !opSignedness !59
  %"155." = load i8, i8* %"154.x129", align 1, !dbg !487, !opID !490, !stats.instNumber !491, !opSignedness !59
  %"156.conv30" = zext i8 %"155." to i32, !dbg !492, !opID !493, !stats.instNumber !494, !opSignedness !59
  %"157.sub31" = sub i32 %"153.conv28", %"156.conv30", !dbg !495, !opID !496, !stats.instNumber !497, !opSignedness !59
  %11 = sext i32 %"157.sub31" to i64, !dbg !498
  call void @profOp(i64 157, i8 13, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !498
  %"158.mul32" = mul i32 %"150.sub27", %"157.sub31", !dbg !498, !opID !499, !stats.instNumber !500, !opSignedness !59
  %12 = sext i32 %"158.mul32" to i64, !dbg !501
  call void @profOp(i64 158, i8 15, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !501
  %"159.sub33" = sub i32 %"144.mul23", %"158.mul32", !dbg !501, !opID !502, !stats.instNumber !503, !opSignedness !59
  %13 = sext i32 %"159.sub33" to i64, !dbg !504
  call void @profOp(i64 159, i8 13, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !504
  store i32 %"159.sub33", i32* %"85.pi1", align 4, !dbg !504, !opID !505, !stats.instNumber !506, !opSignedness !59
  %"161." = load i8, i8* %"82.x.addr", align 1, !dbg !507, !opID !508, !stats.instNumber !509, !opSignedness !59
  %"162.conv34" = zext i8 %"161." to i32, !dbg !507, !opID !510, !stats.instNumber !511, !opSignedness !59
  %"163.x235" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !512, !opID !513, !stats.instNumber !514, !opSignedness !59
  %"164." = load i8, i8* %"163.x235", align 1, !dbg !512, !opID !515, !stats.instNumber !516, !opSignedness !59
  %"165.conv36" = zext i8 %"164." to i32, !dbg !517, !opID !518, !stats.instNumber !519, !opSignedness !59
  %"166.sub37" = sub i32 %"162.conv34", %"165.conv36", !dbg !520, !opID !521, !stats.instNumber !522, !opSignedness !59
  %14 = sext i32 %"166.sub37" to i64, !dbg !523
  call void @profOp(i64 166, i8 13, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !523
  %"167.y038" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !523, !opID !524, !stats.instNumber !525, !opSignedness !59
  %"168." = load i8, i8* %"167.y038", align 1, !dbg !523, !opID !526, !stats.instNumber !527, !opSignedness !59
  %"169.conv39" = zext i8 %"168." to i32, !dbg !528, !opID !529, !stats.instNumber !530, !opSignedness !59
  %"170.y240" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !531, !opID !532, !stats.instNumber !533, !opSignedness !59
  %"171." = load i8, i8* %"170.y240", align 1, !dbg !531, !opID !534, !stats.instNumber !535, !opSignedness !59
  %"172.conv41" = zext i8 %"171." to i32, !dbg !536, !opID !537, !stats.instNumber !538, !opSignedness !59
  %"173.sub42" = sub i32 %"169.conv39", %"172.conv41", !dbg !539, !opID !540, !stats.instNumber !541, !opSignedness !59
  %15 = sext i32 %"173.sub42" to i64, !dbg !542
  call void @profOp(i64 173, i8 13, i64 %15, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !542
  %"174.mul43" = mul i32 %"166.sub37", %"173.sub42", !dbg !542, !opID !543, !stats.instNumber !544, !opSignedness !59
  %16 = sext i32 %"174.mul43" to i64, !dbg !545
  call void @profOp(i64 174, i8 15, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !545
  %"175." = load i8, i8* %"83.y.addr", align 1, !dbg !545, !opID !546, !stats.instNumber !547, !opSignedness !59
  %"176.conv44" = zext i8 %"175." to i32, !dbg !545, !opID !548, !stats.instNumber !549, !opSignedness !59
  %"177.y245" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !550, !opID !551, !stats.instNumber !552, !opSignedness !59
  %"178." = load i8, i8* %"177.y245", align 1, !dbg !550, !opID !553, !stats.instNumber !554, !opSignedness !59
  %"179.conv46" = zext i8 %"178." to i32, !dbg !555, !opID !556, !stats.instNumber !557, !opSignedness !59
  %"180.sub47" = sub i32 %"176.conv44", %"179.conv46", !dbg !558, !opID !559, !stats.instNumber !560, !opSignedness !59
  %17 = sext i32 %"180.sub47" to i64, !dbg !561
  call void @profOp(i64 180, i8 13, i64 %17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !561
  %"181.x048" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !561, !opID !562, !stats.instNumber !563, !opSignedness !59
  %"182." = load i8, i8* %"181.x048", align 1, !dbg !561, !opID !564, !stats.instNumber !565, !opSignedness !59
  %"183.conv49" = zext i8 %"182." to i32, !dbg !566, !opID !567, !stats.instNumber !568, !opSignedness !59
  %"184.x250" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !569, !opID !570, !stats.instNumber !571, !opSignedness !59
  %"185." = load i8, i8* %"184.x250", align 1, !dbg !569, !opID !572, !stats.instNumber !573, !opSignedness !59
  %"186.conv51" = zext i8 %"185." to i32, !dbg !574, !opID !575, !stats.instNumber !576, !opSignedness !59
  %"187.sub52" = sub i32 %"183.conv49", %"186.conv51", !dbg !577, !opID !578, !stats.instNumber !579, !opSignedness !59
  %18 = sext i32 %"187.sub52" to i64, !dbg !580
  call void @profOp(i64 187, i8 13, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !580
  %"188.mul53" = mul i32 %"180.sub47", %"187.sub52", !dbg !580, !opID !581, !stats.instNumber !582, !opSignedness !59
  %19 = sext i32 %"188.mul53" to i64, !dbg !583
  call void @profOp(i64 188, i8 15, i64 %19, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !583
  %"189.sub54" = sub i32 %"174.mul43", %"188.mul53", !dbg !583, !opID !584, !stats.instNumber !585, !opSignedness !59
  %20 = sext i32 %"189.sub54" to i64, !dbg !586
  call void @profOp(i64 189, i8 13, i64 %20, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !586
  store i32 %"189.sub54", i32* %"86.pi2", align 4, !dbg !586, !opID !587, !stats.instNumber !588, !opSignedness !59
  %"191." = load i32, i32* %"84.pi0", align 4, !dbg !589, !opID !590, !stats.instNumber !591, !opSignedness !59
  %"192.cmp" = icmp sge i32 %"191.", 0, !dbg !592, !opID !593, !stats.instNumber !594, !opSignedness !59
  br i1 %"192.cmp", label %land.lhs.true, label %land.end, !dbg !595, !opID !596, !stats.instNumber !597, !opSignedness !59

land.lhs.true:                                    ; preds = %entry
  %"194." = load i32, i32* %"85.pi1", align 4, !dbg !598, !opID !599, !stats.instNumber !600, !opSignedness !59
  %"195.cmp55" = icmp sge i32 %"194.", 0, !dbg !601, !opID !602, !stats.instNumber !603, !opSignedness !59
  br i1 %"195.cmp55", label %land.rhs, label %land.end, !dbg !604, !opID !605, !stats.instNumber !606, !opSignedness !59

land.rhs:                                         ; preds = %land.lhs.true
  %"197." = load i32, i32* %"86.pi2", align 4, !dbg !607, !opID !608, !stats.instNumber !609, !opSignedness !59
  %"198.cmp56" = icmp sge i32 %"197.", 0, !dbg !610, !opID !611, !stats.instNumber !612, !opSignedness !59
  br label %land.end, !opID !613, !stats.instNumber !614, !opSignedness !59

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %"200." = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %"198.cmp56", %land.rhs ], !opID !615, !stats.instNumber !616, !opSignedness !59
  %"201." = bitcast i32* %"86.pi2" to i8*, !dbg !617, !opID !618, !stats.instNumber !619, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"201.") #19, !dbg !617, !opID !620, !stats.instNumber !621, !opSignedness !59
  %"203." = bitcast i32* %"85.pi1" to i8*, !dbg !617, !opID !622, !stats.instNumber !623, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"203.") #19, !dbg !617, !opID !624, !stats.instNumber !625, !opSignedness !59
  %"205." = bitcast i32* %"84.pi0" to i8*, !dbg !617, !opID !626, !stats.instNumber !627, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"205.") #19, !dbg !617, !opID !628, !stats.instNumber !629, !opSignedness !59
  ret i1 %"200.", !dbg !630, !opID !631, !stats.instNumber !632, !opSignedness !59
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #8 !dbg !633 {
entry:
  %"208.retval" = alloca i8, align 1, !opID !636, !stats.instNumber !637, !opSignedness !59
  %"209.in0.addr" = alloca i8, align 1, !opID !638, !stats.instNumber !639, !opSignedness !59
  %"210.in1.addr" = alloca i8, align 1, !opID !640, !stats.instNumber !641, !opSignedness !59
  %"211.in2.addr" = alloca i8, align 1, !opID !642, !stats.instNumber !643, !opSignedness !59
  store i8 %in0, i8* %"209.in0.addr", align 1, !opID !644, !stats.instNumber !645, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"209.in0.addr", metadata !646, metadata !DIExpression()), !dbg !647, !opID !648, !stats.instNumber !649, !opSignedness !59
  store i8 %in1, i8* %"210.in1.addr", align 1, !opID !650, !stats.instNumber !651, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"210.in1.addr", metadata !652, metadata !DIExpression()), !dbg !653, !opID !654, !stats.instNumber !655, !opSignedness !59
  store i8 %in2, i8* %"211.in2.addr", align 1, !opID !656, !stats.instNumber !657, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"211.in2.addr", metadata !658, metadata !DIExpression()), !dbg !659, !opID !660, !stats.instNumber !661, !opSignedness !59
  %"218." = load i8, i8* %"209.in0.addr", align 1, !dbg !662, !opID !664, !stats.instNumber !665, !opSignedness !59
  %"219.conv" = zext i8 %"218." to i32, !dbg !662, !opID !666, !stats.instNumber !667, !opSignedness !59
  %"220." = load i8, i8* %"210.in1.addr", align 1, !dbg !668, !opID !669, !stats.instNumber !670, !opSignedness !59
  %"221.conv1" = zext i8 %"220." to i32, !dbg !668, !opID !671, !stats.instNumber !672, !opSignedness !59
  %"222.cmp" = icmp slt i32 %"219.conv", %"221.conv1", !dbg !673, !opID !674, !stats.instNumber !675, !opSignedness !59
  br i1 %"222.cmp", label %if.then, label %if.else6, !dbg !676, !opID !677, !stats.instNumber !678, !opSignedness !59

if.then:                                          ; preds = %entry
  %"224." = load i8, i8* %"209.in0.addr", align 1, !dbg !679, !opID !682, !stats.instNumber !683, !opSignedness !59
  %"225.conv2" = zext i8 %"224." to i32, !dbg !679, !opID !684, !stats.instNumber !685, !opSignedness !59
  %"226." = load i8, i8* %"211.in2.addr", align 1, !dbg !686, !opID !687, !stats.instNumber !688, !opSignedness !59
  %"227.conv3" = zext i8 %"226." to i32, !dbg !686, !opID !689, !stats.instNumber !690, !opSignedness !59
  %"228.cmp4" = icmp slt i32 %"225.conv2", %"227.conv3", !dbg !691, !opID !692, !stats.instNumber !693, !opSignedness !59
  br i1 %"228.cmp4", label %if.then5, label %if.else, !dbg !694, !opID !695, !stats.instNumber !696, !opSignedness !59

if.then5:                                         ; preds = %if.then
  %"230." = load i8, i8* %"209.in0.addr", align 1, !dbg !697, !opID !698, !stats.instNumber !699, !opSignedness !59
  store i8 %"230.", i8* %"208.retval", align 1, !dbg !700, !opID !701, !stats.instNumber !702, !opSignedness !59
  br label %return, !dbg !700, !opID !703, !stats.instNumber !704, !opSignedness !59

if.else:                                          ; preds = %if.then
  %"233." = load i8, i8* %"211.in2.addr", align 1, !dbg !705, !opID !706, !stats.instNumber !707, !opSignedness !59
  store i8 %"233.", i8* %"208.retval", align 1, !dbg !708, !opID !709, !stats.instNumber !710, !opSignedness !59
  br label %return, !dbg !708, !opID !711, !stats.instNumber !712, !opSignedness !59

if.else6:                                         ; preds = %entry
  %"236." = load i8, i8* %"210.in1.addr", align 1, !dbg !713, !opID !716, !stats.instNumber !717, !opSignedness !59
  %"237.conv7" = zext i8 %"236." to i32, !dbg !713, !opID !718, !stats.instNumber !719, !opSignedness !59
  %"238." = load i8, i8* %"211.in2.addr", align 1, !dbg !720, !opID !721, !stats.instNumber !722, !opSignedness !59
  %"239.conv8" = zext i8 %"238." to i32, !dbg !720, !opID !723, !stats.instNumber !724, !opSignedness !59
  %"240.cmp9" = icmp slt i32 %"237.conv7", %"239.conv8", !dbg !725, !opID !726, !stats.instNumber !727, !opSignedness !59
  br i1 %"240.cmp9", label %if.then10, label %if.else11, !dbg !728, !opID !729, !stats.instNumber !730, !opSignedness !59

if.then10:                                        ; preds = %if.else6
  %"242." = load i8, i8* %"210.in1.addr", align 1, !dbg !731, !opID !732, !stats.instNumber !733, !opSignedness !59
  store i8 %"242.", i8* %"208.retval", align 1, !dbg !734, !opID !735, !stats.instNumber !736, !opSignedness !59
  br label %return, !dbg !734, !opID !737, !stats.instNumber !738, !opSignedness !59

if.else11:                                        ; preds = %if.else6
  %"245." = load i8, i8* %"211.in2.addr", align 1, !dbg !739, !opID !740, !stats.instNumber !741, !opSignedness !59
  store i8 %"245.", i8* %"208.retval", align 1, !dbg !742, !opID !743, !stats.instNumber !744, !opSignedness !59
  br label %return, !dbg !742, !opID !745, !stats.instNumber !746, !opSignedness !59

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %"248." = load i8, i8* %"208.retval", align 1, !dbg !747, !opID !748, !stats.instNumber !749, !opSignedness !59
  ret i8 %"248.", !dbg !747, !opID !750, !stats.instNumber !751, !opSignedness !59
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #9 !dbg !752 {
entry:
  %"250.retval" = alloca i8, align 1, !opID !753, !stats.instNumber !754, !opSignedness !59
  %"251.in0.addr" = alloca i8, align 1, !opID !755, !stats.instNumber !756, !opSignedness !59
  %"252.in1.addr" = alloca i8, align 1, !opID !757, !stats.instNumber !758, !opSignedness !59
  %"253.in2.addr" = alloca i8, align 1, !opID !759, !stats.instNumber !760, !opSignedness !59
  store i8 %in0, i8* %"251.in0.addr", align 1, !opID !761, !stats.instNumber !762, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"251.in0.addr", metadata !763, metadata !DIExpression()), !dbg !764, !opID !765, !stats.instNumber !766, !opSignedness !59
  store i8 %in1, i8* %"252.in1.addr", align 1, !opID !767, !stats.instNumber !768, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"252.in1.addr", metadata !769, metadata !DIExpression()), !dbg !770, !opID !771, !stats.instNumber !772, !opSignedness !59
  store i8 %in2, i8* %"253.in2.addr", align 1, !opID !773, !stats.instNumber !774, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"253.in2.addr", metadata !775, metadata !DIExpression()), !dbg !776, !opID !777, !stats.instNumber !778, !opSignedness !59
  %"260." = load i8, i8* %"251.in0.addr", align 1, !dbg !779, !opID !781, !stats.instNumber !782, !opSignedness !59
  %"261.conv" = zext i8 %"260." to i32, !dbg !779, !opID !783, !stats.instNumber !784, !opSignedness !59
  %"262." = load i8, i8* %"252.in1.addr", align 1, !dbg !785, !opID !786, !stats.instNumber !787, !opSignedness !59
  %"263.conv1" = zext i8 %"262." to i32, !dbg !785, !opID !788, !stats.instNumber !789, !opSignedness !59
  %"264.cmp" = icmp sgt i32 %"261.conv", %"263.conv1", !dbg !790, !opID !791, !stats.instNumber !792, !opSignedness !59
  br i1 %"264.cmp", label %if.then, label %if.else6, !dbg !793, !opID !794, !stats.instNumber !795, !opSignedness !59

if.then:                                          ; preds = %entry
  %"266." = load i8, i8* %"251.in0.addr", align 1, !dbg !796, !opID !799, !stats.instNumber !800, !opSignedness !59
  %"267.conv2" = zext i8 %"266." to i32, !dbg !796, !opID !801, !stats.instNumber !802, !opSignedness !59
  %"268." = load i8, i8* %"253.in2.addr", align 1, !dbg !803, !opID !804, !stats.instNumber !805, !opSignedness !59
  %"269.conv3" = zext i8 %"268." to i32, !dbg !803, !opID !806, !stats.instNumber !807, !opSignedness !59
  %"270.cmp4" = icmp sgt i32 %"267.conv2", %"269.conv3", !dbg !808, !opID !809, !stats.instNumber !810, !opSignedness !59
  br i1 %"270.cmp4", label %if.then5, label %if.else, !dbg !811, !opID !812, !stats.instNumber !813, !opSignedness !59

if.then5:                                         ; preds = %if.then
  %"272." = load i8, i8* %"251.in0.addr", align 1, !dbg !814, !opID !815, !stats.instNumber !816, !opSignedness !59
  store i8 %"272.", i8* %"250.retval", align 1, !dbg !817, !opID !818, !stats.instNumber !819, !opSignedness !59
  br label %return, !dbg !817, !opID !820, !stats.instNumber !821, !opSignedness !59

if.else:                                          ; preds = %if.then
  %"275." = load i8, i8* %"253.in2.addr", align 1, !dbg !822, !opID !823, !stats.instNumber !824, !opSignedness !59
  store i8 %"275.", i8* %"250.retval", align 1, !dbg !825, !opID !826, !stats.instNumber !827, !opSignedness !59
  br label %return, !dbg !825, !opID !828, !stats.instNumber !829, !opSignedness !59

if.else6:                                         ; preds = %entry
  %"278." = load i8, i8* %"252.in1.addr", align 1, !dbg !830, !opID !833, !stats.instNumber !834, !opSignedness !59
  %"279.conv7" = zext i8 %"278." to i32, !dbg !830, !opID !835, !stats.instNumber !836, !opSignedness !59
  %"280." = load i8, i8* %"253.in2.addr", align 1, !dbg !837, !opID !838, !stats.instNumber !839, !opSignedness !59
  %"281.conv8" = zext i8 %"280." to i32, !dbg !837, !opID !840, !stats.instNumber !841, !opSignedness !59
  %"282.cmp9" = icmp sgt i32 %"279.conv7", %"281.conv8", !dbg !842, !opID !843, !stats.instNumber !844, !opSignedness !59
  br i1 %"282.cmp9", label %if.then10, label %if.else11, !dbg !845, !opID !846, !stats.instNumber !847, !opSignedness !59

if.then10:                                        ; preds = %if.else6
  %"284." = load i8, i8* %"252.in1.addr", align 1, !dbg !848, !opID !849, !stats.instNumber !850, !opSignedness !59
  store i8 %"284.", i8* %"250.retval", align 1, !dbg !851, !opID !852, !stats.instNumber !853, !opSignedness !59
  br label %return, !dbg !851, !opID !854, !stats.instNumber !855, !opSignedness !59

if.else11:                                        ; preds = %if.else6
  %"287." = load i8, i8* %"253.in2.addr", align 1, !dbg !856, !opID !857, !stats.instNumber !858, !opSignedness !59
  store i8 %"287.", i8* %"250.retval", align 1, !dbg !859, !opID !860, !stats.instNumber !861, !opSignedness !59
  br label %return, !dbg !859, !opID !862, !stats.instNumber !863, !opSignedness !59

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %"290." = load i8, i8* %"250.retval", align 1, !dbg !864, !opID !865, !stats.instNumber !866, !opSignedness !59
  ret i8 %"290.", !dbg !864, !opID !867, !stats.instNumber !868, !opSignedness !59
}

; Function Attrs: nounwind
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) #10 !dbg !869 {
entry:
  %"292.triangle_2d.addr" = alloca %struct.Triangle_2D*, align 8, !opID !884, !stats.instNumber !885, !opSignedness !59
  %"293.angle.addr" = alloca i32, align 4, !opID !886, !stats.instNumber !887, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D* %triangle_3d, metadata !888, metadata !DIExpression()), !dbg !889, !opID !890, !stats.instNumber !891, !opSignedness !59
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !opID !892, !stats.instNumber !893, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %"292.triangle_2d.addr", metadata !894, metadata !DIExpression()), !dbg !895, !opID !896, !stats.instNumber !897, !opSignedness !59
  store i32 %angle, i32* %"293.angle.addr", align 4, !opID !898, !stats.instNumber !899, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"293.angle.addr", metadata !900, metadata !DIExpression()), !dbg !901, !opID !902, !stats.instNumber !903, !opSignedness !59
  %"299." = load i32, i32* %"293.angle.addr", align 4, !dbg !904, !opID !906, !stats.instNumber !907, !opSignedness !59
  %"300.cmp" = icmp eq i32 %"299.", 0, !dbg !908, !opID !909, !stats.instNumber !910, !opSignedness !59
  br i1 %"300.cmp", label %if.then, label %if.else, !dbg !911, !opID !912, !stats.instNumber !913, !opSignedness !59

if.then:                                          ; preds = %entry
  %"302.x0" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !914, !opID !916, !stats.instNumber !917, !opSignedness !59
  %"303." = load i8, i8* %"302.x0", align 1, !dbg !914, !opID !918, !stats.instNumber !919, !opSignedness !59
  %"304." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !920, !opID !921, !stats.instNumber !922, !opSignedness !59
  %"305.x01" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"304.", i32 0, i32 0, !dbg !923, !opID !924, !stats.instNumber !925, !opSignedness !59
  store i8 %"303.", i8* %"305.x01", align 1, !dbg !926, !opID !927, !stats.instNumber !928, !opSignedness !59
  %"307.y0" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !929, !opID !930, !stats.instNumber !931, !opSignedness !59
  %"308." = load i8, i8* %"307.y0", align 1, !dbg !929, !opID !932, !stats.instNumber !933, !opSignedness !59
  %"309." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !934, !opID !935, !stats.instNumber !936, !opSignedness !59
  %"310.y02" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"309.", i32 0, i32 1, !dbg !937, !opID !938, !stats.instNumber !939, !opSignedness !59
  store i8 %"308.", i8* %"310.y02", align 1, !dbg !940, !opID !941, !stats.instNumber !942, !opSignedness !59
  %"312.x1" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !943, !opID !944, !stats.instNumber !945, !opSignedness !59
  %"313." = load i8, i8* %"312.x1", align 1, !dbg !943, !opID !946, !stats.instNumber !947, !opSignedness !59
  %"314." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !948, !opID !949, !stats.instNumber !950, !opSignedness !59
  %"315.x13" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"314.", i32 0, i32 2, !dbg !951, !opID !952, !stats.instNumber !953, !opSignedness !59
  store i8 %"313.", i8* %"315.x13", align 1, !dbg !954, !opID !955, !stats.instNumber !956, !opSignedness !59
  %"317.y1" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !957, !opID !958, !stats.instNumber !959, !opSignedness !59
  %"318." = load i8, i8* %"317.y1", align 1, !dbg !957, !opID !960, !stats.instNumber !961, !opSignedness !59
  %"319." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !962, !opID !963, !stats.instNumber !964, !opSignedness !59
  %"320.y14" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"319.", i32 0, i32 3, !dbg !965, !opID !966, !stats.instNumber !967, !opSignedness !59
  store i8 %"318.", i8* %"320.y14", align 1, !dbg !968, !opID !969, !stats.instNumber !970, !opSignedness !59
  %"322.x2" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !971, !opID !972, !stats.instNumber !973, !opSignedness !59
  %"323." = load i8, i8* %"322.x2", align 1, !dbg !971, !opID !974, !stats.instNumber !975, !opSignedness !59
  %"324." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !976, !opID !977, !stats.instNumber !978, !opSignedness !59
  %"325.x25" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"324.", i32 0, i32 4, !dbg !979, !opID !980, !stats.instNumber !981, !opSignedness !59
  store i8 %"323.", i8* %"325.x25", align 1, !dbg !982, !opID !983, !stats.instNumber !984, !opSignedness !59
  %"327.y2" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !985, !opID !986, !stats.instNumber !987, !opSignedness !59
  %"328." = load i8, i8* %"327.y2", align 1, !dbg !985, !opID !988, !stats.instNumber !989, !opSignedness !59
  %"329." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !990, !opID !991, !stats.instNumber !992, !opSignedness !59
  %"330.y26" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"329.", i32 0, i32 5, !dbg !993, !opID !994, !stats.instNumber !995, !opSignedness !59
  store i8 %"328.", i8* %"330.y26", align 1, !dbg !996, !opID !997, !stats.instNumber !998, !opSignedness !59
  %"332.z0" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !999, !opID !1000, !stats.instNumber !1001, !opSignedness !59
  %"333." = load i8, i8* %"332.z0", align 1, !dbg !999, !opID !1002, !stats.instNumber !1003, !opSignedness !59
  %"334.conv" = zext i8 %"333." to i32, !dbg !1004, !opID !1005, !stats.instNumber !1006, !opSignedness !59
  %"335.div" = sdiv i32 %"334.conv", 3, !dbg !1007, !opID !1008, !stats.instNumber !1009, !opSignedness !59
  %0 = sext i32 %"335.div" to i64, !dbg !1010
  call void @profOp(i64 335, i8 18, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1010
  %"336.z1" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !1010, !opID !1011, !stats.instNumber !1012, !opSignedness !59
  %"337." = load i8, i8* %"336.z1", align 1, !dbg !1010, !opID !1013, !stats.instNumber !1014, !opSignedness !59
  %"338.conv7" = zext i8 %"337." to i32, !dbg !1015, !opID !1016, !stats.instNumber !1017, !opSignedness !59
  %"339.div8" = sdiv i32 %"338.conv7", 3, !dbg !1018, !opID !1019, !stats.instNumber !1020, !opSignedness !59
  %1 = sext i32 %"339.div8" to i64, !dbg !1021
  call void @profOp(i64 339, i8 18, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1021
  %"340.add" = add i32 %"335.div", %"339.div8", !dbg !1021, !opID !1022, !stats.instNumber !1023, !opSignedness !59
  %2 = sext i32 %"340.add" to i64, !dbg !1024
  call void @profOp(i64 340, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1024
  %"341.z2" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !1024, !opID !1025, !stats.instNumber !1026, !opSignedness !59
  %"342." = load i8, i8* %"341.z2", align 1, !dbg !1024, !opID !1027, !stats.instNumber !1028, !opSignedness !59
  %"343.conv9" = zext i8 %"342." to i32, !dbg !1029, !opID !1030, !stats.instNumber !1031, !opSignedness !59
  %"344.div10" = sdiv i32 %"343.conv9", 3, !dbg !1032, !opID !1033, !stats.instNumber !1034, !opSignedness !59
  %3 = sext i32 %"344.div10" to i64, !dbg !1035
  call void @profOp(i64 344, i8 18, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1035
  %"345.add11" = add i32 %"340.add", %"344.div10", !dbg !1035, !opID !1036, !stats.instNumber !1037, !opSignedness !59
  %4 = sext i32 %"345.add11" to i64, !dbg !1004
  call void @profOp(i64 345, i8 11, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1004
  %"346.conv12" = trunc i32 %"345.add11" to i8, !dbg !1004, !opID !1038, !stats.instNumber !1039, !opSignedness !59
  %"347." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1040, !opID !1041, !stats.instNumber !1042, !opSignedness !59
  %"348.z" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"347.", i32 0, i32 6, !dbg !1043, !opID !1044, !stats.instNumber !1045, !opSignedness !59
  store i8 %"346.conv12", i8* %"348.z", align 1, !dbg !1046, !opID !1047, !stats.instNumber !1048, !opSignedness !59
  br label %if.end69, !dbg !1049, !opID !1050, !stats.instNumber !1051, !opSignedness !59

if.else:                                          ; preds = %entry
  %"351." = load i32, i32* %"293.angle.addr", align 4, !dbg !1052, !opID !1054, !stats.instNumber !1055, !opSignedness !59
  %"352.cmp13" = icmp eq i32 %"351.", 1, !dbg !1056, !opID !1057, !stats.instNumber !1058, !opSignedness !59
  br i1 %"352.cmp13", label %if.then14, label %if.else40, !dbg !1059, !opID !1060, !stats.instNumber !1061, !opSignedness !59

if.then14:                                        ; preds = %if.else
  %"354.x015" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !1062, !opID !1064, !stats.instNumber !1065, !opSignedness !59
  %"355." = load i8, i8* %"354.x015", align 1, !dbg !1062, !opID !1066, !stats.instNumber !1067, !opSignedness !59
  %"356." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1068, !opID !1069, !stats.instNumber !1070, !opSignedness !59
  %"357.x016" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"356.", i32 0, i32 0, !dbg !1071, !opID !1072, !stats.instNumber !1073, !opSignedness !59
  store i8 %"355.", i8* %"357.x016", align 1, !dbg !1074, !opID !1075, !stats.instNumber !1076, !opSignedness !59
  %"359.z017" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !1077, !opID !1078, !stats.instNumber !1079, !opSignedness !59
  %"360." = load i8, i8* %"359.z017", align 1, !dbg !1077, !opID !1080, !stats.instNumber !1081, !opSignedness !59
  %"361." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1082, !opID !1083, !stats.instNumber !1084, !opSignedness !59
  %"362.y018" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"361.", i32 0, i32 1, !dbg !1085, !opID !1086, !stats.instNumber !1087, !opSignedness !59
  store i8 %"360.", i8* %"362.y018", align 1, !dbg !1088, !opID !1089, !stats.instNumber !1090, !opSignedness !59
  %"364.x119" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !1091, !opID !1092, !stats.instNumber !1093, !opSignedness !59
  %"365." = load i8, i8* %"364.x119", align 1, !dbg !1091, !opID !1094, !stats.instNumber !1095, !opSignedness !59
  %"366." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1096, !opID !1097, !stats.instNumber !1098, !opSignedness !59
  %"367.x120" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"366.", i32 0, i32 2, !dbg !1099, !opID !1100, !stats.instNumber !1101, !opSignedness !59
  store i8 %"365.", i8* %"367.x120", align 1, !dbg !1102, !opID !1103, !stats.instNumber !1104, !opSignedness !59
  %"369.z121" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !1105, !opID !1106, !stats.instNumber !1107, !opSignedness !59
  %"370." = load i8, i8* %"369.z121", align 1, !dbg !1105, !opID !1108, !stats.instNumber !1109, !opSignedness !59
  %"371." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1110, !opID !1111, !stats.instNumber !1112, !opSignedness !59
  %"372.y122" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"371.", i32 0, i32 3, !dbg !1113, !opID !1114, !stats.instNumber !1115, !opSignedness !59
  store i8 %"370.", i8* %"372.y122", align 1, !dbg !1116, !opID !1117, !stats.instNumber !1118, !opSignedness !59
  %"374.x223" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !1119, !opID !1120, !stats.instNumber !1121, !opSignedness !59
  %"375." = load i8, i8* %"374.x223", align 1, !dbg !1119, !opID !1122, !stats.instNumber !1123, !opSignedness !59
  %"376." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1124, !opID !1125, !stats.instNumber !1126, !opSignedness !59
  %"377.x224" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"376.", i32 0, i32 4, !dbg !1127, !opID !1128, !stats.instNumber !1129, !opSignedness !59
  store i8 %"375.", i8* %"377.x224", align 1, !dbg !1130, !opID !1131, !stats.instNumber !1132, !opSignedness !59
  %"379.z225" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !1133, !opID !1134, !stats.instNumber !1135, !opSignedness !59
  %"380." = load i8, i8* %"379.z225", align 1, !dbg !1133, !opID !1136, !stats.instNumber !1137, !opSignedness !59
  %"381." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1138, !opID !1139, !stats.instNumber !1140, !opSignedness !59
  %"382.y226" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"381.", i32 0, i32 5, !dbg !1141, !opID !1142, !stats.instNumber !1143, !opSignedness !59
  store i8 %"380.", i8* %"382.y226", align 1, !dbg !1144, !opID !1145, !stats.instNumber !1146, !opSignedness !59
  %"384.y027" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !1147, !opID !1148, !stats.instNumber !1149, !opSignedness !59
  %"385." = load i8, i8* %"384.y027", align 1, !dbg !1147, !opID !1150, !stats.instNumber !1151, !opSignedness !59
  %"386.conv28" = zext i8 %"385." to i32, !dbg !1152, !opID !1153, !stats.instNumber !1154, !opSignedness !59
  %"387.div29" = sdiv i32 %"386.conv28", 3, !dbg !1155, !opID !1156, !stats.instNumber !1157, !opSignedness !59
  %5 = sext i32 %"387.div29" to i64, !dbg !1158
  call void @profOp(i64 387, i8 18, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1158
  %"388.y130" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !1158, !opID !1159, !stats.instNumber !1160, !opSignedness !59
  %"389." = load i8, i8* %"388.y130", align 1, !dbg !1158, !opID !1161, !stats.instNumber !1162, !opSignedness !59
  %"390.conv31" = zext i8 %"389." to i32, !dbg !1163, !opID !1164, !stats.instNumber !1165, !opSignedness !59
  %"391.div32" = sdiv i32 %"390.conv31", 3, !dbg !1166, !opID !1167, !stats.instNumber !1168, !opSignedness !59
  %6 = sext i32 %"391.div32" to i64, !dbg !1169
  call void @profOp(i64 391, i8 18, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1169
  %"392.add33" = add i32 %"387.div29", %"391.div32", !dbg !1169, !opID !1170, !stats.instNumber !1171, !opSignedness !59
  %7 = sext i32 %"392.add33" to i64, !dbg !1172
  call void @profOp(i64 392, i8 11, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1172
  %"393.y234" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !1172, !opID !1173, !stats.instNumber !1174, !opSignedness !59
  %"394." = load i8, i8* %"393.y234", align 1, !dbg !1172, !opID !1175, !stats.instNumber !1176, !opSignedness !59
  %"395.conv35" = zext i8 %"394." to i32, !dbg !1177, !opID !1178, !stats.instNumber !1179, !opSignedness !59
  %"396.div36" = sdiv i32 %"395.conv35", 3, !dbg !1180, !opID !1181, !stats.instNumber !1182, !opSignedness !59
  %8 = sext i32 %"396.div36" to i64, !dbg !1183
  call void @profOp(i64 396, i8 18, i64 %8, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1183
  %"397.add37" = add i32 %"392.add33", %"396.div36", !dbg !1183, !opID !1184, !stats.instNumber !1185, !opSignedness !59
  %9 = sext i32 %"397.add37" to i64, !dbg !1152
  call void @profOp(i64 397, i8 11, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1152
  %"398.conv38" = trunc i32 %"397.add37" to i8, !dbg !1152, !opID !1186, !stats.instNumber !1187, !opSignedness !59
  %"399." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1188, !opID !1189, !stats.instNumber !1190, !opSignedness !59
  %"400.z39" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"399.", i32 0, i32 6, !dbg !1191, !opID !1192, !stats.instNumber !1193, !opSignedness !59
  store i8 %"398.conv38", i8* %"400.z39", align 1, !dbg !1194, !opID !1195, !stats.instNumber !1196, !opSignedness !59
  br label %if.end68, !dbg !1197, !opID !1198, !stats.instNumber !1199, !opSignedness !59

if.else40:                                        ; preds = %if.else
  %"403." = load i32, i32* %"293.angle.addr", align 4, !dbg !1200, !opID !1202, !stats.instNumber !1203, !opSignedness !59
  %"404.cmp41" = icmp eq i32 %"403.", 2, !dbg !1204, !opID !1205, !stats.instNumber !1206, !opSignedness !59
  br i1 %"404.cmp41", label %if.then42, label %if.end, !dbg !1207, !opID !1208, !stats.instNumber !1209, !opSignedness !59

if.then42:                                        ; preds = %if.else40
  %"406.z043" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !1210, !opID !1212, !stats.instNumber !1213, !opSignedness !59
  %"407." = load i8, i8* %"406.z043", align 1, !dbg !1210, !opID !1214, !stats.instNumber !1215, !opSignedness !59
  %"408." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1216, !opID !1217, !stats.instNumber !1218, !opSignedness !59
  %"409.x044" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"408.", i32 0, i32 0, !dbg !1219, !opID !1220, !stats.instNumber !1221, !opSignedness !59
  store i8 %"407.", i8* %"409.x044", align 1, !dbg !1222, !opID !1223, !stats.instNumber !1224, !opSignedness !59
  %"411.y045" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !1225, !opID !1226, !stats.instNumber !1227, !opSignedness !59
  %"412." = load i8, i8* %"411.y045", align 1, !dbg !1225, !opID !1228, !stats.instNumber !1229, !opSignedness !59
  %"413." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1230, !opID !1231, !stats.instNumber !1232, !opSignedness !59
  %"414.y046" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"413.", i32 0, i32 1, !dbg !1233, !opID !1234, !stats.instNumber !1235, !opSignedness !59
  store i8 %"412.", i8* %"414.y046", align 1, !dbg !1236, !opID !1237, !stats.instNumber !1238, !opSignedness !59
  %"416.z147" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !1239, !opID !1240, !stats.instNumber !1241, !opSignedness !59
  %"417." = load i8, i8* %"416.z147", align 1, !dbg !1239, !opID !1242, !stats.instNumber !1243, !opSignedness !59
  %"418." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1244, !opID !1245, !stats.instNumber !1246, !opSignedness !59
  %"419.x148" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"418.", i32 0, i32 2, !dbg !1247, !opID !1248, !stats.instNumber !1249, !opSignedness !59
  store i8 %"417.", i8* %"419.x148", align 1, !dbg !1250, !opID !1251, !stats.instNumber !1252, !opSignedness !59
  %"421.y149" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !1253, !opID !1254, !stats.instNumber !1255, !opSignedness !59
  %"422." = load i8, i8* %"421.y149", align 1, !dbg !1253, !opID !1256, !stats.instNumber !1257, !opSignedness !59
  %"423." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1258, !opID !1259, !stats.instNumber !1260, !opSignedness !59
  %"424.y150" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"423.", i32 0, i32 3, !dbg !1261, !opID !1262, !stats.instNumber !1263, !opSignedness !59
  store i8 %"422.", i8* %"424.y150", align 1, !dbg !1264, !opID !1265, !stats.instNumber !1266, !opSignedness !59
  %"426.z251" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !1267, !opID !1268, !stats.instNumber !1269, !opSignedness !59
  %"427." = load i8, i8* %"426.z251", align 1, !dbg !1267, !opID !1270, !stats.instNumber !1271, !opSignedness !59
  %"428." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1272, !opID !1273, !stats.instNumber !1274, !opSignedness !59
  %"429.x252" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"428.", i32 0, i32 4, !dbg !1275, !opID !1276, !stats.instNumber !1277, !opSignedness !59
  store i8 %"427.", i8* %"429.x252", align 1, !dbg !1278, !opID !1279, !stats.instNumber !1280, !opSignedness !59
  %"431.y253" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !1281, !opID !1282, !stats.instNumber !1283, !opSignedness !59
  %"432." = load i8, i8* %"431.y253", align 1, !dbg !1281, !opID !1284, !stats.instNumber !1285, !opSignedness !59
  %"433." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1286, !opID !1287, !stats.instNumber !1288, !opSignedness !59
  %"434.y254" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"433.", i32 0, i32 5, !dbg !1289, !opID !1290, !stats.instNumber !1291, !opSignedness !59
  store i8 %"432.", i8* %"434.y254", align 1, !dbg !1292, !opID !1293, !stats.instNumber !1294, !opSignedness !59
  %"436.x055" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !1295, !opID !1296, !stats.instNumber !1297, !opSignedness !59
  %"437." = load i8, i8* %"436.x055", align 1, !dbg !1295, !opID !1298, !stats.instNumber !1299, !opSignedness !59
  %"438.conv56" = zext i8 %"437." to i32, !dbg !1300, !opID !1301, !stats.instNumber !1302, !opSignedness !59
  %"439.div57" = sdiv i32 %"438.conv56", 3, !dbg !1303, !opID !1304, !stats.instNumber !1305, !opSignedness !59
  %10 = sext i32 %"439.div57" to i64, !dbg !1306
  call void @profOp(i64 439, i8 18, i64 %10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1306
  %"440.x158" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !1306, !opID !1307, !stats.instNumber !1308, !opSignedness !59
  %"441." = load i8, i8* %"440.x158", align 1, !dbg !1306, !opID !1309, !stats.instNumber !1310, !opSignedness !59
  %"442.conv59" = zext i8 %"441." to i32, !dbg !1311, !opID !1312, !stats.instNumber !1313, !opSignedness !59
  %"443.div60" = sdiv i32 %"442.conv59", 3, !dbg !1314, !opID !1315, !stats.instNumber !1316, !opSignedness !59
  %11 = sext i32 %"443.div60" to i64, !dbg !1317
  call void @profOp(i64 443, i8 18, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1317
  %"444.add61" = add i32 %"439.div57", %"443.div60", !dbg !1317, !opID !1318, !stats.instNumber !1319, !opSignedness !59
  %12 = sext i32 %"444.add61" to i64, !dbg !1320
  call void @profOp(i64 444, i8 11, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1320
  %"445.x262" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !1320, !opID !1321, !stats.instNumber !1322, !opSignedness !59
  %"446." = load i8, i8* %"445.x262", align 1, !dbg !1320, !opID !1323, !stats.instNumber !1324, !opSignedness !59
  %"447.conv63" = zext i8 %"446." to i32, !dbg !1325, !opID !1326, !stats.instNumber !1327, !opSignedness !59
  %"448.div64" = sdiv i32 %"447.conv63", 3, !dbg !1328, !opID !1329, !stats.instNumber !1330, !opSignedness !59
  %13 = sext i32 %"448.div64" to i64, !dbg !1331
  call void @profOp(i64 448, i8 18, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1331
  %"449.add65" = add i32 %"444.add61", %"448.div64", !dbg !1331, !opID !1332, !stats.instNumber !1333, !opSignedness !59
  %14 = sext i32 %"449.add65" to i64, !dbg !1300
  call void @profOp(i64 449, i8 11, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1300
  %"450.conv66" = trunc i32 %"449.add65" to i8, !dbg !1300, !opID !1334, !stats.instNumber !1335, !opSignedness !59
  %"451." = load %struct.Triangle_2D*, %struct.Triangle_2D** %"292.triangle_2d.addr", align 8, !dbg !1336, !opID !1337, !stats.instNumber !1338, !opSignedness !59
  %"452.z67" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %"451.", i32 0, i32 6, !dbg !1339, !opID !1340, !stats.instNumber !1341, !opSignedness !59
  store i8 %"450.conv66", i8* %"452.z67", align 1, !dbg !1342, !opID !1343, !stats.instNumber !1344, !opSignedness !59
  br label %if.end, !dbg !1345, !opID !1346, !stats.instNumber !1347, !opSignedness !59

if.end:                                           ; preds = %if.then42, %if.else40
  br label %if.end68, !opID !1348, !stats.instNumber !1349, !opSignedness !59

if.end68:                                         ; preds = %if.end, %if.then14
  br label %if.end69, !opID !1350, !stats.instNumber !1351, !opSignedness !59

if.end69:                                         ; preds = %if.end68, %if.then
  ret void, !dbg !1352, !opID !1353, !stats.instNumber !1354, !opSignedness !59
}

; Function Attrs: nounwind
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* %max_min, i32* %max_index) #11 !dbg !1355 {
entry:
  %"458.retval" = alloca i1, align 1, !opID !1360, !stats.instNumber !1361, !opSignedness !59
  %"459.max_min.addr" = alloca i8*, align 8, !opID !1362, !stats.instNumber !1363, !opSignedness !59
  %"460.max_index.addr" = alloca i32*, align 8, !opID !1364, !stats.instNumber !1365, !opSignedness !59
  %"461.agg.tmp" = alloca %struct.Triangle_2D, align 1, !opID !1366, !stats.instNumber !1367, !opSignedness !59
  %"462.agg.tmp1" = alloca %struct.Triangle_2D, align 1, !opID !1368, !stats.instNumber !1369, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !1370, metadata !DIExpression()), !dbg !1371, !opID !1372, !stats.instNumber !1373, !opSignedness !59
  store i8* %max_min, i8** %"459.max_min.addr", align 8, !opID !1374, !stats.instNumber !1375, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8** %"459.max_min.addr", metadata !1376, metadata !DIExpression()), !dbg !1377, !opID !1378, !stats.instNumber !1379, !opSignedness !59
  store i32* %max_index, i32** %"460.max_index.addr", align 8, !opID !1380, !stats.instNumber !1381, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32** %"460.max_index.addr", metadata !1382, metadata !DIExpression()), !dbg !1383, !opID !1384, !stats.instNumber !1385, !opSignedness !59
  %"468." = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !1386, !opID !1388, !stats.instNumber !1389, !opSignedness !59
  store %struct.Triangle_2D %"468.", %struct.Triangle_2D* %"461.agg.tmp", align 1, !dbg !1386, !opID !1390, !stats.instNumber !1391, !opSignedness !59
  %"470.call" = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %"461.agg.tmp"), !dbg !1392, !opID !1393, !stats.instNumber !1394, !opSignedness !59
  %"471.cmp" = icmp eq i32 %"470.call", 0, !dbg !1395, !opID !1396, !stats.instNumber !1397, !opSignedness !59
  br i1 %"471.cmp", label %if.then, label %if.end, !dbg !1398, !opID !1399, !stats.instNumber !1400, !opSignedness !59

if.then:                                          ; preds = %entry
  store i1 true, i1* %"458.retval", align 1, !dbg !1401, !opID !1402, !stats.instNumber !1403, !opSignedness !59
  br label %return, !dbg !1401, !opID !1404, !stats.instNumber !1405, !opSignedness !59

if.end:                                           ; preds = %entry
  %"475." = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !1406, !opID !1408, !stats.instNumber !1409, !opSignedness !59
  store %struct.Triangle_2D %"475.", %struct.Triangle_2D* %"462.agg.tmp1", align 1, !dbg !1406, !opID !1410, !stats.instNumber !1411, !opSignedness !59
  %"477.call2" = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %"462.agg.tmp1"), !dbg !1412, !opID !1413, !stats.instNumber !1414, !opSignedness !59
  %"478.cmp3" = icmp slt i32 %"477.call2", 0, !dbg !1415, !opID !1416, !stats.instNumber !1417, !opSignedness !59
  br i1 %"478.cmp3", label %if.then4, label %if.end5, !dbg !1418, !opID !1419, !stats.instNumber !1420, !opSignedness !59

if.then4:                                         ; preds = %if.end
  call void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d), !dbg !1421, !opID !1422, !stats.instNumber !1423, !opSignedness !59
  br label %if.end5, !dbg !1421, !opID !1424, !stats.instNumber !1425, !opSignedness !59

if.end5:                                          ; preds = %if.then4, %if.end
  %"482.x0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !1426, !opID !1427, !stats.instNumber !1428, !opSignedness !59
  %"483." = load i8, i8* %"482.x0", align 1, !dbg !1426, !opID !1429, !stats.instNumber !1430, !opSignedness !59
  %"484.x1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !1431, !opID !1432, !stats.instNumber !1433, !opSignedness !59
  %"485." = load i8, i8* %"484.x1", align 1, !dbg !1431, !opID !1434, !stats.instNumber !1435, !opSignedness !59
  %"486.x2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !1436, !opID !1437, !stats.instNumber !1438, !opSignedness !59
  %"487." = load i8, i8* %"486.x2", align 1, !dbg !1436, !opID !1439, !stats.instNumber !1440, !opSignedness !59
  %"488.call6" = call zeroext i8 @_Z8find_minhhh(i8 zeroext %"483.", i8 zeroext %"485.", i8 zeroext %"487."), !dbg !1441, !opID !1442, !stats.instNumber !1443, !opSignedness !59
  %"489." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1444, !opID !1445, !stats.instNumber !1446, !opSignedness !59
  %"490.arrayidx" = getelementptr inbounds i8, i8* %"489.", i64 0, !dbg !1444, !opID !1447, !stats.instNumber !1448, !opSignedness !59
  store i8 %"488.call6", i8* %"490.arrayidx", align 1, !dbg !1449, !opID !1450, !stats.instNumber !1451, !opSignedness !59
  %"492.x07" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !1452, !opID !1453, !stats.instNumber !1454, !opSignedness !59
  %"493." = load i8, i8* %"492.x07", align 1, !dbg !1452, !opID !1455, !stats.instNumber !1456, !opSignedness !59
  %"494.x18" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !1457, !opID !1458, !stats.instNumber !1459, !opSignedness !59
  %"495." = load i8, i8* %"494.x18", align 1, !dbg !1457, !opID !1460, !stats.instNumber !1461, !opSignedness !59
  %"496.x29" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !1462, !opID !1463, !stats.instNumber !1464, !opSignedness !59
  %"497." = load i8, i8* %"496.x29", align 1, !dbg !1462, !opID !1465, !stats.instNumber !1466, !opSignedness !59
  %"498.call10" = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %"493.", i8 zeroext %"495.", i8 zeroext %"497."), !dbg !1467, !opID !1468, !stats.instNumber !1469, !opSignedness !59
  %"499." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1470, !opID !1471, !stats.instNumber !1472, !opSignedness !59
  %"500.arrayidx11" = getelementptr inbounds i8, i8* %"499.", i64 1, !dbg !1470, !opID !1473, !stats.instNumber !1474, !opSignedness !59
  store i8 %"498.call10", i8* %"500.arrayidx11", align 1, !dbg !1475, !opID !1476, !stats.instNumber !1477, !opSignedness !59
  %"502.y0" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !1478, !opID !1479, !stats.instNumber !1480, !opSignedness !59
  %"503." = load i8, i8* %"502.y0", align 1, !dbg !1478, !opID !1481, !stats.instNumber !1482, !opSignedness !59
  %"504.y1" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !1483, !opID !1484, !stats.instNumber !1485, !opSignedness !59
  %"505." = load i8, i8* %"504.y1", align 1, !dbg !1483, !opID !1486, !stats.instNumber !1487, !opSignedness !59
  %"506.y2" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !1488, !opID !1489, !stats.instNumber !1490, !opSignedness !59
  %"507." = load i8, i8* %"506.y2", align 1, !dbg !1488, !opID !1491, !stats.instNumber !1492, !opSignedness !59
  %"508.call12" = call zeroext i8 @_Z8find_minhhh(i8 zeroext %"503.", i8 zeroext %"505.", i8 zeroext %"507."), !dbg !1493, !opID !1494, !stats.instNumber !1495, !opSignedness !59
  %"509." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1496, !opID !1497, !stats.instNumber !1498, !opSignedness !59
  %"510.arrayidx13" = getelementptr inbounds i8, i8* %"509.", i64 2, !dbg !1496, !opID !1499, !stats.instNumber !1500, !opSignedness !59
  store i8 %"508.call12", i8* %"510.arrayidx13", align 1, !dbg !1501, !opID !1502, !stats.instNumber !1503, !opSignedness !59
  %"512.y014" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !1504, !opID !1505, !stats.instNumber !1506, !opSignedness !59
  %"513." = load i8, i8* %"512.y014", align 1, !dbg !1504, !opID !1507, !stats.instNumber !1508, !opSignedness !59
  %"514.y115" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !1509, !opID !1510, !stats.instNumber !1511, !opSignedness !59
  %"515." = load i8, i8* %"514.y115", align 1, !dbg !1509, !opID !1512, !stats.instNumber !1513, !opSignedness !59
  %"516.y216" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !1514, !opID !1515, !stats.instNumber !1516, !opSignedness !59
  %"517." = load i8, i8* %"516.y216", align 1, !dbg !1514, !opID !1517, !stats.instNumber !1518, !opSignedness !59
  %"518.call17" = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %"513.", i8 zeroext %"515.", i8 zeroext %"517."), !dbg !1519, !opID !1520, !stats.instNumber !1521, !opSignedness !59
  %"519." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1522, !opID !1523, !stats.instNumber !1524, !opSignedness !59
  %"520.arrayidx18" = getelementptr inbounds i8, i8* %"519.", i64 3, !dbg !1522, !opID !1525, !stats.instNumber !1526, !opSignedness !59
  store i8 %"518.call17", i8* %"520.arrayidx18", align 1, !dbg !1527, !opID !1528, !stats.instNumber !1529, !opSignedness !59
  %"522." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1530, !opID !1531, !stats.instNumber !1532, !opSignedness !59
  %"523.arrayidx19" = getelementptr inbounds i8, i8* %"522.", i64 1, !dbg !1530, !opID !1533, !stats.instNumber !1534, !opSignedness !59
  %"524." = load i8, i8* %"523.arrayidx19", align 1, !dbg !1530, !opID !1535, !stats.instNumber !1536, !opSignedness !59
  %"525.conv" = zext i8 %"524." to i32, !dbg !1530, !opID !1537, !stats.instNumber !1538, !opSignedness !59
  %"526." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1539, !opID !1540, !stats.instNumber !1541, !opSignedness !59
  %"527.arrayidx20" = getelementptr inbounds i8, i8* %"526.", i64 0, !dbg !1539, !opID !1542, !stats.instNumber !1543, !opSignedness !59
  %"528." = load i8, i8* %"527.arrayidx20", align 1, !dbg !1539, !opID !1544, !stats.instNumber !1545, !opSignedness !59
  %"529.conv21" = zext i8 %"528." to i32, !dbg !1539, !opID !1546, !stats.instNumber !1547, !opSignedness !59
  %"530.sub" = sub i32 %"525.conv", %"529.conv21", !dbg !1548, !opID !1549, !stats.instNumber !1550, !opSignedness !59
  %0 = sext i32 %"530.sub" to i64, !dbg !1530
  call void @profOp(i64 530, i8 13, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1530
  %"531.conv22" = trunc i32 %"530.sub" to i8, !dbg !1530, !opID !1551, !stats.instNumber !1552, !opSignedness !59
  %"532." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1553, !opID !1554, !stats.instNumber !1555, !opSignedness !59
  %"533.arrayidx23" = getelementptr inbounds i8, i8* %"532.", i64 4, !dbg !1553, !opID !1556, !stats.instNumber !1557, !opSignedness !59
  store i8 %"531.conv22", i8* %"533.arrayidx23", align 1, !dbg !1558, !opID !1559, !stats.instNumber !1560, !opSignedness !59
  %"535." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1561, !opID !1562, !stats.instNumber !1563, !opSignedness !59
  %"536.arrayidx24" = getelementptr inbounds i8, i8* %"535.", i64 1, !dbg !1561, !opID !1564, !stats.instNumber !1565, !opSignedness !59
  %"537." = load i8, i8* %"536.arrayidx24", align 1, !dbg !1561, !opID !1566, !stats.instNumber !1567, !opSignedness !59
  %"538.conv25" = zext i8 %"537." to i32, !dbg !1561, !opID !1568, !stats.instNumber !1569, !opSignedness !59
  %"539." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1570, !opID !1571, !stats.instNumber !1572, !opSignedness !59
  %"540.arrayidx26" = getelementptr inbounds i8, i8* %"539.", i64 0, !dbg !1570, !opID !1573, !stats.instNumber !1574, !opSignedness !59
  %"541." = load i8, i8* %"540.arrayidx26", align 1, !dbg !1570, !opID !1575, !stats.instNumber !1576, !opSignedness !59
  %"542.conv27" = zext i8 %"541." to i32, !dbg !1570, !opID !1577, !stats.instNumber !1578, !opSignedness !59
  %"543.sub28" = sub i32 %"538.conv25", %"542.conv27", !dbg !1579, !opID !1580, !stats.instNumber !1581, !opSignedness !59
  %1 = sext i32 %"543.sub28" to i64, !dbg !1582
  call void @profOp(i64 543, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1582
  %"544." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1582, !opID !1583, !stats.instNumber !1584, !opSignedness !59
  %"545.arrayidx29" = getelementptr inbounds i8, i8* %"544.", i64 3, !dbg !1582, !opID !1585, !stats.instNumber !1586, !opSignedness !59
  %"546." = load i8, i8* %"545.arrayidx29", align 1, !dbg !1582, !opID !1587, !stats.instNumber !1588, !opSignedness !59
  %"547.conv30" = zext i8 %"546." to i32, !dbg !1582, !opID !1589, !stats.instNumber !1590, !opSignedness !59
  %"548." = load i8*, i8** %"459.max_min.addr", align 8, !dbg !1591, !opID !1592, !stats.instNumber !1593, !opSignedness !59
  %"549.arrayidx31" = getelementptr inbounds i8, i8* %"548.", i64 2, !dbg !1591, !opID !1594, !stats.instNumber !1595, !opSignedness !59
  %"550." = load i8, i8* %"549.arrayidx31", align 1, !dbg !1591, !opID !1596, !stats.instNumber !1597, !opSignedness !59
  %"551.conv32" = zext i8 %"550." to i32, !dbg !1591, !opID !1598, !stats.instNumber !1599, !opSignedness !59
  %"552.sub33" = sub i32 %"547.conv30", %"551.conv32", !dbg !1600, !opID !1601, !stats.instNumber !1602, !opSignedness !59
  %2 = sext i32 %"552.sub33" to i64, !dbg !1603
  call void @profOp(i64 552, i8 13, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1603
  %"553.mul" = mul i32 %"543.sub28", %"552.sub33", !dbg !1603, !opID !1604, !stats.instNumber !1605, !opSignedness !59
  %3 = sext i32 %"553.mul" to i64, !dbg !1606
  call void @profOp(i64 553, i8 15, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1606
  %"554." = load i32*, i32** %"460.max_index.addr", align 8, !dbg !1606, !opID !1607, !stats.instNumber !1608, !opSignedness !59
  %"555.arrayidx34" = getelementptr inbounds i32, i32* %"554.", i64 0, !dbg !1606, !opID !1609, !stats.instNumber !1610, !opSignedness !59
  store i32 %"553.mul", i32* %"555.arrayidx34", align 4, !dbg !1611, !opID !1612, !stats.instNumber !1613, !opSignedness !59
  store i1 false, i1* %"458.retval", align 1, !dbg !1614, !opID !1615, !stats.instNumber !1616, !opSignedness !59
  br label %return, !dbg !1614, !opID !1617, !stats.instNumber !1618, !opSignedness !59

return:                                           ; preds = %if.end5, %if.then
  %"559." = load i1, i1* %"458.retval", align 1, !dbg !1619, !opID !1620, !stats.instNumber !1621, !opSignedness !59
  ret i1 %"559.", !dbg !1619, !opID !1622, !stats.instNumber !1623, !opSignedness !59
}

; Function Attrs: nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* %max_min, i32* %max_index, %struct.Triangle_2D* byval align 1 %triangle_2d, %struct.CandidatePixel* %fragment) #12 !dbg !1624 {
entry:
  %"561.retval" = alloca i32, align 4, !opID !1627, !stats.instNumber !1628, !opSignedness !59
  %"562.flag.addr" = alloca i1, align 1, !opID !1629, !stats.instNumber !1630, !opSignedness !59
  %"563.max_min.addr" = alloca i8*, align 8, !opID !1631, !stats.instNumber !1632, !opSignedness !59
  %"564.max_index.addr" = alloca i32*, align 8, !opID !1633, !stats.instNumber !1634, !opSignedness !59
  %"565.fragment.addr" = alloca %struct.CandidatePixel*, align 8, !opID !1635, !stats.instNumber !1636, !opSignedness !59
  %"566.color" = alloca i8, align 1, !opID !1637, !stats.instNumber !1638, !opSignedness !59
  %"567.i" = alloca i32, align 4, !opID !1639, !stats.instNumber !1640, !opSignedness !59
  %"568.k" = alloca i32, align 4, !opID !1641, !stats.instNumber !1642, !opSignedness !59
  %"569.x" = alloca i8, align 1, !opID !1643, !stats.instNumber !1644, !opSignedness !59
  %"570.y" = alloca i8, align 1, !opID !1645, !stats.instNumber !1646, !opSignedness !59
  %"571.agg.tmp" = alloca %struct.Triangle_2D, align 1, !opID !1647, !stats.instNumber !1648, !opSignedness !59
  store i1 %flag, i1* %"562.flag.addr", align 1, !opID !1649, !stats.instNumber !1650, !opSignedness !59
  call void @llvm.dbg.declare(metadata i1* %"562.flag.addr", metadata !1651, metadata !DIExpression()), !dbg !1652, !opID !1653, !stats.instNumber !1654, !opSignedness !59
  store i8* %max_min, i8** %"563.max_min.addr", align 8, !opID !1655, !stats.instNumber !1656, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8** %"563.max_min.addr", metadata !1657, metadata !DIExpression()), !dbg !1658, !opID !1659, !stats.instNumber !1660, !opSignedness !59
  store i32* %max_index, i32** %"564.max_index.addr", align 8, !opID !1661, !stats.instNumber !1662, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32** %"564.max_index.addr", metadata !1663, metadata !DIExpression()), !dbg !1664, !opID !1665, !stats.instNumber !1666, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !1667, metadata !DIExpression()), !dbg !1668, !opID !1669, !stats.instNumber !1670, !opSignedness !59
  store %struct.CandidatePixel* %fragment, %struct.CandidatePixel** %"565.fragment.addr", align 8, !opID !1671, !stats.instNumber !1672, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %"565.fragment.addr", metadata !1673, metadata !DIExpression()), !dbg !1674, !opID !1675, !stats.instNumber !1676, !opSignedness !59
  %"581." = load i1, i1* %"562.flag.addr", align 1, !dbg !1677, !opID !1679, !stats.instNumber !1680, !opSignedness !59
  br i1 %"581.", label %if.then, label %if.end, !dbg !1681, !opID !1682, !stats.instNumber !1683, !opSignedness !59

if.then:                                          ; preds = %entry
  store i32 0, i32* %"561.retval", align 4, !dbg !1684, !opID !1686, !stats.instNumber !1687, !opSignedness !59
  br label %return, !dbg !1684, !opID !1688, !stats.instNumber !1689, !opSignedness !59

if.end:                                           ; preds = %entry
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"566.color") #19, !dbg !1690, !opID !1691, !stats.instNumber !1692, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"566.color", metadata !1693, metadata !DIExpression()), !dbg !1694, !opID !1695, !stats.instNumber !1696, !opSignedness !59
  store i8 100, i8* %"566.color", align 1, !dbg !1694, !opID !1697, !stats.instNumber !1698, !opSignedness !59
  %"588." = bitcast i32* %"567.i" to i8*, !dbg !1699, !opID !1700, !stats.instNumber !1701, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"588.") #19, !dbg !1699, !opID !1702, !stats.instNumber !1703, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"567.i", metadata !1704, metadata !DIExpression()), !dbg !1705, !opID !1706, !stats.instNumber !1707, !opSignedness !59
  store i32 0, i32* %"567.i", align 4, !dbg !1705, !opID !1708, !stats.instNumber !1709, !opSignedness !59
  br label %RAST2, !dbg !1699, !opID !1710, !stats.instNumber !1711, !opSignedness !59

RAST2:                                            ; preds = %if.end
  %"593." = bitcast i32* %"568.k" to i8*, !dbg !1712, !opID !1714, !stats.instNumber !1715, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"593.") #19, !dbg !1712, !opID !1716, !stats.instNumber !1717, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"568.k", metadata !1718, metadata !DIExpression()), !dbg !1719, !opID !1720, !stats.instNumber !1721, !opSignedness !59
  store i32 0, i32* %"568.k", align 4, !dbg !1719, !opID !1722, !stats.instNumber !1723, !opSignedness !59
  br label %for.cond, !dbg !1712, !opID !1724, !stats.instNumber !1725, !opSignedness !59

for.cond:                                         ; preds = %for.inc, %RAST2
  %"598." = load i32, i32* %"568.k", align 4, !dbg !1726, !opID !1728, !stats.instNumber !1729, !opSignedness !59
  %"599." = load i32*, i32** %"564.max_index.addr", align 8, !dbg !1730, !opID !1731, !stats.instNumber !1732, !opSignedness !59
  %"600.arrayidx" = getelementptr inbounds i32, i32* %"599.", i64 0, !dbg !1730, !opID !1733, !stats.instNumber !1734, !opSignedness !59
  %"601." = load i32, i32* %"600.arrayidx", align 4, !dbg !1730, !opID !1735, !stats.instNumber !1736, !opSignedness !59
  %"602.cmp" = icmp slt i32 %"598.", %"601.", !dbg !1737, !opID !1738, !stats.instNumber !1739, !opSignedness !59
  br i1 %"602.cmp", label %for.body, label %for.cond.cleanup, !dbg !1740, !opID !1741, !stats.instNumber !1742, !opSignedness !59

for.cond.cleanup:                                 ; preds = %for.cond
  %"604." = bitcast i32* %"568.k" to i8*, !dbg !1743, !opID !1744, !stats.instNumber !1745, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"604.") #19, !dbg !1743, !opID !1746, !stats.instNumber !1747, !opSignedness !59
  br label %for.end, !opID !1748, !stats.instNumber !1749, !opSignedness !59

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"569.x") #19, !dbg !1750, !opID !1752, !stats.instNumber !1753, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"569.x", metadata !1754, metadata !DIExpression()), !dbg !1755, !opID !1756, !stats.instNumber !1757, !opSignedness !59
  %"609." = load i8*, i8** %"563.max_min.addr", align 8, !dbg !1758, !opID !1759, !stats.instNumber !1760, !opSignedness !59
  %"610.arrayidx1" = getelementptr inbounds i8, i8* %"609.", i64 0, !dbg !1758, !opID !1761, !stats.instNumber !1762, !opSignedness !59
  %"611." = load i8, i8* %"610.arrayidx1", align 1, !dbg !1758, !opID !1763, !stats.instNumber !1764, !opSignedness !59
  %"612.conv" = zext i8 %"611." to i32, !dbg !1758, !opID !1765, !stats.instNumber !1766, !opSignedness !59
  %"613." = load i32, i32* %"568.k", align 4, !dbg !1767, !opID !1768, !stats.instNumber !1769, !opSignedness !59
  %"614." = load i8*, i8** %"563.max_min.addr", align 8, !dbg !1770, !opID !1771, !stats.instNumber !1772, !opSignedness !59
  %"615.arrayidx2" = getelementptr inbounds i8, i8* %"614.", i64 4, !dbg !1770, !opID !1773, !stats.instNumber !1774, !opSignedness !59
  %"616." = load i8, i8* %"615.arrayidx2", align 1, !dbg !1770, !opID !1775, !stats.instNumber !1776, !opSignedness !59
  %"617.conv3" = zext i8 %"616." to i32, !dbg !1770, !opID !1777, !stats.instNumber !1778, !opSignedness !59
  %"618.rem" = srem i32 %"613.", %"617.conv3", !dbg !1779, !opID !1780, !stats.instNumber !1781, !opSignedness !59
  %0 = sext i32 %"618.rem" to i64, !dbg !1782
  call void @profOp(i64 618, i8 21, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1782
  %"619.add" = add i32 %"612.conv", %"618.rem", !dbg !1782, !opID !1783, !stats.instNumber !1784, !opSignedness !59
  %1 = sext i32 %"619.add" to i64, !dbg !1758
  call void @profOp(i64 619, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1758
  %"620.conv4" = trunc i32 %"619.add" to i8, !dbg !1758, !opID !1785, !stats.instNumber !1786, !opSignedness !59
  store i8 %"620.conv4", i8* %"569.x", align 1, !dbg !1755, !opID !1787, !stats.instNumber !1788, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"570.y") #19, !dbg !1789, !opID !1790, !stats.instNumber !1791, !opSignedness !59
  call void @llvm.dbg.declare(metadata i8* %"570.y", metadata !1792, metadata !DIExpression()), !dbg !1793, !opID !1794, !stats.instNumber !1795, !opSignedness !59
  %"624." = load i8*, i8** %"563.max_min.addr", align 8, !dbg !1796, !opID !1797, !stats.instNumber !1798, !opSignedness !59
  %"625.arrayidx5" = getelementptr inbounds i8, i8* %"624.", i64 2, !dbg !1796, !opID !1799, !stats.instNumber !1800, !opSignedness !59
  %"626." = load i8, i8* %"625.arrayidx5", align 1, !dbg !1796, !opID !1801, !stats.instNumber !1802, !opSignedness !59
  %"627.conv6" = zext i8 %"626." to i32, !dbg !1796, !opID !1803, !stats.instNumber !1804, !opSignedness !59
  %"628." = load i32, i32* %"568.k", align 4, !dbg !1805, !opID !1806, !stats.instNumber !1807, !opSignedness !59
  %"629." = load i8*, i8** %"563.max_min.addr", align 8, !dbg !1808, !opID !1809, !stats.instNumber !1810, !opSignedness !59
  %"630.arrayidx7" = getelementptr inbounds i8, i8* %"629.", i64 4, !dbg !1808, !opID !1811, !stats.instNumber !1812, !opSignedness !59
  %"631." = load i8, i8* %"630.arrayidx7", align 1, !dbg !1808, !opID !1813, !stats.instNumber !1814, !opSignedness !59
  %"632.conv8" = zext i8 %"631." to i32, !dbg !1808, !opID !1815, !stats.instNumber !1816, !opSignedness !59
  %"633.div" = sdiv i32 %"628.", %"632.conv8", !dbg !1817, !opID !1818, !stats.instNumber !1819, !opSignedness !59
  %2 = sext i32 %"633.div" to i64, !dbg !1820
  call void @profOp(i64 633, i8 18, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1820
  %"634.add9" = add i32 %"627.conv6", %"633.div", !dbg !1820, !opID !1821, !stats.instNumber !1822, !opSignedness !59
  %3 = sext i32 %"634.add9" to i64, !dbg !1796
  call void @profOp(i64 634, i8 11, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1796
  %"635.conv10" = trunc i32 %"634.add9" to i8, !dbg !1796, !opID !1823, !stats.instNumber !1824, !opSignedness !59
  store i8 %"635.conv10", i8* %"570.y", align 1, !dbg !1793, !opID !1825, !stats.instNumber !1826, !opSignedness !59
  %"637." = load i8, i8* %"569.x", align 1, !dbg !1827, !opID !1829, !stats.instNumber !1830, !opSignedness !59
  %"638." = load i8, i8* %"570.y", align 1, !dbg !1831, !opID !1832, !stats.instNumber !1833, !opSignedness !59
  %"639." = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !1834, !opID !1835, !stats.instNumber !1836, !opSignedness !59
  store %struct.Triangle_2D %"639.", %struct.Triangle_2D* %"571.agg.tmp", align 1, !dbg !1834, !opID !1837, !stats.instNumber !1838, !opSignedness !59
  %"641.call" = call zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %"637.", i8 zeroext %"638.", %struct.Triangle_2D* byval align 1 %"571.agg.tmp"), !dbg !1839, !opID !1840, !stats.instNumber !1841, !opSignedness !59
  br i1 %"641.call", label %if.then11, label %if.end23, !dbg !1842, !opID !1843, !stats.instNumber !1844, !opSignedness !59

if.then11:                                        ; preds = %for.body
  %"643." = load i8, i8* %"569.x", align 1, !dbg !1845, !opID !1847, !stats.instNumber !1848, !opSignedness !59
  %"644." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"565.fragment.addr", align 8, !dbg !1849, !opID !1850, !stats.instNumber !1851, !opSignedness !59
  %"645." = load i32, i32* %"567.i", align 4, !dbg !1852, !opID !1853, !stats.instNumber !1854, !opSignedness !59
  %"646.idxprom" = sext i32 %"645." to i64, !dbg !1849, !opID !1855, !stats.instNumber !1856, !opSignedness !59
  %"647.arrayidx12" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"644.", i64 %"646.idxprom", !dbg !1849, !opID !1857, !stats.instNumber !1858, !opSignedness !59
  %"648.x13" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"647.arrayidx12", i32 0, i32 0, !dbg !1859, !opID !1860, !stats.instNumber !1861, !opSignedness !59
  store i8 %"643.", i8* %"648.x13", align 1, !dbg !1862, !opID !1863, !stats.instNumber !1864, !opSignedness !59
  %"650." = load i8, i8* %"570.y", align 1, !dbg !1865, !opID !1866, !stats.instNumber !1867, !opSignedness !59
  %"651." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"565.fragment.addr", align 8, !dbg !1868, !opID !1869, !stats.instNumber !1870, !opSignedness !59
  %"652." = load i32, i32* %"567.i", align 4, !dbg !1871, !opID !1872, !stats.instNumber !1873, !opSignedness !59
  %"653.idxprom14" = sext i32 %"652." to i64, !dbg !1868, !opID !1874, !stats.instNumber !1875, !opSignedness !59
  %"654.arrayidx15" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"651.", i64 %"653.idxprom14", !dbg !1868, !opID !1876, !stats.instNumber !1877, !opSignedness !59
  %"655.y16" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"654.arrayidx15", i32 0, i32 1, !dbg !1878, !opID !1879, !stats.instNumber !1880, !opSignedness !59
  store i8 %"650.", i8* %"655.y16", align 1, !dbg !1881, !opID !1882, !stats.instNumber !1883, !opSignedness !59
  %"657.z" = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 6, !dbg !1884, !opID !1885, !stats.instNumber !1886, !opSignedness !59
  %"658." = load i8, i8* %"657.z", align 1, !dbg !1884, !opID !1887, !stats.instNumber !1888, !opSignedness !59
  %"659." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"565.fragment.addr", align 8, !dbg !1889, !opID !1890, !stats.instNumber !1891, !opSignedness !59
  %"660." = load i32, i32* %"567.i", align 4, !dbg !1892, !opID !1893, !stats.instNumber !1894, !opSignedness !59
  %"661.idxprom17" = sext i32 %"660." to i64, !dbg !1889, !opID !1895, !stats.instNumber !1896, !opSignedness !59
  %"662.arrayidx18" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"659.", i64 %"661.idxprom17", !dbg !1889, !opID !1897, !stats.instNumber !1898, !opSignedness !59
  %"663.z19" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"662.arrayidx18", i32 0, i32 2, !dbg !1899, !opID !1900, !stats.instNumber !1901, !opSignedness !59
  store i8 %"658.", i8* %"663.z19", align 1, !dbg !1902, !opID !1903, !stats.instNumber !1904, !opSignedness !59
  %"665." = load i8, i8* %"566.color", align 1, !dbg !1905, !opID !1906, !stats.instNumber !1907, !opSignedness !59
  %"666." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"565.fragment.addr", align 8, !dbg !1908, !opID !1909, !stats.instNumber !1910, !opSignedness !59
  %"667." = load i32, i32* %"567.i", align 4, !dbg !1911, !opID !1912, !stats.instNumber !1913, !opSignedness !59
  %"668.idxprom20" = sext i32 %"667." to i64, !dbg !1908, !opID !1914, !stats.instNumber !1915, !opSignedness !59
  %"669.arrayidx21" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"666.", i64 %"668.idxprom20", !dbg !1908, !opID !1916, !stats.instNumber !1917, !opSignedness !59
  %"670.color22" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"669.arrayidx21", i32 0, i32 3, !dbg !1918, !opID !1919, !stats.instNumber !1920, !opSignedness !59
  store i8 %"665.", i8* %"670.color22", align 1, !dbg !1921, !opID !1922, !stats.instNumber !1923, !opSignedness !59
  %"672." = load i32, i32* %"567.i", align 4, !dbg !1924, !opID !1925, !stats.instNumber !1926, !opSignedness !59
  %"673.inc" = add i32 %"672.", 1, !dbg !1924, !opID !1927, !stats.instNumber !1928, !opSignedness !59
  %4 = sext i32 %"673.inc" to i64, !dbg !1924
  call void @profOp(i64 673, i8 11, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1924
  store i32 %"673.inc", i32* %"567.i", align 4, !dbg !1924, !opID !1929, !stats.instNumber !1930, !opSignedness !59
  br label %if.end23, !dbg !1931, !opID !1932, !stats.instNumber !1933, !opSignedness !59

if.end23:                                         ; preds = %if.then11, %for.body
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"570.y") #19, !dbg !1934, !opID !1935, !stats.instNumber !1936, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"569.x") #19, !dbg !1934, !opID !1937, !stats.instNumber !1938, !opSignedness !59
  br label %for.inc, !dbg !1939, !opID !1940, !stats.instNumber !1941, !opSignedness !59

for.inc:                                          ; preds = %if.end23
  %"679." = load i32, i32* %"568.k", align 4, !dbg !1942, !opID !1943, !stats.instNumber !1944, !opSignedness !59
  %"680.inc24" = add i32 %"679.", 1, !dbg !1942, !opID !1945, !stats.instNumber !1946, !opSignedness !59
  %5 = sext i32 %"680.inc24" to i64, !dbg !1942
  call void @profOp(i64 680, i8 11, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1942
  store i32 %"680.inc24", i32* %"568.k", align 4, !dbg !1942, !opID !1947, !stats.instNumber !1948, !opSignedness !59
  br label %for.cond, !dbg !1743, !llvm.loop !1949, !opID !1952, !stats.instNumber !1953, !opSignedness !59

for.end:                                          ; preds = %for.cond.cleanup
  %"683." = load i32, i32* %"567.i", align 4, !dbg !1954, !opID !1955, !stats.instNumber !1956, !opSignedness !59
  store i32 %"683.", i32* %"561.retval", align 4, !dbg !1957, !opID !1958, !stats.instNumber !1959, !opSignedness !59
  %"685." = bitcast i32* %"567.i" to i8*, !dbg !1960, !opID !1961, !stats.instNumber !1962, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"685.") #19, !dbg !1960, !opID !1963, !stats.instNumber !1964, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"566.color") #19, !dbg !1960, !opID !1965, !stats.instNumber !1966, !opSignedness !59
  br label %return, !opID !1967, !stats.instNumber !1968, !opSignedness !59

return:                                           ; preds = %for.end, %if.then
  %"689." = load i32, i32* %"561.retval", align 4, !dbg !1960, !opID !1969, !stats.instNumber !1970, !opSignedness !59
  ret i32 %"689.", !dbg !1960, !opID !1971, !stats.instNumber !1972, !opSignedness !59
}

; Function Attrs: nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* %fragments, i32 %size, %struct.Pixel* %pixels) #13 !dbg !2 {
entry:
  %"691.counter.addr" = alloca i32, align 4, !opID !1973, !stats.instNumber !1974, !opSignedness !59
  %"692.fragments.addr" = alloca %struct.CandidatePixel*, align 8, !opID !1975, !stats.instNumber !1976, !opSignedness !59
  %"693.size.addr" = alloca i32, align 4, !opID !1977, !stats.instNumber !1978, !opSignedness !59
  %"694.pixels.addr" = alloca %struct.Pixel*, align 8, !opID !1979, !stats.instNumber !1980, !opSignedness !59
  %"695.i" = alloca i32, align 4, !opID !1981, !stats.instNumber !1982, !opSignedness !59
  %"696.cleanup.dest.slot" = alloca i32, align 4, !opID !1983, !stats.instNumber !1984, !opSignedness !59
  %"697.j" = alloca i32, align 4, !opID !1985, !stats.instNumber !1986, !opSignedness !59
  %"698.pixel_cntr" = alloca i32, align 4, !opID !1987, !stats.instNumber !1988, !opSignedness !59
  %"699.n" = alloca i32, align 4, !opID !1989, !stats.instNumber !1990, !opSignedness !59
  store i32 %counter, i32* %"691.counter.addr", align 4, !opID !1991, !stats.instNumber !1992, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"691.counter.addr", metadata !1993, metadata !DIExpression()), !dbg !1994, !opID !1995, !stats.instNumber !1996, !opSignedness !59
  store %struct.CandidatePixel* %fragments, %struct.CandidatePixel** %"692.fragments.addr", align 8, !opID !1997, !stats.instNumber !1998, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %"692.fragments.addr", metadata !1999, metadata !DIExpression()), !dbg !2000, !opID !2001, !stats.instNumber !2002, !opSignedness !59
  store i32 %size, i32* %"693.size.addr", align 4, !opID !2003, !stats.instNumber !2004, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"693.size.addr", metadata !2005, metadata !DIExpression()), !dbg !2006, !opID !2007, !stats.instNumber !2008, !opSignedness !59
  store %struct.Pixel* %pixels, %struct.Pixel** %"694.pixels.addr", align 8, !opID !2009, !stats.instNumber !2010, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Pixel** %"694.pixels.addr", metadata !2011, metadata !DIExpression()), !dbg !2012, !opID !2013, !stats.instNumber !2014, !opSignedness !59
  %"708." = load i32, i32* %"691.counter.addr", align 4, !dbg !2015, !opID !2017, !stats.instNumber !2018, !opSignedness !59
  %"709.cmp" = icmp eq i32 %"708.", 0, !dbg !2019, !opID !2020, !stats.instNumber !2021, !opSignedness !59
  br i1 %"709.cmp", label %if.then, label %if.end, !dbg !2022, !opID !2023, !stats.instNumber !2024, !opSignedness !59

if.then:                                          ; preds = %entry
  br label %ZCULLING_INIT_ROW, !dbg !2025, !opID !2026, !stats.instNumber !2027, !opSignedness !59

ZCULLING_INIT_ROW:                                ; preds = %if.then
  %"712." = bitcast i32* %"695.i" to i8*, !dbg !2028, !opID !2031, !stats.instNumber !2032, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"712.") #19, !dbg !2028, !opID !2033, !stats.instNumber !2034, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"695.i", metadata !2035, metadata !DIExpression()), !dbg !2036, !opID !2037, !stats.instNumber !2038, !opSignedness !59
  store i32 0, i32* %"695.i", align 4, !dbg !2036, !opID !2039, !stats.instNumber !2040, !opSignedness !59
  br label %for.cond, !dbg !2028, !opID !2041, !stats.instNumber !2042, !opSignedness !59

for.cond:                                         ; preds = %for.inc8, %ZCULLING_INIT_ROW
  %"717." = load i32, i32* %"695.i", align 4, !dbg !2043, !opID !2045, !stats.instNumber !2046, !opSignedness !59
  %"718.cmp1" = icmp slt i32 %"717.", 256, !dbg !2047, !opID !2048, !stats.instNumber !2049, !opSignedness !59
  br i1 %"718.cmp1", label %for.body, label %for.cond.cleanup, !dbg !2050, !opID !2051, !stats.instNumber !2052, !opSignedness !59

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %"696.cleanup.dest.slot", align 4, !opID !2053, !stats.instNumber !2054, !opSignedness !59
  %"721." = bitcast i32* %"695.i" to i8*, !dbg !2055, !opID !2056, !stats.instNumber !2057, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"721.") #19, !dbg !2055, !opID !2058, !stats.instNumber !2059, !opSignedness !59
  br label %for.end10, !opID !2060, !stats.instNumber !2061, !opSignedness !59

for.body:                                         ; preds = %for.cond
  br label %ZCULLING_INIT_COL, !dbg !2062, !opID !2063, !stats.instNumber !2064, !opSignedness !59

ZCULLING_INIT_COL:                                ; preds = %for.body
  %"725." = bitcast i32* %"697.j" to i8*, !dbg !2065, !opID !2068, !stats.instNumber !2069, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"725.") #19, !dbg !2065, !opID !2070, !stats.instNumber !2071, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"697.j", metadata !2072, metadata !DIExpression()), !dbg !2073, !opID !2074, !stats.instNumber !2075, !opSignedness !59
  store i32 0, i32* %"697.j", align 4, !dbg !2073, !opID !2076, !stats.instNumber !2077, !opSignedness !59
  br label %for.cond2, !dbg !2065, !opID !2078, !stats.instNumber !2079, !opSignedness !59

for.cond2:                                        ; preds = %for.inc, %ZCULLING_INIT_COL
  %"730." = load i32, i32* %"697.j", align 4, !dbg !2080, !opID !2082, !stats.instNumber !2083, !opSignedness !59
  %"731.cmp3" = icmp slt i32 %"730.", 256, !dbg !2084, !opID !2085, !stats.instNumber !2086, !opSignedness !59
  br i1 %"731.cmp3", label %for.body5, label %for.cond.cleanup4, !dbg !2087, !opID !2088, !stats.instNumber !2089, !opSignedness !59

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %"696.cleanup.dest.slot", align 4, !opID !2090, !stats.instNumber !2091, !opSignedness !59
  %"734." = bitcast i32* %"697.j" to i8*, !dbg !2092, !opID !2093, !stats.instNumber !2094, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"734.") #19, !dbg !2092, !opID !2095, !stats.instNumber !2096, !opSignedness !59
  br label %for.end, !opID !2097, !stats.instNumber !2098, !opSignedness !59

for.body5:                                        ; preds = %for.cond2
  %"737." = load i32, i32* %"695.i", align 4, !dbg !2099, !opID !2101, !stats.instNumber !2102, !opSignedness !59
  %"738.idxprom" = sext i32 %"737." to i64, !dbg !2103, !opID !2104, !stats.instNumber !2105, !opSignedness !59
  %"739.arrayidx" = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %"738.idxprom", !dbg !2103, !opID !2106, !stats.instNumber !2107, !opSignedness !59
  %"740." = load i32, i32* %"697.j", align 4, !dbg !2108, !opID !2109, !stats.instNumber !2110, !opSignedness !59
  %"741.idxprom6" = sext i32 %"740." to i64, !dbg !2103, !opID !2111, !stats.instNumber !2112, !opSignedness !59
  %"742.arrayidx7" = getelementptr inbounds [256 x i8], [256 x i8]* %"739.arrayidx", i64 0, i64 %"741.idxprom6", !dbg !2103, !opID !2113, !stats.instNumber !2114, !opSignedness !59
  store i8 -1, i8* %"742.arrayidx7", align 1, !dbg !2115, !opID !2116, !stats.instNumber !2117, !opSignedness !59
  br label %for.inc, !dbg !2118, !opID !2119, !stats.instNumber !2120, !opSignedness !59

for.inc:                                          ; preds = %for.body5
  %"745." = load i32, i32* %"697.j", align 4, !dbg !2121, !opID !2122, !stats.instNumber !2123, !opSignedness !59
  %"746.inc" = add i32 %"745.", 1, !dbg !2121, !opID !2124, !stats.instNumber !2125, !opSignedness !59
  %0 = sext i32 %"746.inc" to i64, !dbg !2121
  call void @profOp(i64 746, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2121
  store i32 %"746.inc", i32* %"697.j", align 4, !dbg !2121, !opID !2126, !stats.instNumber !2127, !opSignedness !59
  br label %for.cond2, !dbg !2092, !llvm.loop !2128, !opID !2131, !stats.instNumber !2132, !opSignedness !59

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !2133, !opID !2134, !stats.instNumber !2135, !opSignedness !59

for.inc8:                                         ; preds = %for.end
  %"750." = load i32, i32* %"695.i", align 4, !dbg !2136, !opID !2137, !stats.instNumber !2138, !opSignedness !59
  %"751.inc9" = add i32 %"750.", 1, !dbg !2136, !opID !2139, !stats.instNumber !2140, !opSignedness !59
  %1 = sext i32 %"751.inc9" to i64, !dbg !2136
  call void @profOp(i64 751, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2136
  store i32 %"751.inc9", i32* %"695.i", align 4, !dbg !2136, !opID !2141, !stats.instNumber !2142, !opSignedness !59
  br label %for.cond, !dbg !2055, !llvm.loop !2143, !opID !2146, !stats.instNumber !2147, !opSignedness !59

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !2148, !opID !2149, !stats.instNumber !2150, !opSignedness !59

if.end:                                           ; preds = %for.end10, %entry
  %"755." = bitcast i32* %"698.pixel_cntr" to i8*, !dbg !2151, !opID !2152, !stats.instNumber !2153, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"755.") #19, !dbg !2151, !opID !2154, !stats.instNumber !2155, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"698.pixel_cntr", metadata !2156, metadata !DIExpression()), !dbg !2157, !opID !2158, !stats.instNumber !2159, !opSignedness !59
  store i32 0, i32* %"698.pixel_cntr", align 4, !dbg !2157, !opID !2160, !stats.instNumber !2161, !opSignedness !59
  br label %ZCULLING, !dbg !2151, !opID !2162, !stats.instNumber !2163, !opSignedness !59

ZCULLING:                                         ; preds = %if.end
  %"760." = bitcast i32* %"699.n" to i8*, !dbg !2164, !opID !2166, !stats.instNumber !2167, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"760.") #19, !dbg !2164, !opID !2168, !stats.instNumber !2169, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"699.n", metadata !2170, metadata !DIExpression()), !dbg !2171, !opID !2172, !stats.instNumber !2173, !opSignedness !59
  store i32 0, i32* %"699.n", align 4, !dbg !2171, !opID !2174, !stats.instNumber !2175, !opSignedness !59
  br label %for.cond11, !dbg !2164, !opID !2176, !stats.instNumber !2177, !opSignedness !59

for.cond11:                                       ; preds = %for.inc60, %ZCULLING
  %"765." = load i32, i32* %"699.n", align 4, !dbg !2178, !opID !2180, !stats.instNumber !2181, !opSignedness !59
  %"766." = load i32, i32* %"693.size.addr", align 4, !dbg !2182, !opID !2183, !stats.instNumber !2184, !opSignedness !59
  %"767.cmp12" = icmp slt i32 %"765.", %"766.", !dbg !2185, !opID !2186, !stats.instNumber !2187, !opSignedness !59
  br i1 %"767.cmp12", label %for.body14, label %for.cond.cleanup13, !dbg !2188, !opID !2189, !stats.instNumber !2190, !opSignedness !59

for.cond.cleanup13:                               ; preds = %for.cond11
  store i32 11, i32* %"696.cleanup.dest.slot", align 4, !opID !2191, !stats.instNumber !2192, !opSignedness !59
  %"770." = bitcast i32* %"699.n" to i8*, !dbg !2193, !opID !2194, !stats.instNumber !2195, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"770.") #19, !dbg !2193, !opID !2196, !stats.instNumber !2197, !opSignedness !59
  br label %for.end62, !opID !2198, !stats.instNumber !2199, !opSignedness !59

for.body14:                                       ; preds = %for.cond11
  %"773." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2200, !opID !2203, !stats.instNumber !2204, !opSignedness !59
  %"774." = load i32, i32* %"699.n", align 4, !dbg !2205, !opID !2206, !stats.instNumber !2207, !opSignedness !59
  %"775.idxprom15" = sext i32 %"774." to i64, !dbg !2200, !opID !2208, !stats.instNumber !2209, !opSignedness !59
  %"776.arrayidx16" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"773.", i64 %"775.idxprom15", !dbg !2200, !opID !2210, !stats.instNumber !2211, !opSignedness !59
  %"777.z" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"776.arrayidx16", i32 0, i32 2, !dbg !2212, !opID !2213, !stats.instNumber !2214, !opSignedness !59
  %"778." = load i8, i8* %"777.z", align 1, !dbg !2212, !opID !2215, !stats.instNumber !2216, !opSignedness !59
  %"779.conv" = zext i8 %"778." to i32, !dbg !2200, !opID !2217, !stats.instNumber !2218, !opSignedness !59
  %"780." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2219, !opID !2220, !stats.instNumber !2221, !opSignedness !59
  %"781." = load i32, i32* %"699.n", align 4, !dbg !2222, !opID !2223, !stats.instNumber !2224, !opSignedness !59
  %"782.idxprom17" = sext i32 %"781." to i64, !dbg !2219, !opID !2225, !stats.instNumber !2226, !opSignedness !59
  %"783.arrayidx18" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"780.", i64 %"782.idxprom17", !dbg !2219, !opID !2227, !stats.instNumber !2228, !opSignedness !59
  %"784.y" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"783.arrayidx18", i32 0, i32 1, !dbg !2229, !opID !2230, !stats.instNumber !2231, !opSignedness !59
  %"785." = load i8, i8* %"784.y", align 1, !dbg !2229, !opID !2232, !stats.instNumber !2233, !opSignedness !59
  %"786.idxprom19" = zext i8 %"785." to i64, !dbg !2234, !opID !2235, !stats.instNumber !2236, !opSignedness !59
  %"787.arrayidx20" = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %"786.idxprom19", !dbg !2234, !opID !2237, !stats.instNumber !2238, !opSignedness !59
  %"788." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2239, !opID !2240, !stats.instNumber !2241, !opSignedness !59
  %"789." = load i32, i32* %"699.n", align 4, !dbg !2242, !opID !2243, !stats.instNumber !2244, !opSignedness !59
  %"790.idxprom21" = sext i32 %"789." to i64, !dbg !2239, !opID !2245, !stats.instNumber !2246, !opSignedness !59
  %"791.arrayidx22" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"788.", i64 %"790.idxprom21", !dbg !2239, !opID !2247, !stats.instNumber !2248, !opSignedness !59
  %"792.x" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"791.arrayidx22", i32 0, i32 0, !dbg !2249, !opID !2250, !stats.instNumber !2251, !opSignedness !59
  %"793." = load i8, i8* %"792.x", align 1, !dbg !2249, !opID !2252, !stats.instNumber !2253, !opSignedness !59
  %"794.idxprom23" = zext i8 %"793." to i64, !dbg !2234, !opID !2254, !stats.instNumber !2255, !opSignedness !59
  %"795.arrayidx24" = getelementptr inbounds [256 x i8], [256 x i8]* %"787.arrayidx20", i64 0, i64 %"794.idxprom23", !dbg !2234, !opID !2256, !stats.instNumber !2257, !opSignedness !59
  %"796." = load i8, i8* %"795.arrayidx24", align 1, !dbg !2234, !opID !2258, !stats.instNumber !2259, !opSignedness !59
  %"797.conv25" = zext i8 %"796." to i32, !dbg !2234, !opID !2260, !stats.instNumber !2261, !opSignedness !59
  %"798.cmp26" = icmp slt i32 %"779.conv", %"797.conv25", !dbg !2262, !opID !2263, !stats.instNumber !2264, !opSignedness !59
  br i1 %"798.cmp26", label %if.then27, label %if.end59, !dbg !2265, !opID !2266, !stats.instNumber !2267, !opSignedness !59

if.then27:                                        ; preds = %for.body14
  %"800." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2268, !opID !2270, !stats.instNumber !2271, !opSignedness !59
  %"801." = load i32, i32* %"699.n", align 4, !dbg !2272, !opID !2273, !stats.instNumber !2274, !opSignedness !59
  %"802.idxprom28" = sext i32 %"801." to i64, !dbg !2268, !opID !2275, !stats.instNumber !2276, !opSignedness !59
  %"803.arrayidx29" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"800.", i64 %"802.idxprom28", !dbg !2268, !opID !2277, !stats.instNumber !2278, !opSignedness !59
  %"804.x30" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"803.arrayidx29", i32 0, i32 0, !dbg !2279, !opID !2280, !stats.instNumber !2281, !opSignedness !59
  %"805." = load i8, i8* %"804.x30", align 1, !dbg !2279, !opID !2282, !stats.instNumber !2283, !opSignedness !59
  %"806." = load %struct.Pixel*, %struct.Pixel** %"694.pixels.addr", align 8, !dbg !2284, !opID !2285, !stats.instNumber !2286, !opSignedness !59
  %"807." = load i32, i32* %"698.pixel_cntr", align 4, !dbg !2287, !opID !2288, !stats.instNumber !2289, !opSignedness !59
  %"808.idxprom31" = sext i32 %"807." to i64, !dbg !2284, !opID !2290, !stats.instNumber !2291, !opSignedness !59
  %"809.arrayidx32" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"806.", i64 %"808.idxprom31", !dbg !2284, !opID !2292, !stats.instNumber !2293, !opSignedness !59
  %"810.x33" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"809.arrayidx32", i32 0, i32 0, !dbg !2294, !opID !2295, !stats.instNumber !2296, !opSignedness !59
  store i8 %"805.", i8* %"810.x33", align 1, !dbg !2297, !opID !2298, !stats.instNumber !2299, !opSignedness !59
  %"812." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2300, !opID !2301, !stats.instNumber !2302, !opSignedness !59
  %"813." = load i32, i32* %"699.n", align 4, !dbg !2303, !opID !2304, !stats.instNumber !2305, !opSignedness !59
  %"814.idxprom34" = sext i32 %"813." to i64, !dbg !2300, !opID !2306, !stats.instNumber !2307, !opSignedness !59
  %"815.arrayidx35" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"812.", i64 %"814.idxprom34", !dbg !2300, !opID !2308, !stats.instNumber !2309, !opSignedness !59
  %"816.y36" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"815.arrayidx35", i32 0, i32 1, !dbg !2310, !opID !2311, !stats.instNumber !2312, !opSignedness !59
  %"817." = load i8, i8* %"816.y36", align 1, !dbg !2310, !opID !2313, !stats.instNumber !2314, !opSignedness !59
  %"818." = load %struct.Pixel*, %struct.Pixel** %"694.pixels.addr", align 8, !dbg !2315, !opID !2316, !stats.instNumber !2317, !opSignedness !59
  %"819." = load i32, i32* %"698.pixel_cntr", align 4, !dbg !2318, !opID !2319, !stats.instNumber !2320, !opSignedness !59
  %"820.idxprom37" = sext i32 %"819." to i64, !dbg !2315, !opID !2321, !stats.instNumber !2322, !opSignedness !59
  %"821.arrayidx38" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"818.", i64 %"820.idxprom37", !dbg !2315, !opID !2323, !stats.instNumber !2324, !opSignedness !59
  %"822.y39" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"821.arrayidx38", i32 0, i32 1, !dbg !2325, !opID !2326, !stats.instNumber !2327, !opSignedness !59
  store i8 %"817.", i8* %"822.y39", align 1, !dbg !2328, !opID !2329, !stats.instNumber !2330, !opSignedness !59
  %"824." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2331, !opID !2332, !stats.instNumber !2333, !opSignedness !59
  %"825." = load i32, i32* %"699.n", align 4, !dbg !2334, !opID !2335, !stats.instNumber !2336, !opSignedness !59
  %"826.idxprom40" = sext i32 %"825." to i64, !dbg !2331, !opID !2337, !stats.instNumber !2338, !opSignedness !59
  %"827.arrayidx41" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"824.", i64 %"826.idxprom40", !dbg !2331, !opID !2339, !stats.instNumber !2340, !opSignedness !59
  %"828.color" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"827.arrayidx41", i32 0, i32 3, !dbg !2341, !opID !2342, !stats.instNumber !2343, !opSignedness !59
  %"829." = load i8, i8* %"828.color", align 1, !dbg !2341, !opID !2344, !stats.instNumber !2345, !opSignedness !59
  %"830." = load %struct.Pixel*, %struct.Pixel** %"694.pixels.addr", align 8, !dbg !2346, !opID !2347, !stats.instNumber !2348, !opSignedness !59
  %"831." = load i32, i32* %"698.pixel_cntr", align 4, !dbg !2349, !opID !2350, !stats.instNumber !2351, !opSignedness !59
  %"832.idxprom42" = sext i32 %"831." to i64, !dbg !2346, !opID !2352, !stats.instNumber !2353, !opSignedness !59
  %"833.arrayidx43" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"830.", i64 %"832.idxprom42", !dbg !2346, !opID !2354, !stats.instNumber !2355, !opSignedness !59
  %"834.color44" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"833.arrayidx43", i32 0, i32 2, !dbg !2356, !opID !2357, !stats.instNumber !2358, !opSignedness !59
  store i8 %"829.", i8* %"834.color44", align 1, !dbg !2359, !opID !2360, !stats.instNumber !2361, !opSignedness !59
  %"836." = load i32, i32* %"698.pixel_cntr", align 4, !dbg !2362, !opID !2363, !stats.instNumber !2364, !opSignedness !59
  %"837.inc45" = add i32 %"836.", 1, !dbg !2362, !opID !2365, !stats.instNumber !2366, !opSignedness !59
  %2 = sext i32 %"837.inc45" to i64, !dbg !2362
  call void @profOp(i64 837, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2362
  store i32 %"837.inc45", i32* %"698.pixel_cntr", align 4, !dbg !2362, !opID !2367, !stats.instNumber !2368, !opSignedness !59
  %"839." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2369, !opID !2370, !stats.instNumber !2371, !opSignedness !59
  %"840." = load i32, i32* %"699.n", align 4, !dbg !2372, !opID !2373, !stats.instNumber !2374, !opSignedness !59
  %"841.idxprom46" = sext i32 %"840." to i64, !dbg !2369, !opID !2375, !stats.instNumber !2376, !opSignedness !59
  %"842.arrayidx47" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"839.", i64 %"841.idxprom46", !dbg !2369, !opID !2377, !stats.instNumber !2378, !opSignedness !59
  %"843.z48" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"842.arrayidx47", i32 0, i32 2, !dbg !2379, !opID !2380, !stats.instNumber !2381, !opSignedness !59
  %"844." = load i8, i8* %"843.z48", align 1, !dbg !2379, !opID !2382, !stats.instNumber !2383, !opSignedness !59
  %"845." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2384, !opID !2385, !stats.instNumber !2386, !opSignedness !59
  %"846." = load i32, i32* %"699.n", align 4, !dbg !2387, !opID !2388, !stats.instNumber !2389, !opSignedness !59
  %"847.idxprom49" = sext i32 %"846." to i64, !dbg !2384, !opID !2390, !stats.instNumber !2391, !opSignedness !59
  %"848.arrayidx50" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"845.", i64 %"847.idxprom49", !dbg !2384, !opID !2392, !stats.instNumber !2393, !opSignedness !59
  %"849.y51" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"848.arrayidx50", i32 0, i32 1, !dbg !2394, !opID !2395, !stats.instNumber !2396, !opSignedness !59
  %"850." = load i8, i8* %"849.y51", align 1, !dbg !2394, !opID !2397, !stats.instNumber !2398, !opSignedness !59
  %"851.idxprom52" = zext i8 %"850." to i64, !dbg !2399, !opID !2400, !stats.instNumber !2401, !opSignedness !59
  %"852.arrayidx53" = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %"851.idxprom52", !dbg !2399, !opID !2402, !stats.instNumber !2403, !opSignedness !59
  %"853." = load %struct.CandidatePixel*, %struct.CandidatePixel** %"692.fragments.addr", align 8, !dbg !2404, !opID !2405, !stats.instNumber !2406, !opSignedness !59
  %"854." = load i32, i32* %"699.n", align 4, !dbg !2407, !opID !2408, !stats.instNumber !2409, !opSignedness !59
  %"855.idxprom54" = sext i32 %"854." to i64, !dbg !2404, !opID !2410, !stats.instNumber !2411, !opSignedness !59
  %"856.arrayidx55" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"853.", i64 %"855.idxprom54", !dbg !2404, !opID !2412, !stats.instNumber !2413, !opSignedness !59
  %"857.x56" = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %"856.arrayidx55", i32 0, i32 0, !dbg !2414, !opID !2415, !stats.instNumber !2416, !opSignedness !59
  %"858." = load i8, i8* %"857.x56", align 1, !dbg !2414, !opID !2417, !stats.instNumber !2418, !opSignedness !59
  %"859.idxprom57" = zext i8 %"858." to i64, !dbg !2399, !opID !2419, !stats.instNumber !2420, !opSignedness !59
  %"860.arrayidx58" = getelementptr inbounds [256 x i8], [256 x i8]* %"852.arrayidx53", i64 0, i64 %"859.idxprom57", !dbg !2399, !opID !2421, !stats.instNumber !2422, !opSignedness !59
  store i8 %"844.", i8* %"860.arrayidx58", align 1, !dbg !2423, !opID !2424, !stats.instNumber !2425, !opSignedness !59
  br label %if.end59, !dbg !2426, !opID !2427, !stats.instNumber !2428, !opSignedness !59

if.end59:                                         ; preds = %if.then27, %for.body14
  br label %for.inc60, !dbg !2429, !opID !2430, !stats.instNumber !2431, !opSignedness !59

for.inc60:                                        ; preds = %if.end59
  %"864." = load i32, i32* %"699.n", align 4, !dbg !2432, !opID !2433, !stats.instNumber !2434, !opSignedness !59
  %"865.inc61" = add i32 %"864.", 1, !dbg !2432, !opID !2435, !stats.instNumber !2436, !opSignedness !59
  %3 = sext i32 %"865.inc61" to i64, !dbg !2432
  call void @profOp(i64 865, i8 11, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2432
  store i32 %"865.inc61", i32* %"699.n", align 4, !dbg !2432, !opID !2437, !stats.instNumber !2438, !opSignedness !59
  br label %for.cond11, !dbg !2193, !llvm.loop !2439, !opID !2442, !stats.instNumber !2443, !opSignedness !59

for.end62:                                        ; preds = %for.cond.cleanup13
  %"868." = load i32, i32* %"698.pixel_cntr", align 4, !dbg !2444, !opID !2445, !stats.instNumber !2446, !opSignedness !59
  store i32 1, i32* %"696.cleanup.dest.slot", align 4, !opID !2447, !stats.instNumber !2448, !opSignedness !59
  %"870." = bitcast i32* %"698.pixel_cntr" to i8*, !dbg !2449, !opID !2450, !stats.instNumber !2451, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"870.") #19, !dbg !2449, !opID !2452, !stats.instNumber !2453, !opSignedness !59
  ret i32 %"868.", !dbg !2454, !opID !2455, !stats.instNumber !2456, !opSignedness !59
}

; Function Attrs: nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* %pixels, [256 x i8]* "fpga.decayed.dim.hint"="256" %frame_buffer) #14 !dbg !2457 {
entry:
  %"873.counter.addr" = alloca i32, align 4, !opID !2463, !stats.instNumber !2464, !opSignedness !59
  %"874.size_pixels.addr" = alloca i32, align 4, !opID !2465, !stats.instNumber !2466, !opSignedness !59
  %"875.pixels.addr" = alloca %struct.Pixel*, align 8, !opID !2467, !stats.instNumber !2468, !opSignedness !59
  %"876.frame_buffer.addr" = alloca [256 x i8]*, align 8, !opID !2469, !stats.instNumber !2470, !opSignedness !59
  %"877.i" = alloca i32, align 4, !opID !2471, !stats.instNumber !2472, !opSignedness !59
  %"878.cleanup.dest.slot" = alloca i32, align 4, !opID !2473, !stats.instNumber !2474, !opSignedness !59
  %"879.j" = alloca i32, align 4, !opID !2475, !stats.instNumber !2476, !opSignedness !59
  %"880.i11" = alloca i32, align 4, !opID !2477, !stats.instNumber !2478, !opSignedness !59
  store i32 %counter, i32* %"873.counter.addr", align 4, !opID !2479, !stats.instNumber !2480, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"873.counter.addr", metadata !2481, metadata !DIExpression()), !dbg !2482, !opID !2483, !stats.instNumber !2484, !opSignedness !59
  store i32 %size_pixels, i32* %"874.size_pixels.addr", align 4, !opID !2485, !stats.instNumber !2486, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"874.size_pixels.addr", metadata !2487, metadata !DIExpression()), !dbg !2488, !opID !2489, !stats.instNumber !2490, !opSignedness !59
  store %struct.Pixel* %pixels, %struct.Pixel** %"875.pixels.addr", align 8, !opID !2491, !stats.instNumber !2492, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Pixel** %"875.pixels.addr", metadata !2493, metadata !DIExpression()), !dbg !2494, !opID !2495, !stats.instNumber !2496, !opSignedness !59
  store [256 x i8]* %frame_buffer, [256 x i8]** %"876.frame_buffer.addr", align 8, !opID !2497, !stats.instNumber !2498, !opSignedness !59
  call void @llvm.dbg.declare(metadata [256 x i8]** %"876.frame_buffer.addr", metadata !2499, metadata !DIExpression()), !dbg !2500, !opID !2501, !stats.instNumber !2502, !opSignedness !59
  %"889." = load i32, i32* %"873.counter.addr", align 4, !dbg !2503, !opID !2505, !stats.instNumber !2506, !opSignedness !59
  %"890.cmp" = icmp eq i32 %"889.", 0, !dbg !2507, !opID !2508, !stats.instNumber !2509, !opSignedness !59
  br i1 %"890.cmp", label %if.then, label %if.end, !dbg !2510, !opID !2511, !stats.instNumber !2512, !opSignedness !59

if.then:                                          ; preds = %entry
  br label %COLORING_FB_INIT_ROW, !dbg !2513, !opID !2514, !stats.instNumber !2515, !opSignedness !59

COLORING_FB_INIT_ROW:                             ; preds = %if.then
  %"893." = bitcast i32* %"877.i" to i8*, !dbg !2516, !opID !2519, !stats.instNumber !2520, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"893.") #19, !dbg !2516, !opID !2521, !stats.instNumber !2522, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"877.i", metadata !2523, metadata !DIExpression()), !dbg !2524, !opID !2525, !stats.instNumber !2526, !opSignedness !59
  store i32 0, i32* %"877.i", align 4, !dbg !2524, !opID !2527, !stats.instNumber !2528, !opSignedness !59
  br label %for.cond, !dbg !2516, !opID !2529, !stats.instNumber !2530, !opSignedness !59

for.cond:                                         ; preds = %for.inc8, %COLORING_FB_INIT_ROW
  %"898." = load i32, i32* %"877.i", align 4, !dbg !2531, !opID !2533, !stats.instNumber !2534, !opSignedness !59
  %"899.cmp1" = icmp slt i32 %"898.", 256, !dbg !2535, !opID !2536, !stats.instNumber !2537, !opSignedness !59
  br i1 %"899.cmp1", label %for.body, label %for.cond.cleanup, !dbg !2538, !opID !2539, !stats.instNumber !2540, !opSignedness !59

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %"878.cleanup.dest.slot", align 4, !opID !2541, !stats.instNumber !2542, !opSignedness !59
  %"902." = bitcast i32* %"877.i" to i8*, !dbg !2543, !opID !2544, !stats.instNumber !2545, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"902.") #19, !dbg !2543, !opID !2546, !stats.instNumber !2547, !opSignedness !59
  br label %for.end10, !opID !2548, !stats.instNumber !2549, !opSignedness !59

for.body:                                         ; preds = %for.cond
  br label %COLORING_FB_INIT_COL, !dbg !2550, !opID !2551, !stats.instNumber !2552, !opSignedness !59

COLORING_FB_INIT_COL:                             ; preds = %for.body
  %"906." = bitcast i32* %"879.j" to i8*, !dbg !2553, !opID !2556, !stats.instNumber !2557, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"906.") #19, !dbg !2553, !opID !2558, !stats.instNumber !2559, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"879.j", metadata !2560, metadata !DIExpression()), !dbg !2561, !opID !2562, !stats.instNumber !2563, !opSignedness !59
  store i32 0, i32* %"879.j", align 4, !dbg !2561, !opID !2564, !stats.instNumber !2565, !opSignedness !59
  br label %for.cond2, !dbg !2553, !opID !2566, !stats.instNumber !2567, !opSignedness !59

for.cond2:                                        ; preds = %for.inc, %COLORING_FB_INIT_COL
  %"911." = load i32, i32* %"879.j", align 4, !dbg !2568, !opID !2570, !stats.instNumber !2571, !opSignedness !59
  %"912.cmp3" = icmp slt i32 %"911.", 256, !dbg !2572, !opID !2573, !stats.instNumber !2574, !opSignedness !59
  br i1 %"912.cmp3", label %for.body5, label %for.cond.cleanup4, !dbg !2575, !opID !2576, !stats.instNumber !2577, !opSignedness !59

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %"878.cleanup.dest.slot", align 4, !opID !2578, !stats.instNumber !2579, !opSignedness !59
  %"915." = bitcast i32* %"879.j" to i8*, !dbg !2580, !opID !2581, !stats.instNumber !2582, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"915.") #19, !dbg !2580, !opID !2583, !stats.instNumber !2584, !opSignedness !59
  br label %for.end, !opID !2585, !stats.instNumber !2586, !opSignedness !59

for.body5:                                        ; preds = %for.cond2
  %"918." = load [256 x i8]*, [256 x i8]** %"876.frame_buffer.addr", align 8, !dbg !2587, !opID !2588, !stats.instNumber !2589, !opSignedness !59
  %"919." = load i32, i32* %"877.i", align 4, !dbg !2590, !opID !2591, !stats.instNumber !2592, !opSignedness !59
  %"920.idxprom" = sext i32 %"919." to i64, !dbg !2587, !opID !2593, !stats.instNumber !2594, !opSignedness !59
  %"921.arrayidx" = getelementptr inbounds [256 x i8], [256 x i8]* %"918.", i64 %"920.idxprom", !dbg !2587, !opID !2595, !stats.instNumber !2596, !opSignedness !59
  %"922." = load i32, i32* %"879.j", align 4, !dbg !2597, !opID !2598, !stats.instNumber !2599, !opSignedness !59
  %"923.idxprom6" = sext i32 %"922." to i64, !dbg !2587, !opID !2600, !stats.instNumber !2601, !opSignedness !59
  %"924.arrayidx7" = getelementptr inbounds [256 x i8], [256 x i8]* %"921.arrayidx", i64 0, i64 %"923.idxprom6", !dbg !2587, !opID !2602, !stats.instNumber !2603, !opSignedness !59
  store i8 0, i8* %"924.arrayidx7", align 1, !dbg !2604, !opID !2605, !stats.instNumber !2606, !opSignedness !59
  br label %for.inc, !dbg !2587, !opID !2607, !stats.instNumber !2608, !opSignedness !59

for.inc:                                          ; preds = %for.body5
  %"927." = load i32, i32* %"879.j", align 4, !dbg !2609, !opID !2610, !stats.instNumber !2611, !opSignedness !59
  %"928.inc" = add i32 %"927.", 1, !dbg !2609, !opID !2612, !stats.instNumber !2613, !opSignedness !59
  %0 = sext i32 %"928.inc" to i64, !dbg !2609
  call void @profOp(i64 928, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2609
  store i32 %"928.inc", i32* %"879.j", align 4, !dbg !2609, !opID !2614, !stats.instNumber !2615, !opSignedness !59
  br label %for.cond2, !dbg !2580, !llvm.loop !2616, !opID !2619, !stats.instNumber !2620, !opSignedness !59

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !2621, !opID !2622, !stats.instNumber !2623, !opSignedness !59

for.inc8:                                         ; preds = %for.end
  %"932." = load i32, i32* %"877.i", align 4, !dbg !2624, !opID !2625, !stats.instNumber !2626, !opSignedness !59
  %"933.inc9" = add i32 %"932.", 1, !dbg !2624, !opID !2627, !stats.instNumber !2628, !opSignedness !59
  %1 = sext i32 %"933.inc9" to i64, !dbg !2624
  call void @profOp(i64 933, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2624
  store i32 %"933.inc9", i32* %"877.i", align 4, !dbg !2624, !opID !2629, !stats.instNumber !2630, !opSignedness !59
  br label %for.cond, !dbg !2543, !llvm.loop !2631, !opID !2634, !stats.instNumber !2635, !opSignedness !59

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !2636, !opID !2637, !stats.instNumber !2638, !opSignedness !59

if.end:                                           ; preds = %for.end10, %entry
  br label %COLORING_FB, !dbg !2639, !opID !2640, !stats.instNumber !2641, !opSignedness !59

COLORING_FB:                                      ; preds = %if.end
  %"938." = bitcast i32* %"880.i11" to i8*, !dbg !2642, !opID !2644, !stats.instNumber !2645, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"938.") #19, !dbg !2642, !opID !2646, !stats.instNumber !2647, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"880.i11", metadata !2648, metadata !DIExpression()), !dbg !2649, !opID !2650, !stats.instNumber !2651, !opSignedness !59
  store i32 0, i32* %"880.i11", align 4, !dbg !2649, !opID !2652, !stats.instNumber !2653, !opSignedness !59
  br label %for.cond12, !dbg !2642, !opID !2654, !stats.instNumber !2655, !opSignedness !59

for.cond12:                                       ; preds = %for.inc26, %COLORING_FB
  %"943." = load i32, i32* %"880.i11", align 4, !dbg !2656, !opID !2658, !stats.instNumber !2659, !opSignedness !59
  %"944." = load i32, i32* %"874.size_pixels.addr", align 4, !dbg !2660, !opID !2661, !stats.instNumber !2662, !opSignedness !59
  %"945.cmp13" = icmp slt i32 %"943.", %"944.", !dbg !2663, !opID !2664, !stats.instNumber !2665, !opSignedness !59
  br i1 %"945.cmp13", label %for.body15, label %for.cond.cleanup14, !dbg !2666, !opID !2667, !stats.instNumber !2668, !opSignedness !59

for.cond.cleanup14:                               ; preds = %for.cond12
  store i32 11, i32* %"878.cleanup.dest.slot", align 4, !opID !2669, !stats.instNumber !2670, !opSignedness !59
  %"948." = bitcast i32* %"880.i11" to i8*, !dbg !2671, !opID !2672, !stats.instNumber !2673, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"948.") #19, !dbg !2671, !opID !2674, !stats.instNumber !2675, !opSignedness !59
  br label %for.end28, !opID !2676, !stats.instNumber !2677, !opSignedness !59

for.body15:                                       ; preds = %for.cond12
  %"951." = load %struct.Pixel*, %struct.Pixel** %"875.pixels.addr", align 8, !dbg !2678, !opID !2679, !stats.instNumber !2680, !opSignedness !59
  %"952." = load i32, i32* %"880.i11", align 4, !dbg !2681, !opID !2682, !stats.instNumber !2683, !opSignedness !59
  %"953.idxprom16" = sext i32 %"952." to i64, !dbg !2678, !opID !2684, !stats.instNumber !2685, !opSignedness !59
  %"954.arrayidx17" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"951.", i64 %"953.idxprom16", !dbg !2678, !opID !2686, !stats.instNumber !2687, !opSignedness !59
  %"955.color" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"954.arrayidx17", i32 0, i32 2, !dbg !2688, !opID !2689, !stats.instNumber !2690, !opSignedness !59
  %"956." = load i8, i8* %"955.color", align 1, !dbg !2688, !opID !2691, !stats.instNumber !2692, !opSignedness !59
  %"957." = load [256 x i8]*, [256 x i8]** %"876.frame_buffer.addr", align 8, !dbg !2693, !opID !2694, !stats.instNumber !2695, !opSignedness !59
  %"958." = load %struct.Pixel*, %struct.Pixel** %"875.pixels.addr", align 8, !dbg !2696, !opID !2697, !stats.instNumber !2698, !opSignedness !59
  %"959." = load i32, i32* %"880.i11", align 4, !dbg !2699, !opID !2700, !stats.instNumber !2701, !opSignedness !59
  %"960.idxprom18" = sext i32 %"959." to i64, !dbg !2696, !opID !2702, !stats.instNumber !2703, !opSignedness !59
  %"961.arrayidx19" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"958.", i64 %"960.idxprom18", !dbg !2696, !opID !2704, !stats.instNumber !2705, !opSignedness !59
  %"962.x" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"961.arrayidx19", i32 0, i32 0, !dbg !2706, !opID !2707, !stats.instNumber !2708, !opSignedness !59
  %"963." = load i8, i8* %"962.x", align 1, !dbg !2706, !opID !2709, !stats.instNumber !2710, !opSignedness !59
  %"964.idxprom20" = zext i8 %"963." to i64, !dbg !2693, !opID !2711, !stats.instNumber !2712, !opSignedness !59
  %"965.arrayidx21" = getelementptr inbounds [256 x i8], [256 x i8]* %"957.", i64 %"964.idxprom20", !dbg !2693, !opID !2713, !stats.instNumber !2714, !opSignedness !59
  %"966." = load %struct.Pixel*, %struct.Pixel** %"875.pixels.addr", align 8, !dbg !2715, !opID !2716, !stats.instNumber !2717, !opSignedness !59
  %"967." = load i32, i32* %"880.i11", align 4, !dbg !2718, !opID !2719, !stats.instNumber !2720, !opSignedness !59
  %"968.idxprom22" = sext i32 %"967." to i64, !dbg !2715, !opID !2721, !stats.instNumber !2722, !opSignedness !59
  %"969.arrayidx23" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"966.", i64 %"968.idxprom22", !dbg !2715, !opID !2723, !stats.instNumber !2724, !opSignedness !59
  %"970.y" = getelementptr inbounds %struct.Pixel, %struct.Pixel* %"969.arrayidx23", i32 0, i32 1, !dbg !2725, !opID !2726, !stats.instNumber !2727, !opSignedness !59
  %"971." = load i8, i8* %"970.y", align 1, !dbg !2725, !opID !2728, !stats.instNumber !2729, !opSignedness !59
  %"972.idxprom24" = zext i8 %"971." to i64, !dbg !2693, !opID !2730, !stats.instNumber !2731, !opSignedness !59
  %"973.arrayidx25" = getelementptr inbounds [256 x i8], [256 x i8]* %"965.arrayidx21", i64 0, i64 %"972.idxprom24", !dbg !2693, !opID !2732, !stats.instNumber !2733, !opSignedness !59
  store i8 %"956.", i8* %"973.arrayidx25", align 1, !dbg !2734, !opID !2735, !stats.instNumber !2736, !opSignedness !59
  br label %for.inc26, !dbg !2693, !opID !2737, !stats.instNumber !2738, !opSignedness !59

for.inc26:                                        ; preds = %for.body15
  %"976." = load i32, i32* %"880.i11", align 4, !dbg !2739, !opID !2740, !stats.instNumber !2741, !opSignedness !59
  %"977.inc27" = add i32 %"976.", 1, !dbg !2739, !opID !2742, !stats.instNumber !2743, !opSignedness !59
  %2 = sext i32 %"977.inc27" to i64, !dbg !2739
  call void @profOp(i64 977, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !2739
  store i32 %"977.inc27", i32* %"880.i11", align 4, !dbg !2739, !opID !2744, !stats.instNumber !2745, !opSignedness !59
  br label %for.cond12, !dbg !2671, !llvm.loop !2746, !opID !2749, !stats.instNumber !2750, !opSignedness !59

for.end28:                                        ; preds = %for.cond.cleanup14
  ret void, !dbg !2751, !opID !2752, !stats.instNumber !2753, !opSignedness !59
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* "fpga.decayed.dim.hint"="3192" %triangle_3ds, [256 x i8]* "fpga.decayed.dim.hint"="256" %output) #15 !dbg !2754 !fpga.function.pragma !2758 {
entry:
  %"981.triangle_3ds.addr" = alloca %struct.Triangle_3D*, align 8, !opID !2761, !stats.instNumber !2762, !opSignedness !59
  %"982.output.addr" = alloca [256 x i8]*, align 8, !opID !2763, !stats.instNumber !2764, !opSignedness !59
  %"983.triangle_2ds" = alloca %struct.Triangle_2D, align 1, !opID !2765, !stats.instNumber !2766, !opSignedness !59
  %"984.angle" = alloca i32, align 4, !opID !2767, !stats.instNumber !2768, !opSignedness !59
  %"985.max_min" = alloca [5 x i8], align 1, !opID !2769, !stats.instNumber !2770, !opSignedness !59
  %"986.max_index" = alloca [1 x i32], align 4, !opID !2771, !stats.instNumber !2772, !opSignedness !59
  %"987.fragment" = alloca [500 x %struct.CandidatePixel], align 1, !opID !2773, !stats.instNumber !2774, !opSignedness !59
  %"988.pixels" = alloca [500 x %struct.Pixel], align 1, !opID !2775, !stats.instNumber !2776, !opSignedness !59
  %"989.i" = alloca i32, align 4, !opID !2777, !stats.instNumber !2778, !opSignedness !59
  %"990.agg.tmp" = alloca %struct.Triangle_3D, align 1, !opID !2779, !stats.instNumber !2780, !opSignedness !59
  %"991.flag" = alloca i1, align 1, !opID !2781, !stats.instNumber !2782, !opSignedness !59
  %"992.agg.tmp1" = alloca %struct.Triangle_2D, align 1, !opID !2783, !stats.instNumber !2784, !opSignedness !59
  %"993.size_fragment" = alloca i32, align 4, !opID !2785, !stats.instNumber !2786, !opSignedness !59
  %"994.agg.tmp5" = alloca %struct.Triangle_2D, align 1, !opID !2787, !stats.instNumber !2788, !opSignedness !59
  %"995.size_pixels" = alloca i32, align 4, !opID !2789, !stats.instNumber !2790, !opSignedness !59
  store %struct.Triangle_3D* %triangle_3ds, %struct.Triangle_3D** %"981.triangle_3ds.addr", align 8, !opID !2791, !stats.instNumber !2792, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D** %"981.triangle_3ds.addr", metadata !2793, metadata !DIExpression()), !dbg !2794, !opID !2795, !stats.instNumber !2796, !opSignedness !59
  store [256 x i8]* %output, [256 x i8]** %"982.output.addr", align 8, !opID !2797, !stats.instNumber !2798, !opSignedness !59
  call void @llvm.dbg.declare(metadata [256 x i8]** %"982.output.addr", metadata !2799, metadata !DIExpression()), !dbg !2800, !opID !2801, !stats.instNumber !2802, !opSignedness !59
  %"1000." = bitcast %struct.Triangle_2D* %"983.triangle_2ds" to i8*, !dbg !2803, !opID !2804, !stats.instNumber !2805, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 7, i8* %"1000.") #19, !dbg !2803, !opID !2806, !stats.instNumber !2807, !opSignedness !59
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %"983.triangle_2ds", metadata !2808, metadata !DIExpression()), !dbg !2809, !opID !2810, !stats.instNumber !2811, !opSignedness !59
  %"1003." = bitcast i32* %"984.angle" to i8*, !dbg !2812, !opID !2813, !stats.instNumber !2814, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"1003.") #19, !dbg !2812, !opID !2815, !stats.instNumber !2816, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"984.angle", metadata !2817, metadata !DIExpression()), !dbg !2818, !opID !2819, !stats.instNumber !2820, !opSignedness !59
  store i32 0, i32* %"984.angle", align 4, !dbg !2818, !opID !2821, !stats.instNumber !2822, !opSignedness !59
  %"1007." = bitcast [5 x i8]* %"985.max_min" to i8*, !dbg !2823, !opID !2824, !stats.instNumber !2825, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 5, i8* %"1007.") #19, !dbg !2823, !opID !2826, !stats.instNumber !2827, !opSignedness !59
  call void @llvm.dbg.declare(metadata [5 x i8]* %"985.max_min", metadata !2828, metadata !DIExpression()), !dbg !2832, !opID !2833, !stats.instNumber !2834, !opSignedness !59
  %"1010." = bitcast [1 x i32]* %"986.max_index" to i8*, !dbg !2835, !opID !2836, !stats.instNumber !2837, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"1010.") #19, !dbg !2835, !opID !2838, !stats.instNumber !2839, !opSignedness !59
  call void @llvm.dbg.declare(metadata [1 x i32]* %"986.max_index", metadata !2840, metadata !DIExpression()), !dbg !2844, !opID !2845, !stats.instNumber !2846, !opSignedness !59
  %"1013." = bitcast [500 x %struct.CandidatePixel]* %"987.fragment" to i8*, !dbg !2847, !opID !2848, !stats.instNumber !2849, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* %"1013.") #19, !dbg !2847, !opID !2850, !stats.instNumber !2851, !opSignedness !59
  call void @llvm.dbg.declare(metadata [500 x %struct.CandidatePixel]* %"987.fragment", metadata !2852, metadata !DIExpression()), !dbg !2856, !opID !2857, !stats.instNumber !2858, !opSignedness !59
  %"1016." = bitcast [500 x %struct.Pixel]* %"988.pixels" to i8*, !dbg !2859, !opID !2860, !stats.instNumber !2861, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* %"1016.") #19, !dbg !2859, !opID !2862, !stats.instNumber !2863, !opSignedness !59
  call void @llvm.dbg.declare(metadata [500 x %struct.Pixel]* %"988.pixels", metadata !2864, metadata !DIExpression()), !dbg !2866, !opID !2867, !stats.instNumber !2868, !opSignedness !59
  br label %TRIANGLES, !dbg !2859, !opID !2869, !stats.instNumber !2870, !opSignedness !59

TRIANGLES:                                        ; preds = %entry
  %"1020." = bitcast i32* %"989.i" to i8*, !dbg !2871, !opID !2873, !stats.instNumber !2874, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"1020.") #19, !dbg !2871, !opID !2875, !stats.instNumber !2876, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"989.i", metadata !2877, metadata !DIExpression()), !dbg !2878, !opID !2879, !stats.instNumber !2880, !opSignedness !59
  store i32 0, i32* %"989.i", align 4, !dbg !2878, !opID !2881, !stats.instNumber !2882, !opSignedness !59
  br label %for.cond, !dbg !2871, !opID !2883, !stats.instNumber !2884, !opSignedness !59

for.cond:                                         ; preds = %for.inc, %TRIANGLES
  %"1025." = load i32, i32* %"989.i", align 4, !dbg !2885, !opID !2887, !stats.instNumber !2888, !opSignedness !59
  %"1026.cmp" = icmp slt i32 %"1025.", 3192, !dbg !2889, !opID !2890, !stats.instNumber !2891, !opSignedness !59
  br i1 %"1026.cmp", label %for.body, label %for.cond.cleanup, !dbg !2892, !opID !2893, !stats.instNumber !2894, !opSignedness !59

for.cond.cleanup:                                 ; preds = %for.cond
  %"1028." = bitcast i32* %"989.i" to i8*, !dbg !2895, !opID !2896, !stats.instNumber !2897, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"1028.") #19, !dbg !2895, !opID !2898, !stats.instNumber !2899, !opSignedness !59
  br label %for.end, !opID !2900, !stats.instNumber !2901, !opSignedness !59

for.body:                                         ; preds = %for.cond
  %"1031." = load %struct.Triangle_3D*, %struct.Triangle_3D** %"981.triangle_3ds.addr", align 8, !dbg !2902, !opID !2904, !stats.instNumber !2905, !opSignedness !59
  %"1032." = load i32, i32* %"989.i", align 4, !dbg !2906, !opID !2907, !stats.instNumber !2908, !opSignedness !59
  %"1033.idxprom" = sext i32 %"1032." to i64, !dbg !2902, !opID !2909, !stats.instNumber !2910, !opSignedness !59
  %"1034.arrayidx" = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %"1031.", i64 %"1033.idxprom", !dbg !2902, !opID !2911, !stats.instNumber !2912, !opSignedness !59
  %"1035." = load %struct.Triangle_3D, %struct.Triangle_3D* %"1034.arrayidx", align 1, !dbg !2902, !opID !2913, !stats.instNumber !2914, !opSignedness !59
  store %struct.Triangle_3D %"1035.", %struct.Triangle_3D* %"990.agg.tmp", align 1, !dbg !2902, !opID !2915, !stats.instNumber !2916, !opSignedness !59
  %"1037." = load i32, i32* %"984.angle", align 4, !dbg !2917, !opID !2918, !stats.instNumber !2919, !opSignedness !59
  call void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %"990.agg.tmp", %struct.Triangle_2D* %"983.triangle_2ds", i32 %"1037."), !dbg !2920, !opID !2921, !stats.instNumber !2922, !opSignedness !59
  %"1039." = bitcast i1* %"991.flag" to i8*, !dbg !2923, !opID !2924, !stats.instNumber !2925, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"1039.") #19, !dbg !2923, !opID !2926, !stats.instNumber !2927, !opSignedness !59
  call void @llvm.dbg.declare(metadata i1* %"991.flag", metadata !2928, metadata !DIExpression()), !dbg !2929, !opID !2930, !stats.instNumber !2931, !opSignedness !59
  %"1042." = load %struct.Triangle_2D, %struct.Triangle_2D* %"983.triangle_2ds", align 1, !dbg !2932, !opID !2933, !stats.instNumber !2934, !opSignedness !59
  store %struct.Triangle_2D %"1042.", %struct.Triangle_2D* %"992.agg.tmp1", align 1, !dbg !2932, !opID !2935, !stats.instNumber !2936, !opSignedness !59
  %"1044.arraydecay" = getelementptr inbounds [5 x i8], [5 x i8]* %"985.max_min", i32 0, i32 0, !dbg !2937, !opID !2938, !stats.instNumber !2939, !opSignedness !59
  %"1045.arraydecay2" = getelementptr inbounds [1 x i32], [1 x i32]* %"986.max_index", i32 0, i32 0, !dbg !2940, !opID !2941, !stats.instNumber !2942, !opSignedness !59
  %"1046.call" = call zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %"992.agg.tmp1", i8* %"1044.arraydecay", i32* %"1045.arraydecay2"), !dbg !2943, !opID !2944, !stats.instNumber !2945, !opSignedness !59
  store i1 %"1046.call", i1* %"991.flag", align 1, !dbg !2929, !opID !2946, !stats.instNumber !2947, !opSignedness !59
  %"1048." = bitcast i32* %"993.size_fragment" to i8*, !dbg !2948, !opID !2949, !stats.instNumber !2950, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"1048.") #19, !dbg !2948, !opID !2951, !stats.instNumber !2952, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"993.size_fragment", metadata !2953, metadata !DIExpression()), !dbg !2954, !opID !2955, !stats.instNumber !2956, !opSignedness !59
  %"1051." = load i1, i1* %"991.flag", align 1, !dbg !2957, !opID !2958, !stats.instNumber !2959, !opSignedness !59
  %"1052.arraydecay3" = getelementptr inbounds [5 x i8], [5 x i8]* %"985.max_min", i32 0, i32 0, !dbg !2960, !opID !2961, !stats.instNumber !2962, !opSignedness !59
  %"1053.arraydecay4" = getelementptr inbounds [1 x i32], [1 x i32]* %"986.max_index", i32 0, i32 0, !dbg !2963, !opID !2964, !stats.instNumber !2965, !opSignedness !59
  %"1054." = load %struct.Triangle_2D, %struct.Triangle_2D* %"983.triangle_2ds", align 1, !dbg !2966, !opID !2967, !stats.instNumber !2968, !opSignedness !59
  store %struct.Triangle_2D %"1054.", %struct.Triangle_2D* %"994.agg.tmp5", align 1, !dbg !2966, !opID !2969, !stats.instNumber !2970, !opSignedness !59
  %"1056.arraydecay6" = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %"987.fragment", i32 0, i32 0, !dbg !2971, !opID !2972, !stats.instNumber !2973, !opSignedness !59
  %"1057.call7" = call i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %"1051.", i8* %"1052.arraydecay3", i32* %"1053.arraydecay4", %struct.Triangle_2D* byval align 1 %"994.agg.tmp5", %struct.CandidatePixel* %"1056.arraydecay6"), !dbg !2974, !opID !2975, !stats.instNumber !2976, !opSignedness !59
  store i32 %"1057.call7", i32* %"993.size_fragment", align 4, !dbg !2954, !opID !2977, !stats.instNumber !2978, !opSignedness !59
  %"1059." = bitcast i32* %"995.size_pixels" to i8*, !dbg !2979, !opID !2980, !stats.instNumber !2981, !opSignedness !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"1059.") #19, !dbg !2979, !opID !2982, !stats.instNumber !2983, !opSignedness !59
  call void @llvm.dbg.declare(metadata i32* %"995.size_pixels", metadata !2984, metadata !DIExpression()), !dbg !2985, !opID !2986, !stats.instNumber !2987, !opSignedness !59
  %"1062." = load i32, i32* %"989.i", align 4, !dbg !2988, !opID !2989, !stats.instNumber !2990, !opSignedness !59
  %"1063.arraydecay8" = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %"987.fragment", i32 0, i32 0, !dbg !2991, !opID !2992, !stats.instNumber !2993, !opSignedness !59
  %"1064." = load i32, i32* %"993.size_fragment", align 4, !dbg !2994, !opID !2995, !stats.instNumber !2996, !opSignedness !59
  %"1065.arraydecay9" = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %"988.pixels", i32 0, i32 0, !dbg !2997, !opID !2998, !stats.instNumber !2999, !opSignedness !59
  %"1066.call10" = call i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %"1062.", %struct.CandidatePixel* %"1063.arraydecay8", i32 %"1064.", %struct.Pixel* %"1065.arraydecay9"), !dbg !3000, !opID !3001, !stats.instNumber !3002, !opSignedness !59
  store i32 %"1066.call10", i32* %"995.size_pixels", align 4, !dbg !2985, !opID !3003, !stats.instNumber !3004, !opSignedness !59
  %"1068." = load i32, i32* %"989.i", align 4, !dbg !3005, !opID !3006, !stats.instNumber !3007, !opSignedness !59
  %"1069." = load i32, i32* %"995.size_pixels", align 4, !dbg !3008, !opID !3009, !stats.instNumber !3010, !opSignedness !59
  %"1070.arraydecay11" = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %"988.pixels", i32 0, i32 0, !dbg !3011, !opID !3012, !stats.instNumber !3013, !opSignedness !59
  %"1071." = load [256 x i8]*, [256 x i8]** %"982.output.addr", align 8, !dbg !3014, !opID !3015, !stats.instNumber !3016, !opSignedness !59
  call void @_Z10coloringFBiiP5PixelPA256_h(i32 %"1068.", i32 %"1069.", %struct.Pixel* %"1070.arraydecay11", [256 x i8]* %"1071."), !dbg !3017, !opID !3018, !stats.instNumber !3019, !opSignedness !59
  %"1073." = bitcast i32* %"995.size_pixels" to i8*, !dbg !3020, !opID !3021, !stats.instNumber !3022, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"1073.") #19, !dbg !3020, !opID !3023, !stats.instNumber !3024, !opSignedness !59
  %"1075." = bitcast i32* %"993.size_fragment" to i8*, !dbg !3020, !opID !3025, !stats.instNumber !3026, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"1075.") #19, !dbg !3020, !opID !3027, !stats.instNumber !3028, !opSignedness !59
  %"1077." = bitcast i1* %"991.flag" to i8*, !dbg !3020, !opID !3029, !stats.instNumber !3030, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"1077.") #19, !dbg !3020, !opID !3031, !stats.instNumber !3032, !opSignedness !59
  br label %for.inc, !dbg !3033, !opID !3034, !stats.instNumber !3035, !opSignedness !59

for.inc:                                          ; preds = %for.body
  %"1080." = load i32, i32* %"989.i", align 4, !dbg !3036, !opID !3037, !stats.instNumber !3038, !opSignedness !59
  %"1081.inc" = add i32 %"1080.", 1, !dbg !3036, !opID !3039, !stats.instNumber !3040, !opSignedness !59
  %0 = sext i32 %"1081.inc" to i64, !dbg !3036
  call void @profOp(i64 1081, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !3036
  store i32 %"1081.inc", i32* %"989.i", align 4, !dbg !3036, !opID !3041, !stats.instNumber !3042, !opSignedness !59
  br label %for.cond, !dbg !2895, !llvm.loop !3043, !opID !3046, !stats.instNumber !3047, !opSignedness !59

for.end:                                          ; preds = %for.cond.cleanup
  %"1084." = bitcast [500 x %struct.Pixel]* %"988.pixels" to i8*, !dbg !3048, !opID !3049, !stats.instNumber !3050, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* %"1084.") #19, !dbg !3048, !opID !3051, !stats.instNumber !3052, !opSignedness !59
  %"1086." = bitcast [500 x %struct.CandidatePixel]* %"987.fragment" to i8*, !dbg !3048, !opID !3053, !stats.instNumber !3054, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* %"1086.") #19, !dbg !3048, !opID !3055, !stats.instNumber !3056, !opSignedness !59
  %"1088." = bitcast [1 x i32]* %"986.max_index" to i8*, !dbg !3048, !opID !3057, !stats.instNumber !3058, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"1088.") #19, !dbg !3048, !opID !3059, !stats.instNumber !3060, !opSignedness !59
  %"1090." = bitcast [5 x i8]* %"985.max_min" to i8*, !dbg !3048, !opID !3061, !stats.instNumber !3062, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 5, i8* %"1090.") #19, !dbg !3048, !opID !3063, !stats.instNumber !3064, !opSignedness !59
  %"1092." = bitcast i32* %"984.angle" to i8*, !dbg !3048, !opID !3065, !stats.instNumber !3066, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"1092.") #19, !dbg !3048, !opID !3067, !stats.instNumber !3068, !opSignedness !59
  %"1094." = bitcast %struct.Triangle_2D* %"983.triangle_2ds" to i8*, !dbg !3048, !opID !3069, !stats.instNumber !3070, !opSignedness !59
  call void @llvm.lifetime.end.p0i8(i64 7, i8* %"1094.") #19, !dbg !3048, !opID !3071, !stats.instNumber !3072, !opSignedness !59
  ret void, !dbg !3048, !opID !3073, !stats.instNumber !3074, !opSignedness !59
}

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #16 {
entry:
  %"1097.retval" = alloca i32, align 4, !opID !3075, !stats.instNumber !3076, !opSignedness !59
  %"1098.argc.addr" = alloca i32, align 4, !opID !3077, !stats.instNumber !3078, !opSignedness !59
  %"1099.argv.addr" = alloca i8**, align 8, !opID !3079, !stats.instNumber !3080, !opSignedness !59
  %"1100.triangle_3ds" = alloca [3192 x %struct.Triangle_3D], align 16, !opID !3081, !stats.instNumber !3082, !opSignedness !59
  %"1101.output" = alloca [256 x [256 x i8]], align 16, !opID !3083, !stats.instNumber !3084, !opSignedness !59
  store i32 0, i32* %"1097.retval", align 4, !opID !3085, !stats.instNumber !3086, !opSignedness !59
  store i32 %argc, i32* %"1098.argc.addr", align 4, !opID !3087, !stats.instNumber !3088, !opSignedness !59
  store i8** %argv, i8*** %"1099.argv.addr", align 8, !opID !3089, !stats.instNumber !3090, !opSignedness !59
  %"1105." = load i8**, i8*** %"1099.argv.addr", align 8, !opID !3091, !stats.instNumber !3092, !opSignedness !59
  %"1106.arrayidx" = getelementptr inbounds i8*, i8** %"1105.", i64 1, !opID !3093, !stats.instNumber !3094, !opSignedness !59
  %"1107." = load i8*, i8** %"1106.arrayidx", align 8, !opID !3095, !stats.instNumber !3096, !opSignedness !59
  %"1108.arraydecay" = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %"1100.triangle_3ds", i32 0, i32 0, !opID !3097, !stats.instNumber !3098, !opSignedness !59
  call void @populateInput(i8* %"1107.", %struct.Triangle_3D* %"1108.arraydecay"), !opID !3099, !stats.instNumber !3100, !opSignedness !59
  %"1110.arraydecay1" = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %"1100.triangle_3ds", i32 0, i32 0, !opID !3101, !stats.instNumber !3102, !opSignedness !59
  %"1111.arraydecay2" = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %"1101.output", i32 0, i32 0, !opID !3103, !stats.instNumber !3104, !opSignedness !59
  call void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* %"1110.arraydecay1", [256 x i8]* %"1111.arraydecay2"), !opID !3105, !stats.instNumber !3106, !opSignedness !59
  %"1113.arraydecay3" = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %"1101.output", i32 0, i32 0, !opID !3107, !stats.instNumber !3108, !opSignedness !59
  call void @populateOutput([256 x i8]* %"1113.arraydecay3"), !opID !3109, !stats.instNumber !3110, !opSignedness !59
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @filename, i32 0, i32 0))
  ret i32 0, !opID !40, !stats.instNumber !3111, !opSignedness !59
}

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %filename, %struct.Triangle_3D* %triangle_3ds) #17 {
entry:
  %filename.addr = alloca i8*, align 8
  %triangle_3ds.addr = alloca %struct.Triangle_3D*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store %struct.Triangle_3D* %triangle_3ds, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1.4, i32 0, i32 0))
  call void @exit(i32 1) #20
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
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2.5, i32 0, i32 0), i8* %x0, i8* %y0, i8* %z0, i8* %x1, i8* %y1, i8* %z1, i8* %x2, i8* %y2, i8* %z2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #18

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline optnone uwtable
define void @populateOutput([256 x i8]* %output) #17 {
entry:
  %output.addr = alloca [256 x i8]*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pix = alloca i32, align 4
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1.4, i32 0, i32 0))
  call void @exit(i32 1) #20
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

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="check_clockwise" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="clockwise_vertices" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="pixel_in_triangle" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_min" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_max" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="projection" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization2" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="zculling" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="coloringFB" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rendering" "fpga.top.func"="rendering" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #19 = { nounwind }
attributes #20 = { noreturn nounwind }

!llvm.ident = !{!39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39}
!llvm.dbg.cu = !{!25}
!OP-ID-COUNTER = !{!40}
!llvm.module.flags = !{!41, !42, !43}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "z_buffer", scope: !2, file: !3, line: 196, type: !36, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "zculling", linkageName: "_Z8zcullingiP14CandidatePixeliP5Pixel", scope: !3, file: !3, line: 193, type: !4, isLocal: false, isDefinition: true, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!3 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/rendering.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !7, !6, !18}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "CandidatePixel", file: !9, line: 57, baseType: !10)
!9 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 51, size: 32, flags: DIFlagTypePassByValue, elements: !11, identifier: "_ZTS14CandidatePixel")
!11 = !{!12, !15, !16, !17}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !10, file: !9, line: 53, baseType: !13, size: 8)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit8", file: !9, line: 21, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !10, file: !9, line: 54, baseType: !13, size: 8, offset: 8)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !10, file: !9, line: 55, baseType: !13, size: 8, offset: 16)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !10, file: !9, line: 56, baseType: !13, size: 8, offset: 24)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "Pixel", file: !9, line: 65, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 60, size: 24, flags: DIFlagTypePassByValue, elements: !21, identifier: "_ZTS5Pixel")
!21 = !{!22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !20, file: !9, line: 62, baseType: !13, size: 8)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !9, line: 63, baseType: !13, size: 8, offset: 8)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !20, file: !9, line: 64, baseType: !13, size: 8, offset: 16)
!25 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !26, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !27, globals: !28)
!26 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/rendering_ahls/solution1/.autopilot/db/rendering.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!27 = !{}
!28 = !{!0, !29, !32, !34}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!30 = distinct !DIGlobalVariable(name: "MAX_X", scope: !25, file: !9, line: 13, type: !31, isLocal: true, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!33 = distinct !DIGlobalVariable(name: "MAX_Y", scope: !25, file: !9, line: 14, type: !31, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression(DW_OP_constu, 3192, DW_OP_stack_value))
!35 = distinct !DIGlobalVariable(name: "NUM_3D_TRI", scope: !25, file: !9, line: 19, type: !31, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !37)
!37 = !{!38, !38}
!38 = !DISubrange(count: 256)
!39 = !{!"clang version 7.0.0 "}
!40 = !{i64 1115}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{i32 2, !"Dwarf Version", i32 4}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = distinct !DISubprogram(name: "check_clockwise", linkageName: "_Z15check_clockwise11Triangle_2D", scope: !3, file: !3, line: 18, type: !45, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!45 = !DISubroutineType(types: !46)
!46 = !{!6, !47}
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_2D", file: !9, line: 48, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 39, size: 56, flags: DIFlagTypePassByValue, elements: !49, identifier: "_ZTS11Triangle_2D")
!49 = !{!50, !51, !52, !53, !54, !55, !56}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !48, file: !9, line: 41, baseType: !13, size: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !48, file: !9, line: 42, baseType: !13, size: 8, offset: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !48, file: !9, line: 43, baseType: !13, size: 8, offset: 16)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !48, file: !9, line: 44, baseType: !13, size: 8, offset: 24)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !48, file: !9, line: 45, baseType: !13, size: 8, offset: 32)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !48, file: !9, line: 46, baseType: !13, size: 8, offset: 40)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !48, file: !9, line: 47, baseType: !13, size: 8, offset: 48)
!57 = !{i64 1}
!58 = !{!"1"}
!59 = !{!"unknownSignedness"}
!60 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !44, file: !3, line: 18, type: !47)
!61 = !DILocation(line: 18, column: 33, scope: !44)
!62 = !{i64 2}
!63 = !{!"2"}
!64 = !DILocation(line: 20, column: 3, scope: !44)
!65 = !{i64 3}
!66 = !{!"3"}
!67 = !{i64 4}
!68 = !{!"4"}
!69 = !DILocalVariable(name: "cw", scope: !44, file: !3, line: 20, type: !6)
!70 = !DILocation(line: 20, column: 7, scope: !44)
!71 = !{i64 5}
!72 = !{!"5"}
!73 = !DILocation(line: 22, column: 21, scope: !44)
!74 = !{i64 6}
!75 = !{!"6"}
!76 = !{i64 7}
!77 = !{!"7"}
!78 = !DILocation(line: 22, column: 9, scope: !44)
!79 = !{i64 8}
!80 = !{!"8"}
!81 = !DILocation(line: 22, column: 38, scope: !44)
!82 = !{i64 9}
!83 = !{!"9"}
!84 = !{i64 10}
!85 = !{!"10"}
!86 = !DILocation(line: 22, column: 26, scope: !44)
!87 = !{i64 11}
!88 = !{!"11"}
!89 = !DILocation(line: 22, column: 24, scope: !44)
!90 = !{i64 12}
!91 = !{!"12"}
!92 = !DILocation(line: 22, column: 57, scope: !44)
!93 = !{i64 13}
!94 = !{!"13"}
!95 = !{i64 14}
!96 = !{!"14"}
!97 = !DILocation(line: 22, column: 45, scope: !44)
!98 = !{i64 15}
!99 = !{!"15"}
!100 = !DILocation(line: 22, column: 74, scope: !44)
!101 = !{i64 16}
!102 = !{!"16"}
!103 = !{i64 17}
!104 = !{!"17"}
!105 = !DILocation(line: 22, column: 62, scope: !44)
!106 = !{i64 18}
!107 = !{!"18"}
!108 = !DILocation(line: 22, column: 60, scope: !44)
!109 = !{i64 19}
!110 = !{!"19"}
!111 = !DILocation(line: 22, column: 42, scope: !44)
!112 = !{i64 20}
!113 = !{!"20"}
!114 = !DILocation(line: 23, column: 23, scope: !44)
!115 = !{i64 21}
!116 = !{!"21"}
!117 = !{i64 22}
!118 = !{!"22"}
!119 = !DILocation(line: 23, column: 11, scope: !44)
!120 = !{i64 23}
!121 = !{!"23"}
!122 = !DILocation(line: 23, column: 40, scope: !44)
!123 = !{i64 24}
!124 = !{!"24"}
!125 = !{i64 25}
!126 = !{!"25"}
!127 = !DILocation(line: 23, column: 28, scope: !44)
!128 = !{i64 26}
!129 = !{!"26"}
!130 = !DILocation(line: 23, column: 26, scope: !44)
!131 = !{i64 27}
!132 = !{!"27"}
!133 = !DILocation(line: 23, column: 59, scope: !44)
!134 = !{i64 28}
!135 = !{!"28"}
!136 = !{i64 29}
!137 = !{!"29"}
!138 = !DILocation(line: 23, column: 47, scope: !44)
!139 = !{i64 30}
!140 = !{!"30"}
!141 = !DILocation(line: 23, column: 76, scope: !44)
!142 = !{i64 31}
!143 = !{!"31"}
!144 = !{i64 32}
!145 = !{!"32"}
!146 = !DILocation(line: 23, column: 64, scope: !44)
!147 = !{i64 33}
!148 = !{!"33"}
!149 = !DILocation(line: 23, column: 62, scope: !44)
!150 = !{i64 34}
!151 = !{!"34"}
!152 = !DILocation(line: 23, column: 44, scope: !44)
!153 = !{i64 35}
!154 = !{!"35"}
!155 = !DILocation(line: 23, column: 8, scope: !44)
!156 = !{i64 36}
!157 = !{!"36"}
!158 = !DILocation(line: 22, column: 6, scope: !44)
!159 = !{i64 37}
!160 = !{!"37"}
!161 = !DILocation(line: 25, column: 10, scope: !44)
!162 = !{i64 38}
!163 = !{!"38"}
!164 = !DILocation(line: 27, column: 1, scope: !44)
!165 = !{i64 39}
!166 = !{!"39"}
!167 = !{i64 40}
!168 = !{!"40"}
!169 = !DILocation(line: 25, column: 3, scope: !44)
!170 = !{i64 41}
!171 = !{!"41"}
!172 = distinct !DISubprogram(name: "clockwise_vertices", linkageName: "_Z18clockwise_verticesP11Triangle_2D", scope: !3, file: !3, line: 30, type: !173, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!173 = !DISubroutineType(types: !174)
!174 = !{null, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!176 = !{i64 42}
!177 = !{!"42"}
!178 = !{i64 43}
!179 = !{!"43"}
!180 = !{i64 44}
!181 = !{!"44"}
!182 = !{i64 45}
!183 = !{!"45"}
!184 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !172, file: !3, line: 30, type: !175)
!185 = !DILocation(line: 30, column: 38, scope: !172)
!186 = !{i64 46}
!187 = !{!"46"}
!188 = !DILocation(line: 32, column: 3, scope: !172)
!189 = !{i64 47}
!190 = !{!"47"}
!191 = !DILocalVariable(name: "tmp_x", scope: !172, file: !3, line: 32, type: !13)
!192 = !DILocation(line: 32, column: 8, scope: !172)
!193 = !{i64 48}
!194 = !{!"48"}
!195 = !{i64 49}
!196 = !{!"49"}
!197 = !DILocalVariable(name: "tmp_y", scope: !172, file: !3, line: 32, type: !13)
!198 = !DILocation(line: 32, column: 15, scope: !172)
!199 = !{i64 50}
!200 = !{!"50"}
!201 = !DILocation(line: 34, column: 11, scope: !172)
!202 = !{i64 51}
!203 = !{!"51"}
!204 = !DILocation(line: 34, column: 24, scope: !172)
!205 = !{i64 52}
!206 = !{!"52"}
!207 = !{i64 53}
!208 = !{!"53"}
!209 = !DILocation(line: 34, column: 9, scope: !172)
!210 = !{i64 54}
!211 = !{!"54"}
!212 = !DILocation(line: 35, column: 11, scope: !172)
!213 = !{i64 55}
!214 = !{!"55"}
!215 = !DILocation(line: 35, column: 24, scope: !172)
!216 = !{i64 56}
!217 = !{!"56"}
!218 = !{i64 57}
!219 = !{!"57"}
!220 = !DILocation(line: 35, column: 9, scope: !172)
!221 = !{i64 58}
!222 = !{!"58"}
!223 = !DILocation(line: 37, column: 21, scope: !172)
!224 = !{i64 59}
!225 = !{!"59"}
!226 = !DILocation(line: 37, column: 34, scope: !172)
!227 = !{i64 60}
!228 = !{!"60"}
!229 = !{i64 61}
!230 = !{!"61"}
!231 = !DILocation(line: 37, column: 3, scope: !172)
!232 = !{i64 62}
!233 = !{!"62"}
!234 = !DILocation(line: 37, column: 16, scope: !172)
!235 = !{i64 63}
!236 = !{!"63"}
!237 = !DILocation(line: 37, column: 19, scope: !172)
!238 = !{i64 64}
!239 = !{!"64"}
!240 = !DILocation(line: 38, column: 21, scope: !172)
!241 = !{i64 65}
!242 = !{!"65"}
!243 = !DILocation(line: 38, column: 34, scope: !172)
!244 = !{i64 66}
!245 = !{!"66"}
!246 = !{i64 67}
!247 = !{!"67"}
!248 = !DILocation(line: 38, column: 3, scope: !172)
!249 = !{i64 68}
!250 = !{!"68"}
!251 = !DILocation(line: 38, column: 16, scope: !172)
!252 = !{i64 69}
!253 = !{!"69"}
!254 = !DILocation(line: 38, column: 19, scope: !172)
!255 = !{i64 70}
!256 = !{!"70"}
!257 = !DILocation(line: 40, column: 21, scope: !172)
!258 = !{i64 71}
!259 = !{!"71"}
!260 = !DILocation(line: 40, column: 3, scope: !172)
!261 = !{i64 72}
!262 = !{!"72"}
!263 = !DILocation(line: 40, column: 16, scope: !172)
!264 = !{i64 73}
!265 = !{!"73"}
!266 = !DILocation(line: 40, column: 19, scope: !172)
!267 = !{i64 74}
!268 = !{!"74"}
!269 = !DILocation(line: 41, column: 21, scope: !172)
!270 = !{i64 75}
!271 = !{!"75"}
!272 = !DILocation(line: 41, column: 3, scope: !172)
!273 = !{i64 76}
!274 = !{!"76"}
!275 = !DILocation(line: 41, column: 16, scope: !172)
!276 = !{i64 77}
!277 = !{!"77"}
!278 = !DILocation(line: 41, column: 19, scope: !172)
!279 = !{i64 78}
!280 = !{!"78"}
!281 = !DILocation(line: 42, column: 1, scope: !172)
!282 = !{i64 79}
!283 = !{!"79"}
!284 = !{i64 80}
!285 = !{!"80"}
!286 = !{i64 81}
!287 = !{!"81"}
!288 = distinct !DISubprogram(name: "pixel_in_triangle", linkageName: "_Z17pixel_in_trianglehh11Triangle_2D", scope: !3, file: !3, line: 48, type: !289, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!289 = !DISubroutineType(types: !290)
!290 = !{!291, !13, !13, !47}
!291 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!292 = !{i64 82}
!293 = !{!"82"}
!294 = !{i64 83}
!295 = !{!"83"}
!296 = !{i64 84}
!297 = !{!"84"}
!298 = !{i64 85}
!299 = !{!"85"}
!300 = !{i64 86}
!301 = !{!"86"}
!302 = !{i64 87}
!303 = !{!"87"}
!304 = !DILocalVariable(name: "x", arg: 1, scope: !288, file: !3, line: 48, type: !13)
!305 = !DILocation(line: 48, column: 29, scope: !288)
!306 = !{i64 88}
!307 = !{!"88"}
!308 = !{i64 89}
!309 = !{!"89"}
!310 = !DILocalVariable(name: "y", arg: 2, scope: !288, file: !3, line: 48, type: !13)
!311 = !DILocation(line: 48, column: 37, scope: !288)
!312 = !{i64 90}
!313 = !{!"90"}
!314 = !DILocalVariable(name: "triangle_2d", arg: 3, scope: !288, file: !3, line: 48, type: !47)
!315 = !DILocation(line: 48, column: 52, scope: !288)
!316 = !{i64 91}
!317 = !{!"91"}
!318 = !DILocation(line: 50, column: 3, scope: !288)
!319 = !{i64 92}
!320 = !{!"92"}
!321 = !{i64 93}
!322 = !{!"93"}
!323 = !DILocalVariable(name: "pi0", scope: !288, file: !3, line: 50, type: !6)
!324 = !DILocation(line: 50, column: 7, scope: !288)
!325 = !{i64 94}
!326 = !{!"94"}
!327 = !{i64 95}
!328 = !{!"95"}
!329 = !{i64 96}
!330 = !{!"96"}
!331 = !DILocalVariable(name: "pi1", scope: !288, file: !3, line: 50, type: !6)
!332 = !DILocation(line: 50, column: 12, scope: !288)
!333 = !{i64 97}
!334 = !{!"97"}
!335 = !{i64 98}
!336 = !{!"98"}
!337 = !{i64 99}
!338 = !{!"99"}
!339 = !DILocalVariable(name: "pi2", scope: !288, file: !3, line: 50, type: !6)
!340 = !DILocation(line: 50, column: 17, scope: !288)
!341 = !{i64 100}
!342 = !{!"100"}
!343 = !DILocation(line: 52, column: 10, scope: !288)
!344 = !{i64 101}
!345 = !{!"101"}
!346 = !{i64 102}
!347 = !{!"102"}
!348 = !DILocation(line: 52, column: 26, scope: !288)
!349 = !{i64 103}
!350 = !{!"103"}
!351 = !{i64 104}
!352 = !{!"104"}
!353 = !DILocation(line: 52, column: 14, scope: !288)
!354 = !{i64 105}
!355 = !{!"105"}
!356 = !DILocation(line: 52, column: 12, scope: !288)
!357 = !{i64 106}
!358 = !{!"106"}
!359 = !DILocation(line: 52, column: 45, scope: !288)
!360 = !{i64 107}
!361 = !{!"107"}
!362 = !{i64 108}
!363 = !{!"108"}
!364 = !DILocation(line: 52, column: 33, scope: !288)
!365 = !{i64 109}
!366 = !{!"109"}
!367 = !DILocation(line: 52, column: 62, scope: !288)
!368 = !{i64 110}
!369 = !{!"110"}
!370 = !{i64 111}
!371 = !{!"111"}
!372 = !DILocation(line: 52, column: 50, scope: !288)
!373 = !{i64 112}
!374 = !{!"112"}
!375 = !DILocation(line: 52, column: 48, scope: !288)
!376 = !{i64 113}
!377 = !{!"113"}
!378 = !DILocation(line: 52, column: 30, scope: !288)
!379 = !{i64 114}
!380 = !{!"114"}
!381 = !DILocation(line: 52, column: 69, scope: !288)
!382 = !{i64 115}
!383 = !{!"115"}
!384 = !{i64 116}
!385 = !{!"116"}
!386 = !DILocation(line: 52, column: 85, scope: !288)
!387 = !{i64 117}
!388 = !{!"117"}
!389 = !{i64 118}
!390 = !{!"118"}
!391 = !DILocation(line: 52, column: 73, scope: !288)
!392 = !{i64 119}
!393 = !{!"119"}
!394 = !DILocation(line: 52, column: 71, scope: !288)
!395 = !{i64 120}
!396 = !{!"120"}
!397 = !DILocation(line: 52, column: 104, scope: !288)
!398 = !{i64 121}
!399 = !{!"121"}
!400 = !{i64 122}
!401 = !{!"122"}
!402 = !DILocation(line: 52, column: 92, scope: !288)
!403 = !{i64 123}
!404 = !{!"123"}
!405 = !DILocation(line: 52, column: 121, scope: !288)
!406 = !{i64 124}
!407 = !{!"124"}
!408 = !{i64 125}
!409 = !{!"125"}
!410 = !DILocation(line: 52, column: 109, scope: !288)
!411 = !{i64 126}
!412 = !{!"126"}
!413 = !DILocation(line: 52, column: 107, scope: !288)
!414 = !{i64 127}
!415 = !{!"127"}
!416 = !DILocation(line: 52, column: 89, scope: !288)
!417 = !{i64 128}
!418 = !{!"128"}
!419 = !DILocation(line: 52, column: 66, scope: !288)
!420 = !{i64 129}
!421 = !{!"129"}
!422 = !DILocation(line: 52, column: 7, scope: !288)
!423 = !{i64 130}
!424 = !{!"130"}
!425 = !DILocation(line: 53, column: 10, scope: !288)
!426 = !{i64 131}
!427 = !{!"131"}
!428 = !{i64 132}
!429 = !{!"132"}
!430 = !DILocation(line: 53, column: 26, scope: !288)
!431 = !{i64 133}
!432 = !{!"133"}
!433 = !{i64 134}
!434 = !{!"134"}
!435 = !DILocation(line: 53, column: 14, scope: !288)
!436 = !{i64 135}
!437 = !{!"135"}
!438 = !DILocation(line: 53, column: 12, scope: !288)
!439 = !{i64 136}
!440 = !{!"136"}
!441 = !DILocation(line: 53, column: 45, scope: !288)
!442 = !{i64 137}
!443 = !{!"137"}
!444 = !{i64 138}
!445 = !{!"138"}
!446 = !DILocation(line: 53, column: 33, scope: !288)
!447 = !{i64 139}
!448 = !{!"139"}
!449 = !DILocation(line: 53, column: 62, scope: !288)
!450 = !{i64 140}
!451 = !{!"140"}
!452 = !{i64 141}
!453 = !{!"141"}
!454 = !DILocation(line: 53, column: 50, scope: !288)
!455 = !{i64 142}
!456 = !{!"142"}
!457 = !DILocation(line: 53, column: 48, scope: !288)
!458 = !{i64 143}
!459 = !{!"143"}
!460 = !DILocation(line: 53, column: 30, scope: !288)
!461 = !{i64 144}
!462 = !{!"144"}
!463 = !DILocation(line: 53, column: 69, scope: !288)
!464 = !{i64 145}
!465 = !{!"145"}
!466 = !{i64 146}
!467 = !{!"146"}
!468 = !DILocation(line: 53, column: 85, scope: !288)
!469 = !{i64 147}
!470 = !{!"147"}
!471 = !{i64 148}
!472 = !{!"148"}
!473 = !DILocation(line: 53, column: 73, scope: !288)
!474 = !{i64 149}
!475 = !{!"149"}
!476 = !DILocation(line: 53, column: 71, scope: !288)
!477 = !{i64 150}
!478 = !{!"150"}
!479 = !DILocation(line: 53, column: 104, scope: !288)
!480 = !{i64 151}
!481 = !{!"151"}
!482 = !{i64 152}
!483 = !{!"152"}
!484 = !DILocation(line: 53, column: 92, scope: !288)
!485 = !{i64 153}
!486 = !{!"153"}
!487 = !DILocation(line: 53, column: 121, scope: !288)
!488 = !{i64 154}
!489 = !{!"154"}
!490 = !{i64 155}
!491 = !{!"155"}
!492 = !DILocation(line: 53, column: 109, scope: !288)
!493 = !{i64 156}
!494 = !{!"156"}
!495 = !DILocation(line: 53, column: 107, scope: !288)
!496 = !{i64 157}
!497 = !{!"157"}
!498 = !DILocation(line: 53, column: 89, scope: !288)
!499 = !{i64 158}
!500 = !{!"158"}
!501 = !DILocation(line: 53, column: 66, scope: !288)
!502 = !{i64 159}
!503 = !{!"159"}
!504 = !DILocation(line: 53, column: 7, scope: !288)
!505 = !{i64 160}
!506 = !{!"160"}
!507 = !DILocation(line: 54, column: 10, scope: !288)
!508 = !{i64 161}
!509 = !{!"161"}
!510 = !{i64 162}
!511 = !{!"162"}
!512 = !DILocation(line: 54, column: 26, scope: !288)
!513 = !{i64 163}
!514 = !{!"163"}
!515 = !{i64 164}
!516 = !{!"164"}
!517 = !DILocation(line: 54, column: 14, scope: !288)
!518 = !{i64 165}
!519 = !{!"165"}
!520 = !DILocation(line: 54, column: 12, scope: !288)
!521 = !{i64 166}
!522 = !{!"166"}
!523 = !DILocation(line: 54, column: 45, scope: !288)
!524 = !{i64 167}
!525 = !{!"167"}
!526 = !{i64 168}
!527 = !{!"168"}
!528 = !DILocation(line: 54, column: 33, scope: !288)
!529 = !{i64 169}
!530 = !{!"169"}
!531 = !DILocation(line: 54, column: 62, scope: !288)
!532 = !{i64 170}
!533 = !{!"170"}
!534 = !{i64 171}
!535 = !{!"171"}
!536 = !DILocation(line: 54, column: 50, scope: !288)
!537 = !{i64 172}
!538 = !{!"172"}
!539 = !DILocation(line: 54, column: 48, scope: !288)
!540 = !{i64 173}
!541 = !{!"173"}
!542 = !DILocation(line: 54, column: 30, scope: !288)
!543 = !{i64 174}
!544 = !{!"174"}
!545 = !DILocation(line: 54, column: 69, scope: !288)
!546 = !{i64 175}
!547 = !{!"175"}
!548 = !{i64 176}
!549 = !{!"176"}
!550 = !DILocation(line: 54, column: 85, scope: !288)
!551 = !{i64 177}
!552 = !{!"177"}
!553 = !{i64 178}
!554 = !{!"178"}
!555 = !DILocation(line: 54, column: 73, scope: !288)
!556 = !{i64 179}
!557 = !{!"179"}
!558 = !DILocation(line: 54, column: 71, scope: !288)
!559 = !{i64 180}
!560 = !{!"180"}
!561 = !DILocation(line: 54, column: 104, scope: !288)
!562 = !{i64 181}
!563 = !{!"181"}
!564 = !{i64 182}
!565 = !{!"182"}
!566 = !DILocation(line: 54, column: 92, scope: !288)
!567 = !{i64 183}
!568 = !{!"183"}
!569 = !DILocation(line: 54, column: 121, scope: !288)
!570 = !{i64 184}
!571 = !{!"184"}
!572 = !{i64 185}
!573 = !{!"185"}
!574 = !DILocation(line: 54, column: 109, scope: !288)
!575 = !{i64 186}
!576 = !{!"186"}
!577 = !DILocation(line: 54, column: 107, scope: !288)
!578 = !{i64 187}
!579 = !{!"187"}
!580 = !DILocation(line: 54, column: 89, scope: !288)
!581 = !{i64 188}
!582 = !{!"188"}
!583 = !DILocation(line: 54, column: 66, scope: !288)
!584 = !{i64 189}
!585 = !{!"189"}
!586 = !DILocation(line: 54, column: 7, scope: !288)
!587 = !{i64 190}
!588 = !{!"190"}
!589 = !DILocation(line: 56, column: 11, scope: !288)
!590 = !{i64 191}
!591 = !{!"191"}
!592 = !DILocation(line: 56, column: 15, scope: !288)
!593 = !{i64 192}
!594 = !{!"192"}
!595 = !DILocation(line: 56, column: 20, scope: !288)
!596 = !{i64 193}
!597 = !{!"193"}
!598 = !DILocation(line: 56, column: 23, scope: !288)
!599 = !{i64 194}
!600 = !{!"194"}
!601 = !DILocation(line: 56, column: 27, scope: !288)
!602 = !{i64 195}
!603 = !{!"195"}
!604 = !DILocation(line: 56, column: 32, scope: !288)
!605 = !{i64 196}
!606 = !{!"196"}
!607 = !DILocation(line: 56, column: 35, scope: !288)
!608 = !{i64 197}
!609 = !{!"197"}
!610 = !DILocation(line: 56, column: 39, scope: !288)
!611 = !{i64 198}
!612 = !{!"198"}
!613 = !{i64 199}
!614 = !{!"199"}
!615 = !{i64 200}
!616 = !{!"200"}
!617 = !DILocation(line: 57, column: 1, scope: !288)
!618 = !{i64 201}
!619 = !{!"201"}
!620 = !{i64 202}
!621 = !{!"202"}
!622 = !{i64 203}
!623 = !{!"203"}
!624 = !{i64 204}
!625 = !{!"204"}
!626 = !{i64 205}
!627 = !{!"205"}
!628 = !{i64 206}
!629 = !{!"206"}
!630 = !DILocation(line: 56, column: 3, scope: !288)
!631 = !{i64 207}
!632 = !{!"207"}
!633 = distinct !DISubprogram(name: "find_min", linkageName: "_Z8find_minhhh", scope: !3, file: !3, line: 60, type: !634, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!634 = !DISubroutineType(types: !635)
!635 = !{!13, !13, !13, !13}
!636 = !{i64 208}
!637 = !{!"208"}
!638 = !{i64 209}
!639 = !{!"209"}
!640 = !{i64 210}
!641 = !{!"210"}
!642 = !{i64 211}
!643 = !{!"211"}
!644 = !{i64 212}
!645 = !{!"212"}
!646 = !DILocalVariable(name: "in0", arg: 1, scope: !633, file: !3, line: 60, type: !13)
!647 = !DILocation(line: 60, column: 20, scope: !633)
!648 = !{i64 213}
!649 = !{!"213"}
!650 = !{i64 214}
!651 = !{!"214"}
!652 = !DILocalVariable(name: "in1", arg: 2, scope: !633, file: !3, line: 60, type: !13)
!653 = !DILocation(line: 60, column: 30, scope: !633)
!654 = !{i64 215}
!655 = !{!"215"}
!656 = !{i64 216}
!657 = !{!"216"}
!658 = !DILocalVariable(name: "in2", arg: 3, scope: !633, file: !3, line: 60, type: !13)
!659 = !DILocation(line: 60, column: 40, scope: !633)
!660 = !{i64 217}
!661 = !{!"217"}
!662 = !DILocation(line: 62, column: 7, scope: !663)
!663 = distinct !DILexicalBlock(scope: !633, file: !3, line: 62, column: 7)
!664 = !{i64 218}
!665 = !{!"218"}
!666 = !{i64 219}
!667 = !{!"219"}
!668 = !DILocation(line: 62, column: 13, scope: !663)
!669 = !{i64 220}
!670 = !{!"220"}
!671 = !{i64 221}
!672 = !{!"221"}
!673 = !DILocation(line: 62, column: 11, scope: !663)
!674 = !{i64 222}
!675 = !{!"222"}
!676 = !DILocation(line: 62, column: 7, scope: !633)
!677 = !{i64 223}
!678 = !{!"223"}
!679 = !DILocation(line: 64, column: 9, scope: !680)
!680 = distinct !DILexicalBlock(scope: !681, file: !3, line: 64, column: 9)
!681 = distinct !DILexicalBlock(scope: !663, file: !3, line: 63, column: 3)
!682 = !{i64 224}
!683 = !{!"224"}
!684 = !{i64 225}
!685 = !{!"225"}
!686 = !DILocation(line: 64, column: 15, scope: !680)
!687 = !{i64 226}
!688 = !{!"226"}
!689 = !{i64 227}
!690 = !{!"227"}
!691 = !DILocation(line: 64, column: 13, scope: !680)
!692 = !{i64 228}
!693 = !{!"228"}
!694 = !DILocation(line: 64, column: 9, scope: !681)
!695 = !{i64 229}
!696 = !{!"229"}
!697 = !DILocation(line: 65, column: 14, scope: !680)
!698 = !{i64 230}
!699 = !{!"230"}
!700 = !DILocation(line: 65, column: 7, scope: !680)
!701 = !{i64 231}
!702 = !{!"231"}
!703 = !{i64 232}
!704 = !{!"232"}
!705 = !DILocation(line: 67, column: 14, scope: !680)
!706 = !{i64 233}
!707 = !{!"233"}
!708 = !DILocation(line: 67, column: 7, scope: !680)
!709 = !{i64 234}
!710 = !{!"234"}
!711 = !{i64 235}
!712 = !{!"235"}
!713 = !DILocation(line: 71, column: 9, scope: !714)
!714 = distinct !DILexicalBlock(scope: !715, file: !3, line: 71, column: 9)
!715 = distinct !DILexicalBlock(scope: !663, file: !3, line: 70, column: 3)
!716 = !{i64 236}
!717 = !{!"236"}
!718 = !{i64 237}
!719 = !{!"237"}
!720 = !DILocation(line: 71, column: 15, scope: !714)
!721 = !{i64 238}
!722 = !{!"238"}
!723 = !{i64 239}
!724 = !{!"239"}
!725 = !DILocation(line: 71, column: 13, scope: !714)
!726 = !{i64 240}
!727 = !{!"240"}
!728 = !DILocation(line: 71, column: 9, scope: !715)
!729 = !{i64 241}
!730 = !{!"241"}
!731 = !DILocation(line: 72, column: 14, scope: !714)
!732 = !{i64 242}
!733 = !{!"242"}
!734 = !DILocation(line: 72, column: 7, scope: !714)
!735 = !{i64 243}
!736 = !{!"243"}
!737 = !{i64 244}
!738 = !{!"244"}
!739 = !DILocation(line: 74, column: 14, scope: !714)
!740 = !{i64 245}
!741 = !{!"245"}
!742 = !DILocation(line: 74, column: 7, scope: !714)
!743 = !{i64 246}
!744 = !{!"246"}
!745 = !{i64 247}
!746 = !{!"247"}
!747 = !DILocation(line: 76, column: 1, scope: !633)
!748 = !{i64 248}
!749 = !{!"248"}
!750 = !{i64 249}
!751 = !{!"249"}
!752 = distinct !DISubprogram(name: "find_max", linkageName: "_Z8find_maxhhh", scope: !3, file: !3, line: 79, type: !634, isLocal: false, isDefinition: true, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!753 = !{i64 250}
!754 = !{!"250"}
!755 = !{i64 251}
!756 = !{!"251"}
!757 = !{i64 252}
!758 = !{!"252"}
!759 = !{i64 253}
!760 = !{!"253"}
!761 = !{i64 254}
!762 = !{!"254"}
!763 = !DILocalVariable(name: "in0", arg: 1, scope: !752, file: !3, line: 79, type: !13)
!764 = !DILocation(line: 79, column: 20, scope: !752)
!765 = !{i64 255}
!766 = !{!"255"}
!767 = !{i64 256}
!768 = !{!"256"}
!769 = !DILocalVariable(name: "in1", arg: 2, scope: !752, file: !3, line: 79, type: !13)
!770 = !DILocation(line: 79, column: 30, scope: !752)
!771 = !{i64 257}
!772 = !{!"257"}
!773 = !{i64 258}
!774 = !{!"258"}
!775 = !DILocalVariable(name: "in2", arg: 3, scope: !752, file: !3, line: 79, type: !13)
!776 = !DILocation(line: 79, column: 40, scope: !752)
!777 = !{i64 259}
!778 = !{!"259"}
!779 = !DILocation(line: 81, column: 7, scope: !780)
!780 = distinct !DILexicalBlock(scope: !752, file: !3, line: 81, column: 7)
!781 = !{i64 260}
!782 = !{!"260"}
!783 = !{i64 261}
!784 = !{!"261"}
!785 = !DILocation(line: 81, column: 13, scope: !780)
!786 = !{i64 262}
!787 = !{!"262"}
!788 = !{i64 263}
!789 = !{!"263"}
!790 = !DILocation(line: 81, column: 11, scope: !780)
!791 = !{i64 264}
!792 = !{!"264"}
!793 = !DILocation(line: 81, column: 7, scope: !752)
!794 = !{i64 265}
!795 = !{!"265"}
!796 = !DILocation(line: 83, column: 9, scope: !797)
!797 = distinct !DILexicalBlock(scope: !798, file: !3, line: 83, column: 9)
!798 = distinct !DILexicalBlock(scope: !780, file: !3, line: 82, column: 3)
!799 = !{i64 266}
!800 = !{!"266"}
!801 = !{i64 267}
!802 = !{!"267"}
!803 = !DILocation(line: 83, column: 15, scope: !797)
!804 = !{i64 268}
!805 = !{!"268"}
!806 = !{i64 269}
!807 = !{!"269"}
!808 = !DILocation(line: 83, column: 13, scope: !797)
!809 = !{i64 270}
!810 = !{!"270"}
!811 = !DILocation(line: 83, column: 9, scope: !798)
!812 = !{i64 271}
!813 = !{!"271"}
!814 = !DILocation(line: 84, column: 14, scope: !797)
!815 = !{i64 272}
!816 = !{!"272"}
!817 = !DILocation(line: 84, column: 7, scope: !797)
!818 = !{i64 273}
!819 = !{!"273"}
!820 = !{i64 274}
!821 = !{!"274"}
!822 = !DILocation(line: 86, column: 14, scope: !797)
!823 = !{i64 275}
!824 = !{!"275"}
!825 = !DILocation(line: 86, column: 7, scope: !797)
!826 = !{i64 276}
!827 = !{!"276"}
!828 = !{i64 277}
!829 = !{!"277"}
!830 = !DILocation(line: 90, column: 9, scope: !831)
!831 = distinct !DILexicalBlock(scope: !832, file: !3, line: 90, column: 9)
!832 = distinct !DILexicalBlock(scope: !780, file: !3, line: 89, column: 3)
!833 = !{i64 278}
!834 = !{!"278"}
!835 = !{i64 279}
!836 = !{!"279"}
!837 = !DILocation(line: 90, column: 15, scope: !831)
!838 = !{i64 280}
!839 = !{!"280"}
!840 = !{i64 281}
!841 = !{!"281"}
!842 = !DILocation(line: 90, column: 13, scope: !831)
!843 = !{i64 282}
!844 = !{!"282"}
!845 = !DILocation(line: 90, column: 9, scope: !832)
!846 = !{i64 283}
!847 = !{!"283"}
!848 = !DILocation(line: 91, column: 14, scope: !831)
!849 = !{i64 284}
!850 = !{!"284"}
!851 = !DILocation(line: 91, column: 7, scope: !831)
!852 = !{i64 285}
!853 = !{!"285"}
!854 = !{i64 286}
!855 = !{!"286"}
!856 = !DILocation(line: 93, column: 14, scope: !831)
!857 = !{i64 287}
!858 = !{!"287"}
!859 = !DILocation(line: 93, column: 7, scope: !831)
!860 = !{i64 288}
!861 = !{!"288"}
!862 = !{i64 289}
!863 = !{!"289"}
!864 = !DILocation(line: 95, column: 1, scope: !752)
!865 = !{i64 290}
!866 = !{!"290"}
!867 = !{i64 291}
!868 = !{!"291"}
!869 = distinct !DISubprogram(name: "projection", linkageName: "_Z10projection11Triangle_3DP11Triangle_2Di", scope: !3, file: !3, line: 100, type: !870, isLocal: false, isDefinition: true, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!870 = !DISubroutineType(types: !871)
!871 = !{null, !872, !175, !6}
!872 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_3D", file: !9, line: 36, baseType: !873)
!873 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 25, size: 72, flags: DIFlagTypePassByValue, elements: !874, identifier: "_ZTS11Triangle_3D")
!874 = !{!875, !876, !877, !878, !879, !880, !881, !882, !883}
!875 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !873, file: !9, line: 27, baseType: !13, size: 8)
!876 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !873, file: !9, line: 28, baseType: !13, size: 8, offset: 8)
!877 = !DIDerivedType(tag: DW_TAG_member, name: "z0", scope: !873, file: !9, line: 29, baseType: !13, size: 8, offset: 16)
!878 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !873, file: !9, line: 30, baseType: !13, size: 8, offset: 24)
!879 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !873, file: !9, line: 31, baseType: !13, size: 8, offset: 32)
!880 = !DIDerivedType(tag: DW_TAG_member, name: "z1", scope: !873, file: !9, line: 32, baseType: !13, size: 8, offset: 40)
!881 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !873, file: !9, line: 33, baseType: !13, size: 8, offset: 48)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !873, file: !9, line: 34, baseType: !13, size: 8, offset: 56)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "z2", scope: !873, file: !9, line: 35, baseType: !13, size: 8, offset: 64)
!884 = !{i64 292}
!885 = !{!"292"}
!886 = !{i64 293}
!887 = !{!"293"}
!888 = !DILocalVariable(name: "triangle_3d", arg: 1, scope: !869, file: !3, line: 100, type: !872)
!889 = !DILocation(line: 100, column: 29, scope: !869)
!890 = !{i64 294}
!891 = !{!"294"}
!892 = !{i64 295}
!893 = !{!"295"}
!894 = !DILocalVariable(name: "triangle_2d", arg: 2, scope: !869, file: !3, line: 100, type: !175)
!895 = !DILocation(line: 100, column: 55, scope: !869)
!896 = !{i64 296}
!897 = !{!"296"}
!898 = !{i64 297}
!899 = !{!"297"}
!900 = !DILocalVariable(name: "angle", arg: 3, scope: !869, file: !3, line: 100, type: !6)
!901 = !DILocation(line: 100, column: 72, scope: !869)
!902 = !{i64 298}
!903 = !{!"298"}
!904 = !DILocation(line: 106, column: 6, scope: !905)
!905 = distinct !DILexicalBlock(scope: !869, file: !3, line: 106, column: 6)
!906 = !{i64 299}
!907 = !{!"299"}
!908 = !DILocation(line: 106, column: 12, scope: !905)
!909 = !{i64 300}
!910 = !{!"300"}
!911 = !DILocation(line: 106, column: 6, scope: !869)
!912 = !{i64 301}
!913 = !{!"301"}
!914 = !DILocation(line: 108, column: 35, scope: !915)
!915 = distinct !DILexicalBlock(scope: !905, file: !3, line: 107, column: 3)
!916 = !{i64 302}
!917 = !{!"302"}
!918 = !{i64 303}
!919 = !{!"303"}
!920 = !DILocation(line: 108, column: 5, scope: !915)
!921 = !{i64 304}
!922 = !{!"304"}
!923 = !DILocation(line: 108, column: 18, scope: !915)
!924 = !{i64 305}
!925 = !{!"305"}
!926 = !DILocation(line: 108, column: 21, scope: !915)
!927 = !{i64 306}
!928 = !{!"306"}
!929 = !DILocation(line: 109, column: 35, scope: !915)
!930 = !{i64 307}
!931 = !{!"307"}
!932 = !{i64 308}
!933 = !{!"308"}
!934 = !DILocation(line: 109, column: 5, scope: !915)
!935 = !{i64 309}
!936 = !{!"309"}
!937 = !DILocation(line: 109, column: 18, scope: !915)
!938 = !{i64 310}
!939 = !{!"310"}
!940 = !DILocation(line: 109, column: 21, scope: !915)
!941 = !{i64 311}
!942 = !{!"311"}
!943 = !DILocation(line: 110, column: 35, scope: !915)
!944 = !{i64 312}
!945 = !{!"312"}
!946 = !{i64 313}
!947 = !{!"313"}
!948 = !DILocation(line: 110, column: 5, scope: !915)
!949 = !{i64 314}
!950 = !{!"314"}
!951 = !DILocation(line: 110, column: 18, scope: !915)
!952 = !{i64 315}
!953 = !{!"315"}
!954 = !DILocation(line: 110, column: 21, scope: !915)
!955 = !{i64 316}
!956 = !{!"316"}
!957 = !DILocation(line: 111, column: 35, scope: !915)
!958 = !{i64 317}
!959 = !{!"317"}
!960 = !{i64 318}
!961 = !{!"318"}
!962 = !DILocation(line: 111, column: 5, scope: !915)
!963 = !{i64 319}
!964 = !{!"319"}
!965 = !DILocation(line: 111, column: 18, scope: !915)
!966 = !{i64 320}
!967 = !{!"320"}
!968 = !DILocation(line: 111, column: 21, scope: !915)
!969 = !{i64 321}
!970 = !{!"321"}
!971 = !DILocation(line: 112, column: 35, scope: !915)
!972 = !{i64 322}
!973 = !{!"322"}
!974 = !{i64 323}
!975 = !{!"323"}
!976 = !DILocation(line: 112, column: 5, scope: !915)
!977 = !{i64 324}
!978 = !{!"324"}
!979 = !DILocation(line: 112, column: 18, scope: !915)
!980 = !{i64 325}
!981 = !{!"325"}
!982 = !DILocation(line: 112, column: 21, scope: !915)
!983 = !{i64 326}
!984 = !{!"326"}
!985 = !DILocation(line: 113, column: 35, scope: !915)
!986 = !{i64 327}
!987 = !{!"327"}
!988 = !{i64 328}
!989 = !{!"328"}
!990 = !DILocation(line: 113, column: 5, scope: !915)
!991 = !{i64 329}
!992 = !{!"329"}
!993 = !DILocation(line: 113, column: 18, scope: !915)
!994 = !{i64 330}
!995 = !{!"330"}
!996 = !DILocation(line: 113, column: 21, scope: !915)
!997 = !{i64 331}
!998 = !{!"331"}
!999 = !DILocation(line: 114, column: 34, scope: !915)
!1000 = !{i64 332}
!1001 = !{!"332"}
!1002 = !{i64 333}
!1003 = !{!"333"}
!1004 = !DILocation(line: 114, column: 22, scope: !915)
!1005 = !{i64 334}
!1006 = !{!"334"}
!1007 = !DILocation(line: 114, column: 37, scope: !915)
!1008 = !{i64 335}
!1009 = !{!"335"}
!1010 = !DILocation(line: 114, column: 55, scope: !915)
!1011 = !{i64 336}
!1012 = !{!"336"}
!1013 = !{i64 337}
!1014 = !{!"337"}
!1015 = !DILocation(line: 114, column: 43, scope: !915)
!1016 = !{i64 338}
!1017 = !{!"338"}
!1018 = !DILocation(line: 114, column: 58, scope: !915)
!1019 = !{i64 339}
!1020 = !{!"339"}
!1021 = !DILocation(line: 114, column: 41, scope: !915)
!1022 = !{i64 340}
!1023 = !{!"340"}
!1024 = !DILocation(line: 114, column: 76, scope: !915)
!1025 = !{i64 341}
!1026 = !{!"341"}
!1027 = !{i64 342}
!1028 = !{!"342"}
!1029 = !DILocation(line: 114, column: 64, scope: !915)
!1030 = !{i64 343}
!1031 = !{!"343"}
!1032 = !DILocation(line: 114, column: 79, scope: !915)
!1033 = !{i64 344}
!1034 = !{!"344"}
!1035 = !DILocation(line: 114, column: 62, scope: !915)
!1036 = !{i64 345}
!1037 = !{!"345"}
!1038 = !{i64 346}
!1039 = !{!"346"}
!1040 = !DILocation(line: 114, column: 5, scope: !915)
!1041 = !{i64 347}
!1042 = !{!"347"}
!1043 = !DILocation(line: 114, column: 18, scope: !915)
!1044 = !{i64 348}
!1045 = !{!"348"}
!1046 = !DILocation(line: 114, column: 20, scope: !915)
!1047 = !{i64 349}
!1048 = !{!"349"}
!1049 = !DILocation(line: 115, column: 3, scope: !915)
!1050 = !{i64 350}
!1051 = !{!"350"}
!1052 = !DILocation(line: 117, column: 11, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !905, file: !3, line: 117, column: 11)
!1054 = !{i64 351}
!1055 = !{!"351"}
!1056 = !DILocation(line: 117, column: 17, scope: !1053)
!1057 = !{i64 352}
!1058 = !{!"352"}
!1059 = !DILocation(line: 117, column: 11, scope: !905)
!1060 = !{i64 353}
!1061 = !{!"353"}
!1062 = !DILocation(line: 119, column: 35, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 118, column: 3)
!1064 = !{i64 354}
!1065 = !{!"354"}
!1066 = !{i64 355}
!1067 = !{!"355"}
!1068 = !DILocation(line: 119, column: 5, scope: !1063)
!1069 = !{i64 356}
!1070 = !{!"356"}
!1071 = !DILocation(line: 119, column: 18, scope: !1063)
!1072 = !{i64 357}
!1073 = !{!"357"}
!1074 = !DILocation(line: 119, column: 21, scope: !1063)
!1075 = !{i64 358}
!1076 = !{!"358"}
!1077 = !DILocation(line: 120, column: 35, scope: !1063)
!1078 = !{i64 359}
!1079 = !{!"359"}
!1080 = !{i64 360}
!1081 = !{!"360"}
!1082 = !DILocation(line: 120, column: 5, scope: !1063)
!1083 = !{i64 361}
!1084 = !{!"361"}
!1085 = !DILocation(line: 120, column: 18, scope: !1063)
!1086 = !{i64 362}
!1087 = !{!"362"}
!1088 = !DILocation(line: 120, column: 21, scope: !1063)
!1089 = !{i64 363}
!1090 = !{!"363"}
!1091 = !DILocation(line: 121, column: 35, scope: !1063)
!1092 = !{i64 364}
!1093 = !{!"364"}
!1094 = !{i64 365}
!1095 = !{!"365"}
!1096 = !DILocation(line: 121, column: 5, scope: !1063)
!1097 = !{i64 366}
!1098 = !{!"366"}
!1099 = !DILocation(line: 121, column: 18, scope: !1063)
!1100 = !{i64 367}
!1101 = !{!"367"}
!1102 = !DILocation(line: 121, column: 21, scope: !1063)
!1103 = !{i64 368}
!1104 = !{!"368"}
!1105 = !DILocation(line: 122, column: 35, scope: !1063)
!1106 = !{i64 369}
!1107 = !{!"369"}
!1108 = !{i64 370}
!1109 = !{!"370"}
!1110 = !DILocation(line: 122, column: 5, scope: !1063)
!1111 = !{i64 371}
!1112 = !{!"371"}
!1113 = !DILocation(line: 122, column: 18, scope: !1063)
!1114 = !{i64 372}
!1115 = !{!"372"}
!1116 = !DILocation(line: 122, column: 21, scope: !1063)
!1117 = !{i64 373}
!1118 = !{!"373"}
!1119 = !DILocation(line: 123, column: 35, scope: !1063)
!1120 = !{i64 374}
!1121 = !{!"374"}
!1122 = !{i64 375}
!1123 = !{!"375"}
!1124 = !DILocation(line: 123, column: 5, scope: !1063)
!1125 = !{i64 376}
!1126 = !{!"376"}
!1127 = !DILocation(line: 123, column: 18, scope: !1063)
!1128 = !{i64 377}
!1129 = !{!"377"}
!1130 = !DILocation(line: 123, column: 21, scope: !1063)
!1131 = !{i64 378}
!1132 = !{!"378"}
!1133 = !DILocation(line: 124, column: 35, scope: !1063)
!1134 = !{i64 379}
!1135 = !{!"379"}
!1136 = !{i64 380}
!1137 = !{!"380"}
!1138 = !DILocation(line: 124, column: 5, scope: !1063)
!1139 = !{i64 381}
!1140 = !{!"381"}
!1141 = !DILocation(line: 124, column: 18, scope: !1063)
!1142 = !{i64 382}
!1143 = !{!"382"}
!1144 = !DILocation(line: 124, column: 21, scope: !1063)
!1145 = !{i64 383}
!1146 = !{!"383"}
!1147 = !DILocation(line: 125, column: 34, scope: !1063)
!1148 = !{i64 384}
!1149 = !{!"384"}
!1150 = !{i64 385}
!1151 = !{!"385"}
!1152 = !DILocation(line: 125, column: 22, scope: !1063)
!1153 = !{i64 386}
!1154 = !{!"386"}
!1155 = !DILocation(line: 125, column: 37, scope: !1063)
!1156 = !{i64 387}
!1157 = !{!"387"}
!1158 = !DILocation(line: 125, column: 55, scope: !1063)
!1159 = !{i64 388}
!1160 = !{!"388"}
!1161 = !{i64 389}
!1162 = !{!"389"}
!1163 = !DILocation(line: 125, column: 43, scope: !1063)
!1164 = !{i64 390}
!1165 = !{!"390"}
!1166 = !DILocation(line: 125, column: 58, scope: !1063)
!1167 = !{i64 391}
!1168 = !{!"391"}
!1169 = !DILocation(line: 125, column: 41, scope: !1063)
!1170 = !{i64 392}
!1171 = !{!"392"}
!1172 = !DILocation(line: 125, column: 76, scope: !1063)
!1173 = !{i64 393}
!1174 = !{!"393"}
!1175 = !{i64 394}
!1176 = !{!"394"}
!1177 = !DILocation(line: 125, column: 64, scope: !1063)
!1178 = !{i64 395}
!1179 = !{!"395"}
!1180 = !DILocation(line: 125, column: 79, scope: !1063)
!1181 = !{i64 396}
!1182 = !{!"396"}
!1183 = !DILocation(line: 125, column: 62, scope: !1063)
!1184 = !{i64 397}
!1185 = !{!"397"}
!1186 = !{i64 398}
!1187 = !{!"398"}
!1188 = !DILocation(line: 125, column: 5, scope: !1063)
!1189 = !{i64 399}
!1190 = !{!"399"}
!1191 = !DILocation(line: 125, column: 18, scope: !1063)
!1192 = !{i64 400}
!1193 = !{!"400"}
!1194 = !DILocation(line: 125, column: 20, scope: !1063)
!1195 = !{i64 401}
!1196 = !{!"401"}
!1197 = !DILocation(line: 126, column: 3, scope: !1063)
!1198 = !{i64 402}
!1199 = !{!"402"}
!1200 = !DILocation(line: 128, column: 11, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 128, column: 11)
!1202 = !{i64 403}
!1203 = !{!"403"}
!1204 = !DILocation(line: 128, column: 17, scope: !1201)
!1205 = !{i64 404}
!1206 = !{!"404"}
!1207 = !DILocation(line: 128, column: 11, scope: !1053)
!1208 = !{i64 405}
!1209 = !{!"405"}
!1210 = !DILocation(line: 130, column: 35, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1201, file: !3, line: 129, column: 3)
!1212 = !{i64 406}
!1213 = !{!"406"}
!1214 = !{i64 407}
!1215 = !{!"407"}
!1216 = !DILocation(line: 130, column: 5, scope: !1211)
!1217 = !{i64 408}
!1218 = !{!"408"}
!1219 = !DILocation(line: 130, column: 18, scope: !1211)
!1220 = !{i64 409}
!1221 = !{!"409"}
!1222 = !DILocation(line: 130, column: 21, scope: !1211)
!1223 = !{i64 410}
!1224 = !{!"410"}
!1225 = !DILocation(line: 131, column: 35, scope: !1211)
!1226 = !{i64 411}
!1227 = !{!"411"}
!1228 = !{i64 412}
!1229 = !{!"412"}
!1230 = !DILocation(line: 131, column: 5, scope: !1211)
!1231 = !{i64 413}
!1232 = !{!"413"}
!1233 = !DILocation(line: 131, column: 18, scope: !1211)
!1234 = !{i64 414}
!1235 = !{!"414"}
!1236 = !DILocation(line: 131, column: 21, scope: !1211)
!1237 = !{i64 415}
!1238 = !{!"415"}
!1239 = !DILocation(line: 132, column: 35, scope: !1211)
!1240 = !{i64 416}
!1241 = !{!"416"}
!1242 = !{i64 417}
!1243 = !{!"417"}
!1244 = !DILocation(line: 132, column: 5, scope: !1211)
!1245 = !{i64 418}
!1246 = !{!"418"}
!1247 = !DILocation(line: 132, column: 18, scope: !1211)
!1248 = !{i64 419}
!1249 = !{!"419"}
!1250 = !DILocation(line: 132, column: 21, scope: !1211)
!1251 = !{i64 420}
!1252 = !{!"420"}
!1253 = !DILocation(line: 133, column: 35, scope: !1211)
!1254 = !{i64 421}
!1255 = !{!"421"}
!1256 = !{i64 422}
!1257 = !{!"422"}
!1258 = !DILocation(line: 133, column: 5, scope: !1211)
!1259 = !{i64 423}
!1260 = !{!"423"}
!1261 = !DILocation(line: 133, column: 18, scope: !1211)
!1262 = !{i64 424}
!1263 = !{!"424"}
!1264 = !DILocation(line: 133, column: 21, scope: !1211)
!1265 = !{i64 425}
!1266 = !{!"425"}
!1267 = !DILocation(line: 134, column: 35, scope: !1211)
!1268 = !{i64 426}
!1269 = !{!"426"}
!1270 = !{i64 427}
!1271 = !{!"427"}
!1272 = !DILocation(line: 134, column: 5, scope: !1211)
!1273 = !{i64 428}
!1274 = !{!"428"}
!1275 = !DILocation(line: 134, column: 18, scope: !1211)
!1276 = !{i64 429}
!1277 = !{!"429"}
!1278 = !DILocation(line: 134, column: 21, scope: !1211)
!1279 = !{i64 430}
!1280 = !{!"430"}
!1281 = !DILocation(line: 135, column: 35, scope: !1211)
!1282 = !{i64 431}
!1283 = !{!"431"}
!1284 = !{i64 432}
!1285 = !{!"432"}
!1286 = !DILocation(line: 135, column: 5, scope: !1211)
!1287 = !{i64 433}
!1288 = !{!"433"}
!1289 = !DILocation(line: 135, column: 18, scope: !1211)
!1290 = !{i64 434}
!1291 = !{!"434"}
!1292 = !DILocation(line: 135, column: 21, scope: !1211)
!1293 = !{i64 435}
!1294 = !{!"435"}
!1295 = !DILocation(line: 136, column: 34, scope: !1211)
!1296 = !{i64 436}
!1297 = !{!"436"}
!1298 = !{i64 437}
!1299 = !{!"437"}
!1300 = !DILocation(line: 136, column: 22, scope: !1211)
!1301 = !{i64 438}
!1302 = !{!"438"}
!1303 = !DILocation(line: 136, column: 37, scope: !1211)
!1304 = !{i64 439}
!1305 = !{!"439"}
!1306 = !DILocation(line: 136, column: 55, scope: !1211)
!1307 = !{i64 440}
!1308 = !{!"440"}
!1309 = !{i64 441}
!1310 = !{!"441"}
!1311 = !DILocation(line: 136, column: 43, scope: !1211)
!1312 = !{i64 442}
!1313 = !{!"442"}
!1314 = !DILocation(line: 136, column: 58, scope: !1211)
!1315 = !{i64 443}
!1316 = !{!"443"}
!1317 = !DILocation(line: 136, column: 41, scope: !1211)
!1318 = !{i64 444}
!1319 = !{!"444"}
!1320 = !DILocation(line: 136, column: 76, scope: !1211)
!1321 = !{i64 445}
!1322 = !{!"445"}
!1323 = !{i64 446}
!1324 = !{!"446"}
!1325 = !DILocation(line: 136, column: 64, scope: !1211)
!1326 = !{i64 447}
!1327 = !{!"447"}
!1328 = !DILocation(line: 136, column: 79, scope: !1211)
!1329 = !{i64 448}
!1330 = !{!"448"}
!1331 = !DILocation(line: 136, column: 62, scope: !1211)
!1332 = !{i64 449}
!1333 = !{!"449"}
!1334 = !{i64 450}
!1335 = !{!"450"}
!1336 = !DILocation(line: 136, column: 5, scope: !1211)
!1337 = !{i64 451}
!1338 = !{!"451"}
!1339 = !DILocation(line: 136, column: 18, scope: !1211)
!1340 = !{i64 452}
!1341 = !{!"452"}
!1342 = !DILocation(line: 136, column: 20, scope: !1211)
!1343 = !{i64 453}
!1344 = !{!"453"}
!1345 = !DILocation(line: 137, column: 3, scope: !1211)
!1346 = !{i64 454}
!1347 = !{!"454"}
!1348 = !{i64 455}
!1349 = !{!"455"}
!1350 = !{i64 456}
!1351 = !{!"456"}
!1352 = !DILocation(line: 138, column: 1, scope: !869)
!1353 = !{i64 457}
!1354 = !{!"457"}
!1355 = distinct !DISubprogram(name: "rasterization1", linkageName: "_Z14rasterization111Triangle_2DPhPi", scope: !3, file: !3, line: 141, type: !1356, isLocal: false, isDefinition: true, scopeLine: 142, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!291, !47, !1358, !1359}
!1358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!1359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!1360 = !{i64 458}
!1361 = !{!"458"}
!1362 = !{i64 459}
!1363 = !{!"459"}
!1364 = !{i64 460}
!1365 = !{!"460"}
!1366 = !{i64 461}
!1367 = !{!"461"}
!1368 = !{i64 462}
!1369 = !{!"462"}
!1370 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !1355, file: !3, line: 141, type: !47)
!1371 = !DILocation(line: 141, column: 33, scope: !1355)
!1372 = !{i64 463}
!1373 = !{!"463"}
!1374 = !{i64 464}
!1375 = !{!"464"}
!1376 = !DILocalVariable(name: "max_min", arg: 2, scope: !1355, file: !3, line: 141, type: !1358)
!1377 = !DILocation(line: 141, column: 51, scope: !1355)
!1378 = !{i64 465}
!1379 = !{!"465"}
!1380 = !{i64 466}
!1381 = !{!"466"}
!1382 = !DILocalVariable(name: "max_index", arg: 3, scope: !1355, file: !3, line: 141, type: !1359)
!1383 = !DILocation(line: 141, column: 66, scope: !1355)
!1384 = !{i64 467}
!1385 = !{!"467"}
!1386 = !DILocation(line: 144, column: 25, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1355, file: !3, line: 144, column: 8)
!1388 = !{i64 468}
!1389 = !{!"468"}
!1390 = !{i64 469}
!1391 = !{!"469"}
!1392 = !DILocation(line: 144, column: 8, scope: !1387)
!1393 = !{i64 470}
!1394 = !{!"470"}
!1395 = !DILocation(line: 144, column: 39, scope: !1387)
!1396 = !{i64 471}
!1397 = !{!"471"}
!1398 = !DILocation(line: 144, column: 8, scope: !1355)
!1399 = !{i64 472}
!1400 = !{!"472"}
!1401 = !DILocation(line: 145, column: 5, scope: !1387)
!1402 = !{i64 473}
!1403 = !{!"473"}
!1404 = !{i64 474}
!1405 = !{!"474"}
!1406 = !DILocation(line: 146, column: 25, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1355, file: !3, line: 146, column: 8)
!1408 = !{i64 475}
!1409 = !{!"475"}
!1410 = !{i64 476}
!1411 = !{!"476"}
!1412 = !DILocation(line: 146, column: 8, scope: !1407)
!1413 = !{i64 477}
!1414 = !{!"477"}
!1415 = !DILocation(line: 146, column: 39, scope: !1407)
!1416 = !{i64 478}
!1417 = !{!"478"}
!1418 = !DILocation(line: 146, column: 8, scope: !1355)
!1419 = !{i64 479}
!1420 = !{!"479"}
!1421 = !DILocation(line: 147, column: 5, scope: !1407)
!1422 = !{i64 480}
!1423 = !{!"480"}
!1424 = !{i64 481}
!1425 = !{!"481"}
!1426 = !DILocation(line: 150, column: 38, scope: !1355)
!1427 = !{i64 482}
!1428 = !{!"482"}
!1429 = !{i64 483}
!1430 = !{!"483"}
!1431 = !DILocation(line: 150, column: 54, scope: !1355)
!1432 = !{i64 484}
!1433 = !{!"484"}
!1434 = !{i64 485}
!1435 = !{!"485"}
!1436 = !DILocation(line: 150, column: 70, scope: !1355)
!1437 = !{i64 486}
!1438 = !{!"486"}
!1439 = !{i64 487}
!1440 = !{!"487"}
!1441 = !DILocation(line: 150, column: 16, scope: !1355)
!1442 = !{i64 488}
!1443 = !{!"488"}
!1444 = !DILocation(line: 150, column: 3, scope: !1355)
!1445 = !{i64 489}
!1446 = !{!"489"}
!1447 = !{i64 490}
!1448 = !{!"490"}
!1449 = !DILocation(line: 150, column: 14, scope: !1355)
!1450 = !{i64 491}
!1451 = !{!"491"}
!1452 = !DILocation(line: 151, column: 38, scope: !1355)
!1453 = !{i64 492}
!1454 = !{!"492"}
!1455 = !{i64 493}
!1456 = !{!"493"}
!1457 = !DILocation(line: 151, column: 54, scope: !1355)
!1458 = !{i64 494}
!1459 = !{!"494"}
!1460 = !{i64 495}
!1461 = !{!"495"}
!1462 = !DILocation(line: 151, column: 70, scope: !1355)
!1463 = !{i64 496}
!1464 = !{!"496"}
!1465 = !{i64 497}
!1466 = !{!"497"}
!1467 = !DILocation(line: 151, column: 16, scope: !1355)
!1468 = !{i64 498}
!1469 = !{!"498"}
!1470 = !DILocation(line: 151, column: 3, scope: !1355)
!1471 = !{i64 499}
!1472 = !{!"499"}
!1473 = !{i64 500}
!1474 = !{!"500"}
!1475 = !DILocation(line: 151, column: 14, scope: !1355)
!1476 = !{i64 501}
!1477 = !{!"501"}
!1478 = !DILocation(line: 152, column: 38, scope: !1355)
!1479 = !{i64 502}
!1480 = !{!"502"}
!1481 = !{i64 503}
!1482 = !{!"503"}
!1483 = !DILocation(line: 152, column: 54, scope: !1355)
!1484 = !{i64 504}
!1485 = !{!"504"}
!1486 = !{i64 505}
!1487 = !{!"505"}
!1488 = !DILocation(line: 152, column: 70, scope: !1355)
!1489 = !{i64 506}
!1490 = !{!"506"}
!1491 = !{i64 507}
!1492 = !{!"507"}
!1493 = !DILocation(line: 152, column: 16, scope: !1355)
!1494 = !{i64 508}
!1495 = !{!"508"}
!1496 = !DILocation(line: 152, column: 3, scope: !1355)
!1497 = !{i64 509}
!1498 = !{!"509"}
!1499 = !{i64 510}
!1500 = !{!"510"}
!1501 = !DILocation(line: 152, column: 14, scope: !1355)
!1502 = !{i64 511}
!1503 = !{!"511"}
!1504 = !DILocation(line: 153, column: 38, scope: !1355)
!1505 = !{i64 512}
!1506 = !{!"512"}
!1507 = !{i64 513}
!1508 = !{!"513"}
!1509 = !DILocation(line: 153, column: 54, scope: !1355)
!1510 = !{i64 514}
!1511 = !{!"514"}
!1512 = !{i64 515}
!1513 = !{!"515"}
!1514 = !DILocation(line: 153, column: 70, scope: !1355)
!1515 = !{i64 516}
!1516 = !{!"516"}
!1517 = !{i64 517}
!1518 = !{!"517"}
!1519 = !DILocation(line: 153, column: 16, scope: !1355)
!1520 = !{i64 518}
!1521 = !{!"518"}
!1522 = !DILocation(line: 153, column: 3, scope: !1355)
!1523 = !{i64 519}
!1524 = !{!"519"}
!1525 = !{i64 520}
!1526 = !{!"520"}
!1527 = !DILocation(line: 153, column: 14, scope: !1355)
!1528 = !{i64 521}
!1529 = !{!"521"}
!1530 = !DILocation(line: 154, column: 16, scope: !1355)
!1531 = !{i64 522}
!1532 = !{!"522"}
!1533 = !{i64 523}
!1534 = !{!"523"}
!1535 = !{i64 524}
!1536 = !{!"524"}
!1537 = !{i64 525}
!1538 = !{!"525"}
!1539 = !DILocation(line: 154, column: 29, scope: !1355)
!1540 = !{i64 526}
!1541 = !{!"526"}
!1542 = !{i64 527}
!1543 = !{!"527"}
!1544 = !{i64 528}
!1545 = !{!"528"}
!1546 = !{i64 529}
!1547 = !{!"529"}
!1548 = !DILocation(line: 154, column: 27, scope: !1355)
!1549 = !{i64 530}
!1550 = !{!"530"}
!1551 = !{i64 531}
!1552 = !{!"531"}
!1553 = !DILocation(line: 154, column: 3, scope: !1355)
!1554 = !{i64 532}
!1555 = !{!"532"}
!1556 = !{i64 533}
!1557 = !{!"533"}
!1558 = !DILocation(line: 154, column: 14, scope: !1355)
!1559 = !{i64 534}
!1560 = !{!"534"}
!1561 = !DILocation(line: 157, column: 19, scope: !1355)
!1562 = !{i64 535}
!1563 = !{!"535"}
!1564 = !{i64 536}
!1565 = !{!"536"}
!1566 = !{i64 537}
!1567 = !{!"537"}
!1568 = !{i64 538}
!1569 = !{!"538"}
!1570 = !DILocation(line: 157, column: 32, scope: !1355)
!1571 = !{i64 539}
!1572 = !{!"539"}
!1573 = !{i64 540}
!1574 = !{!"540"}
!1575 = !{i64 541}
!1576 = !{!"541"}
!1577 = !{i64 542}
!1578 = !{!"542"}
!1579 = !DILocation(line: 157, column: 30, scope: !1355)
!1580 = !{i64 543}
!1581 = !{!"543"}
!1582 = !DILocation(line: 157, column: 47, scope: !1355)
!1583 = !{i64 544}
!1584 = !{!"544"}
!1585 = !{i64 545}
!1586 = !{!"545"}
!1587 = !{i64 546}
!1588 = !{!"546"}
!1589 = !{i64 547}
!1590 = !{!"547"}
!1591 = !DILocation(line: 157, column: 60, scope: !1355)
!1592 = !{i64 548}
!1593 = !{!"548"}
!1594 = !{i64 549}
!1595 = !{!"549"}
!1596 = !{i64 550}
!1597 = !{!"550"}
!1598 = !{i64 551}
!1599 = !{!"551"}
!1600 = !DILocation(line: 157, column: 58, scope: !1355)
!1601 = !{i64 552}
!1602 = !{!"552"}
!1603 = !DILocation(line: 157, column: 44, scope: !1355)
!1604 = !{i64 553}
!1605 = !{!"553"}
!1606 = !DILocation(line: 157, column: 3, scope: !1355)
!1607 = !{i64 554}
!1608 = !{!"554"}
!1609 = !{i64 555}
!1610 = !{!"555"}
!1611 = !DILocation(line: 157, column: 16, scope: !1355)
!1612 = !{i64 556}
!1613 = !{!"556"}
!1614 = !DILocation(line: 159, column: 3, scope: !1355)
!1615 = !{i64 557}
!1616 = !{!"557"}
!1617 = !{i64 558}
!1618 = !{!"558"}
!1619 = !DILocation(line: 160, column: 1, scope: !1355)
!1620 = !{i64 559}
!1621 = !{!"559"}
!1622 = !{i64 560}
!1623 = !{!"560"}
!1624 = distinct !DISubprogram(name: "rasterization2", linkageName: "_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel", scope: !3, file: !3, line: 163, type: !1625, isLocal: false, isDefinition: true, scopeLine: 164, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!1625 = !DISubroutineType(types: !1626)
!1626 = !{!6, !291, !1358, !1359, !47, !7}
!1627 = !{i64 561}
!1628 = !{!"561"}
!1629 = !{i64 562}
!1630 = !{!"562"}
!1631 = !{i64 563}
!1632 = !{!"563"}
!1633 = !{i64 564}
!1634 = !{!"564"}
!1635 = !{i64 565}
!1636 = !{!"565"}
!1637 = !{i64 566}
!1638 = !{!"566"}
!1639 = !{i64 567}
!1640 = !{!"567"}
!1641 = !{i64 568}
!1642 = !{!"568"}
!1643 = !{i64 569}
!1644 = !{!"569"}
!1645 = !{i64 570}
!1646 = !{!"570"}
!1647 = !{i64 571}
!1648 = !{!"571"}
!1649 = !{i64 572}
!1650 = !{!"572"}
!1651 = !DILocalVariable(name: "flag", arg: 1, scope: !1624, file: !3, line: 163, type: !291)
!1652 = !DILocation(line: 163, column: 27, scope: !1624)
!1653 = !{i64 573}
!1654 = !{!"573"}
!1655 = !{i64 574}
!1656 = !{!"574"}
!1657 = !DILocalVariable(name: "max_min", arg: 2, scope: !1624, file: !3, line: 163, type: !1358)
!1658 = !DILocation(line: 163, column: 38, scope: !1624)
!1659 = !{i64 575}
!1660 = !{!"575"}
!1661 = !{i64 576}
!1662 = !{!"576"}
!1663 = !DILocalVariable(name: "max_index", arg: 3, scope: !1624, file: !3, line: 163, type: !1359)
!1664 = !DILocation(line: 163, column: 53, scope: !1624)
!1665 = !{i64 577}
!1666 = !{!"577"}
!1667 = !DILocalVariable(name: "triangle_2d", arg: 4, scope: !1624, file: !3, line: 163, type: !47)
!1668 = !DILocation(line: 163, column: 78, scope: !1624)
!1669 = !{i64 578}
!1670 = !{!"578"}
!1671 = !{i64 579}
!1672 = !{!"579"}
!1673 = !DILocalVariable(name: "fragment", arg: 5, scope: !1624, file: !3, line: 163, type: !7)
!1674 = !DILocation(line: 163, column: 106, scope: !1624)
!1675 = !{i64 580}
!1676 = !{!"580"}
!1677 = !DILocation(line: 166, column: 8, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1624, file: !3, line: 166, column: 8)
!1679 = !{i64 581}
!1680 = !{!"581"}
!1681 = !DILocation(line: 166, column: 8, scope: !1624)
!1682 = !{i64 582}
!1683 = !{!"582"}
!1684 = !DILocation(line: 168, column: 5, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1678, file: !3, line: 167, column: 3)
!1686 = !{i64 583}
!1687 = !{!"583"}
!1688 = !{i64 584}
!1689 = !{!"584"}
!1690 = !DILocation(line: 171, column: 3, scope: !1624)
!1691 = !{i64 585}
!1692 = !{!"585"}
!1693 = !DILocalVariable(name: "color", scope: !1624, file: !3, line: 171, type: !13)
!1694 = !DILocation(line: 171, column: 8, scope: !1624)
!1695 = !{i64 586}
!1696 = !{!"586"}
!1697 = !{i64 587}
!1698 = !{!"587"}
!1699 = !DILocation(line: 172, column: 3, scope: !1624)
!1700 = !{i64 588}
!1701 = !{!"588"}
!1702 = !{i64 589}
!1703 = !{!"589"}
!1704 = !DILocalVariable(name: "i", scope: !1624, file: !3, line: 172, type: !6)
!1705 = !DILocation(line: 172, column: 7, scope: !1624)
!1706 = !{i64 590}
!1707 = !{!"590"}
!1708 = !{i64 591}
!1709 = !{!"591"}
!1710 = !{i64 592}
!1711 = !{!"592"}
!1712 = !DILocation(line: 174, column: 16, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1624, file: !3, line: 174, column: 10)
!1714 = !{i64 593}
!1715 = !{!"593"}
!1716 = !{i64 594}
!1717 = !{!"594"}
!1718 = !DILocalVariable(name: "k", scope: !1713, file: !3, line: 174, type: !6)
!1719 = !DILocation(line: 174, column: 20, scope: !1713)
!1720 = !{i64 595}
!1721 = !{!"595"}
!1722 = !{i64 596}
!1723 = !{!"596"}
!1724 = !{i64 597}
!1725 = !{!"597"}
!1726 = !DILocation(line: 174, column: 27, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1713, file: !3, line: 174, column: 10)
!1728 = !{i64 598}
!1729 = !{!"598"}
!1730 = !DILocation(line: 174, column: 31, scope: !1727)
!1731 = !{i64 599}
!1732 = !{!"599"}
!1733 = !{i64 600}
!1734 = !{!"600"}
!1735 = !{i64 601}
!1736 = !{!"601"}
!1737 = !DILocation(line: 174, column: 29, scope: !1727)
!1738 = !{i64 602}
!1739 = !{!"602"}
!1740 = !DILocation(line: 174, column: 10, scope: !1713)
!1741 = !{i64 603}
!1742 = !{!"603"}
!1743 = !DILocation(line: 174, column: 10, scope: !1727)
!1744 = !{i64 604}
!1745 = !{!"604"}
!1746 = !{i64 605}
!1747 = !{!"605"}
!1748 = !{i64 606}
!1749 = !{!"606"}
!1750 = !DILocation(line: 176, column: 5, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1727, file: !3, line: 175, column: 3)
!1752 = !{i64 607}
!1753 = !{!"607"}
!1754 = !DILocalVariable(name: "x", scope: !1751, file: !3, line: 176, type: !13)
!1755 = !DILocation(line: 176, column: 10, scope: !1751)
!1756 = !{i64 608}
!1757 = !{!"608"}
!1758 = !DILocation(line: 176, column: 14, scope: !1751)
!1759 = !{i64 609}
!1760 = !{!"609"}
!1761 = !{i64 610}
!1762 = !{!"610"}
!1763 = !{i64 611}
!1764 = !{!"611"}
!1765 = !{i64 612}
!1766 = !{!"612"}
!1767 = !DILocation(line: 176, column: 27, scope: !1751)
!1768 = !{i64 613}
!1769 = !{!"613"}
!1770 = !DILocation(line: 176, column: 31, scope: !1751)
!1771 = !{i64 614}
!1772 = !{!"614"}
!1773 = !{i64 615}
!1774 = !{!"615"}
!1775 = !{i64 616}
!1776 = !{!"616"}
!1777 = !{i64 617}
!1778 = !{!"617"}
!1779 = !DILocation(line: 176, column: 29, scope: !1751)
!1780 = !{i64 618}
!1781 = !{!"618"}
!1782 = !DILocation(line: 176, column: 25, scope: !1751)
!1783 = !{i64 619}
!1784 = !{!"619"}
!1785 = !{i64 620}
!1786 = !{!"620"}
!1787 = !{i64 621}
!1788 = !{!"621"}
!1789 = !DILocation(line: 177, column: 5, scope: !1751)
!1790 = !{i64 622}
!1791 = !{!"622"}
!1792 = !DILocalVariable(name: "y", scope: !1751, file: !3, line: 177, type: !13)
!1793 = !DILocation(line: 177, column: 10, scope: !1751)
!1794 = !{i64 623}
!1795 = !{!"623"}
!1796 = !DILocation(line: 177, column: 14, scope: !1751)
!1797 = !{i64 624}
!1798 = !{!"624"}
!1799 = !{i64 625}
!1800 = !{!"625"}
!1801 = !{i64 626}
!1802 = !{!"626"}
!1803 = !{i64 627}
!1804 = !{!"627"}
!1805 = !DILocation(line: 177, column: 27, scope: !1751)
!1806 = !{i64 628}
!1807 = !{!"628"}
!1808 = !DILocation(line: 177, column: 31, scope: !1751)
!1809 = !{i64 629}
!1810 = !{!"629"}
!1811 = !{i64 630}
!1812 = !{!"630"}
!1813 = !{i64 631}
!1814 = !{!"631"}
!1815 = !{i64 632}
!1816 = !{!"632"}
!1817 = !DILocation(line: 177, column: 29, scope: !1751)
!1818 = !{i64 633}
!1819 = !{!"633"}
!1820 = !DILocation(line: 177, column: 25, scope: !1751)
!1821 = !{i64 634}
!1822 = !{!"634"}
!1823 = !{i64 635}
!1824 = !{!"635"}
!1825 = !{i64 636}
!1826 = !{!"636"}
!1827 = !DILocation(line: 179, column: 28, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1751, file: !3, line: 179, column: 9)
!1829 = !{i64 637}
!1830 = !{!"637"}
!1831 = !DILocation(line: 179, column: 31, scope: !1828)
!1832 = !{i64 638}
!1833 = !{!"638"}
!1834 = !DILocation(line: 179, column: 34, scope: !1828)
!1835 = !{i64 639}
!1836 = !{!"639"}
!1837 = !{i64 640}
!1838 = !{!"640"}
!1839 = !DILocation(line: 179, column: 9, scope: !1828)
!1840 = !{i64 641}
!1841 = !{!"641"}
!1842 = !DILocation(line: 179, column: 9, scope: !1751)
!1843 = !{i64 642}
!1844 = !{!"642"}
!1845 = !DILocation(line: 181, column: 23, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1828, file: !3, line: 180, column: 5)
!1847 = !{i64 643}
!1848 = !{!"643"}
!1849 = !DILocation(line: 181, column: 7, scope: !1846)
!1850 = !{i64 644}
!1851 = !{!"644"}
!1852 = !DILocation(line: 181, column: 16, scope: !1846)
!1853 = !{i64 645}
!1854 = !{!"645"}
!1855 = !{i64 646}
!1856 = !{!"646"}
!1857 = !{i64 647}
!1858 = !{!"647"}
!1859 = !DILocation(line: 181, column: 19, scope: !1846)
!1860 = !{i64 648}
!1861 = !{!"648"}
!1862 = !DILocation(line: 181, column: 21, scope: !1846)
!1863 = !{i64 649}
!1864 = !{!"649"}
!1865 = !DILocation(line: 182, column: 23, scope: !1846)
!1866 = !{i64 650}
!1867 = !{!"650"}
!1868 = !DILocation(line: 182, column: 7, scope: !1846)
!1869 = !{i64 651}
!1870 = !{!"651"}
!1871 = !DILocation(line: 182, column: 16, scope: !1846)
!1872 = !{i64 652}
!1873 = !{!"652"}
!1874 = !{i64 653}
!1875 = !{!"653"}
!1876 = !{i64 654}
!1877 = !{!"654"}
!1878 = !DILocation(line: 182, column: 19, scope: !1846)
!1879 = !{i64 655}
!1880 = !{!"655"}
!1881 = !DILocation(line: 182, column: 21, scope: !1846)
!1882 = !{i64 656}
!1883 = !{!"656"}
!1884 = !DILocation(line: 183, column: 35, scope: !1846)
!1885 = !{i64 657}
!1886 = !{!"657"}
!1887 = !{i64 658}
!1888 = !{!"658"}
!1889 = !DILocation(line: 183, column: 7, scope: !1846)
!1890 = !{i64 659}
!1891 = !{!"659"}
!1892 = !DILocation(line: 183, column: 16, scope: !1846)
!1893 = !{i64 660}
!1894 = !{!"660"}
!1895 = !{i64 661}
!1896 = !{!"661"}
!1897 = !{i64 662}
!1898 = !{!"662"}
!1899 = !DILocation(line: 183, column: 19, scope: !1846)
!1900 = !{i64 663}
!1901 = !{!"663"}
!1902 = !DILocation(line: 183, column: 21, scope: !1846)
!1903 = !{i64 664}
!1904 = !{!"664"}
!1905 = !DILocation(line: 184, column: 27, scope: !1846)
!1906 = !{i64 665}
!1907 = !{!"665"}
!1908 = !DILocation(line: 184, column: 7, scope: !1846)
!1909 = !{i64 666}
!1910 = !{!"666"}
!1911 = !DILocation(line: 184, column: 16, scope: !1846)
!1912 = !{i64 667}
!1913 = !{!"667"}
!1914 = !{i64 668}
!1915 = !{!"668"}
!1916 = !{i64 669}
!1917 = !{!"669"}
!1918 = !DILocation(line: 184, column: 19, scope: !1846)
!1919 = !{i64 670}
!1920 = !{!"670"}
!1921 = !DILocation(line: 184, column: 25, scope: !1846)
!1922 = !{i64 671}
!1923 = !{!"671"}
!1924 = !DILocation(line: 185, column: 8, scope: !1846)
!1925 = !{i64 672}
!1926 = !{!"672"}
!1927 = !{i64 673}
!1928 = !{!"673"}
!1929 = !{i64 674}
!1930 = !{!"674"}
!1931 = !DILocation(line: 186, column: 5, scope: !1846)
!1932 = !{i64 675}
!1933 = !{!"675"}
!1934 = !DILocation(line: 187, column: 3, scope: !1727)
!1935 = !{i64 676}
!1936 = !{!"676"}
!1937 = !{i64 677}
!1938 = !{!"677"}
!1939 = !DILocation(line: 187, column: 3, scope: !1751)
!1940 = !{i64 678}
!1941 = !{!"678"}
!1942 = !DILocation(line: 174, column: 47, scope: !1727)
!1943 = !{i64 679}
!1944 = !{!"679"}
!1945 = !{i64 680}
!1946 = !{!"680"}
!1947 = !{i64 681}
!1948 = !{!"681"}
!1949 = distinct !{!1949, !1740, !1950, !1951}
!1950 = !DILocation(line: 187, column: 3, scope: !1713)
!1951 = !{!"llvm.loop.name", !"RAST2"}
!1952 = !{i64 682}
!1953 = !{!"682"}
!1954 = !DILocation(line: 189, column: 10, scope: !1624)
!1955 = !{i64 683}
!1956 = !{!"683"}
!1957 = !DILocation(line: 189, column: 3, scope: !1624)
!1958 = !{i64 684}
!1959 = !{!"684"}
!1960 = !DILocation(line: 190, column: 1, scope: !1624)
!1961 = !{i64 685}
!1962 = !{!"685"}
!1963 = !{i64 686}
!1964 = !{!"686"}
!1965 = !{i64 687}
!1966 = !{!"687"}
!1967 = !{i64 688}
!1968 = !{!"688"}
!1969 = !{i64 689}
!1970 = !{!"689"}
!1971 = !{i64 690}
!1972 = !{!"690"}
!1973 = !{i64 691}
!1974 = !{!"691"}
!1975 = !{i64 692}
!1976 = !{!"692"}
!1977 = !{i64 693}
!1978 = !{!"693"}
!1979 = !{i64 694}
!1980 = !{!"694"}
!1981 = !{i64 695}
!1982 = !{!"695"}
!1983 = !{i64 696}
!1984 = !{!"696"}
!1985 = !{i64 697}
!1986 = !{!"697"}
!1987 = !{i64 698}
!1988 = !{!"698"}
!1989 = !{i64 699}
!1990 = !{!"699"}
!1991 = !{i64 700}
!1992 = !{!"700"}
!1993 = !DILocalVariable(name: "counter", arg: 1, scope: !2, file: !3, line: 193, type: !6)
!1994 = !DILocation(line: 193, column: 18, scope: !2)
!1995 = !{i64 701}
!1996 = !{!"701"}
!1997 = !{i64 702}
!1998 = !{!"702"}
!1999 = !DILocalVariable(name: "fragments", arg: 2, scope: !2, file: !3, line: 193, type: !7)
!2000 = !DILocation(line: 193, column: 42, scope: !2)
!2001 = !{i64 703}
!2002 = !{!"703"}
!2003 = !{i64 704}
!2004 = !{!"704"}
!2005 = !DILocalVariable(name: "size", arg: 3, scope: !2, file: !3, line: 193, type: !6)
!2006 = !DILocation(line: 193, column: 59, scope: !2)
!2007 = !{i64 705}
!2008 = !{!"705"}
!2009 = !{i64 706}
!2010 = !{!"706"}
!2011 = !DILocalVariable(name: "pixels", arg: 4, scope: !2, file: !3, line: 193, type: !18)
!2012 = !DILocation(line: 193, column: 71, scope: !2)
!2013 = !{i64 707}
!2014 = !{!"707"}
!2015 = !DILocation(line: 197, column: 7, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2, file: !3, line: 197, column: 7)
!2017 = !{i64 708}
!2018 = !{!"708"}
!2019 = !DILocation(line: 197, column: 15, scope: !2016)
!2020 = !{i64 709}
!2021 = !{!"709"}
!2022 = !DILocation(line: 197, column: 7, scope: !2)
!2023 = !{i64 710}
!2024 = !{!"710"}
!2025 = !DILocation(line: 198, column: 3, scope: !2016)
!2026 = !{i64 711}
!2027 = !{!"711"}
!2028 = !DILocation(line: 199, column: 30, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2030, file: !3, line: 199, column: 24)
!2030 = distinct !DILexicalBlock(scope: !2016, file: !3, line: 198, column: 3)
!2031 = !{i64 712}
!2032 = !{!"712"}
!2033 = !{i64 713}
!2034 = !{!"713"}
!2035 = !DILocalVariable(name: "i", scope: !2029, file: !3, line: 199, type: !6)
!2036 = !DILocation(line: 199, column: 34, scope: !2029)
!2037 = !{i64 714}
!2038 = !{!"714"}
!2039 = !{i64 715}
!2040 = !{!"715"}
!2041 = !{i64 716}
!2042 = !{!"716"}
!2043 = !DILocation(line: 199, column: 41, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2029, file: !3, line: 199, column: 24)
!2045 = !{i64 717}
!2046 = !{!"717"}
!2047 = !DILocation(line: 199, column: 43, scope: !2044)
!2048 = !{i64 718}
!2049 = !{!"718"}
!2050 = !DILocation(line: 199, column: 24, scope: !2029)
!2051 = !{i64 719}
!2052 = !{!"719"}
!2053 = !{i64 720}
!2054 = !{!"720"}
!2055 = !DILocation(line: 199, column: 24, scope: !2044)
!2056 = !{i64 721}
!2057 = !{!"721"}
!2058 = !{i64 722}
!2059 = !{!"722"}
!2060 = !{i64 723}
!2061 = !{!"723"}
!2062 = !DILocation(line: 200, column: 5, scope: !2044)
!2063 = !{i64 724}
!2064 = !{!"724"}
!2065 = !DILocation(line: 201, column: 32, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2067, file: !3, line: 201, column: 26)
!2067 = distinct !DILexicalBlock(scope: !2044, file: !3, line: 200, column: 5)
!2068 = !{i64 725}
!2069 = !{!"725"}
!2070 = !{i64 726}
!2071 = !{!"726"}
!2072 = !DILocalVariable(name: "j", scope: !2066, file: !3, line: 201, type: !6)
!2073 = !DILocation(line: 201, column: 36, scope: !2066)
!2074 = !{i64 727}
!2075 = !{!"727"}
!2076 = !{i64 728}
!2077 = !{!"728"}
!2078 = !{i64 729}
!2079 = !{!"729"}
!2080 = !DILocation(line: 201, column: 43, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2066, file: !3, line: 201, column: 26)
!2082 = !{i64 730}
!2083 = !{!"730"}
!2084 = !DILocation(line: 201, column: 45, scope: !2081)
!2085 = !{i64 731}
!2086 = !{!"731"}
!2087 = !DILocation(line: 201, column: 26, scope: !2066)
!2088 = !{i64 732}
!2089 = !{!"732"}
!2090 = !{i64 733}
!2091 = !{!"733"}
!2092 = !DILocation(line: 201, column: 26, scope: !2081)
!2093 = !{i64 734}
!2094 = !{!"734"}
!2095 = !{i64 735}
!2096 = !{!"735"}
!2097 = !{i64 736}
!2098 = !{!"736"}
!2099 = !DILocation(line: 203, column: 18, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2081, file: !3, line: 202, column: 7)
!2101 = !{i64 737}
!2102 = !{!"737"}
!2103 = !DILocation(line: 203, column: 9, scope: !2100)
!2104 = !{i64 738}
!2105 = !{!"738"}
!2106 = !{i64 739}
!2107 = !{!"739"}
!2108 = !DILocation(line: 203, column: 21, scope: !2100)
!2109 = !{i64 740}
!2110 = !{!"740"}
!2111 = !{i64 741}
!2112 = !{!"741"}
!2113 = !{i64 742}
!2114 = !{!"742"}
!2115 = !DILocation(line: 203, column: 24, scope: !2100)
!2116 = !{i64 743}
!2117 = !{!"743"}
!2118 = !DILocation(line: 204, column: 7, scope: !2100)
!2119 = !{i64 744}
!2120 = !{!"744"}
!2121 = !DILocation(line: 201, column: 56, scope: !2081)
!2122 = !{i64 745}
!2123 = !{!"745"}
!2124 = !{i64 746}
!2125 = !{!"746"}
!2126 = !{i64 747}
!2127 = !{!"747"}
!2128 = distinct !{!2128, !2087, !2129, !2130}
!2129 = !DILocation(line: 204, column: 7, scope: !2066)
!2130 = !{!"llvm.loop.name", !"ZCULLING_INIT_COL"}
!2131 = !{i64 748}
!2132 = !{!"748"}
!2133 = !DILocation(line: 205, column: 5, scope: !2067)
!2134 = !{i64 749}
!2135 = !{!"749"}
!2136 = !DILocation(line: 199, column: 54, scope: !2044)
!2137 = !{i64 750}
!2138 = !{!"750"}
!2139 = !{i64 751}
!2140 = !{!"751"}
!2141 = !{i64 752}
!2142 = !{!"752"}
!2143 = distinct !{!2143, !2050, !2144, !2145}
!2144 = !DILocation(line: 205, column: 5, scope: !2029)
!2145 = !{!"llvm.loop.name", !"ZCULLING_INIT_ROW"}
!2146 = !{i64 753}
!2147 = !{!"753"}
!2148 = !DILocation(line: 206, column: 3, scope: !2030)
!2149 = !{i64 754}
!2150 = !{!"754"}
!2151 = !DILocation(line: 209, column: 3, scope: !2)
!2152 = !{i64 755}
!2153 = !{!"755"}
!2154 = !{i64 756}
!2155 = !{!"756"}
!2156 = !DILocalVariable(name: "pixel_cntr", scope: !2, file: !3, line: 209, type: !6)
!2157 = !DILocation(line: 209, column: 7, scope: !2)
!2158 = !{i64 757}
!2159 = !{!"757"}
!2160 = !{i64 758}
!2161 = !{!"758"}
!2162 = !{i64 759}
!2163 = !{!"759"}
!2164 = !DILocation(line: 212, column: 19, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2, file: !3, line: 212, column: 13)
!2166 = !{i64 760}
!2167 = !{!"760"}
!2168 = !{i64 761}
!2169 = !{!"761"}
!2170 = !DILocalVariable(name: "n", scope: !2165, file: !3, line: 212, type: !6)
!2171 = !DILocation(line: 212, column: 23, scope: !2165)
!2172 = !{i64 762}
!2173 = !{!"762"}
!2174 = !{i64 763}
!2175 = !{!"763"}
!2176 = !{i64 764}
!2177 = !{!"764"}
!2178 = !DILocation(line: 212, column: 30, scope: !2179)
!2179 = distinct !DILexicalBlock(scope: !2165, file: !3, line: 212, column: 13)
!2180 = !{i64 765}
!2181 = !{!"765"}
!2182 = !DILocation(line: 212, column: 34, scope: !2179)
!2183 = !{i64 766}
!2184 = !{!"766"}
!2185 = !DILocation(line: 212, column: 32, scope: !2179)
!2186 = !{i64 767}
!2187 = !{!"767"}
!2188 = !DILocation(line: 212, column: 13, scope: !2165)
!2189 = !{i64 768}
!2190 = !{!"768"}
!2191 = !{i64 769}
!2192 = !{!"769"}
!2193 = !DILocation(line: 212, column: 13, scope: !2179)
!2194 = !{i64 770}
!2195 = !{!"770"}
!2196 = !{i64 771}
!2197 = !{!"771"}
!2198 = !{i64 772}
!2199 = !{!"772"}
!2200 = !DILocation(line: 214, column: 9, scope: !2201)
!2201 = distinct !DILexicalBlock(scope: !2202, file: !3, line: 214, column: 9)
!2202 = distinct !DILexicalBlock(scope: !2179, file: !3, line: 213, column: 3)
!2203 = !{i64 773}
!2204 = !{!"773"}
!2205 = !DILocation(line: 214, column: 19, scope: !2201)
!2206 = !{i64 774}
!2207 = !{!"774"}
!2208 = !{i64 775}
!2209 = !{!"775"}
!2210 = !{i64 776}
!2211 = !{!"776"}
!2212 = !DILocation(line: 214, column: 22, scope: !2201)
!2213 = !{i64 777}
!2214 = !{!"777"}
!2215 = !{i64 778}
!2216 = !{!"778"}
!2217 = !{i64 779}
!2218 = !{!"779"}
!2219 = !DILocation(line: 214, column: 35, scope: !2201)
!2220 = !{i64 780}
!2221 = !{!"780"}
!2222 = !DILocation(line: 214, column: 45, scope: !2201)
!2223 = !{i64 781}
!2224 = !{!"781"}
!2225 = !{i64 782}
!2226 = !{!"782"}
!2227 = !{i64 783}
!2228 = !{!"783"}
!2229 = !DILocation(line: 214, column: 48, scope: !2201)
!2230 = !{i64 784}
!2231 = !{!"784"}
!2232 = !{i64 785}
!2233 = !{!"785"}
!2234 = !DILocation(line: 214, column: 26, scope: !2201)
!2235 = !{i64 786}
!2236 = !{!"786"}
!2237 = !{i64 787}
!2238 = !{!"787"}
!2239 = !DILocation(line: 214, column: 51, scope: !2201)
!2240 = !{i64 788}
!2241 = !{!"788"}
!2242 = !DILocation(line: 214, column: 61, scope: !2201)
!2243 = !{i64 789}
!2244 = !{!"789"}
!2245 = !{i64 790}
!2246 = !{!"790"}
!2247 = !{i64 791}
!2248 = !{!"791"}
!2249 = !DILocation(line: 214, column: 64, scope: !2201)
!2250 = !{i64 792}
!2251 = !{!"792"}
!2252 = !{i64 793}
!2253 = !{!"793"}
!2254 = !{i64 794}
!2255 = !{!"794"}
!2256 = !{i64 795}
!2257 = !{!"795"}
!2258 = !{i64 796}
!2259 = !{!"796"}
!2260 = !{i64 797}
!2261 = !{!"797"}
!2262 = !DILocation(line: 214, column: 24, scope: !2201)
!2263 = !{i64 798}
!2264 = !{!"798"}
!2265 = !DILocation(line: 214, column: 9, scope: !2202)
!2266 = !{i64 799}
!2267 = !{!"799"}
!2268 = !DILocation(line: 216, column: 30, scope: !2269)
!2269 = distinct !DILexicalBlock(scope: !2201, file: !3, line: 215, column: 5)
!2270 = !{i64 800}
!2271 = !{!"800"}
!2272 = !DILocation(line: 216, column: 40, scope: !2269)
!2273 = !{i64 801}
!2274 = !{!"801"}
!2275 = !{i64 802}
!2276 = !{!"802"}
!2277 = !{i64 803}
!2278 = !{!"803"}
!2279 = !DILocation(line: 216, column: 43, scope: !2269)
!2280 = !{i64 804}
!2281 = !{!"804"}
!2282 = !{i64 805}
!2283 = !{!"805"}
!2284 = !DILocation(line: 216, column: 7, scope: !2269)
!2285 = !{i64 806}
!2286 = !{!"806"}
!2287 = !DILocation(line: 216, column: 14, scope: !2269)
!2288 = !{i64 807}
!2289 = !{!"807"}
!2290 = !{i64 808}
!2291 = !{!"808"}
!2292 = !{i64 809}
!2293 = !{!"809"}
!2294 = !DILocation(line: 216, column: 26, scope: !2269)
!2295 = !{i64 810}
!2296 = !{!"810"}
!2297 = !DILocation(line: 216, column: 28, scope: !2269)
!2298 = !{i64 811}
!2299 = !{!"811"}
!2300 = !DILocation(line: 217, column: 30, scope: !2269)
!2301 = !{i64 812}
!2302 = !{!"812"}
!2303 = !DILocation(line: 217, column: 40, scope: !2269)
!2304 = !{i64 813}
!2305 = !{!"813"}
!2306 = !{i64 814}
!2307 = !{!"814"}
!2308 = !{i64 815}
!2309 = !{!"815"}
!2310 = !DILocation(line: 217, column: 43, scope: !2269)
!2311 = !{i64 816}
!2312 = !{!"816"}
!2313 = !{i64 817}
!2314 = !{!"817"}
!2315 = !DILocation(line: 217, column: 7, scope: !2269)
!2316 = !{i64 818}
!2317 = !{!"818"}
!2318 = !DILocation(line: 217, column: 14, scope: !2269)
!2319 = !{i64 819}
!2320 = !{!"819"}
!2321 = !{i64 820}
!2322 = !{!"820"}
!2323 = !{i64 821}
!2324 = !{!"821"}
!2325 = !DILocation(line: 217, column: 26, scope: !2269)
!2326 = !{i64 822}
!2327 = !{!"822"}
!2328 = !DILocation(line: 217, column: 28, scope: !2269)
!2329 = !{i64 823}
!2330 = !{!"823"}
!2331 = !DILocation(line: 218, column: 34, scope: !2269)
!2332 = !{i64 824}
!2333 = !{!"824"}
!2334 = !DILocation(line: 218, column: 44, scope: !2269)
!2335 = !{i64 825}
!2336 = !{!"825"}
!2337 = !{i64 826}
!2338 = !{!"826"}
!2339 = !{i64 827}
!2340 = !{!"827"}
!2341 = !DILocation(line: 218, column: 47, scope: !2269)
!2342 = !{i64 828}
!2343 = !{!"828"}
!2344 = !{i64 829}
!2345 = !{!"829"}
!2346 = !DILocation(line: 218, column: 7, scope: !2269)
!2347 = !{i64 830}
!2348 = !{!"830"}
!2349 = !DILocation(line: 218, column: 14, scope: !2269)
!2350 = !{i64 831}
!2351 = !{!"831"}
!2352 = !{i64 832}
!2353 = !{!"832"}
!2354 = !{i64 833}
!2355 = !{!"833"}
!2356 = !DILocation(line: 218, column: 26, scope: !2269)
!2357 = !{i64 834}
!2358 = !{!"834"}
!2359 = !DILocation(line: 218, column: 32, scope: !2269)
!2360 = !{i64 835}
!2361 = !{!"835"}
!2362 = !DILocation(line: 219, column: 17, scope: !2269)
!2363 = !{i64 836}
!2364 = !{!"836"}
!2365 = !{i64 837}
!2366 = !{!"837"}
!2367 = !{i64 838}
!2368 = !{!"838"}
!2369 = !DILocation(line: 220, column: 50, scope: !2269)
!2370 = !{i64 839}
!2371 = !{!"839"}
!2372 = !DILocation(line: 220, column: 60, scope: !2269)
!2373 = !{i64 840}
!2374 = !{!"840"}
!2375 = !{i64 841}
!2376 = !{!"841"}
!2377 = !{i64 842}
!2378 = !{!"842"}
!2379 = !DILocation(line: 220, column: 63, scope: !2269)
!2380 = !{i64 843}
!2381 = !{!"843"}
!2382 = !{i64 844}
!2383 = !{!"844"}
!2384 = !DILocation(line: 220, column: 16, scope: !2269)
!2385 = !{i64 845}
!2386 = !{!"845"}
!2387 = !DILocation(line: 220, column: 26, scope: !2269)
!2388 = !{i64 846}
!2389 = !{!"846"}
!2390 = !{i64 847}
!2391 = !{!"847"}
!2392 = !{i64 848}
!2393 = !{!"848"}
!2394 = !DILocation(line: 220, column: 29, scope: !2269)
!2395 = !{i64 849}
!2396 = !{!"849"}
!2397 = !{i64 850}
!2398 = !{!"850"}
!2399 = !DILocation(line: 220, column: 7, scope: !2269)
!2400 = !{i64 851}
!2401 = !{!"851"}
!2402 = !{i64 852}
!2403 = !{!"852"}
!2404 = !DILocation(line: 220, column: 32, scope: !2269)
!2405 = !{i64 853}
!2406 = !{!"853"}
!2407 = !DILocation(line: 220, column: 42, scope: !2269)
!2408 = !{i64 854}
!2409 = !{!"854"}
!2410 = !{i64 855}
!2411 = !{!"855"}
!2412 = !{i64 856}
!2413 = !{!"856"}
!2414 = !DILocation(line: 220, column: 45, scope: !2269)
!2415 = !{i64 857}
!2416 = !{!"857"}
!2417 = !{i64 858}
!2418 = !{!"858"}
!2419 = !{i64 859}
!2420 = !{!"859"}
!2421 = !{i64 860}
!2422 = !{!"860"}
!2423 = !DILocation(line: 220, column: 48, scope: !2269)
!2424 = !{i64 861}
!2425 = !{!"861"}
!2426 = !DILocation(line: 221, column: 5, scope: !2269)
!2427 = !{i64 862}
!2428 = !{!"862"}
!2429 = !DILocation(line: 222, column: 3, scope: !2202)
!2430 = !{i64 863}
!2431 = !{!"863"}
!2432 = !DILocation(line: 212, column: 42, scope: !2179)
!2433 = !{i64 864}
!2434 = !{!"864"}
!2435 = !{i64 865}
!2436 = !{!"865"}
!2437 = !{i64 866}
!2438 = !{!"866"}
!2439 = distinct !{!2439, !2188, !2440, !2441}
!2440 = !DILocation(line: 222, column: 3, scope: !2165)
!2441 = !{!"llvm.loop.name", !"ZCULLING"}
!2442 = !{i64 867}
!2443 = !{!"867"}
!2444 = !DILocation(line: 224, column: 10, scope: !2)
!2445 = !{i64 868}
!2446 = !{!"868"}
!2447 = !{i64 869}
!2448 = !{!"869"}
!2449 = !DILocation(line: 225, column: 1, scope: !2)
!2450 = !{i64 870}
!2451 = !{!"870"}
!2452 = !{i64 871}
!2453 = !{!"871"}
!2454 = !DILocation(line: 224, column: 3, scope: !2)
!2455 = !{i64 872}
!2456 = !{!"872"}
!2457 = distinct !DISubprogram(name: "coloringFB", linkageName: "_Z10coloringFBiiP5PixelPA256_h", scope: !3, file: !3, line: 228, type: !2458, isLocal: false, isDefinition: true, scopeLine: 229, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!2458 = !DISubroutineType(types: !2459)
!2459 = !{null, !6, !6, !18, !2460}
!2460 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2461, size: 64)
!2461 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !2462)
!2462 = !{!38}
!2463 = !{i64 873}
!2464 = !{!"873"}
!2465 = !{i64 874}
!2466 = !{!"874"}
!2467 = !{i64 875}
!2468 = !{!"875"}
!2469 = !{i64 876}
!2470 = !{!"876"}
!2471 = !{i64 877}
!2472 = !{!"877"}
!2473 = !{i64 878}
!2474 = !{!"878"}
!2475 = !{i64 879}
!2476 = !{!"879"}
!2477 = !{i64 880}
!2478 = !{!"880"}
!2479 = !{i64 881}
!2480 = !{!"881"}
!2481 = !DILocalVariable(name: "counter", arg: 1, scope: !2457, file: !3, line: 228, type: !6)
!2482 = !DILocation(line: 228, column: 21, scope: !2457)
!2483 = !{i64 882}
!2484 = !{!"882"}
!2485 = !{i64 883}
!2486 = !{!"883"}
!2487 = !DILocalVariable(name: "size_pixels", arg: 2, scope: !2457, file: !3, line: 228, type: !6)
!2488 = !DILocation(line: 228, column: 34, scope: !2457)
!2489 = !{i64 884}
!2490 = !{!"884"}
!2491 = !{i64 885}
!2492 = !{!"885"}
!2493 = !DILocalVariable(name: "pixels", arg: 3, scope: !2457, file: !3, line: 228, type: !18)
!2494 = !DILocation(line: 228, column: 53, scope: !2457)
!2495 = !{i64 886}
!2496 = !{!"886"}
!2497 = !{i64 887}
!2498 = !{!"887"}
!2499 = !DILocalVariable(name: "frame_buffer", arg: 4, scope: !2457, file: !3, line: 228, type: !2460)
!2500 = !DILocation(line: 228, column: 68, scope: !2457)
!2501 = !{i64 888}
!2502 = !{!"888"}
!2503 = !DILocation(line: 230, column: 8, scope: !2504)
!2504 = distinct !DILexicalBlock(scope: !2457, file: !3, line: 230, column: 8)
!2505 = !{i64 889}
!2506 = !{!"889"}
!2507 = !DILocation(line: 230, column: 16, scope: !2504)
!2508 = !{i64 890}
!2509 = !{!"890"}
!2510 = !DILocation(line: 230, column: 8, scope: !2457)
!2511 = !{i64 891}
!2512 = !{!"891"}
!2513 = !DILocation(line: 231, column: 3, scope: !2504)
!2514 = !{i64 892}
!2515 = !{!"892"}
!2516 = !DILocation(line: 233, column: 33, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2518, file: !3, line: 233, column: 27)
!2518 = distinct !DILexicalBlock(scope: !2504, file: !3, line: 231, column: 3)
!2519 = !{i64 893}
!2520 = !{!"893"}
!2521 = !{i64 894}
!2522 = !{!"894"}
!2523 = !DILocalVariable(name: "i", scope: !2517, file: !3, line: 233, type: !6)
!2524 = !DILocation(line: 233, column: 37, scope: !2517)
!2525 = !{i64 895}
!2526 = !{!"895"}
!2527 = !{i64 896}
!2528 = !{!"896"}
!2529 = !{i64 897}
!2530 = !{!"897"}
!2531 = !DILocation(line: 233, column: 44, scope: !2532)
!2532 = distinct !DILexicalBlock(scope: !2517, file: !3, line: 233, column: 27)
!2533 = !{i64 898}
!2534 = !{!"898"}
!2535 = !DILocation(line: 233, column: 46, scope: !2532)
!2536 = !{i64 899}
!2537 = !{!"899"}
!2538 = !DILocation(line: 233, column: 27, scope: !2517)
!2539 = !{i64 900}
!2540 = !{!"900"}
!2541 = !{i64 901}
!2542 = !{!"901"}
!2543 = !DILocation(line: 233, column: 27, scope: !2532)
!2544 = !{i64 902}
!2545 = !{!"902"}
!2546 = !{i64 903}
!2547 = !{!"903"}
!2548 = !{i64 904}
!2549 = !{!"904"}
!2550 = !DILocation(line: 234, column: 5, scope: !2532)
!2551 = !{i64 905}
!2552 = !{!"905"}
!2553 = !DILocation(line: 235, column: 35, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2555, file: !3, line: 235, column: 29)
!2555 = distinct !DILexicalBlock(scope: !2532, file: !3, line: 234, column: 5)
!2556 = !{i64 906}
!2557 = !{!"906"}
!2558 = !{i64 907}
!2559 = !{!"907"}
!2560 = !DILocalVariable(name: "j", scope: !2554, file: !3, line: 235, type: !6)
!2561 = !DILocation(line: 235, column: 39, scope: !2554)
!2562 = !{i64 908}
!2563 = !{!"908"}
!2564 = !{i64 909}
!2565 = !{!"909"}
!2566 = !{i64 910}
!2567 = !{!"910"}
!2568 = !DILocation(line: 235, column: 46, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2554, file: !3, line: 235, column: 29)
!2570 = !{i64 911}
!2571 = !{!"911"}
!2572 = !DILocation(line: 235, column: 48, scope: !2569)
!2573 = !{i64 912}
!2574 = !{!"912"}
!2575 = !DILocation(line: 235, column: 29, scope: !2554)
!2576 = !{i64 913}
!2577 = !{!"913"}
!2578 = !{i64 914}
!2579 = !{!"914"}
!2580 = !DILocation(line: 235, column: 29, scope: !2569)
!2581 = !{i64 915}
!2582 = !{!"915"}
!2583 = !{i64 916}
!2584 = !{!"916"}
!2585 = !{i64 917}
!2586 = !{!"917"}
!2587 = !DILocation(line: 236, column: 9, scope: !2569)
!2588 = !{i64 918}
!2589 = !{!"918"}
!2590 = !DILocation(line: 236, column: 22, scope: !2569)
!2591 = !{i64 919}
!2592 = !{!"919"}
!2593 = !{i64 920}
!2594 = !{!"920"}
!2595 = !{i64 921}
!2596 = !{!"921"}
!2597 = !DILocation(line: 236, column: 25, scope: !2569)
!2598 = !{i64 922}
!2599 = !{!"922"}
!2600 = !{i64 923}
!2601 = !{!"923"}
!2602 = !{i64 924}
!2603 = !{!"924"}
!2604 = !DILocation(line: 236, column: 28, scope: !2569)
!2605 = !{i64 925}
!2606 = !{!"925"}
!2607 = !{i64 926}
!2608 = !{!"926"}
!2609 = !DILocation(line: 235, column: 59, scope: !2569)
!2610 = !{i64 927}
!2611 = !{!"927"}
!2612 = !{i64 928}
!2613 = !{!"928"}
!2614 = !{i64 929}
!2615 = !{!"929"}
!2616 = distinct !{!2616, !2575, !2617, !2618}
!2617 = !DILocation(line: 236, column: 30, scope: !2554)
!2618 = !{!"llvm.loop.name", !"COLORING_FB_INIT_COL"}
!2619 = !{i64 930}
!2620 = !{!"930"}
!2621 = !DILocation(line: 237, column: 5, scope: !2555)
!2622 = !{i64 931}
!2623 = !{!"931"}
!2624 = !DILocation(line: 233, column: 57, scope: !2532)
!2625 = !{i64 932}
!2626 = !{!"932"}
!2627 = !{i64 933}
!2628 = !{!"933"}
!2629 = !{i64 934}
!2630 = !{!"934"}
!2631 = distinct !{!2631, !2538, !2632, !2633}
!2632 = !DILocation(line: 237, column: 5, scope: !2517)
!2633 = !{!"llvm.loop.name", !"COLORING_FB_INIT_ROW"}
!2634 = !{i64 935}
!2635 = !{!"935"}
!2636 = !DILocation(line: 238, column: 3, scope: !2518)
!2637 = !{i64 936}
!2638 = !{!"936"}
!2639 = !DILocation(line: 230, column: 19, scope: !2504)
!2640 = !{i64 937}
!2641 = !{!"937"}
!2642 = !DILocation(line: 241, column: 22, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2457, file: !3, line: 241, column: 16)
!2644 = !{i64 938}
!2645 = !{!"938"}
!2646 = !{i64 939}
!2647 = !{!"939"}
!2648 = !DILocalVariable(name: "i", scope: !2643, file: !3, line: 241, type: !6)
!2649 = !DILocation(line: 241, column: 26, scope: !2643)
!2650 = !{i64 940}
!2651 = !{!"940"}
!2652 = !{i64 941}
!2653 = !{!"941"}
!2654 = !{i64 942}
!2655 = !{!"942"}
!2656 = !DILocation(line: 241, column: 33, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2643, file: !3, line: 241, column: 16)
!2658 = !{i64 943}
!2659 = !{!"943"}
!2660 = !DILocation(line: 241, column: 37, scope: !2657)
!2661 = !{i64 944}
!2662 = !{!"944"}
!2663 = !DILocation(line: 241, column: 35, scope: !2657)
!2664 = !{i64 945}
!2665 = !{!"945"}
!2666 = !DILocation(line: 241, column: 16, scope: !2643)
!2667 = !{i64 946}
!2668 = !{!"946"}
!2669 = !{i64 947}
!2670 = !{!"947"}
!2671 = !DILocation(line: 241, column: 16, scope: !2657)
!2672 = !{i64 948}
!2673 = !{!"948"}
!2674 = !{i64 949}
!2675 = !{!"949"}
!2676 = !{i64 950}
!2677 = !{!"950"}
!2678 = !DILocation(line: 242, column: 50, scope: !2657)
!2679 = !{i64 951}
!2680 = !{!"951"}
!2681 = !DILocation(line: 242, column: 57, scope: !2657)
!2682 = !{i64 952}
!2683 = !{!"952"}
!2684 = !{i64 953}
!2685 = !{!"953"}
!2686 = !{i64 954}
!2687 = !{!"954"}
!2688 = !DILocation(line: 242, column: 60, scope: !2657)
!2689 = !{i64 955}
!2690 = !{!"955"}
!2691 = !{i64 956}
!2692 = !{!"956"}
!2693 = !DILocation(line: 242, column: 5, scope: !2657)
!2694 = !{i64 957}
!2695 = !{!"957"}
!2696 = !DILocation(line: 242, column: 19, scope: !2657)
!2697 = !{i64 958}
!2698 = !{!"958"}
!2699 = !DILocation(line: 242, column: 26, scope: !2657)
!2700 = !{i64 959}
!2701 = !{!"959"}
!2702 = !{i64 960}
!2703 = !{!"960"}
!2704 = !{i64 961}
!2705 = !{!"961"}
!2706 = !DILocation(line: 242, column: 29, scope: !2657)
!2707 = !{i64 962}
!2708 = !{!"962"}
!2709 = !{i64 963}
!2710 = !{!"963"}
!2711 = !{i64 964}
!2712 = !{!"964"}
!2713 = !{i64 965}
!2714 = !{!"965"}
!2715 = !DILocation(line: 242, column: 34, scope: !2657)
!2716 = !{i64 966}
!2717 = !{!"966"}
!2718 = !DILocation(line: 242, column: 41, scope: !2657)
!2719 = !{i64 967}
!2720 = !{!"967"}
!2721 = !{i64 968}
!2722 = !{!"968"}
!2723 = !{i64 969}
!2724 = !{!"969"}
!2725 = !DILocation(line: 242, column: 44, scope: !2657)
!2726 = !{i64 970}
!2727 = !{!"970"}
!2728 = !{i64 971}
!2729 = !{!"971"}
!2730 = !{i64 972}
!2731 = !{!"972"}
!2732 = !{i64 973}
!2733 = !{!"973"}
!2734 = !DILocation(line: 242, column: 48, scope: !2657)
!2735 = !{i64 974}
!2736 = !{!"974"}
!2737 = !{i64 975}
!2738 = !{!"975"}
!2739 = !DILocation(line: 241, column: 52, scope: !2657)
!2740 = !{i64 976}
!2741 = !{!"976"}
!2742 = !{i64 977}
!2743 = !{!"977"}
!2744 = !{i64 978}
!2745 = !{!"978"}
!2746 = distinct !{!2746, !2666, !2747, !2748}
!2747 = !DILocation(line: 242, column: 60, scope: !2643)
!2748 = !{!"llvm.loop.name", !"COLORING_FB"}
!2749 = !{i64 979}
!2750 = !{!"979"}
!2751 = !DILocation(line: 243, column: 1, scope: !2457)
!2752 = !{i64 980}
!2753 = !{!"980"}
!2754 = distinct !DISubprogram(name: "rendering", linkageName: "_Z9renderingP11Triangle_3DPA256_h", scope: !3, file: !3, line: 246, type: !2755, isLocal: false, isDefinition: true, scopeLine: 247, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!2755 = !DISubroutineType(types: !2756)
!2756 = !{null, !2757, !2460}
!2757 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !872, size: 64)
!2758 = !{!2759}
!2759 = !{!"fpga.top", !"user", !2760}
!2760 = !DILocation(line: 246, column: 16, scope: !2754)
!2761 = !{i64 981}
!2762 = !{!"981"}
!2763 = !{i64 982}
!2764 = !{!"982"}
!2765 = !{i64 983}
!2766 = !{!"983"}
!2767 = !{i64 984}
!2768 = !{!"984"}
!2769 = !{i64 985}
!2770 = !{!"985"}
!2771 = !{i64 986}
!2772 = !{!"986"}
!2773 = !{i64 987}
!2774 = !{!"987"}
!2775 = !{i64 988}
!2776 = !{!"988"}
!2777 = !{i64 989}
!2778 = !{!"989"}
!2779 = !{i64 990}
!2780 = !{!"990"}
!2781 = !{i64 991}
!2782 = !{!"991"}
!2783 = !{i64 992}
!2784 = !{!"992"}
!2785 = !{i64 993}
!2786 = !{!"993"}
!2787 = !{i64 994}
!2788 = !{!"994"}
!2789 = !{i64 995}
!2790 = !{!"995"}
!2791 = !{i64 996}
!2792 = !{!"996"}
!2793 = !DILocalVariable(name: "triangle_3ds", arg: 1, scope: !2754, file: !3, line: 246, type: !2757)
!2794 = !DILocation(line: 246, column: 72, scope: !2754)
!2795 = !{i64 997}
!2796 = !{!"997"}
!2797 = !{i64 998}
!2798 = !{!"998"}
!2799 = !DILocalVariable(name: "output", arg: 2, scope: !2754, file: !3, line: 246, type: !2460)
!2800 = !DILocation(line: 246, column: 103, scope: !2754)
!2801 = !{i64 999}
!2802 = !{!"999"}
!2803 = !DILocation(line: 249, column: 3, scope: !2754)
!2804 = !{i64 1000}
!2805 = !{!"1000"}
!2806 = !{i64 1001}
!2807 = !{!"1001"}
!2808 = !DILocalVariable(name: "triangle_2ds", scope: !2754, file: !3, line: 249, type: !47)
!2809 = !DILocation(line: 249, column: 15, scope: !2754)
!2810 = !{i64 1002}
!2811 = !{!"1002"}
!2812 = !DILocation(line: 251, column: 3, scope: !2754)
!2813 = !{i64 1003}
!2814 = !{!"1003"}
!2815 = !{i64 1004}
!2816 = !{!"1004"}
!2817 = !DILocalVariable(name: "angle", scope: !2754, file: !3, line: 251, type: !6)
!2818 = !DILocation(line: 251, column: 7, scope: !2754)
!2819 = !{i64 1005}
!2820 = !{!"1005"}
!2821 = !{i64 1006}
!2822 = !{!"1006"}
!2823 = !DILocation(line: 254, column: 3, scope: !2754)
!2824 = !{i64 1007}
!2825 = !{!"1007"}
!2826 = !{i64 1008}
!2827 = !{!"1008"}
!2828 = !DILocalVariable(name: "max_min", scope: !2754, file: !3, line: 254, type: !2829)
!2829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 40, elements: !2830)
!2830 = !{!2831}
!2831 = !DISubrange(count: 5)
!2832 = !DILocation(line: 254, column: 8, scope: !2754)
!2833 = !{i64 1009}
!2834 = !{!"1009"}
!2835 = !DILocation(line: 255, column: 3, scope: !2754)
!2836 = !{i64 1010}
!2837 = !{!"1010"}
!2838 = !{i64 1011}
!2839 = !{!"1011"}
!2840 = !DILocalVariable(name: "max_index", scope: !2754, file: !3, line: 255, type: !2841)
!2841 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !2842)
!2842 = !{!2843}
!2843 = !DISubrange(count: 1)
!2844 = !DILocation(line: 255, column: 7, scope: !2754)
!2845 = !{i64 1012}
!2846 = !{!"1012"}
!2847 = !DILocation(line: 258, column: 3, scope: !2754)
!2848 = !{i64 1013}
!2849 = !{!"1013"}
!2850 = !{i64 1014}
!2851 = !{!"1014"}
!2852 = !DILocalVariable(name: "fragment", scope: !2754, file: !3, line: 258, type: !2853)
!2853 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 16000, elements: !2854)
!2854 = !{!2855}
!2855 = !DISubrange(count: 500)
!2856 = !DILocation(line: 258, column: 18, scope: !2754)
!2857 = !{i64 1015}
!2858 = !{!"1015"}
!2859 = !DILocation(line: 261, column: 3, scope: !2754)
!2860 = !{i64 1016}
!2861 = !{!"1016"}
!2862 = !{i64 1017}
!2863 = !{!"1017"}
!2864 = !DILocalVariable(name: "pixels", scope: !2754, file: !3, line: 261, type: !2865)
!2865 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 12000, elements: !2854)
!2866 = !DILocation(line: 261, column: 9, scope: !2754)
!2867 = !{i64 1018}
!2868 = !{!"1018"}
!2869 = !{i64 1019}
!2870 = !{!"1019"}
!2871 = !DILocation(line: 264, column: 19, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2754, file: !3, line: 264, column: 14)
!2873 = !{i64 1020}
!2874 = !{!"1020"}
!2875 = !{i64 1021}
!2876 = !{!"1021"}
!2877 = !DILocalVariable(name: "i", scope: !2872, file: !3, line: 264, type: !6)
!2878 = !DILocation(line: 264, column: 23, scope: !2872)
!2879 = !{i64 1022}
!2880 = !{!"1022"}
!2881 = !{i64 1023}
!2882 = !{!"1023"}
!2883 = !{i64 1024}
!2884 = !{!"1024"}
!2885 = !DILocation(line: 264, column: 30, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2872, file: !3, line: 264, column: 14)
!2887 = !{i64 1025}
!2888 = !{!"1025"}
!2889 = !DILocation(line: 264, column: 32, scope: !2886)
!2890 = !{i64 1026}
!2891 = !{!"1026"}
!2892 = !DILocation(line: 264, column: 14, scope: !2872)
!2893 = !{i64 1027}
!2894 = !{!"1027"}
!2895 = !DILocation(line: 264, column: 14, scope: !2886)
!2896 = !{i64 1028}
!2897 = !{!"1028"}
!2898 = !{i64 1029}
!2899 = !{!"1029"}
!2900 = !{i64 1030}
!2901 = !{!"1030"}
!2902 = !DILocation(line: 267, column: 17, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2886, file: !3, line: 265, column: 3)
!2904 = !{i64 1031}
!2905 = !{!"1031"}
!2906 = !DILocation(line: 267, column: 30, scope: !2903)
!2907 = !{i64 1032}
!2908 = !{!"1032"}
!2909 = !{i64 1033}
!2910 = !{!"1033"}
!2911 = !{i64 1034}
!2912 = !{!"1034"}
!2913 = !{i64 1035}
!2914 = !{!"1035"}
!2915 = !{i64 1036}
!2916 = !{!"1036"}
!2917 = !DILocation(line: 267, column: 49, scope: !2903)
!2918 = !{i64 1037}
!2919 = !{!"1037"}
!2920 = !DILocation(line: 267, column: 5, scope: !2903)
!2921 = !{i64 1038}
!2922 = !{!"1038"}
!2923 = !DILocation(line: 268, column: 5, scope: !2903)
!2924 = !{i64 1039}
!2925 = !{!"1039"}
!2926 = !{i64 1040}
!2927 = !{!"1040"}
!2928 = !DILocalVariable(name: "flag", scope: !2903, file: !3, line: 268, type: !291)
!2929 = !DILocation(line: 268, column: 10, scope: !2903)
!2930 = !{i64 1041}
!2931 = !{!"1041"}
!2932 = !DILocation(line: 268, column: 32, scope: !2903)
!2933 = !{i64 1042}
!2934 = !{!"1042"}
!2935 = !{i64 1043}
!2936 = !{!"1043"}
!2937 = !DILocation(line: 268, column: 46, scope: !2903)
!2938 = !{i64 1044}
!2939 = !{!"1044"}
!2940 = !DILocation(line: 268, column: 55, scope: !2903)
!2941 = !{i64 1045}
!2942 = !{!"1045"}
!2943 = !DILocation(line: 268, column: 17, scope: !2903)
!2944 = !{i64 1046}
!2945 = !{!"1046"}
!2946 = !{i64 1047}
!2947 = !{!"1047"}
!2948 = !DILocation(line: 269, column: 5, scope: !2903)
!2949 = !{i64 1048}
!2950 = !{!"1048"}
!2951 = !{i64 1049}
!2952 = !{!"1049"}
!2953 = !DILocalVariable(name: "size_fragment", scope: !2903, file: !3, line: 269, type: !6)
!2954 = !DILocation(line: 269, column: 9, scope: !2903)
!2955 = !{i64 1050}
!2956 = !{!"1050"}
!2957 = !DILocation(line: 269, column: 41, scope: !2903)
!2958 = !{i64 1051}
!2959 = !{!"1051"}
!2960 = !DILocation(line: 269, column: 47, scope: !2903)
!2961 = !{i64 1052}
!2962 = !{!"1052"}
!2963 = !DILocation(line: 269, column: 56, scope: !2903)
!2964 = !{i64 1053}
!2965 = !{!"1053"}
!2966 = !DILocation(line: 269, column: 67, scope: !2903)
!2967 = !{i64 1054}
!2968 = !{!"1054"}
!2969 = !{i64 1055}
!2970 = !{!"1055"}
!2971 = !DILocation(line: 269, column: 81, scope: !2903)
!2972 = !{i64 1056}
!2973 = !{!"1056"}
!2974 = !DILocation(line: 269, column: 25, scope: !2903)
!2975 = !{i64 1057}
!2976 = !{!"1057"}
!2977 = !{i64 1058}
!2978 = !{!"1058"}
!2979 = !DILocation(line: 270, column: 5, scope: !2903)
!2980 = !{i64 1059}
!2981 = !{!"1059"}
!2982 = !{i64 1060}
!2983 = !{!"1060"}
!2984 = !DILocalVariable(name: "size_pixels", scope: !2903, file: !3, line: 270, type: !6)
!2985 = !DILocation(line: 270, column: 9, scope: !2903)
!2986 = !{i64 1061}
!2987 = !{!"1061"}
!2988 = !DILocation(line: 270, column: 33, scope: !2903)
!2989 = !{i64 1062}
!2990 = !{!"1062"}
!2991 = !DILocation(line: 270, column: 36, scope: !2903)
!2992 = !{i64 1063}
!2993 = !{!"1063"}
!2994 = !DILocation(line: 270, column: 46, scope: !2903)
!2995 = !{i64 1064}
!2996 = !{!"1064"}
!2997 = !DILocation(line: 270, column: 61, scope: !2903)
!2998 = !{i64 1065}
!2999 = !{!"1065"}
!3000 = !DILocation(line: 270, column: 23, scope: !2903)
!3001 = !{i64 1066}
!3002 = !{!"1066"}
!3003 = !{i64 1067}
!3004 = !{!"1067"}
!3005 = !DILocation(line: 271, column: 18, scope: !2903)
!3006 = !{i64 1068}
!3007 = !{!"1068"}
!3008 = !DILocation(line: 271, column: 21, scope: !2903)
!3009 = !{i64 1069}
!3010 = !{!"1069"}
!3011 = !DILocation(line: 271, column: 34, scope: !2903)
!3012 = !{i64 1070}
!3013 = !{!"1070"}
!3014 = !DILocation(line: 271, column: 42, scope: !2903)
!3015 = !{i64 1071}
!3016 = !{!"1071"}
!3017 = !DILocation(line: 271, column: 5, scope: !2903)
!3018 = !{i64 1072}
!3019 = !{!"1072"}
!3020 = !DILocation(line: 272, column: 3, scope: !2886)
!3021 = !{i64 1073}
!3022 = !{!"1073"}
!3023 = !{i64 1074}
!3024 = !{!"1074"}
!3025 = !{i64 1075}
!3026 = !{!"1075"}
!3027 = !{i64 1076}
!3028 = !{!"1076"}
!3029 = !{i64 1077}
!3030 = !{!"1077"}
!3031 = !{i64 1078}
!3032 = !{!"1078"}
!3033 = !DILocation(line: 272, column: 3, scope: !2903)
!3034 = !{i64 1079}
!3035 = !{!"1079"}
!3036 = !DILocation(line: 264, column: 48, scope: !2886)
!3037 = !{i64 1080}
!3038 = !{!"1080"}
!3039 = !{i64 1081}
!3040 = !{!"1081"}
!3041 = !{i64 1082}
!3042 = !{!"1082"}
!3043 = distinct !{!3043, !2892, !3044, !3045}
!3044 = !DILocation(line: 272, column: 3, scope: !2872)
!3045 = !{!"llvm.loop.name", !"TRIANGLES"}
!3046 = !{i64 1083}
!3047 = !{!"1083"}
!3048 = !DILocation(line: 273, column: 1, scope: !2754)
!3049 = !{i64 1084}
!3050 = !{!"1084"}
!3051 = !{i64 1085}
!3052 = !{!"1085"}
!3053 = !{i64 1086}
!3054 = !{!"1086"}
!3055 = !{i64 1087}
!3056 = !{!"1087"}
!3057 = !{i64 1088}
!3058 = !{!"1088"}
!3059 = !{i64 1089}
!3060 = !{!"1089"}
!3061 = !{i64 1090}
!3062 = !{!"1090"}
!3063 = !{i64 1091}
!3064 = !{!"1091"}
!3065 = !{i64 1092}
!3066 = !{!"1092"}
!3067 = !{i64 1093}
!3068 = !{!"1093"}
!3069 = !{i64 1094}
!3070 = !{!"1094"}
!3071 = !{i64 1095}
!3072 = !{!"1095"}
!3073 = !{i64 1096}
!3074 = !{!"1096"}
!3075 = !{i64 1097}
!3076 = !{!"1097"}
!3077 = !{i64 1098}
!3078 = !{!"1098"}
!3079 = !{i64 1099}
!3080 = !{!"1099"}
!3081 = !{i64 1100}
!3082 = !{!"1100"}
!3083 = !{i64 1101}
!3084 = !{!"1101"}
!3085 = !{i64 1102}
!3086 = !{!"1102"}
!3087 = !{i64 1103}
!3088 = !{!"1103"}
!3089 = !{i64 1104}
!3090 = !{!"1104"}
!3091 = !{i64 1105}
!3092 = !{!"1105"}
!3093 = !{i64 1106}
!3094 = !{!"1106"}
!3095 = !{i64 1107}
!3096 = !{!"1107"}
!3097 = !{i64 1108}
!3098 = !{!"1108"}
!3099 = !{i64 1109}
!3100 = !{!"1109"}
!3101 = !{i64 1110}
!3102 = !{!"1110"}
!3103 = !{i64 1111}
!3104 = !{!"1111"}
!3105 = !{i64 1112}
!3106 = !{!"1112"}
!3107 = !{i64 1113}
!3108 = !{!"1113"}
!3109 = !{i64 1114}
!3110 = !{!"1114"}
!3111 = !{!"1115"}
