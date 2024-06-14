; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct.Triangle_2D = type { i8, i8, i8, i8, i8, i8, i8 }
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.CandidatePixel = type { i8, i8, i8, i8 }
%struct.Pixel = type { i8, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@ops = global %struct.BinOpInfo* null, align 8
@_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer = internal unnamed_addr global [256 x [256 x i8]] zeroinitializer, align 1
@profileFileName = private constant [15 x i8] c"data_stats.txt\00"
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf|\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.4 = private unnamed_addr constant [28 x i8] c"Failed to open input file!\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [46 x i8] c"%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu\0A\00", align 1
@.str.3.8 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Image After Rendering: \0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: argmemonly norecurse nounwind readonly willreturn
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d) local_unnamed_addr #0 {
entry:
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !5, !opSignedness !6
  %0 = load i8, i8* %x2, align 1, !opID !7, !opSignedness !6
  %conv = zext i8 %0 to i32, !opID !8, !opSignedness !6
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !9, !opSignedness !6
  %1 = load i8, i8* %x0, align 1, !opID !10, !opSignedness !6
  %conv1 = zext i8 %1 to i32, !opID !11, !opSignedness !6
  %sub = sub nsw i32 %conv, %conv1, !opID !12, !opSignedness !6
  %2 = sext i32 %sub to i64
  call void @profOp(i64 7, i8 13, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !13, !opSignedness !6
  %3 = load i8, i8* %y1, align 1, !opID !14, !opSignedness !6
  %conv2 = zext i8 %3 to i32, !opID !15, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !16, !opSignedness !6
  %4 = load i8, i8* %y0, align 1, !opID !17, !opSignedness !6
  %conv3 = zext i8 %4 to i32, !opID !18, !opSignedness !6
  %sub4 = sub nsw i32 %conv2, %conv3, !opID !19, !opSignedness !6
  %5 = sext i32 %sub4 to i64
  call void @profOp(i64 14, i8 13, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul = mul nsw i32 %sub4, %sub, !opID !20, !opSignedness !6
  %6 = sext i32 %mul to i64
  call void @profOp(i64 15, i8 15, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !21, !opSignedness !6
  %7 = load i8, i8* %y2, align 1, !opID !22, !opSignedness !6
  %conv5 = zext i8 %7 to i32, !opID !23, !opSignedness !6
  %sub8 = sub nsw i32 %conv5, %conv3, !opID !24, !opSignedness !6
  %8 = sext i32 %sub8 to i64
  call void @profOp(i64 19, i8 13, i64 %8, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !25, !opSignedness !6
  %9 = load i8, i8* %x1, align 1, !opID !26, !opSignedness !6
  %conv9 = zext i8 %9 to i32, !opID !27, !opSignedness !6
  %sub12 = sub nsw i32 %conv9, %conv1, !opID !28, !opSignedness !6
  %10 = sext i32 %sub12 to i64
  call void @profOp(i64 23, i8 13, i64 %10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13 = mul nsw i32 %sub12, %sub8, !opID !29, !opSignedness !6
  %11 = sext i32 %mul13 to i64
  call void @profOp(i64 24, i8 15, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub14 = sub nsw i32 %mul, %mul13, !opID !30, !opSignedness !6
  %12 = sext i32 %sub14 to i64
  call void @profOp(i64 25, i8 13, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  ret i32 %sub14, !opID !31, !opSignedness !6
}

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %instID, i8 zeroext %instOpcode, i64 %signedIntValue, i64 %unsignedIntValue, double %fpValue, i1 zeroext %isSignedValue, i1 zeroext %isFpValue, i32 %bitwidth) #1 {
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
  %call = call double @pow(double %13, double 2.000000e+00) #18
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
  %call15 = call double @pow(double %conv14, double 2.000000e+00) #18
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
  %call31 = call double @pow(double %conv30, double 2.000000e+00) #18
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
  %call49 = call double @sqrt(double %59) #18
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
  %call55 = call noalias i8* @malloc(i64 64) #18
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
  %call63 = call double @pow(double %76, double 2.000000e+00) #18
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
  %call71 = call double @pow(double %conv70, double 2.000000e+00) #18
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
  %call77 = call double @pow(double %conv76, double 2.000000e+00) #18
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
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* nocapture %triangle_2d) local_unnamed_addr #3 {
entry:
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !32, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !33, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !34, !opSignedness !6
  %1 = load i8, i8* %y0, align 1, !opID !35, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !36, !opSignedness !6
  %2 = load i8, i8* %x1, align 1, !opID !37, !opSignedness !6
  store i8 %2, i8* %x0, align 1, !opID !38, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !39, !opSignedness !6
  %3 = load i8, i8* %y1, align 1, !opID !40, !opSignedness !6
  store i8 %3, i8* %y0, align 1, !opID !41, !opSignedness !6
  store i8 %0, i8* %x1, align 1, !opID !42, !opSignedness !6
  store i8 %1, i8* %y1, align 1, !opID !43, !opSignedness !6
  ret void, !opID !44, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readonly willreturn
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d) local_unnamed_addr #4 {
entry:
  %conv = zext i8 %x to i32, !opID !45, !opSignedness !6
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !46, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !47, !opSignedness !6
  %conv1 = zext i8 %0 to i32, !opID !48, !opSignedness !6
  %sub = sub nsw i32 %conv, %conv1, !opID !49, !opSignedness !6
  %1 = sext i32 %sub to i64
  call void @profOp(i64 44, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !50, !opSignedness !6
  %2 = load i8, i8* %y1, align 1, !opID !51, !opSignedness !6
  %conv2 = zext i8 %2 to i32, !opID !52, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !53, !opSignedness !6
  %3 = load i8, i8* %y0, align 1, !opID !54, !opSignedness !6
  %conv3 = zext i8 %3 to i32, !opID !55, !opSignedness !6
  %sub4 = sub nsw i32 %conv2, %conv3, !opID !56, !opSignedness !6
  %4 = sext i32 %sub4 to i64
  call void @profOp(i64 51, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul = mul nsw i32 %sub4, %sub, !opID !57, !opSignedness !6
  %5 = sext i32 %mul to i64
  call void @profOp(i64 52, i8 15, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv5 = zext i8 %y to i32, !opID !58, !opSignedness !6
  %sub8 = sub nsw i32 %conv5, %conv3, !opID !59, !opSignedness !6
  %6 = sext i32 %sub8 to i64
  call void @profOp(i64 54, i8 13, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !60, !opSignedness !6
  %7 = load i8, i8* %x1, align 1, !opID !61, !opSignedness !6
  %conv9 = zext i8 %7 to i32, !opID !62, !opSignedness !6
  %sub12 = sub nsw i32 %conv9, %conv1, !opID !63, !opSignedness !6
  %8 = sext i32 %sub12 to i64
  call void @profOp(i64 58, i8 13, i64 %8, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13 = mul nsw i32 %sub12, %sub8, !opID !64, !opSignedness !6
  %9 = sext i32 %mul13 to i64
  call void @profOp(i64 59, i8 15, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub18 = sub nsw i32 %conv, %conv9, !opID !65, !opSignedness !6
  %10 = sext i32 %sub18 to i64
  call void @profOp(i64 60, i8 13, i64 %10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !66, !opSignedness !6
  %11 = load i8, i8* %y2, align 1, !opID !67, !opSignedness !6
  %conv19 = zext i8 %11 to i32, !opID !68, !opSignedness !6
  %sub22 = sub nsw i32 %conv19, %conv2, !opID !69, !opSignedness !6
  %12 = sext i32 %sub22 to i64
  call void @profOp(i64 64, i8 13, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul23 = mul nsw i32 %sub22, %sub18, !opID !70, !opSignedness !6
  %13 = sext i32 %mul23 to i64
  call void @profOp(i64 65, i8 15, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub27 = sub nsw i32 %conv5, %conv2, !opID !71, !opSignedness !6
  %14 = sext i32 %sub27 to i64
  call void @profOp(i64 66, i8 13, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !72, !opSignedness !6
  %15 = load i8, i8* %x2, align 1, !opID !73, !opSignedness !6
  %conv28 = zext i8 %15 to i32, !opID !74, !opSignedness !6
  %sub31 = sub nsw i32 %conv28, %conv9, !opID !75, !opSignedness !6
  %16 = sext i32 %sub31 to i64
  call void @profOp(i64 70, i8 13, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul32 = mul nsw i32 %sub31, %sub27, !opID !76, !opSignedness !6
  %17 = sext i32 %mul32 to i64
  call void @profOp(i64 71, i8 15, i64 %17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub37 = sub nsw i32 %conv, %conv28, !opID !77, !opSignedness !6
  %18 = sext i32 %sub37 to i64
  call void @profOp(i64 72, i8 13, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub42 = sub nsw i32 %conv3, %conv19, !opID !78, !opSignedness !6
  %19 = sext i32 %sub42 to i64
  call void @profOp(i64 73, i8 13, i64 %19, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul43 = mul nsw i32 %sub37, %sub42, !opID !79, !opSignedness !6
  %20 = sext i32 %mul43 to i64
  call void @profOp(i64 74, i8 15, i64 %20, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub47 = sub nsw i32 %conv5, %conv19, !opID !80, !opSignedness !6
  %21 = sext i32 %sub47 to i64
  call void @profOp(i64 75, i8 13, i64 %21, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub52 = sub nsw i32 %conv1, %conv28, !opID !81, !opSignedness !6
  %22 = sext i32 %sub52 to i64
  call void @profOp(i64 76, i8 13, i64 %22, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul53 = mul nsw i32 %sub52, %sub47, !opID !82, !opSignedness !6
  %23 = sext i32 %mul53 to i64
  call void @profOp(i64 77, i8 15, i64 %23, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp = icmp sge i32 %mul, %mul13, !opID !83, !opSignedness !6
  %cmp55 = icmp sge i32 %mul23, %mul32, !opID !84, !opSignedness !6
  %or.cond = and i1 %cmp, %cmp55, !opID !85, !opSignedness !6
  %24 = sext i1 %or.cond to i64
  call void @profOp(i64 80, i8 26, i64 %24, i64 0, double 0.000000e+00, i1 true, i1 false, i32 1)
  br i1 %or.cond, label %land.rhs, label %land.end, !opID !86, !opSignedness !6

land.rhs:                                         ; preds = %entry
  %cmp56 = icmp sge i32 %mul43, %mul53, !opID !87, !opSignedness !6
  br label %land.end, !opID !88, !opSignedness !6

land.end:                                         ; preds = %land.rhs, %entry
  %25 = phi i1 [ false, %entry ], [ %cmp56, %land.rhs ], !opID !89, !opSignedness !6
  ret i1 %25, !opID !90, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #5 {
entry:
  %cmp4 = icmp ult i8 %in0, %in2, !opID !91, !opSignedness !6
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2, !opID !92, !opSignedness !6
  %0 = icmp ult i8 %in0.in2, %in1, !opID !93, !opSignedness !6
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1, !opID !94, !opSignedness !6
  ret i8 %retval.0, !opID !95, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #6 {
entry:
  %cmp4 = icmp ugt i8 %in0, %in2, !opID !96, !opSignedness !6
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2, !opID !97, !opSignedness !6
  %0 = icmp ugt i8 %in0.in2, %in1, !opID !98, !opSignedness !6
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1, !opID !99, !opSignedness !6
  ret i8 %retval.0, !opID !100, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval readonly align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) local_unnamed_addr #7 {
entry:
  switch i32 %angle, label %if.end69 [
    i32 0, label %if.then
    i32 1, label %if.then14
    i32 2, label %if.then42
  ], !opID !101, !opSignedness !6

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !102, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !103, !opSignedness !6
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !104, !opSignedness !6
  store i8 %0, i8* %x01, align 1, !opID !105, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !106, !opSignedness !6
  %1 = load i8, i8* %y0, align 1, !opID !107, !opSignedness !6
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !108, !opSignedness !6
  store i8 %1, i8* %y02, align 1, !opID !109, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !110, !opSignedness !6
  %2 = load i8, i8* %x1, align 1, !opID !111, !opSignedness !6
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !112, !opSignedness !6
  store i8 %2, i8* %x13, align 1, !opID !113, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !114, !opSignedness !6
  %3 = load i8, i8* %y1, align 1, !opID !115, !opSignedness !6
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !116, !opSignedness !6
  store i8 %3, i8* %y14, align 1, !opID !117, !opSignedness !6
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !118, !opSignedness !6
  %4 = load i8, i8* %x2, align 1, !opID !119, !opSignedness !6
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !120, !opSignedness !6
  store i8 %4, i8* %x25, align 1, !opID !121, !opSignedness !6
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !122, !opSignedness !6
  %5 = load i8, i8* %y2, align 1, !opID !123, !opSignedness !6
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !124, !opSignedness !6
  store i8 %5, i8* %y26, align 1, !opID !125, !opSignedness !6
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !126, !opSignedness !6
  %6 = load i8, i8* %z0, align 1, !opID !127, !opSignedness !6
  %7 = udiv i8 %6, 3, !opID !128, !opSignedness !6
  %8 = zext i8 %7 to i64
  call void @profOp(i64 123, i8 17, i64 0, i64 %8, double 0.000000e+00, i1 false, i1 false, i32 8)
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !129, !opSignedness !6
  %9 = load i8, i8* %z1, align 1, !opID !130, !opSignedness !6
  %10 = udiv i8 %9, 3, !opID !131, !opSignedness !6
  %11 = zext i8 %10 to i64
  call void @profOp(i64 126, i8 17, i64 0, i64 %11, double 0.000000e+00, i1 false, i1 false, i32 8)
  %addconv2 = add nuw i8 %10, %7, !opID !132, !opSignedness !6
  %12 = sext i8 %addconv2 to i64
  call void @profOp(i64 127, i8 11, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !133, !opSignedness !6
  br label %if.end69.sink.split, !opID !134, !opSignedness !6

if.then14:                                        ; preds = %entry
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !135, !opSignedness !6
  %13 = load i8, i8* %x015, align 1, !opID !136, !opSignedness !6
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !137, !opSignedness !6
  store i8 %13, i8* %x016, align 1, !opID !138, !opSignedness !6
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !139, !opSignedness !6
  %14 = load i8, i8* %z017, align 1, !opID !140, !opSignedness !6
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !141, !opSignedness !6
  store i8 %14, i8* %y018, align 1, !opID !142, !opSignedness !6
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !143, !opSignedness !6
  %15 = load i8, i8* %x119, align 1, !opID !144, !opSignedness !6
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !145, !opSignedness !6
  store i8 %15, i8* %x120, align 1, !opID !146, !opSignedness !6
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !147, !opSignedness !6
  %16 = load i8, i8* %z121, align 1, !opID !148, !opSignedness !6
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !149, !opSignedness !6
  store i8 %16, i8* %y122, align 1, !opID !150, !opSignedness !6
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !151, !opSignedness !6
  %17 = load i8, i8* %x223, align 1, !opID !152, !opSignedness !6
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !153, !opSignedness !6
  store i8 %17, i8* %x224, align 1, !opID !154, !opSignedness !6
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !155, !opSignedness !6
  %18 = load i8, i8* %z225, align 1, !opID !156, !opSignedness !6
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !157, !opSignedness !6
  store i8 %18, i8* %y226, align 1, !opID !158, !opSignedness !6
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !159, !opSignedness !6
  %19 = load i8, i8* %y027, align 1, !opID !160, !opSignedness !6
  %20 = udiv i8 %19, 3, !opID !161, !opSignedness !6
  %21 = zext i8 %20 to i64
  call void @profOp(i64 156, i8 17, i64 0, i64 %21, double 0.000000e+00, i1 false, i1 false, i32 8)
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !162, !opSignedness !6
  %22 = load i8, i8* %y130, align 1, !opID !163, !opSignedness !6
  %23 = udiv i8 %22, 3, !opID !164, !opSignedness !6
  %24 = zext i8 %23 to i64
  call void @profOp(i64 159, i8 17, i64 0, i64 %24, double 0.000000e+00, i1 false, i1 false, i32 8)
  %addconv1 = add nuw i8 %23, %20, !opID !165, !opSignedness !6
  %25 = sext i8 %addconv1 to i64
  call void @profOp(i64 160, i8 11, i64 %25, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !166, !opSignedness !6
  br label %if.end69.sink.split, !opID !167, !opSignedness !6

if.then42:                                        ; preds = %entry
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !168, !opSignedness !6
  %26 = load i8, i8* %z043, align 1, !opID !169, !opSignedness !6
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !170, !opSignedness !6
  store i8 %26, i8* %x044, align 1, !opID !171, !opSignedness !6
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !172, !opSignedness !6
  %27 = load i8, i8* %y045, align 1, !opID !173, !opSignedness !6
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !174, !opSignedness !6
  store i8 %27, i8* %y046, align 1, !opID !175, !opSignedness !6
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !176, !opSignedness !6
  %28 = load i8, i8* %z147, align 1, !opID !177, !opSignedness !6
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !178, !opSignedness !6
  store i8 %28, i8* %x148, align 1, !opID !179, !opSignedness !6
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !180, !opSignedness !6
  %29 = load i8, i8* %y149, align 1, !opID !181, !opSignedness !6
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !182, !opSignedness !6
  store i8 %29, i8* %y150, align 1, !opID !183, !opSignedness !6
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !184, !opSignedness !6
  %30 = load i8, i8* %z251, align 1, !opID !185, !opSignedness !6
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !186, !opSignedness !6
  store i8 %30, i8* %x252, align 1, !opID !187, !opSignedness !6
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !188, !opSignedness !6
  %31 = load i8, i8* %y253, align 1, !opID !189, !opSignedness !6
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !190, !opSignedness !6
  store i8 %31, i8* %y254, align 1, !opID !191, !opSignedness !6
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !192, !opSignedness !6
  %32 = load i8, i8* %x055, align 1, !opID !193, !opSignedness !6
  %33 = udiv i8 %32, 3, !opID !194, !opSignedness !6
  %34 = zext i8 %33 to i64
  call void @profOp(i64 189, i8 17, i64 0, i64 %34, double 0.000000e+00, i1 false, i1 false, i32 8)
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !195, !opSignedness !6
  %35 = load i8, i8* %x158, align 1, !opID !196, !opSignedness !6
  %36 = udiv i8 %35, 3, !opID !197, !opSignedness !6
  %37 = zext i8 %36 to i64
  call void @profOp(i64 192, i8 17, i64 0, i64 %37, double 0.000000e+00, i1 false, i1 false, i32 8)
  %addconv = add nuw i8 %36, %33, !opID !198, !opSignedness !6
  %38 = sext i8 %addconv to i64
  call void @profOp(i64 193, i8 11, i64 %38, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !199, !opSignedness !6
  br label %if.end69.sink.split, !opID !200, !opSignedness !6

if.end69.sink.split:                              ; preds = %if.then42, %if.then14, %if.then
  %y234.sink = phi i8* [ %y234, %if.then14 ], [ %x262, %if.then42 ], [ %z2, %if.then ], !opID !201, !opSignedness !6
  %addconv1.sink = phi i8 [ %addconv1, %if.then14 ], [ %addconv, %if.then42 ], [ %addconv2, %if.then ], !opID !202, !opSignedness !6
  %39 = load i8, i8* %y234.sink, align 1, !opID !203, !opSignedness !6
  %40 = udiv i8 %39, 3, !opID !204, !opSignedness !6
  %41 = zext i8 %40 to i64
  call void @profOp(i64 199, i8 17, i64 0, i64 %41, double 0.000000e+00, i1 false, i1 false, i32 8)
  %add37 = add i8 %addconv1.sink, %40, !opID !205, !opSignedness !6
  %42 = sext i8 %add37 to i64
  call void @profOp(i64 200, i8 11, i64 %42, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6, !opID !206, !opSignedness !6
  store i8 %add37, i8* %z39, align 1, !opID !207, !opSignedness !6
  br label %if.end69, !opID !208, !opSignedness !6

if.end69:                                         ; preds = %if.end69.sink.split, %entry
  ret void, !opID !209, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* nocapture %max_min, i32* nocapture %max_index) local_unnamed_addr #8 {
entry:
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !210, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !211, !opSignedness !6
  %.elt15 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !212, !opSignedness !6
  %.unpack16 = load i8, i8* %.elt15, align 1, !opID !213, !opSignedness !6
  %.elt17 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !214, !opSignedness !6
  %.unpack18 = load i8, i8* %.elt17, align 1, !opID !215, !opSignedness !6
  %.elt19 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !216, !opSignedness !6
  %.unpack20 = load i8, i8* %.elt19, align 1, !opID !217, !opSignedness !6
  %.elt21 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !218, !opSignedness !6
  %.unpack22 = load i8, i8* %.elt21, align 1, !opID !219, !opSignedness !6
  %.elt23 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !220, !opSignedness !6
  %.unpack24 = load i8, i8* %.elt23, align 1, !opID !221, !opSignedness !6
  %conv.i = zext i8 %.unpack22 to i32, !opID !222, !opSignedness !6
  %conv1.i = zext i8 %.unpack to i32, !opID !223, !opSignedness !6
  %sub.i = sub nsw i32 %conv.i, %conv1.i, !opID !224, !opSignedness !6
  %0 = sext i32 %sub.i to i64
  call void @profOp(i64 219, i8 13, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv2.i = zext i8 %.unpack20 to i32, !opID !225, !opSignedness !6
  %conv3.i = zext i8 %.unpack16 to i32, !opID !226, !opSignedness !6
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i, !opID !227, !opSignedness !6
  %1 = sext i32 %sub4.i to i64
  call void @profOp(i64 222, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul.i = mul nsw i32 %sub.i, %sub4.i, !opID !228, !opSignedness !6
  %2 = sext i32 %mul.i to i64
  call void @profOp(i64 223, i8 15, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv5.i = zext i8 %.unpack24 to i32, !opID !229, !opSignedness !6
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i, !opID !230, !opSignedness !6
  %3 = sext i32 %sub8.i to i64
  call void @profOp(i64 225, i8 13, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv9.i = zext i8 %.unpack18 to i32, !opID !231, !opSignedness !6
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i, !opID !232, !opSignedness !6
  %4 = sext i32 %sub12.i to i64
  call void @profOp(i64 227, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13.i = mul nsw i32 %sub8.i, %sub12.i, !opID !233, !opSignedness !6
  %5 = sext i32 %mul13.i to i64
  call void @profOp(i64 228, i8 15, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub14.i = sub nsw i32 %mul.i, %mul13.i, !opID !234, !opSignedness !6
  %6 = sext i32 %sub14.i to i64
  call void @profOp(i64 229, i8 13, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp = icmp eq i32 %sub14.i, 0, !opID !235, !opSignedness !6
  br i1 %cmp, label %return, label %if.end, !opID !236, !opSignedness !6

if.end:                                           ; preds = %entry
  %cmp3 = icmp slt i32 %sub14.i, 0, !opID !237, !opSignedness !6
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !238, !opSignedness !6

if.then4:                                         ; preds = %if.end
  store i8 %.unpack18, i8* %.elt, align 1, !opID !239, !opSignedness !6
  store i8 %.unpack20, i8* %.elt15, align 1, !opID !240, !opSignedness !6
  store i8 %.unpack, i8* %.elt17, align 1, !opID !241, !opSignedness !6
  store i8 %.unpack16, i8* %.elt19, align 1, !opID !242, !opSignedness !6
  br label %if.end5, !opID !243, !opSignedness !6

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = phi i8 [ %.unpack16, %if.then4 ], [ %.unpack20, %if.end ], !opID !244, !opSignedness !6
  %8 = phi i8 [ %.unpack20, %if.then4 ], [ %.unpack16, %if.end ], !opID !245, !opSignedness !6
  %9 = phi i8 [ %.unpack, %if.then4 ], [ %.unpack18, %if.end ], !opID !246, !opSignedness !6
  %10 = phi i8 [ %.unpack18, %if.then4 ], [ %.unpack, %if.end ], !opID !247, !opSignedness !6
  %cmp4.i47 = icmp ult i8 %10, %.unpack22, !opID !248, !opSignedness !6
  %in0.in2.i48 = select i1 %cmp4.i47, i8 %10, i8 %.unpack22, !opID !249, !opSignedness !6
  %11 = icmp ult i8 %in0.in2.i48, %9, !opID !250, !opSignedness !6
  %retval.0.i49 = select i1 %11, i8 %in0.in2.i48, i8 %9, !opID !251, !opSignedness !6
  store i8 %retval.0.i49, i8* %max_min, align 1, !opID !252, !opSignedness !6
  %cmp4.i44 = icmp ugt i8 %10, %.unpack22, !opID !253, !opSignedness !6
  %in0.in2.i45 = select i1 %cmp4.i44, i8 %10, i8 %.unpack22, !opID !254, !opSignedness !6
  %12 = icmp ugt i8 %in0.in2.i45, %9, !opID !255, !opSignedness !6
  %retval.0.i46 = select i1 %12, i8 %in0.in2.i45, i8 %9, !opID !256, !opSignedness !6
  %arrayidx11 = getelementptr inbounds i8, i8* %max_min, i64 1, !opID !257, !opSignedness !6
  store i8 %retval.0.i46, i8* %arrayidx11, align 1, !opID !258, !opSignedness !6
  %cmp4.i41 = icmp ult i8 %8, %.unpack24, !opID !259, !opSignedness !6
  %in0.in2.i42 = select i1 %cmp4.i41, i8 %8, i8 %.unpack24, !opID !260, !opSignedness !6
  %13 = icmp ult i8 %in0.in2.i42, %7, !opID !261, !opSignedness !6
  %retval.0.i43 = select i1 %13, i8 %in0.in2.i42, i8 %7, !opID !262, !opSignedness !6
  %arrayidx13 = getelementptr inbounds i8, i8* %max_min, i64 2, !opID !263, !opSignedness !6
  store i8 %retval.0.i43, i8* %arrayidx13, align 1, !opID !264, !opSignedness !6
  %cmp4.i = icmp ugt i8 %8, %.unpack24, !opID !265, !opSignedness !6
  %in0.in2.i = select i1 %cmp4.i, i8 %8, i8 %.unpack24, !opID !266, !opSignedness !6
  %14 = icmp ugt i8 %in0.in2.i, %7, !opID !267, !opSignedness !6
  %retval.0.i = select i1 %14, i8 %in0.in2.i, i8 %7, !opID !268, !opSignedness !6
  %arrayidx18 = getelementptr inbounds i8, i8* %max_min, i64 3, !opID !269, !opSignedness !6
  store i8 %retval.0.i, i8* %arrayidx18, align 1, !opID !270, !opSignedness !6
  %sub = sub i8 %retval.0.i46, %retval.0.i49, !opID !271, !opSignedness !6
  %15 = sext i8 %sub to i64
  call void @profOp(i64 266, i8 13, i64 %15, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %arrayidx23 = getelementptr inbounds i8, i8* %max_min, i64 4, !opID !272, !opSignedness !6
  store i8 %sub, i8* %arrayidx23, align 1, !opID !273, !opSignedness !6
  %conv25 = zext i8 %retval.0.i46 to i32, !opID !274, !opSignedness !6
  %conv27 = zext i8 %retval.0.i49 to i32, !opID !275, !opSignedness !6
  %sub28 = sub nsw i32 %conv25, %conv27, !opID !276, !opSignedness !6
  %16 = sext i32 %sub28 to i64
  call void @profOp(i64 271, i8 13, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv30 = zext i8 %retval.0.i to i32, !opID !277, !opSignedness !6
  %conv32 = zext i8 %retval.0.i43 to i32, !opID !278, !opSignedness !6
  %sub33 = sub nsw i32 %conv30, %conv32, !opID !279, !opSignedness !6
  %17 = sext i32 %sub33 to i64
  call void @profOp(i64 274, i8 13, i64 %17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul = mul nsw i32 %sub33, %sub28, !opID !280, !opSignedness !6
  %18 = sext i32 %mul to i64
  call void @profOp(i64 275, i8 15, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  store i32 %mul, i32* %max_index, align 4, !opID !281, !opSignedness !6
  br label %return, !opID !282, !opSignedness !6

return:                                           ; preds = %if.end5, %entry
  %retval.0 = phi i1 [ false, %if.end5 ], [ true, %entry ], !opID !283, !opSignedness !6
  ret i1 %retval.0, !opID !284, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* nocapture readonly %max_min, i32* nocapture readonly %max_index, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d, %struct.CandidatePixel* nocapture %fragment) local_unnamed_addr #9 {
entry:
  br i1 %flag, label %return, label %if.end, !opID !285, !opSignedness !6

if.end:                                           ; preds = %entry
  %0 = load i32, i32* %max_index, align 4, !opID !286, !opSignedness !6
  %cmp13 = icmp sgt i32 %0, 0, !opID !287, !opSignedness !6
  br i1 %cmp13, label %for.body.lr.ph, label %return, !opID !288, !opSignedness !6

for.body.lr.ph:                                   ; preds = %if.end
  %arrayidx2 = getelementptr inbounds i8, i8* %max_min, i64 4, !opID !289, !opSignedness !6
  %arrayidx5 = getelementptr inbounds i8, i8* %max_min, i64 2, !opID !290, !opSignedness !6
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !291, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !292, !opSignedness !6
  %.elt1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !293, !opSignedness !6
  %.unpack2 = load i8, i8* %.elt1, align 1, !opID !294, !opSignedness !6
  %.elt3 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !295, !opSignedness !6
  %.unpack4 = load i8, i8* %.elt3, align 1, !opID !296, !opSignedness !6
  %.elt5 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !297, !opSignedness !6
  %.unpack6 = load i8, i8* %.elt5, align 1, !opID !298, !opSignedness !6
  %.elt7 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !299, !opSignedness !6
  %.unpack8 = load i8, i8* %.elt7, align 1, !opID !300, !opSignedness !6
  %.elt9 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !301, !opSignedness !6
  %.unpack10 = load i8, i8* %.elt9, align 1, !opID !302, !opSignedness !6
  %.elt11 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6, !opID !303, !opSignedness !6
  %conv1.i = zext i8 %.unpack to i32, !opID !304, !opSignedness !6
  %conv2.i = zext i8 %.unpack6 to i32, !opID !305, !opSignedness !6
  %conv3.i = zext i8 %.unpack2 to i32, !opID !306, !opSignedness !6
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i, !opID !307, !opSignedness !6
  %1 = sext i32 %sub4.i to i64
  call void @profOp(i64 302, i8 13, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv9.i = zext i8 %.unpack4 to i32, !opID !308, !opSignedness !6
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i, !opID !309, !opSignedness !6
  %2 = sext i32 %sub12.i to i64
  call void @profOp(i64 304, i8 13, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv19.i = zext i8 %.unpack10 to i32, !opID !310, !opSignedness !6
  %sub22.i = sub nsw i32 %conv19.i, %conv2.i, !opID !311, !opSignedness !6
  %3 = sext i32 %sub22.i to i64
  call void @profOp(i64 306, i8 13, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv28.i = zext i8 %.unpack8 to i32, !opID !312, !opSignedness !6
  %sub31.i = sub nsw i32 %conv28.i, %conv9.i, !opID !313, !opSignedness !6
  %4 = sext i32 %sub31.i to i64
  call void @profOp(i64 308, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub42.i = sub nsw i32 %conv3.i, %conv19.i, !opID !314, !opSignedness !6
  %5 = sext i32 %sub42.i to i64
  call void @profOp(i64 309, i8 13, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub52.i = sub nsw i32 %conv1.i, %conv28.i, !opID !315, !opSignedness !6
  %6 = sext i32 %sub52.i to i64
  call void @profOp(i64 310, i8 13, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %7 = load i8, i8* %.elt11, align 1, !opID !316, !opSignedness !6
  br label %for.body, !opID !317, !opSignedness !6

for.body:                                         ; preds = %if.end23, %for.body.lr.ph
  %k.015 = phi i32 [ 0, %for.body.lr.ph ], [ %inc24, %if.end23 ], !opID !318, !opSignedness !6
  %i.014 = phi i32 [ 0, %for.body.lr.ph ], [ %i.1, %if.end23 ], !opID !319, !opSignedness !6
  %8 = load i8, i8* %max_min, align 1, !opID !320, !opSignedness !6
  %9 = load i8, i8* %arrayidx2, align 1, !opID !321, !opSignedness !6
  %conv3 = zext i8 %9 to i32, !opID !322, !opSignedness !6
  %rem.urem = urem i32 %k.015, %conv3, !opID !323, !opSignedness !6
  %10 = zext i32 %rem.urem to i64
  call void @profOp(i64 318, i8 20, i64 0, i64 %10, double 0.000000e+00, i1 false, i1 false, i32 32)
  %11 = trunc i32 %rem.urem to i8, !opID !324, !opSignedness !6
  %conv4 = add i8 %8, %11, !opID !325, !opSignedness !6
  %12 = sext i8 %conv4 to i64
  call void @profOp(i64 320, i8 11, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %13 = load i8, i8* %arrayidx5, align 1, !opID !326, !opSignedness !6
  %div.udiv = udiv i32 %k.015, %conv3, !opID !327, !opSignedness !6
  %14 = zext i32 %div.udiv to i64
  call void @profOp(i64 322, i8 17, i64 0, i64 %14, double 0.000000e+00, i1 false, i1 false, i32 32)
  %15 = trunc i32 %div.udiv to i8, !opID !328, !opSignedness !6
  %conv10 = add i8 %13, %15, !opID !329, !opSignedness !6
  %16 = sext i8 %conv10 to i64
  call void @profOp(i64 324, i8 11, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %conv.i = zext i8 %conv4 to i32, !opID !330, !opSignedness !6
  %sub.i = sub nsw i32 %conv.i, %conv1.i, !opID !331, !opSignedness !6
  %17 = sext i32 %sub.i to i64
  call void @profOp(i64 326, i8 13, i64 %17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul.i = mul nsw i32 %sub4.i, %sub.i, !opID !332, !opSignedness !6
  %18 = sext i32 %mul.i to i64
  call void @profOp(i64 327, i8 15, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv5.i = zext i8 %conv10 to i32, !opID !333, !opSignedness !6
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i, !opID !334, !opSignedness !6
  %19 = sext i32 %sub8.i to i64
  call void @profOp(i64 329, i8 13, i64 %19, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13.i = mul nsw i32 %sub12.i, %sub8.i, !opID !335, !opSignedness !6
  %20 = sext i32 %mul13.i to i64
  call void @profOp(i64 330, i8 15, i64 %20, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub18.i = sub nsw i32 %conv.i, %conv9.i, !opID !336, !opSignedness !6
  %21 = sext i32 %sub18.i to i64
  call void @profOp(i64 331, i8 13, i64 %21, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul23.i = mul nsw i32 %sub22.i, %sub18.i, !opID !337, !opSignedness !6
  %22 = sext i32 %mul23.i to i64
  call void @profOp(i64 332, i8 15, i64 %22, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub27.i = sub nsw i32 %conv5.i, %conv2.i, !opID !338, !opSignedness !6
  %23 = sext i32 %sub27.i to i64
  call void @profOp(i64 333, i8 13, i64 %23, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul32.i = mul nsw i32 %sub31.i, %sub27.i, !opID !339, !opSignedness !6
  %24 = sext i32 %mul32.i to i64
  call void @profOp(i64 334, i8 15, i64 %24, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub37.i = sub nsw i32 %conv.i, %conv28.i, !opID !340, !opSignedness !6
  %25 = sext i32 %sub37.i to i64
  call void @profOp(i64 335, i8 13, i64 %25, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul43.i = mul nsw i32 %sub42.i, %sub37.i, !opID !341, !opSignedness !6
  %26 = sext i32 %mul43.i to i64
  call void @profOp(i64 336, i8 15, i64 %26, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub47.i = sub nsw i32 %conv5.i, %conv19.i, !opID !342, !opSignedness !6
  %27 = sext i32 %sub47.i to i64
  call void @profOp(i64 337, i8 13, i64 %27, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul53.i = mul nsw i32 %sub47.i, %sub52.i, !opID !343, !opSignedness !6
  %28 = sext i32 %mul53.i to i64
  call void @profOp(i64 338, i8 15, i64 %28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp.i = icmp sge i32 %mul.i, %mul13.i, !opID !344, !opSignedness !6
  %cmp55.i = icmp sge i32 %mul23.i, %mul32.i, !opID !345, !opSignedness !6
  %or.cond.i = and i1 %cmp.i, %cmp55.i, !opID !346, !opSignedness !6
  %29 = sext i1 %or.cond.i to i64
  call void @profOp(i64 341, i8 26, i64 %29, i64 0, double 0.000000e+00, i1 true, i1 false, i32 1)
  %cmp56.i = icmp sge i32 %mul43.i, %mul53.i, !opID !347, !opSignedness !6
  %or.cond = and i1 %cmp56.i, %or.cond.i, !opID !348, !opSignedness !6
  %30 = sext i1 %or.cond to i64
  call void @profOp(i64 343, i8 26, i64 %30, i64 0, double 0.000000e+00, i1 true, i1 false, i32 1)
  br i1 %or.cond, label %if.then11, label %if.end23, !opID !349, !opSignedness !6

if.then11:                                        ; preds = %for.body
  %idxprom = sext i32 %i.014 to i64, !opID !350, !opSignedness !6
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 0, !opID !351, !opSignedness !6
  store i8 %conv4, i8* %x13, align 1, !opID !352, !opSignedness !6
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 1, !opID !353, !opSignedness !6
  store i8 %conv10, i8* %y16, align 1, !opID !354, !opSignedness !6
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 2, !opID !355, !opSignedness !6
  store i8 %7, i8* %z19, align 1, !opID !356, !opSignedness !6
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 3, !opID !357, !opSignedness !6
  store i8 100, i8* %color22, align 1, !opID !358, !opSignedness !6
  %inc = add i32 %i.014, 1, !opID !359, !opSignedness !6
  %31 = sext i32 %inc to i64
  call void @profOp(i64 354, i8 11, i64 %31, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  br label %if.end23, !opID !360, !opSignedness !6

if.end23:                                         ; preds = %if.then11, %for.body
  %i.1 = phi i32 [ %inc, %if.then11 ], [ %i.014, %for.body ], !opID !361, !opSignedness !6
  %inc24 = add nuw nsw i32 %k.015, 1, !opID !362, !opSignedness !6
  %32 = sext i32 %inc24 to i64
  call void @profOp(i64 357, i8 11, i64 %32, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %33 = load i32, i32* %max_index, align 4, !opID !363, !opSignedness !6
  %cmp = icmp slt i32 %inc24, %33, !opID !364, !opSignedness !6
  br i1 %cmp, label %for.body, label %return, !llvm.loop !365, !opID !367, !opSignedness !6

return:                                           ; preds = %if.end23, %if.end, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 0, %if.end ], [ %i.1, %if.end23 ], !opID !368, !opSignedness !6
  ret i32 %retval.0, !opID !369, !opSignedness !6
}

; Function Attrs: norecurse nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* nocapture readonly %fragments, i32 %size, %struct.Pixel* nocapture %pixels) local_unnamed_addr #10 {
entry:
  %cmp = icmp eq i32 %counter, 0, !opID !370, !opSignedness !6
  br i1 %cmp, label %ZCULLING_INIT_ROW, label %if.end, !opID !371, !opSignedness !6

ZCULLING_INIT_ROW:                                ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false), !opID !372, !opSignedness !6
  br label %if.end, !opID !373, !opSignedness !6

if.end:                                           ; preds = %ZCULLING_INIT_ROW, %entry
  %cmp121 = icmp sgt i32 %size, 0, !opID !374, !opSignedness !6
  br i1 %cmp121, label %for.body14.lr.ph, label %for.cond.cleanup13, !opID !375, !opSignedness !6

for.body14.lr.ph:                                 ; preds = %if.end
  %wide.trip.count = zext i32 %size to i64, !opID !376, !opSignedness !6
  br label %for.body14, !opID !377, !opSignedness !6

for.cond.cleanup13:                               ; preds = %for.inc60, %if.end
  %pixel_cntr.0.lcssa = phi i32 [ 0, %if.end ], [ %pixel_cntr.1, %for.inc60 ], !opID !378, !opSignedness !6
  ret i32 %pixel_cntr.0.lcssa, !opID !379, !opSignedness !6

for.body14:                                       ; preds = %for.inc60, %for.body14.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body14.lr.ph ], [ %indvars.iv.next, %for.inc60 ], !opID !380, !opSignedness !6
  %pixel_cntr.02 = phi i32 [ 0, %for.body14.lr.ph ], [ %pixel_cntr.1, %for.inc60 ], !opID !381, !opSignedness !6
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 2, !opID !382, !opSignedness !6
  %0 = load i8, i8* %z, align 1, !opID !383, !opSignedness !6
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 1, !opID !384, !opSignedness !6
  %1 = load i8, i8* %y, align 1, !opID !385, !opSignedness !6
  %idxprom19 = zext i8 %1 to i64, !opID !386, !opSignedness !6
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 0, !opID !387, !opSignedness !6
  %2 = load i8, i8* %x, align 1, !opID !388, !opSignedness !6
  %idxprom23 = zext i8 %2 to i64, !opID !389, !opSignedness !6
  %arrayidx24 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19, i64 %idxprom23, !opID !390, !opSignedness !6
  %3 = load i8, i8* %arrayidx24, align 1, !opID !391, !opSignedness !6
  %cmp26 = icmp ult i8 %0, %3, !opID !392, !opSignedness !6
  br i1 %cmp26, label %if.then27, label %for.inc60, !opID !393, !opSignedness !6

if.then27:                                        ; preds = %for.body14
  %idxprom31 = sext i32 %pixel_cntr.02 to i64, !opID !394, !opSignedness !6
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 0, !opID !395, !opSignedness !6
  store i8 %2, i8* %x33, align 1, !opID !396, !opSignedness !6
  %4 = load i8, i8* %y, align 1, !opID !397, !opSignedness !6
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 1, !opID !398, !opSignedness !6
  store i8 %4, i8* %y39, align 1, !opID !399, !opSignedness !6
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 3, !opID !400, !opSignedness !6
  %5 = load i8, i8* %color, align 1, !opID !401, !opSignedness !6
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 2, !opID !402, !opSignedness !6
  store i8 %5, i8* %color44, align 1, !opID !403, !opSignedness !6
  %inc45 = add i32 %pixel_cntr.02, 1, !opID !404, !opSignedness !6
  %6 = sext i32 %inc45 to i64
  call void @profOp(i64 397, i8 11, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %7 = load i8, i8* %z, align 1, !opID !405, !opSignedness !6
  %8 = load i8, i8* %y, align 1, !opID !406, !opSignedness !6
  %idxprom52 = zext i8 %8 to i64, !opID !407, !opSignedness !6
  %9 = load i8, i8* %x, align 1, !opID !408, !opSignedness !6
  %idxprom57 = zext i8 %9 to i64, !opID !409, !opSignedness !6
  %arrayidx58 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52, i64 %idxprom57, !opID !410, !opSignedness !6
  store i8 %7, i8* %arrayidx58, align 1, !opID !411, !opSignedness !6
  br label %for.inc60, !opID !412, !opSignedness !6

for.inc60:                                        ; preds = %if.then27, %for.body14
  %pixel_cntr.1 = phi i32 [ %inc45, %if.then27 ], [ %pixel_cntr.02, %for.body14 ], !opID !413, !opSignedness !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !414, !opSignedness !6
  call void @profOp(i64 407, i8 11, i64 %indvars.iv.next, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64)
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !opID !415, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup13, label %for.body14, !llvm.loop !416, !opID !418, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #11

; Function Attrs: argmemonly norecurse nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* nocapture readonly %pixels, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %frame_buffer) local_unnamed_addr #12 {
entry:
  %frame_buffer9 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 0, i64 0, !opID !419, !opSignedness !6
  %cmp = icmp eq i32 %counter, 0, !opID !420, !opSignedness !6
  br i1 %cmp, label %COLORING_FB_INIT_ROW, label %COLORING_FB, !opID !421, !opSignedness !6

COLORING_FB_INIT_ROW:                             ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9, i8 0, i64 65536, i1 false), !opID !422, !opSignedness !6
  br label %COLORING_FB, !opID !423, !opSignedness !6

COLORING_FB:                                      ; preds = %COLORING_FB_INIT_ROW, %entry
  %cmp131 = icmp sgt i32 %size_pixels, 0, !opID !424, !opSignedness !6
  br i1 %cmp131, label %for.body15.lr.ph, label %for.cond.cleanup14, !opID !425, !opSignedness !6

for.body15.lr.ph:                                 ; preds = %COLORING_FB
  %wide.trip.count = zext i32 %size_pixels to i64, !opID !426, !opSignedness !6
  br label %for.body15, !opID !427, !opSignedness !6

for.cond.cleanup14:                               ; preds = %for.body15, %COLORING_FB
  ret void, !opID !428, !opSignedness !6

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body15.lr.ph ], [ %indvars.iv.next, %for.body15 ], !opID !429, !opSignedness !6
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 2, !opID !430, !opSignedness !6
  %0 = load i8, i8* %color, align 1, !opID !431, !opSignedness !6
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 0, !opID !432, !opSignedness !6
  %1 = load i8, i8* %x, align 1, !opID !433, !opSignedness !6
  %idxprom20 = zext i8 %1 to i64, !opID !434, !opSignedness !6
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 1, !opID !435, !opSignedness !6
  %2 = load i8, i8* %y, align 1, !opID !436, !opSignedness !6
  %idxprom24 = zext i8 %2 to i64, !opID !437, !opSignedness !6
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 %idxprom20, i64 %idxprom24, !opID !438, !opSignedness !6
  store i8 %0, i8* %arrayidx25, align 1, !opID !439, !opSignedness !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !440, !opSignedness !6
  call void @profOp(i64 431, i8 11, i64 %indvars.iv.next, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64)
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !opID !441, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup14, label %for.body15, !llvm.loop !442, !opID !444, !opSignedness !6
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* nocapture readonly "fpga.decayed.dim.hint"="3192" %triangle_3ds, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %output) #13 !fpga.function.pragma !445 {
entry:
  %fragment = alloca [500 x %struct.CandidatePixel], align 1, !opID !447, !opSignedness !6
  %pixels = alloca [500 x %struct.Pixel], align 1, !opID !448, !opSignedness !6
  %0 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 0, i32 0, !opID !449, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* nonnull %0) #18, !opID !450, !opSignedness !6
  %1 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 0, i32 0, !opID !451, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* nonnull %1) #18, !opID !452, !opSignedness !6
  %frame_buffer9.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 0, i64 0, !opID !453, !opSignedness !6
  br label %for.body, !opID !454, !opSignedness !6

for.cond.cleanup:                                 ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* nonnull %1) #18, !opID !455, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* nonnull %0) #18, !opID !456, !opSignedness !6
  ret void, !opID !457, !opSignedness !6

for.body:                                         ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %_Z10coloringFBiiP5PixelPA256_h.exit ], !opID !458, !opSignedness !6
  %.elt = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 0, !opID !459, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !460, !opSignedness !6
  %.elt57 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 1, !opID !461, !opSignedness !6
  %.unpack58 = load i8, i8* %.elt57, align 1, !opID !462, !opSignedness !6
  %.elt59 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 2, !opID !463, !opSignedness !6
  %.unpack60 = load i8, i8* %.elt59, align 1, !opID !464, !opSignedness !6
  %.elt61 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 3, !opID !465, !opSignedness !6
  %.unpack62 = load i8, i8* %.elt61, align 1, !opID !466, !opSignedness !6
  %.elt63 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 4, !opID !467, !opSignedness !6
  %.unpack64 = load i8, i8* %.elt63, align 1, !opID !468, !opSignedness !6
  %.elt65 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 5, !opID !469, !opSignedness !6
  %.unpack66 = load i8, i8* %.elt65, align 1, !opID !470, !opSignedness !6
  %.elt67 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 6, !opID !471, !opSignedness !6
  %.unpack68 = load i8, i8* %.elt67, align 1, !opID !472, !opSignedness !6
  %.elt69 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 7, !opID !473, !opSignedness !6
  %.unpack70 = load i8, i8* %.elt69, align 1, !opID !474, !opSignedness !6
  %.elt71 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 8, !opID !475, !opSignedness !6
  %.unpack72 = load i8, i8* %.elt71, align 1, !opID !476, !opSignedness !6
  %2 = udiv i8 %.unpack60, 3, !opID !477, !opSignedness !6
  %3 = zext i8 %2 to i64
  call void @profOp(i64 464, i8 17, i64 0, i64 %3, double 0.000000e+00, i1 false, i1 false, i32 8)
  %4 = udiv i8 %.unpack66, 3, !opID !478, !opSignedness !6
  %5 = zext i8 %4 to i64
  call void @profOp(i64 465, i8 17, i64 0, i64 %5, double 0.000000e+00, i1 false, i1 false, i32 8)
  %addconv2.i = add nuw i8 %4, %2, !opID !479, !opSignedness !6
  %6 = sext i8 %addconv2.i to i64
  call void @profOp(i64 466, i8 11, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %7 = udiv i8 %.unpack72, 3, !opID !480, !opSignedness !6
  %8 = zext i8 %7 to i64
  call void @profOp(i64 467, i8 17, i64 0, i64 %8, double 0.000000e+00, i1 false, i1 false, i32 8)
  %add11.i = add i8 %addconv2.i, %7, !opID !481, !opSignedness !6
  %9 = sext i8 %add11.i to i64
  call void @profOp(i64 468, i8 11, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %conv.i.i90 = zext i8 %.unpack68 to i32, !opID !482, !opSignedness !6
  %conv1.i.i91 = zext i8 %.unpack to i32, !opID !483, !opSignedness !6
  %sub.i.i92 = sub nsw i32 %conv.i.i90, %conv1.i.i91, !opID !484, !opSignedness !6
  %10 = sext i32 %sub.i.i92 to i64
  call void @profOp(i64 471, i8 13, i64 %10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv2.i.i93 = zext i8 %.unpack64 to i32, !opID !485, !opSignedness !6
  %conv3.i.i94 = zext i8 %.unpack58 to i32, !opID !486, !opSignedness !6
  %sub4.i.i95 = sub nsw i32 %conv2.i.i93, %conv3.i.i94, !opID !487, !opSignedness !6
  %11 = sext i32 %sub4.i.i95 to i64
  call void @profOp(i64 474, i8 13, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul.i.i96 = mul nsw i32 %sub.i.i92, %sub4.i.i95, !opID !488, !opSignedness !6
  %12 = sext i32 %mul.i.i96 to i64
  call void @profOp(i64 475, i8 15, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv5.i.i97 = zext i8 %.unpack70 to i32, !opID !489, !opSignedness !6
  %sub8.i.i98 = sub nsw i32 %conv5.i.i97, %conv3.i.i94, !opID !490, !opSignedness !6
  %13 = sext i32 %sub8.i.i98 to i64
  call void @profOp(i64 477, i8 13, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv9.i.i99 = zext i8 %.unpack62 to i32, !opID !491, !opSignedness !6
  %sub12.i.i100 = sub nsw i32 %conv9.i.i99, %conv1.i.i91, !opID !492, !opSignedness !6
  %14 = sext i32 %sub12.i.i100 to i64
  call void @profOp(i64 479, i8 13, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13.i.i101 = mul nsw i32 %sub8.i.i98, %sub12.i.i100, !opID !493, !opSignedness !6
  %15 = sext i32 %mul13.i.i101 to i64
  call void @profOp(i64 480, i8 15, i64 %15, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub14.i.i = sub nsw i32 %mul.i.i96, %mul13.i.i101, !opID !494, !opSignedness !6
  %16 = sext i32 %sub14.i.i to i64
  call void @profOp(i64 481, i8 13, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp.i102 = icmp eq i32 %sub14.i.i, 0, !opID !495, !opSignedness !6
  br i1 %cmp.i102, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, label %if.end.i103, !opID !496, !opSignedness !6

if.end.i103:                                      ; preds = %for.body
  %cmp3.i = icmp slt i32 %sub14.i.i, 0, !opID !497, !opSignedness !6
  %spec.select = select i1 %cmp3.i, i8 %.unpack58, i8 %.unpack64, !opID !498, !opSignedness !6
  %spec.select158 = select i1 %cmp3.i, i8 %.unpack64, i8 %.unpack58, !opID !499, !opSignedness !6
  %spec.select159 = select i1 %cmp3.i, i8 %.unpack, i8 %.unpack62, !opID !500, !opSignedness !6
  %spec.select160 = select i1 %cmp3.i, i8 %.unpack62, i8 %.unpack, !opID !501, !opSignedness !6
  %cmp4.i47.i = icmp ult i8 %spec.select160, %.unpack68, !opID !502, !opSignedness !6
  %in0.in2.i48.i = select i1 %cmp4.i47.i, i8 %spec.select160, i8 %.unpack68, !opID !503, !opSignedness !6
  %17 = icmp ult i8 %in0.in2.i48.i, %spec.select159, !opID !504, !opSignedness !6
  %retval.0.i49.i = select i1 %17, i8 %in0.in2.i48.i, i8 %spec.select159, !opID !505, !opSignedness !6
  %cmp4.i44.i = icmp ugt i8 %spec.select160, %.unpack68, !opID !506, !opSignedness !6
  %in0.in2.i45.i = select i1 %cmp4.i44.i, i8 %spec.select160, i8 %.unpack68, !opID !507, !opSignedness !6
  %18 = icmp ugt i8 %in0.in2.i45.i, %spec.select159, !opID !508, !opSignedness !6
  %retval.0.i46.i = select i1 %18, i8 %in0.in2.i45.i, i8 %spec.select159, !opID !509, !opSignedness !6
  %cmp4.i41.i = icmp ult i8 %spec.select158, %.unpack70, !opID !510, !opSignedness !6
  %in0.in2.i42.i = select i1 %cmp4.i41.i, i8 %spec.select158, i8 %.unpack70, !opID !511, !opSignedness !6
  %19 = icmp ult i8 %in0.in2.i42.i, %spec.select, !opID !512, !opSignedness !6
  %retval.0.i43.i = select i1 %19, i8 %in0.in2.i42.i, i8 %spec.select, !opID !513, !opSignedness !6
  %cmp4.i.i = icmp ugt i8 %spec.select158, %.unpack70, !opID !514, !opSignedness !6
  %in0.in2.i.i = select i1 %cmp4.i.i, i8 %spec.select158, i8 %.unpack70, !opID !515, !opSignedness !6
  %20 = icmp ugt i8 %in0.in2.i.i, %spec.select, !opID !516, !opSignedness !6
  %retval.0.i.i = select i1 %20, i8 %in0.in2.i.i, i8 %spec.select, !opID !517, !opSignedness !6
  %sub.i = sub i8 %retval.0.i46.i, %retval.0.i49.i, !opID !518, !opSignedness !6
  %21 = sext i8 %sub.i to i64
  call void @profOp(i64 505, i8 13, i64 %21, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %conv25.i = zext i8 %retval.0.i46.i to i32, !opID !519, !opSignedness !6
  %conv27.i = zext i8 %retval.0.i49.i to i32, !opID !520, !opSignedness !6
  %sub28.i = sub nsw i32 %conv25.i, %conv27.i, !opID !521, !opSignedness !6
  %22 = sext i32 %sub28.i to i64
  call void @profOp(i64 508, i8 13, i64 %22, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv30.i = zext i8 %retval.0.i.i to i32, !opID !522, !opSignedness !6
  %conv32.i = zext i8 %retval.0.i43.i to i32, !opID !523, !opSignedness !6
  %sub33.i = sub nsw i32 %conv30.i, %conv32.i, !opID !524, !opSignedness !6
  %23 = sext i32 %sub33.i to i64
  call void @profOp(i64 511, i8 13, i64 %23, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul.i = mul nsw i32 %sub33.i, %sub28.i, !opID !525, !opSignedness !6
  %24 = sext i32 %mul.i to i64
  call void @profOp(i64 512, i8 15, i64 %24, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp13.i = icmp sgt i32 %mul.i, 0, !opID !526, !opSignedness !6
  br i1 %cmp13.i, label %for.body.lr.ph.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, !opID !527, !opSignedness !6

for.body.lr.ph.i:                                 ; preds = %if.end.i103
  %sub22.i.i = sub nsw i32 %conv5.i.i97, %conv2.i.i93, !opID !528, !opSignedness !6
  %25 = sext i32 %sub22.i.i to i64
  call void @profOp(i64 515, i8 13, i64 %25, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub31.i.i = sub nsw i32 %conv.i.i90, %conv9.i.i99, !opID !529, !opSignedness !6
  %26 = sext i32 %sub31.i.i to i64
  call void @profOp(i64 516, i8 13, i64 %26, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub42.i.i = sub nsw i32 %conv3.i.i94, %conv5.i.i97, !opID !530, !opSignedness !6
  %27 = sext i32 %sub42.i.i to i64
  call void @profOp(i64 517, i8 13, i64 %27, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub52.i.i = sub nsw i32 %conv1.i.i91, %conv.i.i90, !opID !531, !opSignedness !6
  %28 = sext i32 %sub52.i.i to i64
  call void @profOp(i64 518, i8 13, i64 %28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv3.i = zext i8 %sub.i to i32, !opID !532, !opSignedness !6
  br label %for.body.i, !opID !533, !opSignedness !6

for.body.i:                                       ; preds = %if.end23.i, %for.body.lr.ph.i
  %k.015.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc24.i, %if.end23.i ], !opID !534, !opSignedness !6
  %i.014.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %i.1.i, %if.end23.i ], !opID !535, !opSignedness !6
  %rem.urem.i = urem i32 %k.015.i, %conv3.i, !opID !536, !opSignedness !6
  %29 = zext i32 %rem.urem.i to i64
  call void @profOp(i64 523, i8 20, i64 0, i64 %29, double 0.000000e+00, i1 false, i1 false, i32 32)
  %30 = trunc i32 %rem.urem.i to i8, !opID !537, !opSignedness !6
  %conv4.i = add i8 %retval.0.i49.i, %30, !opID !538, !opSignedness !6
  %31 = sext i8 %conv4.i to i64
  call void @profOp(i64 525, i8 11, i64 %31, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %div.udiv.i = udiv i32 %k.015.i, %conv3.i, !opID !539, !opSignedness !6
  %32 = zext i32 %div.udiv.i to i64
  call void @profOp(i64 526, i8 17, i64 0, i64 %32, double 0.000000e+00, i1 false, i1 false, i32 32)
  %33 = trunc i32 %div.udiv.i to i8, !opID !540, !opSignedness !6
  %conv10.i = add i8 %retval.0.i43.i, %33, !opID !541, !opSignedness !6
  %34 = sext i8 %conv10.i to i64
  call void @profOp(i64 528, i8 11, i64 %34, i64 0, double 0.000000e+00, i1 true, i1 false, i32 8)
  %conv.i.i = zext i8 %conv4.i to i32, !opID !542, !opSignedness !6
  %sub.i.i = sub nsw i32 %conv.i.i, %conv1.i.i91, !opID !543, !opSignedness !6
  %35 = sext i32 %sub.i.i to i64
  call void @profOp(i64 530, i8 13, i64 %35, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul.i.i = mul nsw i32 %sub.i.i, %sub4.i.i95, !opID !544, !opSignedness !6
  %36 = sext i32 %mul.i.i to i64
  call void @profOp(i64 531, i8 15, i64 %36, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %conv5.i.i = zext i8 %conv10.i to i32, !opID !545, !opSignedness !6
  %sub8.i.i = sub nsw i32 %conv5.i.i, %conv3.i.i94, !opID !546, !opSignedness !6
  %37 = sext i32 %sub8.i.i to i64
  call void @profOp(i64 533, i8 13, i64 %37, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul13.i.i = mul nsw i32 %sub8.i.i, %sub12.i.i100, !opID !547, !opSignedness !6
  %38 = sext i32 %mul13.i.i to i64
  call void @profOp(i64 534, i8 15, i64 %38, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub18.i.i = sub nsw i32 %conv.i.i, %conv9.i.i99, !opID !548, !opSignedness !6
  %39 = sext i32 %sub18.i.i to i64
  call void @profOp(i64 535, i8 13, i64 %39, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul23.i.i = mul nsw i32 %sub18.i.i, %sub22.i.i, !opID !549, !opSignedness !6
  %40 = sext i32 %mul23.i.i to i64
  call void @profOp(i64 536, i8 15, i64 %40, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub27.i.i = sub nsw i32 %conv5.i.i, %conv2.i.i93, !opID !550, !opSignedness !6
  %41 = sext i32 %sub27.i.i to i64
  call void @profOp(i64 537, i8 13, i64 %41, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul32.i.i = mul nsw i32 %sub27.i.i, %sub31.i.i, !opID !551, !opSignedness !6
  %42 = sext i32 %mul32.i.i to i64
  call void @profOp(i64 538, i8 15, i64 %42, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub37.i.i = sub nsw i32 %conv.i.i, %conv.i.i90, !opID !552, !opSignedness !6
  %43 = sext i32 %sub37.i.i to i64
  call void @profOp(i64 539, i8 13, i64 %43, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul43.i.i = mul nsw i32 %sub37.i.i, %sub42.i.i, !opID !553, !opSignedness !6
  %44 = sext i32 %mul43.i.i to i64
  call void @profOp(i64 540, i8 15, i64 %44, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %sub47.i.i = sub nsw i32 %conv5.i.i, %conv5.i.i97, !opID !554, !opSignedness !6
  %45 = sext i32 %sub47.i.i to i64
  call void @profOp(i64 541, i8 13, i64 %45, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %mul53.i.i = mul nsw i32 %sub47.i.i, %sub52.i.i, !opID !555, !opSignedness !6
  %46 = sext i32 %mul53.i.i to i64
  call void @profOp(i64 542, i8 15, i64 %46, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp.i.i = icmp sge i32 %mul.i.i, %mul13.i.i, !opID !556, !opSignedness !6
  %cmp55.i.i = icmp sge i32 %mul23.i.i, %mul32.i.i, !opID !557, !opSignedness !6
  %or.cond.i.i = and i1 %cmp.i.i, %cmp55.i.i, !opID !558, !opSignedness !6
  %47 = sext i1 %or.cond.i.i to i64
  call void @profOp(i64 545, i8 26, i64 %47, i64 0, double 0.000000e+00, i1 true, i1 false, i32 1)
  %cmp56.i.i = icmp sge i32 %mul43.i.i, %mul53.i.i, !opID !559, !opSignedness !6
  %or.cond.i = and i1 %cmp56.i.i, %or.cond.i.i, !opID !560, !opSignedness !6
  %48 = sext i1 %or.cond.i to i64
  call void @profOp(i64 547, i8 26, i64 %48, i64 0, double 0.000000e+00, i1 true, i1 false, i32 1)
  br i1 %or.cond.i, label %if.then11.i, label %if.end23.i, !opID !561, !opSignedness !6

if.then11.i:                                      ; preds = %for.body.i
  %idxprom.i = sext i32 %i.014.i to i64, !opID !562, !opSignedness !6
  %x13.i85 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 0, !opID !563, !opSignedness !6
  store i8 %conv4.i, i8* %x13.i85, align 1, !opID !564, !opSignedness !6
  %y16.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 1, !opID !565, !opSignedness !6
  store i8 %conv10.i, i8* %y16.i, align 1, !opID !566, !opSignedness !6
  %z19.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 2, !opID !567, !opSignedness !6
  store i8 %add11.i, i8* %z19.i, align 1, !opID !568, !opSignedness !6
  %color22.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 3, !opID !569, !opSignedness !6
  store i8 100, i8* %color22.i, align 1, !opID !570, !opSignedness !6
  %inc.i = add i32 %i.014.i, 1, !opID !571, !opSignedness !6
  %49 = sext i32 %inc.i to i64
  call void @profOp(i64 558, i8 11, i64 %49, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  br label %if.end23.i, !opID !572, !opSignedness !6

if.end23.i:                                       ; preds = %if.then11.i, %for.body.i
  %i.1.i = phi i32 [ %inc.i, %if.then11.i ], [ %i.014.i, %for.body.i ], !opID !573, !opSignedness !6
  %inc24.i = add nuw nsw i32 %k.015.i, 1, !opID !574, !opSignedness !6
  %50 = sext i32 %inc24.i to i64
  call void @profOp(i64 561, i8 11, i64 %50, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  %cmp.i86 = icmp slt i32 %inc24.i, %mul.i, !opID !575, !opSignedness !6
  br i1 %cmp.i86, label %for.body.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, !llvm.loop !365, !opID !576, !opSignedness !6

_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit: ; preds = %if.end23.i, %if.end.i103, %for.body
  %retval.0.i = phi i32 [ 0, %if.end.i103 ], [ 0, %for.body ], [ %i.1.i, %if.end23.i ], !opID !577, !opSignedness !6
  %cmp.i74 = icmp eq i64 %indvars.iv, 0, !opID !578, !opSignedness !6
  br i1 %cmp.i74, label %ZCULLING_INIT_ROW.i, label %if.end.i, !opID !579, !opSignedness !6

ZCULLING_INIT_ROW.i:                              ; preds = %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false) #18, !opID !580, !opSignedness !6
  br label %if.end.i, !opID !581, !opSignedness !6

if.end.i:                                         ; preds = %ZCULLING_INIT_ROW.i, %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  %cmp121.i = icmp sgt i32 %retval.0.i, 0, !opID !582, !opSignedness !6
  br i1 %cmp121.i, label %for.body14.lr.ph.i, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit, !opID !583, !opSignedness !6

for.body14.lr.ph.i:                               ; preds = %if.end.i
  %wide.trip.count.i75 = zext i32 %retval.0.i to i64, !opID !584, !opSignedness !6
  br label %for.body14.i, !opID !585, !opSignedness !6

for.body14.i:                                     ; preds = %for.inc60.i, %for.body14.lr.ph.i
  %indvars.iv.i76 = phi i64 [ 0, %for.body14.lr.ph.i ], [ %indvars.iv.next.i81, %for.inc60.i ], !opID !586, !opSignedness !6
  %pixel_cntr.02.i = phi i32 [ 0, %for.body14.lr.ph.i ], [ %pixel_cntr.1.i, %for.inc60.i ], !opID !587, !opSignedness !6
  %z.i77 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 2, !opID !588, !opSignedness !6
  %51 = load i8, i8* %z.i77, align 1, !opID !589, !opSignedness !6
  %y.i78 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 1, !opID !590, !opSignedness !6
  %52 = load i8, i8* %y.i78, align 1, !opID !591, !opSignedness !6
  %idxprom19.i = zext i8 %52 to i64, !opID !592, !opSignedness !6
  %x.i79 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 0, !opID !593, !opSignedness !6
  %53 = load i8, i8* %x.i79, align 1, !opID !594, !opSignedness !6
  %idxprom23.i = zext i8 %53 to i64, !opID !595, !opSignedness !6
  %arrayidx24.i = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19.i, i64 %idxprom23.i, !opID !596, !opSignedness !6
  %54 = load i8, i8* %arrayidx24.i, align 1, !opID !597, !opSignedness !6
  %cmp26.i = icmp ult i8 %51, %54, !opID !598, !opSignedness !6
  br i1 %cmp26.i, label %if.then27.i, label %for.inc60.i, !opID !599, !opSignedness !6

if.then27.i:                                      ; preds = %for.body14.i
  %idxprom31.i = sext i32 %pixel_cntr.02.i to i64, !opID !600, !opSignedness !6
  %x33.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 0, !opID !601, !opSignedness !6
  store i8 %53, i8* %x33.i, align 1, !opID !602, !opSignedness !6
  %y39.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 1, !opID !603, !opSignedness !6
  store i8 %52, i8* %y39.i, align 1, !opID !604, !opSignedness !6
  %color.i80 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 3, !opID !605, !opSignedness !6
  %55 = load i8, i8* %color.i80, align 1, !opID !606, !opSignedness !6
  %color44.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 2, !opID !607, !opSignedness !6
  store i8 %55, i8* %color44.i, align 1, !opID !608, !opSignedness !6
  %inc45.i = add i32 %pixel_cntr.02.i, 1, !opID !609, !opSignedness !6
  %56 = sext i32 %inc45.i to i64
  call void @profOp(i64 596, i8 11, i64 %56, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  store i8 %51, i8* %arrayidx24.i, align 1, !opID !610, !opSignedness !6
  br label %for.inc60.i, !opID !611, !opSignedness !6

for.inc60.i:                                      ; preds = %if.then27.i, %for.body14.i
  %pixel_cntr.1.i = phi i32 [ %inc45.i, %if.then27.i ], [ %pixel_cntr.02.i, %for.body14.i ], !opID !612, !opSignedness !6
  %indvars.iv.next.i81 = add nuw nsw i64 %indvars.iv.i76, 1, !opID !613, !opSignedness !6
  call void @profOp(i64 600, i8 11, i64 %indvars.iv.next.i81, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64)
  %exitcond.i82 = icmp eq i64 %indvars.iv.next.i81, %wide.trip.count.i75, !opID !614, !opSignedness !6
  br i1 %exitcond.i82, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit, label %for.body14.i, !llvm.loop !416, !opID !615, !opSignedness !6

_Z8zcullingiP14CandidatePixeliP5Pixel.exit:       ; preds = %for.inc60.i, %if.end.i
  %pixel_cntr.0.lcssa.i = phi i32 [ 0, %if.end.i ], [ %pixel_cntr.1.i, %for.inc60.i ], !opID !616, !opSignedness !6
  br i1 %cmp.i74, label %COLORING_FB_INIT_ROW.i, label %COLORING_FB.i, !opID !617, !opSignedness !6

COLORING_FB_INIT_ROW.i:                           ; preds = %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9.i, i8 0, i64 65536, i1 false) #18, !opID !618, !opSignedness !6
  br label %COLORING_FB.i, !opID !619, !opSignedness !6

COLORING_FB.i:                                    ; preds = %COLORING_FB_INIT_ROW.i, %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  %cmp131.i = icmp sgt i32 %pixel_cntr.0.lcssa.i, 0, !opID !620, !opSignedness !6
  br i1 %cmp131.i, label %for.body15.lr.ph.i, label %_Z10coloringFBiiP5PixelPA256_h.exit, !opID !621, !opSignedness !6

for.body15.lr.ph.i:                               ; preds = %COLORING_FB.i
  %wide.trip.count.i = zext i32 %pixel_cntr.0.lcssa.i to i64, !opID !622, !opSignedness !6
  br label %for.body15.i, !opID !623, !opSignedness !6

for.body15.i:                                     ; preds = %for.body15.i, %for.body15.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body15.lr.ph.i ], [ %indvars.iv.next.i, %for.body15.i ], !opID !624, !opSignedness !6
  %color.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 2, !opID !625, !opSignedness !6
  %57 = load i8, i8* %color.i, align 1, !opID !626, !opSignedness !6
  %x.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 0, !opID !627, !opSignedness !6
  %58 = load i8, i8* %x.i, align 1, !opID !628, !opSignedness !6
  %idxprom20.i = zext i8 %58 to i64, !opID !629, !opSignedness !6
  %y.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 1, !opID !630, !opSignedness !6
  %59 = load i8, i8* %y.i, align 1, !opID !631, !opSignedness !6
  %idxprom24.i = zext i8 %59 to i64, !opID !632, !opSignedness !6
  %arrayidx25.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 %idxprom20.i, i64 %idxprom24.i, !opID !633, !opSignedness !6
  store i8 %57, i8* %arrayidx25.i, align 1, !opID !634, !opSignedness !6
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !opID !635, !opSignedness !6
  call void @profOp(i64 622, i8 11, i64 %indvars.iv.next.i, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64)
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i, !opID !636, !opSignedness !6
  br i1 %exitcond.i, label %_Z10coloringFBiiP5PixelPA256_h.exit, label %for.body15.i, !llvm.loop !442, !opID !637, !opSignedness !6

_Z10coloringFBiiP5PixelPA256_h.exit:              ; preds = %for.body15.i, %COLORING_FB.i
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !638, !opSignedness !6
  call void @profOp(i64 625, i8 11, i64 %indvars.iv.next, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64)
  %exitcond = icmp eq i64 %indvars.iv.next, 3192, !opID !639, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup, label %for.body, !llvm.loop !640, !opID !642, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #11

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #11

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #14 {
entry:
  %retval = alloca i32, align 4, !opID !643, !opSignedness !6
  %argc.addr = alloca i32, align 4, !opID !644, !opSignedness !6
  %argv.addr = alloca i8**, align 8, !opID !645, !opSignedness !6
  %triangle_3ds = alloca [3192 x %struct.Triangle_3D], align 16, !opID !646, !opSignedness !6
  %output = alloca [256 x [256 x i8]], align 16, !opID !647, !opSignedness !6
  store i32 0, i32* %retval, align 4, !opID !648, !opSignedness !6
  store i32 %argc, i32* %argc.addr, align 4, !opID !649, !opSignedness !6
  store i8** %argv, i8*** %argv.addr, align 8, !opID !650, !opSignedness !6
  %0 = load i8**, i8*** %argv.addr, align 8, !opID !651, !opSignedness !6
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !opID !652, !opSignedness !6
  %1 = load i8*, i8** %arrayidx, align 8, !opID !653, !opSignedness !6
  %arraydecay = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0, !opID !654, !opSignedness !6
  call void @populateInput(i8* %1, %struct.Triangle_3D* %arraydecay), !opID !655, !opSignedness !6
  %arraydecay1 = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0, !opID !656, !opSignedness !6
  %arraydecay2 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0, !opID !657, !opSignedness !6
  call void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* %arraydecay1, [256 x i8]* %arraydecay2), !opID !658, !opSignedness !6
  %arraydecay3 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0, !opID !659, !opSignedness !6
  call void @populateOutput([256 x i8]* %arraydecay3), !opID !660, !opSignedness !6
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @profileFileName, i32 0, i32 0))
  ret i32 0, !opID !1, !opSignedness !6
}

; Function Attrs: noinline nounwind optnone uwtable
define void @saveProfile(i8* %fileName) #1 {
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
  call void @free(i8* %27) #18
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

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #15

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #15

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fclose(%struct._IO_FILE*) #15

declare i32 @printf(i8*, ...) #15

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %filename, %struct.Triangle_3D* %triangle_3ds) #16 {
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
  call void @exit(i32 1) #19
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
declare void @exit(i32) #17

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #15

; Function Attrs: noinline optnone uwtable
define void @populateOutput([256 x i8]* %output) #16 {
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
  call void @exit(i32 1) #19
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

attributes #0 = { argmemonly norecurse nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="check_clockwise" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="clockwise_vertices" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly norecurse nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="pixel_in_triangle" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly norecurse nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_min" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly norecurse nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_max" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="projection" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization2" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="zculling" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { argmemonly nounwind willreturn }
attributes #12 = { argmemonly norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="coloringFB" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rendering" "fpga.top.func"="rendering" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { nounwind }
attributes #19 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!opIDCounter = !{!1}
!llvm.module.flags = !{!2, !3, !4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i64 646}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i64 1}
!6 = !{!"unknownSignedness"}
!7 = !{i64 2}
!8 = !{i64 3}
!9 = !{i64 4}
!10 = !{i64 5}
!11 = !{i64 6}
!12 = !{i64 7}
!13 = !{i64 8}
!14 = !{i64 9}
!15 = !{i64 10}
!16 = !{i64 11}
!17 = !{i64 12}
!18 = !{i64 13}
!19 = !{i64 14}
!20 = !{i64 15}
!21 = !{i64 16}
!22 = !{i64 17}
!23 = !{i64 18}
!24 = !{i64 19}
!25 = !{i64 20}
!26 = !{i64 21}
!27 = !{i64 22}
!28 = !{i64 23}
!29 = !{i64 24}
!30 = !{i64 25}
!31 = !{i64 26}
!32 = !{i64 27}
!33 = !{i64 28}
!34 = !{i64 29}
!35 = !{i64 30}
!36 = !{i64 31}
!37 = !{i64 32}
!38 = !{i64 33}
!39 = !{i64 34}
!40 = !{i64 35}
!41 = !{i64 36}
!42 = !{i64 37}
!43 = !{i64 38}
!44 = !{i64 39}
!45 = !{i64 40}
!46 = !{i64 41}
!47 = !{i64 42}
!48 = !{i64 43}
!49 = !{i64 44}
!50 = !{i64 45}
!51 = !{i64 46}
!52 = !{i64 47}
!53 = !{i64 48}
!54 = !{i64 49}
!55 = !{i64 50}
!56 = !{i64 51}
!57 = !{i64 52}
!58 = !{i64 53}
!59 = !{i64 54}
!60 = !{i64 55}
!61 = !{i64 56}
!62 = !{i64 57}
!63 = !{i64 58}
!64 = !{i64 59}
!65 = !{i64 60}
!66 = !{i64 61}
!67 = !{i64 62}
!68 = !{i64 63}
!69 = !{i64 64}
!70 = !{i64 65}
!71 = !{i64 66}
!72 = !{i64 67}
!73 = !{i64 68}
!74 = !{i64 69}
!75 = !{i64 70}
!76 = !{i64 71}
!77 = !{i64 72}
!78 = !{i64 73}
!79 = !{i64 74}
!80 = !{i64 75}
!81 = !{i64 76}
!82 = !{i64 77}
!83 = !{i64 78}
!84 = !{i64 79}
!85 = !{i64 80}
!86 = !{i64 81}
!87 = !{i64 82}
!88 = !{i64 83}
!89 = !{i64 84}
!90 = !{i64 85}
!91 = !{i64 86}
!92 = !{i64 87}
!93 = !{i64 88}
!94 = !{i64 89}
!95 = !{i64 90}
!96 = !{i64 91}
!97 = !{i64 92}
!98 = !{i64 93}
!99 = !{i64 94}
!100 = !{i64 95}
!101 = !{i64 96}
!102 = !{i64 97}
!103 = !{i64 98}
!104 = !{i64 99}
!105 = !{i64 100}
!106 = !{i64 101}
!107 = !{i64 102}
!108 = !{i64 103}
!109 = !{i64 104}
!110 = !{i64 105}
!111 = !{i64 106}
!112 = !{i64 107}
!113 = !{i64 108}
!114 = !{i64 109}
!115 = !{i64 110}
!116 = !{i64 111}
!117 = !{i64 112}
!118 = !{i64 113}
!119 = !{i64 114}
!120 = !{i64 115}
!121 = !{i64 116}
!122 = !{i64 117}
!123 = !{i64 118}
!124 = !{i64 119}
!125 = !{i64 120}
!126 = !{i64 121}
!127 = !{i64 122}
!128 = !{i64 123}
!129 = !{i64 124}
!130 = !{i64 125}
!131 = !{i64 126}
!132 = !{i64 127}
!133 = !{i64 128}
!134 = !{i64 129}
!135 = !{i64 130}
!136 = !{i64 131}
!137 = !{i64 132}
!138 = !{i64 133}
!139 = !{i64 134}
!140 = !{i64 135}
!141 = !{i64 136}
!142 = !{i64 137}
!143 = !{i64 138}
!144 = !{i64 139}
!145 = !{i64 140}
!146 = !{i64 141}
!147 = !{i64 142}
!148 = !{i64 143}
!149 = !{i64 144}
!150 = !{i64 145}
!151 = !{i64 146}
!152 = !{i64 147}
!153 = !{i64 148}
!154 = !{i64 149}
!155 = !{i64 150}
!156 = !{i64 151}
!157 = !{i64 152}
!158 = !{i64 153}
!159 = !{i64 154}
!160 = !{i64 155}
!161 = !{i64 156}
!162 = !{i64 157}
!163 = !{i64 158}
!164 = !{i64 159}
!165 = !{i64 160}
!166 = !{i64 161}
!167 = !{i64 162}
!168 = !{i64 163}
!169 = !{i64 164}
!170 = !{i64 165}
!171 = !{i64 166}
!172 = !{i64 167}
!173 = !{i64 168}
!174 = !{i64 169}
!175 = !{i64 170}
!176 = !{i64 171}
!177 = !{i64 172}
!178 = !{i64 173}
!179 = !{i64 174}
!180 = !{i64 175}
!181 = !{i64 176}
!182 = !{i64 177}
!183 = !{i64 178}
!184 = !{i64 179}
!185 = !{i64 180}
!186 = !{i64 181}
!187 = !{i64 182}
!188 = !{i64 183}
!189 = !{i64 184}
!190 = !{i64 185}
!191 = !{i64 186}
!192 = !{i64 187}
!193 = !{i64 188}
!194 = !{i64 189}
!195 = !{i64 190}
!196 = !{i64 191}
!197 = !{i64 192}
!198 = !{i64 193}
!199 = !{i64 194}
!200 = !{i64 195}
!201 = !{i64 196}
!202 = !{i64 197}
!203 = !{i64 198}
!204 = !{i64 199}
!205 = !{i64 200}
!206 = !{i64 201}
!207 = !{i64 202}
!208 = !{i64 203}
!209 = !{i64 204}
!210 = !{i64 205}
!211 = !{i64 206}
!212 = !{i64 207}
!213 = !{i64 208}
!214 = !{i64 209}
!215 = !{i64 210}
!216 = !{i64 211}
!217 = !{i64 212}
!218 = !{i64 213}
!219 = !{i64 214}
!220 = !{i64 215}
!221 = !{i64 216}
!222 = !{i64 217}
!223 = !{i64 218}
!224 = !{i64 219}
!225 = !{i64 220}
!226 = !{i64 221}
!227 = !{i64 222}
!228 = !{i64 223}
!229 = !{i64 224}
!230 = !{i64 225}
!231 = !{i64 226}
!232 = !{i64 227}
!233 = !{i64 228}
!234 = !{i64 229}
!235 = !{i64 230}
!236 = !{i64 231}
!237 = !{i64 232}
!238 = !{i64 233}
!239 = !{i64 234}
!240 = !{i64 235}
!241 = !{i64 236}
!242 = !{i64 237}
!243 = !{i64 238}
!244 = !{i64 239}
!245 = !{i64 240}
!246 = !{i64 241}
!247 = !{i64 242}
!248 = !{i64 243}
!249 = !{i64 244}
!250 = !{i64 245}
!251 = !{i64 246}
!252 = !{i64 247}
!253 = !{i64 248}
!254 = !{i64 249}
!255 = !{i64 250}
!256 = !{i64 251}
!257 = !{i64 252}
!258 = !{i64 253}
!259 = !{i64 254}
!260 = !{i64 255}
!261 = !{i64 256}
!262 = !{i64 257}
!263 = !{i64 258}
!264 = !{i64 259}
!265 = !{i64 260}
!266 = !{i64 261}
!267 = !{i64 262}
!268 = !{i64 263}
!269 = !{i64 264}
!270 = !{i64 265}
!271 = !{i64 266}
!272 = !{i64 267}
!273 = !{i64 268}
!274 = !{i64 269}
!275 = !{i64 270}
!276 = !{i64 271}
!277 = !{i64 272}
!278 = !{i64 273}
!279 = !{i64 274}
!280 = !{i64 275}
!281 = !{i64 276}
!282 = !{i64 277}
!283 = !{i64 278}
!284 = !{i64 279}
!285 = !{i64 280}
!286 = !{i64 281}
!287 = !{i64 282}
!288 = !{i64 283}
!289 = !{i64 284}
!290 = !{i64 285}
!291 = !{i64 286}
!292 = !{i64 287}
!293 = !{i64 288}
!294 = !{i64 289}
!295 = !{i64 290}
!296 = !{i64 291}
!297 = !{i64 292}
!298 = !{i64 293}
!299 = !{i64 294}
!300 = !{i64 295}
!301 = !{i64 296}
!302 = !{i64 297}
!303 = !{i64 298}
!304 = !{i64 299}
!305 = !{i64 300}
!306 = !{i64 301}
!307 = !{i64 302}
!308 = !{i64 303}
!309 = !{i64 304}
!310 = !{i64 305}
!311 = !{i64 306}
!312 = !{i64 307}
!313 = !{i64 308}
!314 = !{i64 309}
!315 = !{i64 310}
!316 = !{i64 311}
!317 = !{i64 312}
!318 = !{i64 313}
!319 = !{i64 314}
!320 = !{i64 315}
!321 = !{i64 316}
!322 = !{i64 317}
!323 = !{i64 318}
!324 = !{i64 319}
!325 = !{i64 320}
!326 = !{i64 321}
!327 = !{i64 322}
!328 = !{i64 323}
!329 = !{i64 324}
!330 = !{i64 325}
!331 = !{i64 326}
!332 = !{i64 327}
!333 = !{i64 328}
!334 = !{i64 329}
!335 = !{i64 330}
!336 = !{i64 331}
!337 = !{i64 332}
!338 = !{i64 333}
!339 = !{i64 334}
!340 = !{i64 335}
!341 = !{i64 336}
!342 = !{i64 337}
!343 = !{i64 338}
!344 = !{i64 339}
!345 = !{i64 340}
!346 = !{i64 341}
!347 = !{i64 342}
!348 = !{i64 343}
!349 = !{i64 344}
!350 = !{i64 345}
!351 = !{i64 346}
!352 = !{i64 347}
!353 = !{i64 348}
!354 = !{i64 349}
!355 = !{i64 350}
!356 = !{i64 351}
!357 = !{i64 352}
!358 = !{i64 353}
!359 = !{i64 354}
!360 = !{i64 355}
!361 = !{i64 356}
!362 = !{i64 357}
!363 = !{i64 358}
!364 = !{i64 359}
!365 = distinct !{!365, !366}
!366 = !{!"llvm.loop.name", !"RAST2"}
!367 = !{i64 360}
!368 = !{i64 361}
!369 = !{i64 362}
!370 = !{i64 363}
!371 = !{i64 364}
!372 = !{i64 365}
!373 = !{i64 366}
!374 = !{i64 367}
!375 = !{i64 368}
!376 = !{i64 369}
!377 = !{i64 370}
!378 = !{i64 371}
!379 = !{i64 372}
!380 = !{i64 373}
!381 = !{i64 374}
!382 = !{i64 375}
!383 = !{i64 376}
!384 = !{i64 377}
!385 = !{i64 378}
!386 = !{i64 379}
!387 = !{i64 380}
!388 = !{i64 381}
!389 = !{i64 382}
!390 = !{i64 383}
!391 = !{i64 384}
!392 = !{i64 385}
!393 = !{i64 386}
!394 = !{i64 387}
!395 = !{i64 388}
!396 = !{i64 389}
!397 = !{i64 390}
!398 = !{i64 391}
!399 = !{i64 392}
!400 = !{i64 393}
!401 = !{i64 394}
!402 = !{i64 395}
!403 = !{i64 396}
!404 = !{i64 397}
!405 = !{i64 398}
!406 = !{i64 399}
!407 = !{i64 400}
!408 = !{i64 401}
!409 = !{i64 402}
!410 = !{i64 403}
!411 = !{i64 404}
!412 = !{i64 405}
!413 = !{i64 406}
!414 = !{i64 407}
!415 = !{i64 408}
!416 = distinct !{!416, !417}
!417 = !{!"llvm.loop.name", !"ZCULLING"}
!418 = !{i64 409}
!419 = !{i64 410}
!420 = !{i64 411}
!421 = !{i64 412}
!422 = !{i64 413}
!423 = !{i64 414}
!424 = !{i64 415}
!425 = !{i64 416}
!426 = !{i64 417}
!427 = !{i64 418}
!428 = !{i64 419}
!429 = !{i64 420}
!430 = !{i64 421}
!431 = !{i64 422}
!432 = !{i64 423}
!433 = !{i64 424}
!434 = !{i64 425}
!435 = !{i64 426}
!436 = !{i64 427}
!437 = !{i64 428}
!438 = !{i64 429}
!439 = !{i64 430}
!440 = !{i64 431}
!441 = !{i64 432}
!442 = distinct !{!442, !443}
!443 = !{!"llvm.loop.name", !"COLORING_FB"}
!444 = !{i64 433}
!445 = !{!446}
!446 = !{!"fpga.top", !"user"}
!447 = !{i64 434}
!448 = !{i64 435}
!449 = !{i64 436}
!450 = !{i64 437}
!451 = !{i64 438}
!452 = !{i64 439}
!453 = !{i64 440}
!454 = !{i64 441}
!455 = !{i64 442}
!456 = !{i64 443}
!457 = !{i64 444}
!458 = !{i64 445}
!459 = !{i64 446}
!460 = !{i64 447}
!461 = !{i64 448}
!462 = !{i64 449}
!463 = !{i64 450}
!464 = !{i64 451}
!465 = !{i64 452}
!466 = !{i64 453}
!467 = !{i64 454}
!468 = !{i64 455}
!469 = !{i64 456}
!470 = !{i64 457}
!471 = !{i64 458}
!472 = !{i64 459}
!473 = !{i64 460}
!474 = !{i64 461}
!475 = !{i64 462}
!476 = !{i64 463}
!477 = !{i64 464}
!478 = !{i64 465}
!479 = !{i64 466}
!480 = !{i64 467}
!481 = !{i64 468}
!482 = !{i64 469}
!483 = !{i64 470}
!484 = !{i64 471}
!485 = !{i64 472}
!486 = !{i64 473}
!487 = !{i64 474}
!488 = !{i64 475}
!489 = !{i64 476}
!490 = !{i64 477}
!491 = !{i64 478}
!492 = !{i64 479}
!493 = !{i64 480}
!494 = !{i64 481}
!495 = !{i64 482}
!496 = !{i64 483}
!497 = !{i64 484}
!498 = !{i64 485}
!499 = !{i64 486}
!500 = !{i64 487}
!501 = !{i64 488}
!502 = !{i64 489}
!503 = !{i64 490}
!504 = !{i64 491}
!505 = !{i64 492}
!506 = !{i64 493}
!507 = !{i64 494}
!508 = !{i64 495}
!509 = !{i64 496}
!510 = !{i64 497}
!511 = !{i64 498}
!512 = !{i64 499}
!513 = !{i64 500}
!514 = !{i64 501}
!515 = !{i64 502}
!516 = !{i64 503}
!517 = !{i64 504}
!518 = !{i64 505}
!519 = !{i64 506}
!520 = !{i64 507}
!521 = !{i64 508}
!522 = !{i64 509}
!523 = !{i64 510}
!524 = !{i64 511}
!525 = !{i64 512}
!526 = !{i64 513}
!527 = !{i64 514}
!528 = !{i64 515}
!529 = !{i64 516}
!530 = !{i64 517}
!531 = !{i64 518}
!532 = !{i64 519}
!533 = !{i64 520}
!534 = !{i64 521}
!535 = !{i64 522}
!536 = !{i64 523}
!537 = !{i64 524}
!538 = !{i64 525}
!539 = !{i64 526}
!540 = !{i64 527}
!541 = !{i64 528}
!542 = !{i64 529}
!543 = !{i64 530}
!544 = !{i64 531}
!545 = !{i64 532}
!546 = !{i64 533}
!547 = !{i64 534}
!548 = !{i64 535}
!549 = !{i64 536}
!550 = !{i64 537}
!551 = !{i64 538}
!552 = !{i64 539}
!553 = !{i64 540}
!554 = !{i64 541}
!555 = !{i64 542}
!556 = !{i64 543}
!557 = !{i64 544}
!558 = !{i64 545}
!559 = !{i64 546}
!560 = !{i64 547}
!561 = !{i64 548}
!562 = !{i64 549}
!563 = !{i64 550}
!564 = !{i64 551}
!565 = !{i64 552}
!566 = !{i64 553}
!567 = !{i64 554}
!568 = !{i64 555}
!569 = !{i64 556}
!570 = !{i64 557}
!571 = !{i64 558}
!572 = !{i64 559}
!573 = !{i64 560}
!574 = !{i64 561}
!575 = !{i64 562}
!576 = !{i64 563}
!577 = !{i64 564}
!578 = !{i64 565}
!579 = !{i64 566}
!580 = !{i64 567}
!581 = !{i64 568}
!582 = !{i64 569}
!583 = !{i64 570}
!584 = !{i64 571}
!585 = !{i64 572}
!586 = !{i64 573}
!587 = !{i64 574}
!588 = !{i64 575}
!589 = !{i64 576}
!590 = !{i64 577}
!591 = !{i64 578}
!592 = !{i64 579}
!593 = !{i64 580}
!594 = !{i64 581}
!595 = !{i64 582}
!596 = !{i64 583}
!597 = !{i64 584}
!598 = !{i64 585}
!599 = !{i64 586}
!600 = !{i64 587}
!601 = !{i64 588}
!602 = !{i64 589}
!603 = !{i64 590}
!604 = !{i64 591}
!605 = !{i64 592}
!606 = !{i64 593}
!607 = !{i64 594}
!608 = !{i64 595}
!609 = !{i64 596}
!610 = !{i64 597}
!611 = !{i64 598}
!612 = !{i64 599}
!613 = !{i64 600}
!614 = !{i64 601}
!615 = !{i64 602}
!616 = !{i64 603}
!617 = !{i64 604}
!618 = !{i64 605}
!619 = !{i64 606}
!620 = !{i64 607}
!621 = !{i64 608}
!622 = !{i64 609}
!623 = !{i64 610}
!624 = !{i64 611}
!625 = !{i64 612}
!626 = !{i64 613}
!627 = !{i64 614}
!628 = !{i64 615}
!629 = !{i64 616}
!630 = !{i64 617}
!631 = !{i64 618}
!632 = !{i64 619}
!633 = !{i64 620}
!634 = !{i64 621}
!635 = !{i64 622}
!636 = !{i64 623}
!637 = !{i64 624}
!638 = !{i64 625}
!639 = !{i64 626}
!640 = distinct !{!640, !641}
!641 = !{!"llvm.loop.name", !"TRIANGLES"}
!642 = !{i64 627}
!643 = !{i64 628}
!644 = !{i64 629}
!645 = !{i64 630}
!646 = !{i64 631}
!647 = !{i64 632}
!648 = !{i64 633}
!649 = !{i64 634}
!650 = !{i64 635}
!651 = !{i64 636}
!652 = !{i64 637}
!653 = !{i64 638}
!654 = !{i64 639}
!655 = !{i64 640}
!656 = !{i64 641}
!657 = !{i64 642}
!658 = !{i64 643}
!659 = !{i64 644}
!660 = !{i64 645}
