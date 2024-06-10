; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.DataSet_s = type { float*, i8*, float*, i64, i64 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@ops = global %struct.BinOpInfo* null, align 8
@stdout = external global %struct._IO_FILE*, align 8
@filename = private constant [15 x i8] c"data_stats.txt\00"
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf|\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.4 = private unnamed_addr constant [30 x i8] c"Failed to open data file %s!\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.3.6 = private unnamed_addr constant [31 x i8] c"Failed to open label file %s!\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Failed to open output file!\0A\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"\0Amain parameter vector: \0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"m[%d]: %f | \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"Training TPR: %f\0A\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"Training FPR: %f\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"Training Error: %f\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Testing TPR: %f\0A\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"Testing FPR: %f\0A\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"Testing Error: %f\0A\00", align 1

; Function Attrs: nounwind
define float @_Z10dotProductPfS_(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %feature) #0 !dbg !378 {
entry:
  %"1.param.addr" = alloca float*, align 8, !opID !386, !stats.instNumber !387, !opSignedness !388
  %"2.feature.addr" = alloca float*, align 8, !opID !389, !stats.instNumber !390, !opSignedness !388
  %"3.result" = alloca float, align 4, !opID !391, !stats.instNumber !392, !opSignedness !388
  %"4.i" = alloca i32, align 4, !opID !393, !stats.instNumber !394, !opSignedness !388
  store float* %param, float** %"1.param.addr", align 8, !opID !395, !stats.instNumber !396, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"1.param.addr", metadata !397, metadata !DIExpression()), !dbg !398, !opID !399, !stats.instNumber !400, !opSignedness !388
  store float* %feature, float** %"2.feature.addr", align 8, !opID !401, !stats.instNumber !402, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"2.feature.addr", metadata !403, metadata !DIExpression()), !dbg !404, !opID !405, !stats.instNumber !406, !opSignedness !388
  %"9." = bitcast float* %"3.result" to i8*, !dbg !407, !opID !408, !stats.instNumber !409, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"9.") #15, !dbg !407, !opID !410, !stats.instNumber !411, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"3.result", metadata !412, metadata !DIExpression()), !dbg !413, !opID !414, !stats.instNumber !415, !opSignedness !388
  store float 0.000000e+00, float* %"3.result", align 4, !dbg !413, !opID !416, !stats.instNumber !417, !opSignedness !388
  br label %DOT, !dbg !407, !opID !418, !stats.instNumber !419, !opSignedness !388

DOT:                                              ; preds = %entry
  %"14." = bitcast i32* %"4.i" to i8*, !dbg !420, !opID !422, !stats.instNumber !423, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"14.") #15, !dbg !420, !opID !424, !stats.instNumber !425, !opSignedness !388
  call void @llvm.dbg.declare(metadata i32* %"4.i", metadata !426, metadata !DIExpression()), !dbg !427, !opID !428, !stats.instNumber !429, !opSignedness !388
  store i32 0, i32* %"4.i", align 4, !dbg !427, !opID !430, !stats.instNumber !431, !opSignedness !388
  br label %for.cond, !dbg !420, !opID !432, !stats.instNumber !433, !opSignedness !388

for.cond:                                         ; preds = %for.inc, %DOT
  %"19." = load i32, i32* %"4.i", align 4, !dbg !434, !opID !436, !stats.instNumber !437, !opSignedness !388
  %"20.cmp" = icmp slt i32 %"19.", 1024, !dbg !438, !opID !439, !stats.instNumber !440, !opSignedness !388
  br i1 %"20.cmp", label %for.body, label %for.cond.cleanup, !dbg !441, !opID !442, !stats.instNumber !443, !opSignedness !388

for.cond.cleanup:                                 ; preds = %for.cond
  %"22." = bitcast i32* %"4.i" to i8*, !dbg !444, !opID !445, !stats.instNumber !446, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"22.") #15, !dbg !444, !opID !447, !stats.instNumber !448, !opSignedness !388
  br label %for.end, !opID !449, !stats.instNumber !450, !opSignedness !388

for.body:                                         ; preds = %for.cond
  %"25." = load float*, float** %"1.param.addr", align 8, !dbg !451, !opID !452, !stats.instNumber !453, !opSignedness !388
  %"26." = load i32, i32* %"4.i", align 4, !dbg !454, !opID !455, !stats.instNumber !456, !opSignedness !388
  %"27.idxprom" = sext i32 %"26." to i64, !dbg !451, !opID !457, !stats.instNumber !458, !opSignedness !388
  %"28.arrayidx" = getelementptr inbounds float, float* %"25.", i64 %"27.idxprom", !dbg !451, !opID !459, !stats.instNumber !460, !opSignedness !388
  %"29." = load float, float* %"28.arrayidx", align 4, !dbg !451, !opID !461, !stats.instNumber !462, !opSignedness !388
  %"30." = load float*, float** %"2.feature.addr", align 8, !dbg !463, !opID !464, !stats.instNumber !465, !opSignedness !388
  %"31." = load i32, i32* %"4.i", align 4, !dbg !466, !opID !467, !stats.instNumber !468, !opSignedness !388
  %"32.idxprom1" = sext i32 %"31." to i64, !dbg !463, !opID !469, !stats.instNumber !470, !opSignedness !388
  %"33.arrayidx2" = getelementptr inbounds float, float* %"30.", i64 %"32.idxprom1", !dbg !463, !opID !471, !stats.instNumber !472, !opSignedness !388
  %"34." = load float, float* %"33.arrayidx2", align 4, !dbg !463, !opID !473, !stats.instNumber !474, !opSignedness !388
  %"35.mul" = fmul float %"29.", %"34.", !dbg !475, !opID !476, !stats.instNumber !477, !opSignedness !388
  %0 = fpext float %"35.mul" to double, !dbg !478
  call void @profOp(i64 35, i8 16, i64 0, i64 0, double %0, i1 false, i1 true, i32 32), !dbg !478
  %"36." = load float, float* %"3.result", align 4, !dbg !478, !opID !479, !stats.instNumber !480, !opSignedness !388
  %"37.add" = fadd float %"36.", %"35.mul", !dbg !478, !opID !481, !stats.instNumber !482, !opSignedness !388
  %1 = fpext float %"37.add" to double, !dbg !478
  call void @profOp(i64 37, i8 12, i64 0, i64 0, double %1, i1 false, i1 true, i32 32), !dbg !478
  store float %"37.add", float* %"3.result", align 4, !dbg !478, !opID !483, !stats.instNumber !484, !opSignedness !388
  br label %for.inc, !dbg !485, !opID !486, !stats.instNumber !487, !opSignedness !388

for.inc:                                          ; preds = %for.body
  %"40." = load i32, i32* %"4.i", align 4, !dbg !488, !opID !489, !stats.instNumber !490, !opSignedness !388
  %"41.inc" = add i32 %"40.", 1, !dbg !488, !opID !491, !stats.instNumber !492, !opSignedness !388
  %2 = sext i32 %"41.inc" to i64, !dbg !488
  call void @profOp(i64 41, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !488
  store i32 %"41.inc", i32* %"4.i", align 4, !dbg !488, !opID !493, !stats.instNumber !494, !opSignedness !388
  br label %for.cond, !dbg !444, !llvm.loop !495, !opID !498, !stats.instNumber !499, !opSignedness !388

for.end:                                          ; preds = %for.cond.cleanup
  %"44." = load float, float* %"3.result", align 4, !dbg !500, !opID !501, !stats.instNumber !502, !opSignedness !388
  %"45." = bitcast float* %"3.result" to i8*, !dbg !503, !opID !504, !stats.instNumber !505, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"45.") #15, !dbg !503, !opID !506, !stats.instNumber !507, !opSignedness !388
  ret float %"44.", !dbg !508, !opID !509, !stats.instNumber !510, !opSignedness !388
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %instID, i8 zeroext %instOpcode, i64 %signedIntValue, i64 %unsignedIntValue, double %fpValue, i1 zeroext %isSignedValue, i1 zeroext %isFpValue, i32 %bitwidth) #3 {
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
  %call = call double @pow(double %13, double 2.000000e+00) #15
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
  %call15 = call double @pow(double %conv14, double 2.000000e+00) #15
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
  %call31 = call double @pow(double %conv30, double 2.000000e+00) #15
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
  %call49 = call double @sqrt(double %59) #15
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
  %call55 = call noalias i8* @malloc(i64 64) #15
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
  %call63 = call double @pow(double %76, double 2.000000e+00) #15
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
  %call71 = call double @pow(double %conv70, double 2.000000e+00) #15
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
  %call77 = call double @pow(double %conv76, double 2.000000e+00) #15
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
declare double @pow(double, double) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
define float @_Z7Sigmoidf(float %exponent) #5 !dbg !511 {
entry:
  %"48.exponent.addr" = alloca float, align 4, !opID !514, !stats.instNumber !515, !opSignedness !388
  store float %exponent, float* %"48.exponent.addr", align 4, !opID !516, !stats.instNumber !517, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"48.exponent.addr", metadata !518, metadata !DIExpression()), !dbg !519, !opID !520, !stats.instNumber !521, !opSignedness !388
  %"51." = load float, float* %"48.exponent.addr", align 4, !dbg !522, !opID !523, !stats.instNumber !524, !opSignedness !388
  %"52.sub" = fsub float -0.000000e+00, %"51.", !dbg !525, !opID !526, !stats.instNumber !527, !opSignedness !388
  %0 = fpext float %"52.sub" to double, !dbg !528
  call void @profOp(i64 52, i8 14, i64 0, i64 0, double %0, i1 false, i1 true, i32 32), !dbg !528
  %"53." = call float @llvm.exp.f32(float %"52.sub"), !dbg !528, !opID !529, !stats.instNumber !530, !opSignedness !388
  %"54.add" = fadd float 1.000000e+00, %"53.", !dbg !531, !opID !532, !stats.instNumber !533, !opSignedness !388
  %1 = fpext float %"54.add" to double, !dbg !534
  call void @profOp(i64 54, i8 12, i64 0, i64 0, double %1, i1 false, i1 true, i32 32), !dbg !534
  %"55.div" = fdiv float 1.000000e+00, %"54.add", !dbg !534, !opID !535, !stats.instNumber !536, !opSignedness !388
  %2 = fpext float %"55.div" to double, !dbg !537
  call void @profOp(i64 55, i8 19, i64 0, i64 0, double %2, i1 false, i1 true, i32 32), !dbg !537
  ret float %"55.div", !dbg !537, !opID !538, !stats.instNumber !539, !opSignedness !388
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: nounwind
define void @_Z15computeGradientPfS_f(float* "fpga.decayed.dim.hint"="1024" %grad, float* "fpga.decayed.dim.hint"="1024" %feature, float %scale) #6 !dbg !540 {
entry:
  %"57.grad.addr" = alloca float*, align 8, !opID !543, !stats.instNumber !544, !opSignedness !388
  %"58.feature.addr" = alloca float*, align 8, !opID !545, !stats.instNumber !546, !opSignedness !388
  %"59.scale.addr" = alloca float, align 4, !opID !547, !stats.instNumber !548, !opSignedness !388
  %"60.i" = alloca i32, align 4, !opID !549, !stats.instNumber !550, !opSignedness !388
  store float* %grad, float** %"57.grad.addr", align 8, !opID !551, !stats.instNumber !552, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"57.grad.addr", metadata !553, metadata !DIExpression()), !dbg !554, !opID !555, !stats.instNumber !556, !opSignedness !388
  store float* %feature, float** %"58.feature.addr", align 8, !opID !557, !stats.instNumber !558, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"58.feature.addr", metadata !559, metadata !DIExpression()), !dbg !560, !opID !561, !stats.instNumber !562, !opSignedness !388
  store float %scale, float* %"59.scale.addr", align 4, !opID !563, !stats.instNumber !564, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"59.scale.addr", metadata !565, metadata !DIExpression()), !dbg !566, !opID !567, !stats.instNumber !568, !opSignedness !388
  br label %GRAD, !dbg !569, !opID !570, !stats.instNumber !571, !opSignedness !388

GRAD:                                             ; preds = %entry
  %"68." = bitcast i32* %"60.i" to i8*, !dbg !572, !opID !574, !stats.instNumber !575, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"68.") #15, !dbg !572, !opID !576, !stats.instNumber !577, !opSignedness !388
  call void @llvm.dbg.declare(metadata i32* %"60.i", metadata !578, metadata !DIExpression()), !dbg !579, !opID !580, !stats.instNumber !581, !opSignedness !388
  store i32 0, i32* %"60.i", align 4, !dbg !579, !opID !582, !stats.instNumber !583, !opSignedness !388
  br label %for.cond, !dbg !572, !opID !584, !stats.instNumber !585, !opSignedness !388

for.cond:                                         ; preds = %for.inc, %GRAD
  %"73." = load i32, i32* %"60.i", align 4, !dbg !586, !opID !588, !stats.instNumber !589, !opSignedness !388
  %"74.cmp" = icmp slt i32 %"73.", 1024, !dbg !590, !opID !591, !stats.instNumber !592, !opSignedness !388
  br i1 %"74.cmp", label %for.body, label %for.cond.cleanup, !dbg !593, !opID !594, !stats.instNumber !595, !opSignedness !388

for.cond.cleanup:                                 ; preds = %for.cond
  %"76." = bitcast i32* %"60.i" to i8*, !dbg !596, !opID !597, !stats.instNumber !598, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"76.") #15, !dbg !596, !opID !599, !stats.instNumber !600, !opSignedness !388
  br label %for.end, !opID !601, !stats.instNumber !602, !opSignedness !388

for.body:                                         ; preds = %for.cond
  %"79." = load float, float* %"59.scale.addr", align 4, !dbg !603, !opID !604, !stats.instNumber !605, !opSignedness !388
  %"80." = load float*, float** %"58.feature.addr", align 8, !dbg !606, !opID !607, !stats.instNumber !608, !opSignedness !388
  %"81." = load i32, i32* %"60.i", align 4, !dbg !609, !opID !610, !stats.instNumber !611, !opSignedness !388
  %"82.idxprom" = sext i32 %"81." to i64, !dbg !606, !opID !612, !stats.instNumber !613, !opSignedness !388
  %"83.arrayidx" = getelementptr inbounds float, float* %"80.", i64 %"82.idxprom", !dbg !606, !opID !614, !stats.instNumber !615, !opSignedness !388
  %"84." = load float, float* %"83.arrayidx", align 4, !dbg !606, !opID !616, !stats.instNumber !617, !opSignedness !388
  %"85.mul" = fmul float %"79.", %"84.", !dbg !618, !opID !619, !stats.instNumber !620, !opSignedness !388
  %0 = fpext float %"85.mul" to double, !dbg !621
  call void @profOp(i64 85, i8 16, i64 0, i64 0, double %0, i1 false, i1 true, i32 32), !dbg !621
  %"86." = load float*, float** %"57.grad.addr", align 8, !dbg !621, !opID !622, !stats.instNumber !623, !opSignedness !388
  %"87." = load i32, i32* %"60.i", align 4, !dbg !624, !opID !625, !stats.instNumber !626, !opSignedness !388
  %"88.idxprom1" = sext i32 %"87." to i64, !dbg !621, !opID !627, !stats.instNumber !628, !opSignedness !388
  %"89.arrayidx2" = getelementptr inbounds float, float* %"86.", i64 %"88.idxprom1", !dbg !621, !opID !629, !stats.instNumber !630, !opSignedness !388
  store float %"85.mul", float* %"89.arrayidx2", align 4, !dbg !631, !opID !632, !stats.instNumber !633, !opSignedness !388
  br label %for.inc, !dbg !621, !opID !634, !stats.instNumber !635, !opSignedness !388

for.inc:                                          ; preds = %for.body
  %"92." = load i32, i32* %"60.i", align 4, !dbg !636, !opID !637, !stats.instNumber !638, !opSignedness !388
  %"93.inc" = add i32 %"92.", 1, !dbg !636, !opID !639, !stats.instNumber !640, !opSignedness !388
  %1 = sext i32 %"93.inc" to i64, !dbg !636
  call void @profOp(i64 93, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !636
  store i32 %"93.inc", i32* %"60.i", align 4, !dbg !636, !opID !641, !stats.instNumber !642, !opSignedness !388
  br label %for.cond, !dbg !596, !llvm.loop !643, !opID !646, !stats.instNumber !647, !opSignedness !388

for.end:                                          ; preds = %for.cond.cleanup
  ret void, !dbg !648, !opID !649, !stats.instNumber !650, !opSignedness !388
}

; Function Attrs: nounwind
define void @_Z15updateParameterPfS_f(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %grad, float %scale) #7 !dbg !651 {
entry:
  %"97.param.addr" = alloca float*, align 8, !opID !654, !stats.instNumber !655, !opSignedness !388
  %"98.grad.addr" = alloca float*, align 8, !opID !656, !stats.instNumber !657, !opSignedness !388
  %"99.scale.addr" = alloca float, align 4, !opID !658, !stats.instNumber !659, !opSignedness !388
  %"100.i" = alloca i32, align 4, !opID !660, !stats.instNumber !661, !opSignedness !388
  store float* %param, float** %"97.param.addr", align 8, !opID !662, !stats.instNumber !663, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"97.param.addr", metadata !664, metadata !DIExpression()), !dbg !665, !opID !666, !stats.instNumber !667, !opSignedness !388
  store float* %grad, float** %"98.grad.addr", align 8, !opID !668, !stats.instNumber !669, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"98.grad.addr", metadata !670, metadata !DIExpression()), !dbg !671, !opID !672, !stats.instNumber !673, !opSignedness !388
  store float %scale, float* %"99.scale.addr", align 4, !opID !674, !stats.instNumber !675, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"99.scale.addr", metadata !676, metadata !DIExpression()), !dbg !677, !opID !678, !stats.instNumber !679, !opSignedness !388
  br label %UPDATE, !dbg !680, !opID !681, !stats.instNumber !682, !opSignedness !388

UPDATE:                                           ; preds = %entry
  %"108." = bitcast i32* %"100.i" to i8*, !dbg !683, !opID !685, !stats.instNumber !686, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"108.") #15, !dbg !683, !opID !687, !stats.instNumber !688, !opSignedness !388
  call void @llvm.dbg.declare(metadata i32* %"100.i", metadata !689, metadata !DIExpression()), !dbg !690, !opID !691, !stats.instNumber !692, !opSignedness !388
  store i32 0, i32* %"100.i", align 4, !dbg !690, !opID !693, !stats.instNumber !694, !opSignedness !388
  br label %for.cond, !dbg !683, !opID !695, !stats.instNumber !696, !opSignedness !388

for.cond:                                         ; preds = %for.inc, %UPDATE
  %"113." = load i32, i32* %"100.i", align 4, !dbg !697, !opID !699, !stats.instNumber !700, !opSignedness !388
  %"114.cmp" = icmp slt i32 %"113.", 1024, !dbg !701, !opID !702, !stats.instNumber !703, !opSignedness !388
  br i1 %"114.cmp", label %for.body, label %for.cond.cleanup, !dbg !704, !opID !705, !stats.instNumber !706, !opSignedness !388

for.cond.cleanup:                                 ; preds = %for.cond
  %"116." = bitcast i32* %"100.i" to i8*, !dbg !707, !opID !708, !stats.instNumber !709, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"116.") #15, !dbg !707, !opID !710, !stats.instNumber !711, !opSignedness !388
  br label %for.end, !opID !712, !stats.instNumber !713, !opSignedness !388

for.body:                                         ; preds = %for.cond
  %"119." = load float, float* %"99.scale.addr", align 4, !dbg !714, !opID !715, !stats.instNumber !716, !opSignedness !388
  %"120." = load float*, float** %"98.grad.addr", align 8, !dbg !717, !opID !718, !stats.instNumber !719, !opSignedness !388
  %"121." = load i32, i32* %"100.i", align 4, !dbg !720, !opID !721, !stats.instNumber !722, !opSignedness !388
  %"122.idxprom" = sext i32 %"121." to i64, !dbg !717, !opID !723, !stats.instNumber !724, !opSignedness !388
  %"123.arrayidx" = getelementptr inbounds float, float* %"120.", i64 %"122.idxprom", !dbg !717, !opID !725, !stats.instNumber !726, !opSignedness !388
  %"124." = load float, float* %"123.arrayidx", align 4, !dbg !717, !opID !727, !stats.instNumber !728, !opSignedness !388
  %"125.mul" = fmul float %"119.", %"124.", !dbg !729, !opID !730, !stats.instNumber !731, !opSignedness !388
  %0 = fpext float %"125.mul" to double, !dbg !732
  call void @profOp(i64 125, i8 16, i64 0, i64 0, double %0, i1 false, i1 true, i32 32), !dbg !732
  %"126." = load float*, float** %"97.param.addr", align 8, !dbg !732, !opID !733, !stats.instNumber !734, !opSignedness !388
  %"127." = load i32, i32* %"100.i", align 4, !dbg !735, !opID !736, !stats.instNumber !737, !opSignedness !388
  %"128.idxprom1" = sext i32 %"127." to i64, !dbg !732, !opID !738, !stats.instNumber !739, !opSignedness !388
  %"129.arrayidx2" = getelementptr inbounds float, float* %"126.", i64 %"128.idxprom1", !dbg !732, !opID !740, !stats.instNumber !741, !opSignedness !388
  %"130." = load float, float* %"129.arrayidx2", align 4, !dbg !742, !opID !743, !stats.instNumber !744, !opSignedness !388
  %"131.add" = fadd float %"130.", %"125.mul", !dbg !742, !opID !745, !stats.instNumber !746, !opSignedness !388
  %1 = fpext float %"131.add" to double, !dbg !742
  call void @profOp(i64 131, i8 12, i64 0, i64 0, double %1, i1 false, i1 true, i32 32), !dbg !742
  store float %"131.add", float* %"129.arrayidx2", align 4, !dbg !742, !opID !747, !stats.instNumber !748, !opSignedness !388
  br label %for.inc, !dbg !732, !opID !749, !stats.instNumber !750, !opSignedness !388

for.inc:                                          ; preds = %for.body
  %"134." = load i32, i32* %"100.i", align 4, !dbg !751, !opID !752, !stats.instNumber !753, !opSignedness !388
  %"135.inc" = add i32 %"134.", 1, !dbg !751, !opID !754, !stats.instNumber !755, !opSignedness !388
  %2 = sext i32 %"135.inc" to i64, !dbg !751
  call void @profOp(i64 135, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !751
  store i32 %"135.inc", i32* %"100.i", align 4, !dbg !751, !opID !756, !stats.instNumber !757, !opSignedness !388
  br label %for.cond, !dbg !707, !llvm.loop !758, !opID !761, !stats.instNumber !762, !opSignedness !388

for.end:                                          ; preds = %for.cond.cleanup
  ret void, !dbg !763, !opID !764, !stats.instNumber !765, !opSignedness !388
}

; Function Attrs: nounwind
define void @_Z5SgdLRPfPhS_(float* "fpga.decayed.dim.hint"="4608000" %data, i8* "fpga.decayed.dim.hint"="4500" %label, float* "fpga.decayed.dim.hint"="1024" %theta) #8 !dbg !766 !fpga.function.pragma !772 {
entry:
  %"139.data.addr" = alloca float*, align 8, !opID !775, !stats.instNumber !776, !opSignedness !388
  %"140.label.addr" = alloca i8*, align 8, !opID !777, !stats.instNumber !778, !opSignedness !388
  %"141.theta.addr" = alloca float*, align 8, !opID !779, !stats.instNumber !780, !opSignedness !388
  %"142.gradient" = alloca [1024 x float], align 4, !opID !781, !stats.instNumber !782, !opSignedness !388
  %"143.epoch" = alloca i32, align 4, !opID !783, !stats.instNumber !784, !opSignedness !388
  %"144.cleanup.dest.slot" = alloca i32, align 4, !opID !785, !stats.instNumber !786, !opSignedness !388
  %"145.training_id" = alloca i32, align 4, !opID !787, !stats.instNumber !788, !opSignedness !388
  %"146.dot" = alloca float, align 4, !opID !789, !stats.instNumber !790, !opSignedness !388
  %"147.prob" = alloca float, align 4, !opID !791, !stats.instNumber !792, !opSignedness !388
  store float* %data, float** %"139.data.addr", align 8, !opID !793, !stats.instNumber !794, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"139.data.addr", metadata !795, metadata !DIExpression()), !dbg !796, !opID !797, !stats.instNumber !798, !opSignedness !388
  store i8* %label, i8** %"140.label.addr", align 8, !opID !799, !stats.instNumber !800, !opSignedness !388
  call void @llvm.dbg.declare(metadata i8** %"140.label.addr", metadata !801, metadata !DIExpression()), !dbg !802, !opID !803, !stats.instNumber !804, !opSignedness !388
  store float* %theta, float** %"141.theta.addr", align 8, !opID !805, !stats.instNumber !806, !opSignedness !388
  call void @llvm.dbg.declare(metadata float** %"141.theta.addr", metadata !807, metadata !DIExpression()), !dbg !808, !opID !809, !stats.instNumber !810, !opSignedness !388
  %"154." = bitcast [1024 x float]* %"142.gradient" to i8*, !dbg !811, !opID !812, !stats.instNumber !813, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* %"154.") #15, !dbg !811, !opID !814, !stats.instNumber !815, !opSignedness !388
  call void @llvm.dbg.declare(metadata [1024 x float]* %"142.gradient", metadata !816, metadata !DIExpression()), !dbg !820, !opID !821, !stats.instNumber !822, !opSignedness !388
  br label %EPOCH, !dbg !811, !opID !823, !stats.instNumber !824, !opSignedness !388

EPOCH:                                            ; preds = %entry
  %"158." = bitcast i32* %"143.epoch" to i8*, !dbg !825, !opID !827, !stats.instNumber !828, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"158.") #15, !dbg !825, !opID !829, !stats.instNumber !830, !opSignedness !388
  call void @llvm.dbg.declare(metadata i32* %"143.epoch", metadata !831, metadata !DIExpression()), !dbg !832, !opID !833, !stats.instNumber !834, !opSignedness !388
  store i32 0, i32* %"143.epoch", align 4, !dbg !832, !opID !835, !stats.instNumber !836, !opSignedness !388
  br label %for.cond, !dbg !825, !opID !837, !stats.instNumber !838, !opSignedness !388

for.cond:                                         ; preds = %for.inc13, %EPOCH
  %"163." = load i32, i32* %"143.epoch", align 4, !dbg !839, !opID !841, !stats.instNumber !842, !opSignedness !388
  %"164.cmp" = icmp slt i32 %"163.", 5, !dbg !843, !opID !844, !stats.instNumber !845, !opSignedness !388
  br i1 %"164.cmp", label %for.body, label %for.cond.cleanup, !dbg !846, !opID !847, !stats.instNumber !848, !opSignedness !388

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %"144.cleanup.dest.slot", align 4, !opID !849, !stats.instNumber !850, !opSignedness !388
  %"167." = bitcast i32* %"143.epoch" to i8*, !dbg !851, !opID !852, !stats.instNumber !853, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"167.") #15, !dbg !851, !opID !854, !stats.instNumber !855, !opSignedness !388
  br label %for.end15, !opID !856, !stats.instNumber !857, !opSignedness !388

for.body:                                         ; preds = %for.cond
  br label %TRAINING_INST, !dbg !858, !opID !859, !stats.instNumber !860, !opSignedness !388

TRAINING_INST:                                    ; preds = %for.body
  %"171." = bitcast i32* %"145.training_id" to i8*, !dbg !861, !opID !864, !stats.instNumber !865, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"171.") #15, !dbg !861, !opID !866, !stats.instNumber !867, !opSignedness !388
  call void @llvm.dbg.declare(metadata i32* %"145.training_id", metadata !868, metadata !DIExpression()), !dbg !869, !opID !870, !stats.instNumber !871, !opSignedness !388
  store i32 0, i32* %"145.training_id", align 4, !dbg !869, !opID !872, !stats.instNumber !873, !opSignedness !388
  br label %for.cond1, !dbg !861, !opID !874, !stats.instNumber !875, !opSignedness !388

for.cond1:                                        ; preds = %for.inc, %TRAINING_INST
  %"176." = load i32, i32* %"145.training_id", align 4, !dbg !876, !opID !878, !stats.instNumber !879, !opSignedness !388
  %"177.cmp2" = icmp slt i32 %"176.", 4500, !dbg !880, !opID !881, !stats.instNumber !882, !opSignedness !388
  br i1 %"177.cmp2", label %for.body4, label %for.cond.cleanup3, !dbg !883, !opID !884, !stats.instNumber !885, !opSignedness !388

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %"144.cleanup.dest.slot", align 4, !opID !886, !stats.instNumber !887, !opSignedness !388
  %"180." = bitcast i32* %"145.training_id" to i8*, !dbg !888, !opID !889, !stats.instNumber !890, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"180.") #15, !dbg !888, !opID !891, !stats.instNumber !892, !opSignedness !388
  br label %for.end, !opID !893, !stats.instNumber !894, !opSignedness !388

for.body4:                                        ; preds = %for.cond1
  %"183." = bitcast float* %"146.dot" to i8*, !dbg !895, !opID !897, !stats.instNumber !898, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"183.") #15, !dbg !895, !opID !899, !stats.instNumber !900, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"146.dot", metadata !901, metadata !DIExpression()), !dbg !902, !opID !903, !stats.instNumber !904, !opSignedness !388
  %"186." = load float*, float** %"141.theta.addr", align 8, !dbg !905, !opID !906, !stats.instNumber !907, !opSignedness !388
  %"187." = load float*, float** %"139.data.addr", align 8, !dbg !908, !opID !909, !stats.instNumber !910, !opSignedness !388
  %"188." = load i32, i32* %"145.training_id", align 4, !dbg !911, !opID !912, !stats.instNumber !913, !opSignedness !388
  %"189.mul" = mul i32 1024, %"188.", !dbg !914, !opID !915, !stats.instNumber !916, !opSignedness !388
  %0 = sext i32 %"189.mul" to i64, !dbg !908
  call void @profOp(i64 189, i8 15, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !908
  %"190.idxprom" = sext i32 %"189.mul" to i64, !dbg !908, !opID !917, !stats.instNumber !918, !opSignedness !388
  %"191.arrayidx" = getelementptr inbounds float, float* %"187.", i64 %"190.idxprom", !dbg !908, !opID !919, !stats.instNumber !920, !opSignedness !388
  %"192.call" = call float @_Z10dotProductPfS_(float* %"186.", float* %"191.arrayidx"), !dbg !921, !opID !922, !stats.instNumber !923, !opSignedness !388
  store float %"192.call", float* %"146.dot", align 4, !dbg !902, !opID !924, !stats.instNumber !925, !opSignedness !388
  %"194." = bitcast float* %"147.prob" to i8*, !dbg !926, !opID !927, !stats.instNumber !928, !opSignedness !388
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"194.") #15, !dbg !926, !opID !929, !stats.instNumber !930, !opSignedness !388
  call void @llvm.dbg.declare(metadata float* %"147.prob", metadata !931, metadata !DIExpression()), !dbg !932, !opID !933, !stats.instNumber !934, !opSignedness !388
  %"197." = load float, float* %"146.dot", align 4, !dbg !935, !opID !936, !stats.instNumber !937, !opSignedness !388
  %"198.call5" = call float @_Z7Sigmoidf(float %"197."), !dbg !938, !opID !939, !stats.instNumber !940, !opSignedness !388
  store float %"198.call5", float* %"147.prob", align 4, !dbg !932, !opID !941, !stats.instNumber !942, !opSignedness !388
  %"200.arraydecay" = getelementptr inbounds [1024 x float], [1024 x float]* %"142.gradient", i32 0, i32 0, !dbg !943, !opID !944, !stats.instNumber !945, !opSignedness !388
  %"201." = load float*, float** %"139.data.addr", align 8, !dbg !946, !opID !947, !stats.instNumber !948, !opSignedness !388
  %"202." = load i32, i32* %"145.training_id", align 4, !dbg !949, !opID !950, !stats.instNumber !951, !opSignedness !388
  %"203.mul6" = mul i32 1024, %"202.", !dbg !952, !opID !953, !stats.instNumber !954, !opSignedness !388
  %1 = sext i32 %"203.mul6" to i64, !dbg !946
  call void @profOp(i64 203, i8 15, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !946
  %"204.idxprom7" = sext i32 %"203.mul6" to i64, !dbg !946, !opID !955, !stats.instNumber !956, !opSignedness !388
  %"205.arrayidx8" = getelementptr inbounds float, float* %"201.", i64 %"204.idxprom7", !dbg !946, !opID !957, !stats.instNumber !958, !opSignedness !388
  %"206." = load float, float* %"147.prob", align 4, !dbg !959, !opID !960, !stats.instNumber !961, !opSignedness !388
  %"207." = load i8*, i8** %"140.label.addr", align 8, !dbg !962, !opID !963, !stats.instNumber !964, !opSignedness !388
  %"208." = load i32, i32* %"145.training_id", align 4, !dbg !965, !opID !966, !stats.instNumber !967, !opSignedness !388
  %"209.idxprom9" = sext i32 %"208." to i64, !dbg !962, !opID !968, !stats.instNumber !969, !opSignedness !388
  %"210.arrayidx10" = getelementptr inbounds i8, i8* %"207.", i64 %"209.idxprom9", !dbg !962, !opID !970, !stats.instNumber !971, !opSignedness !388
  %"211." = load i8, i8* %"210.arrayidx10", align 1, !dbg !962, !opID !972, !stats.instNumber !973, !opSignedness !388
  %"212.conv" = zext i8 %"211." to i32, !dbg !962, !opID !974, !stats.instNumber !975, !opSignedness !388
  %"213.conv11" = sitofp i32 %"212.conv" to float, !dbg !962, !opID !976, !stats.instNumber !977, !opSignedness !388
  %"214.sub" = fsub float %"206.", %"213.conv11", !dbg !978, !opID !979, !stats.instNumber !980, !opSignedness !388
  %2 = fpext float %"214.sub" to double, !dbg !981
  call void @profOp(i64 214, i8 14, i64 0, i64 0, double %2, i1 false, i1 true, i32 32), !dbg !981
  call void @_Z15computeGradientPfS_f(float* %"200.arraydecay", float* %"205.arrayidx8", float %"214.sub"), !dbg !981, !opID !982, !stats.instNumber !983, !opSignedness !388
  %"216." = load float*, float** %"141.theta.addr", align 8, !dbg !984, !opID !985, !stats.instNumber !986, !opSignedness !388
  %"217.arraydecay12" = getelementptr inbounds [1024 x float], [1024 x float]* %"142.gradient", i32 0, i32 0, !dbg !987, !opID !988, !stats.instNumber !989, !opSignedness !388
  call void @_Z15updateParameterPfS_f(float* %"216.", float* %"217.arraydecay12", float -6.000000e+04), !dbg !990, !opID !991, !stats.instNumber !992, !opSignedness !388
  %"219." = bitcast float* %"147.prob" to i8*, !dbg !993, !opID !994, !stats.instNumber !995, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"219.") #15, !dbg !993, !opID !996, !stats.instNumber !997, !opSignedness !388
  %"221." = bitcast float* %"146.dot" to i8*, !dbg !993, !opID !998, !stats.instNumber !999, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"221.") #15, !dbg !993, !opID !1000, !stats.instNumber !1001, !opSignedness !388
  br label %for.inc, !dbg !1002, !opID !1003, !stats.instNumber !1004, !opSignedness !388

for.inc:                                          ; preds = %for.body4
  %"224." = load i32, i32* %"145.training_id", align 4, !dbg !1005, !opID !1006, !stats.instNumber !1007, !opSignedness !388
  %"225.inc" = add i32 %"224.", 1, !dbg !1005, !opID !1008, !stats.instNumber !1009, !opSignedness !388
  %3 = sext i32 %"225.inc" to i64, !dbg !1005
  call void @profOp(i64 225, i8 11, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1005
  store i32 %"225.inc", i32* %"145.training_id", align 4, !dbg !1005, !opID !1010, !stats.instNumber !1011, !opSignedness !388
  br label %for.cond1, !dbg !888, !llvm.loop !1012, !opID !1015, !stats.instNumber !1016, !opSignedness !388

for.end:                                          ; preds = %for.cond.cleanup3
  br label %for.inc13, !dbg !1017, !opID !1018, !stats.instNumber !1019, !opSignedness !388

for.inc13:                                        ; preds = %for.end
  %"229." = load i32, i32* %"143.epoch", align 4, !dbg !1020, !opID !1021, !stats.instNumber !1022, !opSignedness !388
  %"230.inc14" = add i32 %"229.", 1, !dbg !1020, !opID !1023, !stats.instNumber !1024, !opSignedness !388
  %4 = sext i32 %"230.inc14" to i64, !dbg !1020
  call void @profOp(i64 230, i8 11, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1020
  store i32 %"230.inc14", i32* %"143.epoch", align 4, !dbg !1020, !opID !1025, !stats.instNumber !1026, !opSignedness !388
  br label %for.cond, !dbg !851, !llvm.loop !1027, !opID !1030, !stats.instNumber !1031, !opSignedness !388

for.end15:                                        ; preds = %for.cond.cleanup
  %"233." = bitcast [1024 x float]* %"142.gradient" to i8*, !dbg !1032, !opID !1033, !stats.instNumber !1034, !opSignedness !388
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* %"233.") #15, !dbg !1032, !opID !1035, !stats.instNumber !1036, !opSignedness !388
  ret void, !dbg !1032, !opID !1037, !stats.instNumber !1038, !opSignedness !388
}

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #9 {
entry:
  %"236.retval" = alloca i32, align 4, !opID !1039, !stats.instNumber !1040, !opSignedness !388
  %"237.argc.addr" = alloca i32, align 4, !opID !1041, !stats.instNumber !1042, !opSignedness !388
  %"238.argv.addr" = alloca i8**, align 8, !opID !1043, !stats.instNumber !1044, !opSignedness !388
  %"239.data_points" = alloca float*, align 8, !opID !1045, !stats.instNumber !1046, !opSignedness !388
  %"240.labels" = alloca i8*, align 8, !opID !1047, !stats.instNumber !1048, !opSignedness !388
  %"241.param_vector" = alloca float*, align 8, !opID !1049, !stats.instNumber !1050, !opSignedness !388
  %"242.i" = alloca i32, align 4, !opID !1051, !stats.instNumber !1052, !opSignedness !388
  store i32 0, i32* %"236.retval", align 4, !opID !1053, !stats.instNumber !1054, !opSignedness !388
  store i32 %argc, i32* %"237.argc.addr", align 4, !opID !1055, !stats.instNumber !1056, !opSignedness !388
  store i8** %argv, i8*** %"238.argv.addr", align 8, !opID !1057, !stats.instNumber !1058, !opSignedness !388
  %"246." = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !opID !1059, !stats.instNumber !1060, !opSignedness !388
  call void @setbuf(%struct._IO_FILE* %"246.", i8* null) #15, !opID !1061, !stats.instNumber !1062, !opSignedness !388
  %"248.call" = call i8* @_Znam(i64 20480000) #16, !opID !1063, !stats.instNumber !1064, !opSignedness !388
  %"249." = bitcast i8* %"248.call" to float*, !opID !1065, !stats.instNumber !1066, !opSignedness !388
  store float* %"249.", float** %"239.data_points", align 8, !opID !1067, !stats.instNumber !1068, !opSignedness !388
  %"251.call1" = call i8* @_Znam(i64 5000) #16, !opID !1069, !stats.instNumber !1070, !opSignedness !388
  store i8* %"251.call1", i8** %"240.labels", align 8, !opID !1071, !stats.instNumber !1072, !opSignedness !388
  %"253.call2" = call i8* @_Znam(i64 4096) #16, !opID !1073, !stats.instNumber !1074, !opSignedness !388
  %"254." = bitcast i8* %"253.call2" to float*, !opID !1075, !stats.instNumber !1076, !opSignedness !388
  store float* %"254.", float** %"241.param_vector", align 8, !opID !1077, !stats.instNumber !1078, !opSignedness !388
  %"256." = load i8**, i8*** %"238.argv.addr", align 8, !opID !1079, !stats.instNumber !1080, !opSignedness !388
  %"257.arrayidx" = getelementptr inbounds i8*, i8** %"256.", i64 1, !opID !1081, !stats.instNumber !1082, !opSignedness !388
  %"258." = load i8*, i8** %"257.arrayidx", align 8, !opID !1083, !stats.instNumber !1084, !opSignedness !388
  %"259." = load i8**, i8*** %"238.argv.addr", align 8, !opID !1085, !stats.instNumber !1086, !opSignedness !388
  %"260.arrayidx3" = getelementptr inbounds i8*, i8** %"259.", i64 2, !opID !1087, !stats.instNumber !1088, !opSignedness !388
  %"261." = load i8*, i8** %"260.arrayidx3", align 8, !opID !1089, !stats.instNumber !1090, !opSignedness !388
  %"262." = load float*, float** %"239.data_points", align 8, !opID !1091, !stats.instNumber !1092, !opSignedness !388
  %"263." = load i8*, i8** %"240.labels", align 8, !opID !1093, !stats.instNumber !1094, !opSignedness !388
  call void @populateInput(i8* %"258.", i8* %"261.", float* %"262.", i8* %"263."), !opID !1095, !stats.instNumber !1096, !opSignedness !388
  store i32 0, i32* %"242.i", align 4, !opID !1097, !stats.instNumber !1098, !opSignedness !388
  br label %for.cond, !opID !1099, !stats.instNumber !1100, !opSignedness !388

for.cond:                                         ; preds = %for.inc, %entry
  %"267." = load i32, i32* %"242.i", align 4, !opID !1101, !stats.instNumber !1102, !opSignedness !388
  %"268.cmp" = icmp slt i32 %"267.", 1024, !opID !1103, !stats.instNumber !1104, !opSignedness !388
  br i1 %"268.cmp", label %for.body, label %for.end, !opID !1105, !stats.instNumber !1106, !opSignedness !388

for.body:                                         ; preds = %for.cond
  %"270." = load float*, float** %"241.param_vector", align 8, !opID !1107, !stats.instNumber !1108, !opSignedness !388
  %"271." = load i32, i32* %"242.i", align 4, !opID !1109, !stats.instNumber !1110, !opSignedness !388
  %"272.idxprom" = sext i32 %"271." to i64, !opID !1111, !stats.instNumber !1112, !opSignedness !388
  %"273.arrayidx4" = getelementptr inbounds float, float* %"270.", i64 %"272.idxprom", !opID !1113, !stats.instNumber !1114, !opSignedness !388
  store float 0.000000e+00, float* %"273.arrayidx4", align 4, !opID !1115, !stats.instNumber !1116, !opSignedness !388
  br label %for.inc, !opID !1117, !stats.instNumber !1118, !opSignedness !388

for.inc:                                          ; preds = %for.body
  %"276." = load i32, i32* %"242.i", align 4, !opID !1119, !stats.instNumber !1120, !opSignedness !388
  %"277.inc" = add nsw i32 %"276.", 1, !opID !1121, !stats.instNumber !1122, !opSignedness !388
  %0 = sext i32 %"277.inc" to i64
  call void @profOp(i64 277, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32)
  store i32 %"277.inc", i32* %"242.i", align 4, !opID !1123, !stats.instNumber !1124, !opSignedness !388
  br label %for.cond, !opID !1125, !stats.instNumber !1126, !opSignedness !388

for.end:                                          ; preds = %for.cond
  %"280." = load float*, float** %"239.data_points", align 8, !opID !1127, !stats.instNumber !1128, !opSignedness !388
  %"281." = load i8*, i8** %"240.labels", align 8, !opID !1129, !stats.instNumber !1130, !opSignedness !388
  %"282." = load float*, float** %"241.param_vector", align 8, !opID !1131, !stats.instNumber !1132, !opSignedness !388
  call void @_Z5SgdLRPfPhS_(float* %"280.", i8* %"281.", float* %"282."), !opID !1133, !stats.instNumber !1134, !opSignedness !388
  %"284." = load float*, float** %"241.param_vector", align 8, !opID !1135, !stats.instNumber !1136, !opSignedness !388
  %"285." = load float*, float** %"239.data_points", align 8, !opID !1137, !stats.instNumber !1138, !opSignedness !388
  %"286." = load i8*, i8** %"240.labels", align 8, !opID !1139, !stats.instNumber !1140, !opSignedness !388
  call void @populateOutput(float* %"284.", float* %"285.", i8* %"286."), !opID !1141, !stats.instNumber !1142, !opSignedness !388
  %"288." = load float*, float** %"239.data_points", align 8, !opID !1143, !stats.instNumber !1144, !opSignedness !388
  %"289.isnull" = icmp eq float* %"288.", null, !opID !1145, !stats.instNumber !1146, !opSignedness !388
  br i1 %"289.isnull", label %delete.end, label %delete.notnull, !opID !1147, !stats.instNumber !1148, !opSignedness !388

delete.notnull:                                   ; preds = %for.end
  %"291." = bitcast float* %"288." to i8*, !opID !1149, !stats.instNumber !1150, !opSignedness !388
  call void @_ZdaPv(i8* %"291.") #17, !opID !1151, !stats.instNumber !1152, !opSignedness !388
  br label %delete.end, !opID !1153, !stats.instNumber !1154, !opSignedness !388

delete.end:                                       ; preds = %delete.notnull, %for.end
  %"294." = load i8*, i8** %"240.labels", align 8, !opID !1155, !stats.instNumber !1156, !opSignedness !388
  %"295.isnull5" = icmp eq i8* %"294.", null, !opID !1157, !stats.instNumber !1158, !opSignedness !388
  br i1 %"295.isnull5", label %delete.end7, label %delete.notnull6, !opID !1159, !stats.instNumber !1160, !opSignedness !388

delete.notnull6:                                  ; preds = %delete.end
  call void @_ZdaPv(i8* %"294.") #17, !opID !1161, !stats.instNumber !1162, !opSignedness !388
  br label %delete.end7, !opID !1163, !stats.instNumber !1164, !opSignedness !388

delete.end7:                                      ; preds = %delete.notnull6, %delete.end
  %"299." = load float*, float** %"241.param_vector", align 8, !opID !1165, !stats.instNumber !1166, !opSignedness !388
  %"300.isnull8" = icmp eq float* %"299.", null, !opID !1167, !stats.instNumber !1168, !opSignedness !388
  br i1 %"300.isnull8", label %delete.end10, label %delete.notnull9, !opID !1169, !stats.instNumber !1170, !opSignedness !388

delete.notnull9:                                  ; preds = %delete.end7
  %"302." = bitcast float* %"299." to i8*, !opID !1171, !stats.instNumber !1172, !opSignedness !388
  call void @_ZdaPv(i8* %"302.") #17, !opID !1173, !stats.instNumber !1174, !opSignedness !388
  br label %delete.end10, !opID !1175, !stats.instNumber !1176, !opSignedness !388

delete.end10:                                     ; preds = %delete.notnull9, %delete.end7
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @filename, i32 0, i32 0))
  ret i32 0, !opID !374, !stats.instNumber !1177, !opSignedness !388
}

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #4

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #10

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #11

; Function Attrs: noinline nounwind optnone uwtable
define void @saveProfile(i8* %fileName) #3 {
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
  call void @free(i8* %27) #15
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

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #12

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #12

; Function Attrs: nounwind
declare void @free(i8*) #4

declare i32 @fclose(%struct._IO_FILE*) #12

declare i32 @printf(i8*, ...) #12

; Function Attrs: noinline nounwind optnone uwtable
define float @_Z10dotProductPfS_m(float* %param_vector, float* %data_point_i, i64 %num_features) #3 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param_vector, float** %param_vector.addr, align 8
  store float* %data_point_i, float** %data_point_i.addr, align 8
  store i64 %num_features, i64* %num_features.addr, align 8
  store float 0.000000e+00, float* %result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, i64* %num_features.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %param_vector.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %4 = load float, float* %arrayidx, align 4
  %5 = load float*, float** %data_point_i.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1
  %7 = load float, float* %arrayidx2, align 4
  %mul = fmul float %4, %7
  %8 = load float, float* %result, align 4
  %add = fadd float %8, %mul
  store float %add, float* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load float, float* %result, align 4
  ret float %10
}

; Function Attrs: noinline nounwind optnone uwtable
define zeroext i8 @_Z13getPredictionPfS_md(float* %parameter_vector, float* %data_point_i, i64 %num_features, double %treshold) #3 {
entry:
  %retval = alloca i8, align 1
  %parameter_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %treshold.addr = alloca double, align 8
  %parameter_vector_dot_x_i = alloca float, align 4
  store float* %parameter_vector, float** %parameter_vector.addr, align 8
  store float* %data_point_i, float** %data_point_i.addr, align 8
  store i64 %num_features, i64* %num_features.addr, align 8
  store double %treshold, double* %treshold.addr, align 8
  %0 = load float*, float** %parameter_vector.addr, align 8
  %1 = load float*, float** %data_point_i.addr, align 8
  %2 = load i64, i64* %num_features.addr, align 8
  %call = call float @_Z10dotProductPfS_m(float* %0, float* %1, i64 %2)
  store float %call, float* %parameter_vector_dot_x_i, align 4
  %3 = load float, float* %parameter_vector_dot_x_i, align 4
  %conv = fpext float %3 to double
  %4 = load double, double* %treshold.addr, align 8
  %cmp = fcmp ogt double %conv, %4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8 1, i8* %retval, align 1
  br label %return

if.else:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1
  ret i8 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %data_set, double* dereferenceable(8) %cumulative_true_positive_rate, double* dereferenceable(8) %cumulative_false_positive_rate, double* dereferenceable(8) %cumulative_error) #3 {
entry:
  %cumulative_true_positive_rate.addr = alloca double*, align 8
  %cumulative_false_positive_rate.addr = alloca double*, align 8
  %cumulative_error.addr = alloca double*, align 8
  %true_positives = alloca i64, align 8
  %true_negatives = alloca i64, align 8
  %false_positives = alloca i64, align 8
  %false_negatives = alloca i64, align 8
  %i = alloca i64, align 8
  %prediction = alloca i8, align 1
  %error_rate = alloca double, align 8
  store double* %cumulative_true_positive_rate, double** %cumulative_true_positive_rate.addr, align 8
  store double* %cumulative_false_positive_rate, double** %cumulative_false_positive_rate.addr, align 8
  store double* %cumulative_error, double** %cumulative_error.addr, align 8
  store i64 0, i64* %true_positives, align 8
  store i64 0, i64* %true_negatives, align 8
  store i64 0, i64* %false_positives, align 8
  store i64 0, i64* %false_negatives, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3
  %1 = load i64, i64* %num_data_points, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 2
  %2 = load float*, float** %parameter_vector, align 8
  %data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 0
  %3 = load float*, float** %data_points, align 8
  %4 = load i64, i64* %i, align 8
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4
  %5 = load i64, i64* %num_features, align 8
  %mul = mul i64 %4, %5
  %arrayidx = getelementptr inbounds float, float* %3, i64 %mul
  %num_features1 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4
  %6 = load i64, i64* %num_features1, align 8
  %call = call zeroext i8 @_Z13getPredictionPfS_md(float* %2, float* %arrayidx, i64 %6, double 0.000000e+00)
  store i8 %call, i8* %prediction, align 1
  %7 = load i8, i8* %prediction, align 1
  %conv = zext i8 %7 to i32
  %labels = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 1
  %8 = load i8*, i8** %labels, align 8
  %9 = load i64, i64* %i, align 8
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9
  %10 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %10 to i32
  %cmp4 = icmp ne i32 %conv, %conv3
  br i1 %cmp4, label %if.then, label %if.else9

if.then:                                          ; preds = %for.body
  %11 = load i8, i8* %prediction, align 1
  %conv5 = zext i8 %11 to i32
  %cmp6 = icmp eq i32 %conv5, 1
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %12 = load i64, i64* %false_positives, align 8
  %inc = add i64 %12, 1
  store i64 %inc, i64* %false_positives, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %13 = load i64, i64* %false_negatives, align 8
  %inc8 = add i64 %13, 1
  store i64 %inc8, i64* %false_negatives, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end17

if.else9:                                         ; preds = %for.body
  %14 = load i8, i8* %prediction, align 1
  %conv10 = zext i8 %14 to i32
  %cmp11 = icmp eq i32 %conv10, 1
  br i1 %cmp11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.else9
  %15 = load i64, i64* %true_positives, align 8
  %inc13 = add i64 %15, 1
  store i64 %inc13, i64* %true_positives, align 8
  br label %if.end16

if.else14:                                        ; preds = %if.else9
  %16 = load i64, i64* %true_negatives, align 8
  %inc15 = add i64 %16, 1
  store i64 %inc15, i64* %true_negatives, align 8
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %17 = load i64, i64* %i, align 8
  %inc18 = add i64 %17, 1
  store i64 %inc18, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i64, i64* %false_positives, align 8
  %19 = load i64, i64* %false_negatives, align 8
  %add = add i64 %18, %19
  %conv19 = uitofp i64 %add to double
  %num_data_points20 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3
  %20 = load i64, i64* %num_data_points20, align 8
  %conv21 = uitofp i64 %20 to double
  %div = fdiv double %conv19, %conv21
  store double %div, double* %error_rate, align 8
  %21 = load i64, i64* %true_positives, align 8
  %conv22 = uitofp i64 %21 to double
  %22 = load i64, i64* %true_positives, align 8
  %23 = load i64, i64* %false_negatives, align 8
  %add23 = add i64 %22, %23
  %conv24 = uitofp i64 %add23 to double
  %div25 = fdiv double %conv22, %conv24
  %24 = load double*, double** %cumulative_true_positive_rate.addr, align 8
  %25 = load double, double* %24, align 8
  %add26 = fadd double %25, %div25
  store double %add26, double* %24, align 8
  %26 = load i64, i64* %false_positives, align 8
  %conv27 = uitofp i64 %26 to double
  %27 = load i64, i64* %false_positives, align 8
  %28 = load i64, i64* %true_negatives, align 8
  %add28 = add i64 %27, %28
  %conv29 = uitofp i64 %add28 to double
  %div30 = fdiv double %conv27, %conv29
  %29 = load double*, double** %cumulative_false_positive_rate.addr, align 8
  %30 = load double, double* %29, align 8
  %add31 = fadd double %30, %div30
  store double %add31, double* %29, align 8
  %31 = load double, double* %error_rate, align 8
  %32 = load double*, double** %cumulative_error.addr, align 8
  %33 = load double, double* %32, align 8
  %add32 = fadd double %33, %31
  store double %add32, double* %32, align 8
  %34 = load double, double* %error_rate, align 8
  ret double %34
}

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %str_points_filepath, i8* %str_labels_filepath, float* %data_points, i8* %labels) #13 {
entry:
  %str_points_filepath.addr = alloca i8*, align 8
  %str_labels_filepath.addr = alloca i8*, align 8
  %data_points.addr = alloca float*, align 8
  %labels.addr = alloca i8*, align 8
  %data_file = alloca %struct._IO_FILE*, align 8
  %label_file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %tmp = alloca float, align 4
  %i9 = alloca i32, align 4
  %tmp13 = alloca i32, align 4
  store i8* %str_points_filepath, i8** %str_points_filepath.addr, align 8
  store i8* %str_labels_filepath, i8** %str_labels_filepath.addr, align 8
  store float* %data_points, float** %data_points.addr, align 8
  store i8* %labels, i8** %labels.addr, align 8
  %0 = load i8*, i8** %str_points_filepath.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %data_file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %str_points_filepath.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1.4, i32 0, i32 0), i8* %2)
  call void @exit(i32 1) #18
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %3, 5120000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2.5, i32 0, i32 0), float* %tmp)
  %5 = load float, float* %tmp, align 4
  %6 = load float*, float** %data_points.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom
  store float %5, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %call3 = call i32 @fclose(%struct._IO_FILE* %9)
  %10 = load i8*, i8** %str_labels_filepath.addr, align 8
  %call4 = call noalias %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call4, %struct._IO_FILE** %label_file, align 8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %tobool5 = icmp ne %struct._IO_FILE* %11, null
  br i1 %tobool5, label %if.end8, label %if.then6

if.then6:                                         ; preds = %for.end
  %12 = load i8*, i8** %str_labels_filepath.addr, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3.6, i32 0, i32 0), i8* %12)
  call void @exit(i32 1) #18
  unreachable

if.end8:                                          ; preds = %for.end
  store i32 0, i32* %i9, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc17, %if.end8
  %13 = load i32, i32* %i9, align 4
  %cmp11 = icmp slt i32 %13, 5000
  br i1 %cmp11, label %for.body12, label %for.end19

for.body12:                                       ; preds = %for.cond10
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %tmp13)
  %15 = load i32, i32* %tmp13, align 4
  %conv = trunc i32 %15 to i8
  %16 = load i8*, i8** %labels.addr, align 8
  %17 = load i32, i32* %i9, align 4
  %idxprom15 = sext i32 %17 to i64
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i64 %idxprom15
  store i8 %conv, i8* %arrayidx16, align 1
  br label %for.inc17

for.inc17:                                        ; preds = %for.body12
  %18 = load i32, i32* %i9, align 4
  %inc18 = add nsw i32 %18, 1
  store i32 %inc18, i32* %i9, align 4
  br label %for.cond10

for.end19:                                        ; preds = %for.cond10
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %call20 = call i32 @fclose(%struct._IO_FILE* %19)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #14

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #12

; Function Attrs: noinline optnone uwtable
define void @populateOutput(float* %param_vector, float* %data_points, i8* %labels) #13 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_points.addr = alloca float*, align 8
  %labels.addr = alloca i8*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %training_tpr = alloca double, align 8
  %training_fpr = alloca double, align 8
  %training_error = alloca double, align 8
  %testing_tpr = alloca double, align 8
  %testing_fpr = alloca double, align 8
  %testing_error = alloca double, align 8
  %training_set = alloca %struct.DataSet_s, align 8
  %agg.tmp = alloca %struct.DataSet_s, align 8
  %testing_set = alloca %struct.DataSet_s, align 8
  %agg.tmp16 = alloca %struct.DataSet_s, align 8
  store float* %param_vector, float** %param_vector.addr, align 8
  store float* %data_points, float** %data_points.addr, align 8
  store i8* %labels, i8** %labels.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #18
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %2, 30
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %4 = load i32, i32* %i, align 4
  %5 = load float*, float** %param_vector.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds float, float* %5, i64 %idxprom
  %7 = load float, float* %arrayidx, align 4
  %conv = fpext float %7 to double
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0), i32 %4, double %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0))
  store double 0.000000e+00, double* %training_tpr, align 8
  store double 0.000000e+00, double* %training_fpr, align 8
  store double 0.000000e+00, double* %training_error, align 8
  store double 0.000000e+00, double* %testing_tpr, align 8
  store double 0.000000e+00, double* %testing_fpr, align 8
  store double 0.000000e+00, double* %testing_error, align 8
  %10 = load float*, float** %data_points.addr, align 8
  %data_points6 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 0
  store float* %10, float** %data_points6, align 8
  %11 = load i8*, i8** %labels.addr, align 8
  %labels7 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 1
  store i8* %11, i8** %labels7, align 8
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 3
  store i64 4500, i64* %num_data_points, align 8
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 4
  store i64 1024, i64* %num_features, align 8
  %12 = load float*, float** %param_vector.addr, align 8
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 2
  store float* %12, float** %parameter_vector, align 8
  %13 = bitcast %struct.DataSet_s* %agg.tmp to i8*
  %14 = bitcast %struct.DataSet_s* %training_set to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 40, i1 false)
  %call8 = call double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp, double* dereferenceable(8) %training_tpr, double* dereferenceable(8) %training_fpr, double* dereferenceable(8) %training_error)
  %15 = load float*, float** %data_points.addr, align 8
  %arrayidx9 = getelementptr inbounds float, float* %15, i64 4608000
  %data_points10 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 0
  store float* %arrayidx9, float** %data_points10, align 8
  %16 = load i8*, i8** %labels.addr, align 8
  %arrayidx11 = getelementptr inbounds i8, i8* %16, i64 4500
  %labels12 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 1
  store i8* %arrayidx11, i8** %labels12, align 8
  %num_data_points13 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 3
  store i64 500, i64* %num_data_points13, align 8
  %num_features14 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 4
  store i64 1024, i64* %num_features14, align 8
  %17 = load float*, float** %param_vector.addr, align 8
  %parameter_vector15 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 2
  store float* %17, float** %parameter_vector15, align 8
  %18 = bitcast %struct.DataSet_s* %agg.tmp16 to i8*
  %19 = bitcast %struct.DataSet_s* %testing_set to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %18, i8* align 8 %19, i64 40, i1 false)
  %call17 = call double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp16, double* dereferenceable(8) %testing_tpr, double* dereferenceable(8) %testing_fpr, double* dereferenceable(8) %testing_error)
  %20 = load double, double* %training_tpr, align 8
  %mul = fmul double %20, 1.000000e+02
  store double %mul, double* %training_tpr, align 8
  %21 = load double, double* %training_fpr, align 8
  %mul18 = fmul double %21, 1.000000e+02
  store double %mul18, double* %training_fpr, align 8
  %22 = load double, double* %training_error, align 8
  %mul19 = fmul double %22, 1.000000e+02
  store double %mul19, double* %training_error, align 8
  %23 = load double, double* %testing_tpr, align 8
  %mul20 = fmul double %23, 1.000000e+02
  store double %mul20, double* %testing_tpr, align 8
  %24 = load double, double* %testing_fpr, align 8
  %mul21 = fmul double %24, 1.000000e+02
  store double %mul21, double* %testing_fpr, align 8
  %25 = load double, double* %testing_error, align 8
  %mul22 = fmul double %25, 1.000000e+02
  store double %mul22, double* %testing_error, align 8
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %27 = load double, double* %training_tpr, align 8
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i32 0, i32 0), double %27)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %29 = load double, double* %training_fpr, align 8
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i32 0, i32 0), double %29)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %31 = load double, double* %training_error, align 8
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i32 0, i32 0), double %31)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %33 = load double, double* %testing_tpr, align 8
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i32 0, i32 0), double %33)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %35 = load double, double* %testing_fpr, align 8
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i32 0, i32 0), double %35)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %37 = load double, double* %testing_error, align 8
  %call28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), double %37)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call29 = call i32 @fclose(%struct._IO_FILE* %38)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="dotProduct" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="Sigmoid" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="computeGradient" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="updateParameter" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="SgdLR" "fpga.top.func"="SgdLR" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind }
attributes #16 = { builtin }
attributes #17 = { builtin nounwind }
attributes #18 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373}
!OP-ID-COUNTER = !{!374}
!llvm.module.flags = !{!375, !376, !377}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3, imports: !15)
!1 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/spam_ahls/solution1/.autopilot/db/sgd.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!2 = !{}
!3 = !{!4, !9, !11, !13}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "NUM_FEATURES", scope: !0, file: !6, line: 13, type: !7, isLocal: true, isDefinition: true)
!6 = !DIFile(filename: "benchmarks/rosetta/spam-filter/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression(DW_OP_constu, 5, DW_OP_stack_value))
!10 = distinct !DIGlobalVariable(name: "NUM_EPOCHS", scope: !0, file: !6, line: 18, type: !7, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 4500, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "NUM_TRAINING", scope: !0, file: !6, line: 15, type: !7, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression(DW_OP_constu, 60000, DW_OP_stack_value))
!14 = distinct !DIGlobalVariable(name: "STEP_SIZE", scope: !0, file: !6, line: 17, type: !7, isLocal: true, isDefinition: true)
!15 = !{!16, !23, !30, !32, !34, !38, !40, !42, !44, !46, !48, !50, !52, !57, !61, !63, !65, !70, !72, !74, !76, !78, !80, !82, !85, !88, !90, !94, !99, !101, !103, !105, !107, !109, !111, !113, !115, !117, !119, !123, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !161, !165, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !191, !195, !199, !201, !203, !205, !210, !214, !218, !220, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !247, !251, !255, !257, !259, !261, !268, !272, !276, !278, !280, !282, !284, !286, !288, !292, !296, !298, !300, !302, !304, !308, !312, !316, !318, !320, !322, !324, !326, !328, !332, !336, !340, !342, !346, !350, !352, !354, !356, !358, !360, !362, !368}
!16 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !18, file: !22, line: 52)
!17 = !DINamespace(name: "std", scope: null)
!18 = !DISubprogram(name: "abs", scope: !19, file: !19, line: 848, type: !20, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!19 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!20 = !DISubroutineType(types: !21)
!21 = !{!8, !8}
!22 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !24, file: !29, line: 83)
!24 = !DISubprogram(name: "acos", scope: !25, file: !25, line: 53, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!29 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cmath", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !31, file: !29, line: 102)
!31 = !DISubprogram(name: "asin", scope: !25, file: !25, line: 55, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !33, file: !29, line: 121)
!33 = !DISubprogram(name: "atan", scope: !25, file: !25, line: 57, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !35, file: !29, line: 140)
!35 = !DISubprogram(name: "atan2", scope: !25, file: !25, line: 59, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DISubroutineType(types: !37)
!37 = !{!28, !28, !28}
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !39, file: !29, line: 161)
!39 = !DISubprogram(name: "ceil", scope: !25, file: !25, line: 159, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !41, file: !29, line: 180)
!41 = !DISubprogram(name: "cos", scope: !25, file: !25, line: 62, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !43, file: !29, line: 199)
!43 = !DISubprogram(name: "cosh", scope: !25, file: !25, line: 71, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !45, file: !29, line: 218)
!45 = !DISubprogram(name: "exp", scope: !25, file: !25, line: 95, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !47, file: !29, line: 237)
!47 = !DISubprogram(name: "fabs", scope: !25, file: !25, line: 162, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !49, file: !29, line: 256)
!49 = !DISubprogram(name: "floor", scope: !25, file: !25, line: 165, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !51, file: !29, line: 275)
!51 = !DISubprogram(name: "fmod", scope: !25, file: !25, line: 168, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !53, file: !29, line: 296)
!53 = !DISubprogram(name: "frexp", scope: !25, file: !25, line: 98, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DISubroutineType(types: !55)
!55 = !{!28, !28, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !58, file: !29, line: 315)
!58 = !DISubprogram(name: "ldexp", scope: !25, file: !25, line: 101, type: !59, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DISubroutineType(types: !60)
!60 = !{!28, !28, !8}
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !62, file: !29, line: 334)
!62 = !DISubprogram(name: "log", scope: !25, file: !25, line: 104, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !64, file: !29, line: 353)
!64 = !DISubprogram(name: "log10", scope: !25, file: !25, line: 107, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !66, file: !29, line: 372)
!66 = !DISubprogram(name: "modf", scope: !25, file: !25, line: 110, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{!28, !28, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !71, file: !29, line: 384)
!71 = !DISubprogram(name: "pow", scope: !25, file: !25, line: 140, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !73, file: !29, line: 421)
!73 = !DISubprogram(name: "sin", scope: !25, file: !25, line: 64, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !75, file: !29, line: 440)
!75 = !DISubprogram(name: "sinh", scope: !25, file: !25, line: 73, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !77, file: !29, line: 459)
!77 = !DISubprogram(name: "sqrt", scope: !25, file: !25, line: 143, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !79, file: !29, line: 478)
!79 = !DISubprogram(name: "tan", scope: !25, file: !25, line: 66, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !81, file: !29, line: 497)
!81 = !DISubprogram(name: "tanh", scope: !25, file: !25, line: 75, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !83, file: !29, line: 1065)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !84, line: 164, baseType: !28)
!84 = !DIFile(filename: "/usr/include/math.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !86, file: !29, line: 1066)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !84, line: 163, baseType: !87)
!87 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !89, file: !29, line: 1069)
!89 = !DISubprogram(name: "acosh", scope: !25, file: !25, line: 85, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !91, file: !29, line: 1070)
!91 = !DISubprogram(name: "acoshf", scope: !25, file: !25, line: 85, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DISubroutineType(types: !93)
!93 = !{!87, !87}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !95, file: !29, line: 1071)
!95 = !DISubprogram(name: "acoshl", scope: !25, file: !25, line: 85, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !98}
!98 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !100, file: !29, line: 1073)
!100 = !DISubprogram(name: "asinh", scope: !25, file: !25, line: 87, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !102, file: !29, line: 1074)
!102 = !DISubprogram(name: "asinhf", scope: !25, file: !25, line: 87, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !104, file: !29, line: 1075)
!104 = !DISubprogram(name: "asinhl", scope: !25, file: !25, line: 87, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !106, file: !29, line: 1077)
!106 = !DISubprogram(name: "atanh", scope: !25, file: !25, line: 89, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !108, file: !29, line: 1078)
!108 = !DISubprogram(name: "atanhf", scope: !25, file: !25, line: 89, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !110, file: !29, line: 1079)
!110 = !DISubprogram(name: "atanhl", scope: !25, file: !25, line: 89, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !112, file: !29, line: 1081)
!112 = !DISubprogram(name: "cbrt", scope: !25, file: !25, line: 152, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !114, file: !29, line: 1082)
!114 = !DISubprogram(name: "cbrtf", scope: !25, file: !25, line: 152, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !116, file: !29, line: 1083)
!116 = !DISubprogram(name: "cbrtl", scope: !25, file: !25, line: 152, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !118, file: !29, line: 1085)
!118 = !DISubprogram(name: "copysign", scope: !25, file: !25, line: 198, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !120, file: !29, line: 1086)
!120 = !DISubprogram(name: "copysignf", scope: !25, file: !25, line: 198, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!87, !87, !87}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !124, file: !29, line: 1087)
!124 = !DISubprogram(name: "copysignl", scope: !25, file: !25, line: 198, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!98, !98, !98}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !128, file: !29, line: 1089)
!128 = !DISubprogram(name: "erf", scope: !25, file: !25, line: 231, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !130, file: !29, line: 1090)
!130 = !DISubprogram(name: "erff", scope: !25, file: !25, line: 231, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !132, file: !29, line: 1091)
!132 = !DISubprogram(name: "erfl", scope: !25, file: !25, line: 231, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !134, file: !29, line: 1093)
!134 = !DISubprogram(name: "erfc", scope: !25, file: !25, line: 232, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !136, file: !29, line: 1094)
!136 = !DISubprogram(name: "erfcf", scope: !25, file: !25, line: 232, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !138, file: !29, line: 1095)
!138 = !DISubprogram(name: "erfcl", scope: !25, file: !25, line: 232, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !140, file: !29, line: 1097)
!140 = !DISubprogram(name: "exp2", scope: !25, file: !25, line: 130, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !142, file: !29, line: 1098)
!142 = !DISubprogram(name: "exp2f", scope: !25, file: !25, line: 130, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !144, file: !29, line: 1099)
!144 = !DISubprogram(name: "exp2l", scope: !25, file: !25, line: 130, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !146, file: !29, line: 1101)
!146 = !DISubprogram(name: "expm1", scope: !25, file: !25, line: 119, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !148, file: !29, line: 1102)
!148 = !DISubprogram(name: "expm1f", scope: !25, file: !25, line: 119, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !150, file: !29, line: 1103)
!150 = !DISubprogram(name: "expm1l", scope: !25, file: !25, line: 119, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !152, file: !29, line: 1105)
!152 = !DISubprogram(name: "fdim", scope: !25, file: !25, line: 329, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !154, file: !29, line: 1106)
!154 = !DISubprogram(name: "fdimf", scope: !25, file: !25, line: 329, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !156, file: !29, line: 1107)
!156 = !DISubprogram(name: "fdiml", scope: !25, file: !25, line: 329, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !158, file: !29, line: 1109)
!158 = !DISubprogram(name: "fma", scope: !25, file: !25, line: 340, type: !159, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!28, !28, !28, !28}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !162, file: !29, line: 1110)
!162 = !DISubprogram(name: "fmaf", scope: !25, file: !25, line: 340, type: !163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DISubroutineType(types: !164)
!164 = !{!87, !87, !87, !87}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !166, file: !29, line: 1111)
!166 = !DISubprogram(name: "fmal", scope: !25, file: !25, line: 340, type: !167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!98, !98, !98, !98}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !170, file: !29, line: 1113)
!170 = !DISubprogram(name: "fmax", scope: !25, file: !25, line: 333, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !172, file: !29, line: 1114)
!172 = !DISubprogram(name: "fmaxf", scope: !25, file: !25, line: 333, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !174, file: !29, line: 1115)
!174 = !DISubprogram(name: "fmaxl", scope: !25, file: !25, line: 333, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !176, file: !29, line: 1117)
!176 = !DISubprogram(name: "fmin", scope: !25, file: !25, line: 336, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !178, file: !29, line: 1118)
!178 = !DISubprogram(name: "fminf", scope: !25, file: !25, line: 336, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !180, file: !29, line: 1119)
!180 = !DISubprogram(name: "fminl", scope: !25, file: !25, line: 336, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !182, file: !29, line: 1121)
!182 = !DISubprogram(name: "hypot", scope: !25, file: !25, line: 147, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !184, file: !29, line: 1122)
!184 = !DISubprogram(name: "hypotf", scope: !25, file: !25, line: 147, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !186, file: !29, line: 1123)
!186 = !DISubprogram(name: "hypotl", scope: !25, file: !25, line: 147, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !188, file: !29, line: 1125)
!188 = !DISubprogram(name: "ilogb", scope: !25, file: !25, line: 283, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!8, !28}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !192, file: !29, line: 1126)
!192 = !DISubprogram(name: "ilogbf", scope: !25, file: !25, line: 283, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!8, !87}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !196, file: !29, line: 1127)
!196 = !DISubprogram(name: "ilogbl", scope: !25, file: !25, line: 283, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!8, !98}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !200, file: !29, line: 1129)
!200 = !DISubprogram(name: "lgamma", scope: !25, file: !25, line: 233, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !202, file: !29, line: 1130)
!202 = !DISubprogram(name: "lgammaf", scope: !25, file: !25, line: 233, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !204, file: !29, line: 1131)
!204 = !DISubprogram(name: "lgammal", scope: !25, file: !25, line: 233, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !206, file: !29, line: 1134)
!206 = !DISubprogram(name: "llrint", scope: !25, file: !25, line: 319, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !28}
!209 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !211, file: !29, line: 1135)
!211 = !DISubprogram(name: "llrintf", scope: !25, file: !25, line: 319, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DISubroutineType(types: !213)
!213 = !{!209, !87}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !215, file: !29, line: 1136)
!215 = !DISubprogram(name: "llrintl", scope: !25, file: !25, line: 319, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!209, !98}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !219, file: !29, line: 1138)
!219 = !DISubprogram(name: "llround", scope: !25, file: !25, line: 325, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !221, file: !29, line: 1139)
!221 = !DISubprogram(name: "llroundf", scope: !25, file: !25, line: 325, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !223, file: !29, line: 1140)
!223 = !DISubprogram(name: "llroundl", scope: !25, file: !25, line: 325, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !225, file: !29, line: 1143)
!225 = !DISubprogram(name: "log1p", scope: !25, file: !25, line: 122, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !227, file: !29, line: 1144)
!227 = !DISubprogram(name: "log1pf", scope: !25, file: !25, line: 122, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !229, file: !29, line: 1145)
!229 = !DISubprogram(name: "log1pl", scope: !25, file: !25, line: 122, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !231, file: !29, line: 1147)
!231 = !DISubprogram(name: "log2", scope: !25, file: !25, line: 133, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !233, file: !29, line: 1148)
!233 = !DISubprogram(name: "log2f", scope: !25, file: !25, line: 133, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !235, file: !29, line: 1149)
!235 = !DISubprogram(name: "log2l", scope: !25, file: !25, line: 133, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !237, file: !29, line: 1151)
!237 = !DISubprogram(name: "logb", scope: !25, file: !25, line: 125, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !239, file: !29, line: 1152)
!239 = !DISubprogram(name: "logbf", scope: !25, file: !25, line: 125, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !241, file: !29, line: 1153)
!241 = !DISubprogram(name: "logbl", scope: !25, file: !25, line: 125, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !243, file: !29, line: 1155)
!243 = !DISubprogram(name: "lrint", scope: !25, file: !25, line: 317, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DISubroutineType(types: !245)
!245 = !{!246, !28}
!246 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !248, file: !29, line: 1156)
!248 = !DISubprogram(name: "lrintf", scope: !25, file: !25, line: 317, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!246, !87}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !252, file: !29, line: 1157)
!252 = !DISubprogram(name: "lrintl", scope: !25, file: !25, line: 317, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!246, !98}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !256, file: !29, line: 1159)
!256 = !DISubprogram(name: "lround", scope: !25, file: !25, line: 323, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !258, file: !29, line: 1160)
!258 = !DISubprogram(name: "lroundf", scope: !25, file: !25, line: 323, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !260, file: !29, line: 1161)
!260 = !DISubprogram(name: "lroundl", scope: !25, file: !25, line: 323, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !262, file: !29, line: 1163)
!262 = !DISubprogram(name: "nan", scope: !25, file: !25, line: 203, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DISubroutineType(types: !264)
!264 = !{!28, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !267)
!267 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !269, file: !29, line: 1164)
!269 = !DISubprogram(name: "nanf", scope: !25, file: !25, line: 203, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DISubroutineType(types: !271)
!271 = !{!87, !265}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !273, file: !29, line: 1165)
!273 = !DISubprogram(name: "nanl", scope: !25, file: !25, line: 203, type: !274, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{!98, !265}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !277, file: !29, line: 1167)
!277 = !DISubprogram(name: "nearbyint", scope: !25, file: !25, line: 297, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !279, file: !29, line: 1168)
!279 = !DISubprogram(name: "nearbyintf", scope: !25, file: !25, line: 297, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !281, file: !29, line: 1169)
!281 = !DISubprogram(name: "nearbyintl", scope: !25, file: !25, line: 297, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !283, file: !29, line: 1171)
!283 = !DISubprogram(name: "nextafter", scope: !25, file: !25, line: 262, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !285, file: !29, line: 1172)
!285 = !DISubprogram(name: "nextafterf", scope: !25, file: !25, line: 262, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !287, file: !29, line: 1173)
!287 = !DISubprogram(name: "nextafterl", scope: !25, file: !25, line: 262, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !289, file: !29, line: 1175)
!289 = !DISubprogram(name: "nexttoward", scope: !25, file: !25, line: 264, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!28, !28, !98}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !293, file: !29, line: 1176)
!293 = !DISubprogram(name: "nexttowardf", scope: !25, file: !25, line: 264, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!87, !87, !98}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !297, file: !29, line: 1177)
!297 = !DISubprogram(name: "nexttowardl", scope: !25, file: !25, line: 264, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !299, file: !29, line: 1179)
!299 = !DISubprogram(name: "remainder", scope: !25, file: !25, line: 275, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !301, file: !29, line: 1180)
!301 = !DISubprogram(name: "remainderf", scope: !25, file: !25, line: 275, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !303, file: !29, line: 1181)
!303 = !DISubprogram(name: "remainderl", scope: !25, file: !25, line: 275, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !305, file: !29, line: 1183)
!305 = !DISubprogram(name: "remquo", scope: !25, file: !25, line: 310, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!28, !28, !28, !56}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !309, file: !29, line: 1184)
!309 = !DISubprogram(name: "remquof", scope: !25, file: !25, line: 310, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DISubroutineType(types: !311)
!311 = !{!87, !87, !87, !56}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !313, file: !29, line: 1185)
!313 = !DISubprogram(name: "remquol", scope: !25, file: !25, line: 310, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!98, !98, !98, !56}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !317, file: !29, line: 1187)
!317 = !DISubprogram(name: "rint", scope: !25, file: !25, line: 259, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !319, file: !29, line: 1188)
!319 = !DISubprogram(name: "rintf", scope: !25, file: !25, line: 259, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !321, file: !29, line: 1189)
!321 = !DISubprogram(name: "rintl", scope: !25, file: !25, line: 259, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !323, file: !29, line: 1191)
!323 = !DISubprogram(name: "round", scope: !25, file: !25, line: 301, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !325, file: !29, line: 1192)
!325 = !DISubprogram(name: "roundf", scope: !25, file: !25, line: 301, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !327, file: !29, line: 1193)
!327 = !DISubprogram(name: "roundl", scope: !25, file: !25, line: 301, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !329, file: !29, line: 1195)
!329 = !DISubprogram(name: "scalbln", scope: !25, file: !25, line: 293, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!28, !28, !246}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !333, file: !29, line: 1196)
!333 = !DISubprogram(name: "scalblnf", scope: !25, file: !25, line: 293, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{!87, !87, !246}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !337, file: !29, line: 1197)
!337 = !DISubprogram(name: "scalblnl", scope: !25, file: !25, line: 293, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!98, !98, !246}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !341, file: !29, line: 1199)
!341 = !DISubprogram(name: "scalbn", scope: !25, file: !25, line: 279, type: !59, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !343, file: !29, line: 1200)
!343 = !DISubprogram(name: "scalbnf", scope: !25, file: !25, line: 279, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!87, !87, !8}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !347, file: !29, line: 1201)
!347 = !DISubprogram(name: "scalbnl", scope: !25, file: !25, line: 279, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!98, !98, !8}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !351, file: !29, line: 1203)
!351 = !DISubprogram(name: "tgamma", scope: !25, file: !25, line: 238, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !353, file: !29, line: 1204)
!353 = !DISubprogram(name: "tgammaf", scope: !25, file: !25, line: 238, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !355, file: !29, line: 1205)
!355 = !DISubprogram(name: "tgammal", scope: !25, file: !25, line: 238, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !357, file: !29, line: 1207)
!357 = !DISubprogram(name: "trunc", scope: !25, file: !25, line: 305, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !359, file: !29, line: 1208)
!359 = !DISubprogram(name: "truncf", scope: !25, file: !25, line: 305, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !361, file: !29, line: 1209)
!361 = !DISubprogram(name: "truncl", scope: !25, file: !25, line: 305, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !363, file: !367, line: 38)
!363 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !17, file: !22, line: 102, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!366, !366}
!366 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!367 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/math.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !369, file: !367, line: 54)
!369 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !17, file: !29, line: 380, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!98, !98, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!373 = !{!"clang version 7.0.0 "}
!374 = !{i64 305}
!375 = !{i32 2, !"Dwarf Version", i32 4}
!376 = !{i32 2, !"Debug Info Version", i32 3}
!377 = !{i32 1, !"wchar_size", i32 4}
!378 = distinct !DISubprogram(name: "dotProduct", linkageName: "_Z10dotProductPfS_", scope: !379, file: !379, line: 14, type: !380, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!379 = !DIFile(filename: "benchmarks/rosetta/spam-filter/src/sgd.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!380 = !DISubroutineType(types: !381)
!381 = !{!382, !383, !384}
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "FeatureType", file: !6, line: 22, baseType: !87)
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64)
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataType", file: !6, line: 23, baseType: !87)
!386 = !{i64 1}
!387 = !{!"1"}
!388 = !{!"unknownSignedness"}
!389 = !{i64 2}
!390 = !{!"2"}
!391 = !{i64 3}
!392 = !{!"3"}
!393 = !{i64 4}
!394 = !{!"4"}
!395 = !{i64 5}
!396 = !{!"5"}
!397 = !DILocalVariable(name: "param", arg: 1, scope: !378, file: !379, line: 15, type: !383)
!398 = !DILocation(line: 15, column: 17, scope: !378)
!399 = !{i64 6}
!400 = !{!"6"}
!401 = !{i64 7}
!402 = !{!"7"}
!403 = !DILocalVariable(name: "feature", arg: 2, scope: !378, file: !379, line: 16, type: !384)
!404 = !DILocation(line: 16, column: 14, scope: !378)
!405 = !{i64 8}
!406 = !{!"8"}
!407 = !DILocation(line: 18, column: 3, scope: !378)
!408 = !{i64 9}
!409 = !{!"9"}
!410 = !{i64 10}
!411 = !{!"10"}
!412 = !DILocalVariable(name: "result", scope: !378, file: !379, line: 18, type: !382)
!413 = !DILocation(line: 18, column: 15, scope: !378)
!414 = !{i64 11}
!415 = !{!"11"}
!416 = !{i64 12}
!417 = !{!"12"}
!418 = !{i64 13}
!419 = !{!"13"}
!420 = !DILocation(line: 19, column: 13, scope: !421)
!421 = distinct !DILexicalBlock(scope: !378, file: !379, line: 19, column: 8)
!422 = !{i64 14}
!423 = !{!"14"}
!424 = !{i64 15}
!425 = !{!"15"}
!426 = !DILocalVariable(name: "i", scope: !421, file: !379, line: 19, type: !8)
!427 = !DILocation(line: 19, column: 17, scope: !421)
!428 = !{i64 16}
!429 = !{!"16"}
!430 = !{i64 17}
!431 = !{!"17"}
!432 = !{i64 18}
!433 = !{!"18"}
!434 = !DILocation(line: 19, column: 24, scope: !435)
!435 = distinct !DILexicalBlock(scope: !421, file: !379, line: 19, column: 8)
!436 = !{i64 19}
!437 = !{!"19"}
!438 = !DILocation(line: 19, column: 26, scope: !435)
!439 = !{i64 20}
!440 = !{!"20"}
!441 = !DILocation(line: 19, column: 8, scope: !421)
!442 = !{i64 21}
!443 = !{!"21"}
!444 = !DILocation(line: 19, column: 8, scope: !435)
!445 = !{i64 22}
!446 = !{!"22"}
!447 = !{i64 23}
!448 = !{!"23"}
!449 = !{i64 24}
!450 = !{!"24"}
!451 = !DILocation(line: 20, column: 15, scope: !435)
!452 = !{i64 25}
!453 = !{!"25"}
!454 = !DILocation(line: 20, column: 21, scope: !435)
!455 = !{i64 26}
!456 = !{!"26"}
!457 = !{i64 27}
!458 = !{!"27"}
!459 = !{i64 28}
!460 = !{!"28"}
!461 = !{i64 29}
!462 = !{!"29"}
!463 = !DILocation(line: 20, column: 26, scope: !435)
!464 = !{i64 30}
!465 = !{!"30"}
!466 = !DILocation(line: 20, column: 34, scope: !435)
!467 = !{i64 31}
!468 = !{!"31"}
!469 = !{i64 32}
!470 = !{!"32"}
!471 = !{i64 33}
!472 = !{!"33"}
!473 = !{i64 34}
!474 = !{!"34"}
!475 = !DILocation(line: 20, column: 24, scope: !435)
!476 = !{i64 35}
!477 = !{!"35"}
!478 = !DILocation(line: 20, column: 12, scope: !435)
!479 = !{i64 36}
!480 = !{!"36"}
!481 = !{i64 37}
!482 = !{!"37"}
!483 = !{i64 38}
!484 = !{!"38"}
!485 = !DILocation(line: 20, column: 5, scope: !435)
!486 = !{i64 39}
!487 = !{!"39"}
!488 = !DILocation(line: 19, column: 43, scope: !435)
!489 = !{i64 40}
!490 = !{!"40"}
!491 = !{i64 41}
!492 = !{!"41"}
!493 = !{i64 42}
!494 = !{!"42"}
!495 = distinct !{!495, !441, !496, !497}
!496 = !DILocation(line: 20, column: 35, scope: !421)
!497 = !{!"llvm.loop.name", !"DOT"}
!498 = !{i64 43}
!499 = !{!"43"}
!500 = !DILocation(line: 21, column: 10, scope: !378)
!501 = !{i64 44}
!502 = !{!"44"}
!503 = !DILocation(line: 22, column: 1, scope: !378)
!504 = !{i64 45}
!505 = !{!"45"}
!506 = !{i64 46}
!507 = !{!"46"}
!508 = !DILocation(line: 21, column: 3, scope: !378)
!509 = !{i64 47}
!510 = !{!"47"}
!511 = distinct !DISubprogram(name: "Sigmoid", linkageName: "_Z7Sigmoidf", scope: !379, file: !379, line: 24, type: !512, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!512 = !DISubroutineType(types: !513)
!513 = !{!382, !382}
!514 = !{i64 48}
!515 = !{!"48"}
!516 = !{i64 49}
!517 = !{!"49"}
!518 = !DILocalVariable(name: "exponent", arg: 1, scope: !511, file: !379, line: 24, type: !382)
!519 = !DILocation(line: 24, column: 33, scope: !511)
!520 = !{i64 50}
!521 = !{!"50"}
!522 = !DILocation(line: 26, column: 31, scope: !511)
!523 = !{i64 51}
!524 = !{!"51"}
!525 = !DILocation(line: 26, column: 30, scope: !511)
!526 = !{i64 52}
!527 = !{!"52"}
!528 = !DILocation(line: 26, column: 25, scope: !511)
!529 = !{i64 53}
!530 = !{!"53"}
!531 = !DILocation(line: 26, column: 23, scope: !511)
!532 = !{i64 54}
!533 = !{!"54"}
!534 = !DILocation(line: 26, column: 15, scope: !511)
!535 = !{i64 55}
!536 = !{!"55"}
!537 = !DILocation(line: 26, column: 3, scope: !511)
!538 = !{i64 56}
!539 = !{!"56"}
!540 = distinct !DISubprogram(name: "computeGradient", linkageName: "_Z15computeGradientPfS_f", scope: !379, file: !379, line: 30, type: !541, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!541 = !DISubroutineType(types: !542)
!542 = !{null, !383, !384, !382}
!543 = !{i64 57}
!544 = !{!"57"}
!545 = !{i64 58}
!546 = !{!"58"}
!547 = !{i64 59}
!548 = !{!"59"}
!549 = !{i64 60}
!550 = !{!"60"}
!551 = !{i64 61}
!552 = !{!"61"}
!553 = !DILocalVariable(name: "grad", arg: 1, scope: !540, file: !379, line: 31, type: !383)
!554 = !DILocation(line: 31, column: 17, scope: !540)
!555 = !{i64 62}
!556 = !{!"62"}
!557 = !{i64 63}
!558 = !{!"63"}
!559 = !DILocalVariable(name: "feature", arg: 2, scope: !540, file: !379, line: 32, type: !384)
!560 = !DILocation(line: 32, column: 14, scope: !540)
!561 = !{i64 64}
!562 = !{!"64"}
!563 = !{i64 65}
!564 = !{!"65"}
!565 = !DILocalVariable(name: "scale", arg: 3, scope: !540, file: !379, line: 33, type: !382)
!566 = !DILocation(line: 33, column: 17, scope: !540)
!567 = !{i64 66}
!568 = !{!"66"}
!569 = !DILocation(line: 34, column: 1, scope: !540)
!570 = !{i64 67}
!571 = !{!"67"}
!572 = !DILocation(line: 35, column: 14, scope: !573)
!573 = distinct !DILexicalBlock(scope: !540, file: !379, line: 35, column: 9)
!574 = !{i64 68}
!575 = !{!"68"}
!576 = !{i64 69}
!577 = !{!"69"}
!578 = !DILocalVariable(name: "i", scope: !573, file: !379, line: 35, type: !8)
!579 = !DILocation(line: 35, column: 18, scope: !573)
!580 = !{i64 70}
!581 = !{!"70"}
!582 = !{i64 71}
!583 = !{!"71"}
!584 = !{i64 72}
!585 = !{!"72"}
!586 = !DILocation(line: 35, column: 25, scope: !587)
!587 = distinct !DILexicalBlock(scope: !573, file: !379, line: 35, column: 9)
!588 = !{i64 73}
!589 = !{!"73"}
!590 = !DILocation(line: 35, column: 27, scope: !587)
!591 = !{i64 74}
!592 = !{!"74"}
!593 = !DILocation(line: 35, column: 9, scope: !573)
!594 = !{i64 75}
!595 = !{!"75"}
!596 = !DILocation(line: 35, column: 9, scope: !587)
!597 = !{i64 76}
!598 = !{!"76"}
!599 = !{i64 77}
!600 = !{!"77"}
!601 = !{i64 78}
!602 = !{!"78"}
!603 = !DILocation(line: 36, column: 15, scope: !587)
!604 = !{i64 79}
!605 = !{!"79"}
!606 = !DILocation(line: 36, column: 23, scope: !587)
!607 = !{i64 80}
!608 = !{!"80"}
!609 = !DILocation(line: 36, column: 31, scope: !587)
!610 = !{i64 81}
!611 = !{!"81"}
!612 = !{i64 82}
!613 = !{!"82"}
!614 = !{i64 83}
!615 = !{!"83"}
!616 = !{i64 84}
!617 = !{!"84"}
!618 = !DILocation(line: 36, column: 21, scope: !587)
!619 = !{i64 85}
!620 = !{!"85"}
!621 = !DILocation(line: 36, column: 5, scope: !587)
!622 = !{i64 86}
!623 = !{!"86"}
!624 = !DILocation(line: 36, column: 10, scope: !587)
!625 = !{i64 87}
!626 = !{!"87"}
!627 = !{i64 88}
!628 = !{!"88"}
!629 = !{i64 89}
!630 = !{!"89"}
!631 = !DILocation(line: 36, column: 13, scope: !587)
!632 = !{i64 90}
!633 = !{!"90"}
!634 = !{i64 91}
!635 = !{!"91"}
!636 = !DILocation(line: 35, column: 44, scope: !587)
!637 = !{i64 92}
!638 = !{!"92"}
!639 = !{i64 93}
!640 = !{!"93"}
!641 = !{i64 94}
!642 = !{!"94"}
!643 = distinct !{!643, !593, !644, !645}
!644 = !DILocation(line: 36, column: 32, scope: !573)
!645 = !{!"llvm.loop.name", !"GRAD"}
!646 = !{i64 95}
!647 = !{!"95"}
!648 = !DILocation(line: 37, column: 1, scope: !540)
!649 = !{i64 96}
!650 = !{!"96"}
!651 = distinct !DISubprogram(name: "updateParameter", linkageName: "_Z15updateParameterPfS_f", scope: !379, file: !379, line: 40, type: !652, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!652 = !DISubroutineType(types: !653)
!653 = !{null, !383, !383, !382}
!654 = !{i64 97}
!655 = !{!"97"}
!656 = !{i64 98}
!657 = !{!"98"}
!658 = !{i64 99}
!659 = !{!"99"}
!660 = !{i64 100}
!661 = !{!"100"}
!662 = !{i64 101}
!663 = !{!"101"}
!664 = !DILocalVariable(name: "param", arg: 1, scope: !651, file: !379, line: 41, type: !383)
!665 = !DILocation(line: 41, column: 17, scope: !651)
!666 = !{i64 102}
!667 = !{!"102"}
!668 = !{i64 103}
!669 = !{!"103"}
!670 = !DILocalVariable(name: "grad", arg: 2, scope: !651, file: !379, line: 42, type: !383)
!671 = !DILocation(line: 42, column: 17, scope: !651)
!672 = !{i64 104}
!673 = !{!"104"}
!674 = !{i64 105}
!675 = !{!"105"}
!676 = !DILocalVariable(name: "scale", arg: 3, scope: !651, file: !379, line: 43, type: !382)
!677 = !DILocation(line: 43, column: 17, scope: !651)
!678 = !{i64 106}
!679 = !{!"106"}
!680 = !DILocation(line: 44, column: 1, scope: !651)
!681 = !{i64 107}
!682 = !{!"107"}
!683 = !DILocation(line: 45, column: 16, scope: !684)
!684 = distinct !DILexicalBlock(scope: !651, file: !379, line: 45, column: 11)
!685 = !{i64 108}
!686 = !{!"108"}
!687 = !{i64 109}
!688 = !{!"109"}
!689 = !DILocalVariable(name: "i", scope: !684, file: !379, line: 45, type: !8)
!690 = !DILocation(line: 45, column: 20, scope: !684)
!691 = !{i64 110}
!692 = !{!"110"}
!693 = !{i64 111}
!694 = !{!"111"}
!695 = !{i64 112}
!696 = !{!"112"}
!697 = !DILocation(line: 45, column: 27, scope: !698)
!698 = distinct !DILexicalBlock(scope: !684, file: !379, line: 45, column: 11)
!699 = !{i64 113}
!700 = !{!"113"}
!701 = !DILocation(line: 45, column: 29, scope: !698)
!702 = !{i64 114}
!703 = !{!"114"}
!704 = !DILocation(line: 45, column: 11, scope: !684)
!705 = !{i64 115}
!706 = !{!"115"}
!707 = !DILocation(line: 45, column: 11, scope: !698)
!708 = !{i64 116}
!709 = !{!"116"}
!710 = !{i64 117}
!711 = !{!"117"}
!712 = !{i64 118}
!713 = !{!"118"}
!714 = !DILocation(line: 46, column: 17, scope: !698)
!715 = !{i64 119}
!716 = !{!"119"}
!717 = !DILocation(line: 46, column: 25, scope: !698)
!718 = !{i64 120}
!719 = !{!"120"}
!720 = !DILocation(line: 46, column: 30, scope: !698)
!721 = !{i64 121}
!722 = !{!"121"}
!723 = !{i64 122}
!724 = !{!"122"}
!725 = !{i64 123}
!726 = !{!"123"}
!727 = !{i64 124}
!728 = !{!"124"}
!729 = !DILocation(line: 46, column: 23, scope: !698)
!730 = !{i64 125}
!731 = !{!"125"}
!732 = !DILocation(line: 46, column: 5, scope: !698)
!733 = !{i64 126}
!734 = !{!"126"}
!735 = !DILocation(line: 46, column: 11, scope: !698)
!736 = !{i64 127}
!737 = !{!"127"}
!738 = !{i64 128}
!739 = !{!"128"}
!740 = !{i64 129}
!741 = !{!"129"}
!742 = !DILocation(line: 46, column: 14, scope: !698)
!743 = !{i64 130}
!744 = !{!"130"}
!745 = !{i64 131}
!746 = !{!"131"}
!747 = !{i64 132}
!748 = !{!"132"}
!749 = !{i64 133}
!750 = !{!"133"}
!751 = !DILocation(line: 45, column: 46, scope: !698)
!752 = !{i64 134}
!753 = !{!"134"}
!754 = !{i64 135}
!755 = !{!"135"}
!756 = !{i64 136}
!757 = !{!"136"}
!758 = distinct !{!758, !704, !759, !760}
!759 = !DILocation(line: 46, column: 31, scope: !684)
!760 = !{!"llvm.loop.name", !"UPDATE"}
!761 = !{i64 137}
!762 = !{!"137"}
!763 = !DILocation(line: 47, column: 1, scope: !651)
!764 = !{i64 138}
!765 = !{!"138"}
!766 = distinct !DISubprogram(name: "SgdLR", linkageName: "_Z5SgdLRPfPhS_", scope: !379, file: !379, line: 50, type: !767, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!767 = !DISubroutineType(types: !768)
!768 = !{null, !384, !769, !383}
!769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !770, size: 64)
!770 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !6, line: 24, baseType: !771)
!771 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!772 = !{!773}
!773 = !{!"fpga.top", !"user", !774}
!774 = !DILocation(line: 50, column: 16, scope: !766)
!775 = !{i64 139}
!776 = !{!"139"}
!777 = !{i64 140}
!778 = !{!"140"}
!779 = !{i64 141}
!780 = !{!"141"}
!781 = !{i64 142}
!782 = !{!"142"}
!783 = !{i64 143}
!784 = !{!"143"}
!785 = !{i64 144}
!786 = !{!"144"}
!787 = !{i64 145}
!788 = !{!"145"}
!789 = !{i64 146}
!790 = !{!"146"}
!791 = !{i64 147}
!792 = !{!"147"}
!793 = !{i64 148}
!794 = !{!"148"}
!795 = !DILocalVariable(name: "data", arg: 1, scope: !766, file: !379, line: 51, type: !384)
!796 = !DILocation(line: 51, column: 14, scope: !766)
!797 = !{i64 149}
!798 = !{!"149"}
!799 = !{i64 150}
!800 = !{!"150"}
!801 = !DILocalVariable(name: "label", arg: 2, scope: !766, file: !379, line: 52, type: !769)
!802 = !DILocation(line: 52, column: 15, scope: !766)
!803 = !{i64 151}
!804 = !{!"151"}
!805 = !{i64 152}
!806 = !{!"152"}
!807 = !DILocalVariable(name: "theta", arg: 3, scope: !766, file: !379, line: 53, type: !383)
!808 = !DILocation(line: 53, column: 17, scope: !766)
!809 = !{i64 153}
!810 = !{!"153"}
!811 = !DILocation(line: 56, column: 3, scope: !766)
!812 = !{i64 154}
!813 = !{!"154"}
!814 = !{i64 155}
!815 = !{!"155"}
!816 = !DILocalVariable(name: "gradient", scope: !766, file: !379, line: 56, type: !817)
!817 = !DICompositeType(tag: DW_TAG_array_type, baseType: !382, size: 32768, elements: !818)
!818 = !{!819}
!819 = !DISubrange(count: 1024)
!820 = !DILocation(line: 56, column: 15, scope: !766)
!821 = !{i64 156}
!822 = !{!"156"}
!823 = !{i64 157}
!824 = !{!"157"}
!825 = !DILocation(line: 60, column: 15, scope: !826)
!826 = distinct !DILexicalBlock(scope: !766, file: !379, line: 60, column: 10)
!827 = !{i64 158}
!828 = !{!"158"}
!829 = !{i64 159}
!830 = !{!"159"}
!831 = !DILocalVariable(name: "epoch", scope: !826, file: !379, line: 60, type: !8)
!832 = !DILocation(line: 60, column: 19, scope: !826)
!833 = !{i64 160}
!834 = !{!"160"}
!835 = !{i64 161}
!836 = !{!"161"}
!837 = !{i64 162}
!838 = !{!"162"}
!839 = !DILocation(line: 60, column: 30, scope: !840)
!840 = distinct !DILexicalBlock(scope: !826, file: !379, line: 60, column: 10)
!841 = !{i64 163}
!842 = !{!"163"}
!843 = !DILocation(line: 60, column: 36, scope: !840)
!844 = !{i64 164}
!845 = !{!"164"}
!846 = !DILocation(line: 60, column: 10, scope: !826)
!847 = !{i64 165}
!848 = !{!"165"}
!849 = !{i64 166}
!850 = !{!"166"}
!851 = !DILocation(line: 60, column: 10, scope: !840)
!852 = !{i64 167}
!853 = !{!"167"}
!854 = !{i64 168}
!855 = !{!"168"}
!856 = !{i64 169}
!857 = !{!"169"}
!858 = !DILocation(line: 61, column: 3, scope: !840)
!859 = !{i64 170}
!860 = !{!"170"}
!861 = !DILocation(line: 63, column: 25, scope: !862)
!862 = distinct !DILexicalBlock(scope: !863, file: !379, line: 63, column: 20)
!863 = distinct !DILexicalBlock(scope: !840, file: !379, line: 61, column: 3)
!864 = !{i64 171}
!865 = !{!"171"}
!866 = !{i64 172}
!867 = !{!"172"}
!868 = !DILocalVariable(name: "training_id", scope: !862, file: !379, line: 63, type: !8)
!869 = !DILocation(line: 63, column: 29, scope: !862)
!870 = !{i64 173}
!871 = !{!"173"}
!872 = !{i64 174}
!873 = !{!"174"}
!874 = !{i64 175}
!875 = !{!"175"}
!876 = !DILocation(line: 63, column: 46, scope: !877)
!877 = distinct !DILexicalBlock(scope: !862, file: !379, line: 63, column: 20)
!878 = !{i64 176}
!879 = !{!"176"}
!880 = !DILocation(line: 63, column: 58, scope: !877)
!881 = !{i64 177}
!882 = !{!"177"}
!883 = !DILocation(line: 63, column: 20, scope: !862)
!884 = !{i64 178}
!885 = !{!"178"}
!886 = !{i64 179}
!887 = !{!"179"}
!888 = !DILocation(line: 63, column: 20, scope: !877)
!889 = !{i64 180}
!890 = !{!"180"}
!891 = !{i64 181}
!892 = !{!"181"}
!893 = !{i64 182}
!894 = !{!"182"}
!895 = !DILocation(line: 66, column: 7, scope: !896)
!896 = distinct !DILexicalBlock(scope: !877, file: !379, line: 64, column: 5)
!897 = !{i64 183}
!898 = !{!"183"}
!899 = !{i64 184}
!900 = !{!"184"}
!901 = !DILocalVariable(name: "dot", scope: !896, file: !379, line: 66, type: !382)
!902 = !DILocation(line: 66, column: 19, scope: !896)
!903 = !{i64 185}
!904 = !{!"185"}
!905 = !DILocation(line: 66, column: 36, scope: !896)
!906 = !{i64 186}
!907 = !{!"186"}
!908 = !DILocation(line: 66, column: 44, scope: !896)
!909 = !{i64 187}
!910 = !{!"187"}
!911 = !DILocation(line: 66, column: 64, scope: !896)
!912 = !{i64 188}
!913 = !{!"188"}
!914 = !DILocation(line: 66, column: 62, scope: !896)
!915 = !{i64 189}
!916 = !{!"189"}
!917 = !{i64 190}
!918 = !{!"190"}
!919 = !{i64 191}
!920 = !{!"191"}
!921 = !DILocation(line: 66, column: 25, scope: !896)
!922 = !{i64 192}
!923 = !{!"192"}
!924 = !{i64 193}
!925 = !{!"193"}
!926 = !DILocation(line: 68, column: 7, scope: !896)
!927 = !{i64 194}
!928 = !{!"194"}
!929 = !{i64 195}
!930 = !{!"195"}
!931 = !DILocalVariable(name: "prob", scope: !896, file: !379, line: 68, type: !382)
!932 = !DILocation(line: 68, column: 19, scope: !896)
!933 = !{i64 196}
!934 = !{!"196"}
!935 = !DILocation(line: 68, column: 34, scope: !896)
!936 = !{i64 197}
!937 = !{!"197"}
!938 = !DILocation(line: 68, column: 26, scope: !896)
!939 = !{i64 198}
!940 = !{!"198"}
!941 = !{i64 199}
!942 = !{!"199"}
!943 = !DILocation(line: 70, column: 23, scope: !896)
!944 = !{i64 200}
!945 = !{!"200"}
!946 = !DILocation(line: 70, column: 34, scope: !896)
!947 = !{i64 201}
!948 = !{!"201"}
!949 = !DILocation(line: 70, column: 54, scope: !896)
!950 = !{i64 202}
!951 = !{!"202"}
!952 = !DILocation(line: 70, column: 52, scope: !896)
!953 = !{i64 203}
!954 = !{!"203"}
!955 = !{i64 204}
!956 = !{!"204"}
!957 = !{i64 205}
!958 = !{!"205"}
!959 = !DILocation(line: 70, column: 69, scope: !896)
!960 = !{i64 206}
!961 = !{!"206"}
!962 = !DILocation(line: 70, column: 76, scope: !896)
!963 = !{i64 207}
!964 = !{!"207"}
!965 = !DILocation(line: 70, column: 82, scope: !896)
!966 = !{i64 208}
!967 = !{!"208"}
!968 = !{i64 209}
!969 = !{!"209"}
!970 = !{i64 210}
!971 = !{!"210"}
!972 = !{i64 211}
!973 = !{!"211"}
!974 = !{i64 212}
!975 = !{!"212"}
!976 = !{i64 213}
!977 = !{!"213"}
!978 = !DILocation(line: 70, column: 74, scope: !896)
!979 = !{i64 214}
!980 = !{!"214"}
!981 = !DILocation(line: 70, column: 7, scope: !896)
!982 = !{i64 215}
!983 = !{!"215"}
!984 = !DILocation(line: 72, column: 23, scope: !896)
!985 = !{i64 216}
!986 = !{!"216"}
!987 = !DILocation(line: 72, column: 30, scope: !896)
!988 = !{i64 217}
!989 = !{!"217"}
!990 = !DILocation(line: 72, column: 7, scope: !896)
!991 = !{i64 218}
!992 = !{!"218"}
!993 = !DILocation(line: 73, column: 5, scope: !877)
!994 = !{i64 219}
!995 = !{!"219"}
!996 = !{i64 220}
!997 = !{!"220"}
!998 = !{i64 221}
!999 = !{!"221"}
!1000 = !{i64 222}
!1001 = !{!"222"}
!1002 = !DILocation(line: 73, column: 5, scope: !896)
!1003 = !{i64 223}
!1004 = !{!"223"}
!1005 = !DILocation(line: 63, column: 86, scope: !877)
!1006 = !{i64 224}
!1007 = !{!"224"}
!1008 = !{i64 225}
!1009 = !{!"225"}
!1010 = !{i64 226}
!1011 = !{!"226"}
!1012 = distinct !{!1012, !883, !1013, !1014}
!1013 = !DILocation(line: 73, column: 5, scope: !862)
!1014 = !{!"llvm.loop.name", !"TRAINING_INST"}
!1015 = !{i64 227}
!1016 = !{!"227"}
!1017 = !DILocation(line: 74, column: 3, scope: !863)
!1018 = !{i64 228}
!1019 = !{!"228"}
!1020 = !DILocation(line: 60, column: 56, scope: !840)
!1021 = !{i64 229}
!1022 = !{!"229"}
!1023 = !{i64 230}
!1024 = !{!"230"}
!1025 = !{i64 231}
!1026 = !{!"231"}
!1027 = distinct !{!1027, !846, !1028, !1029}
!1028 = !DILocation(line: 74, column: 3, scope: !826)
!1029 = !{!"llvm.loop.name", !"EPOCH"}
!1030 = !{i64 232}
!1031 = !{!"232"}
!1032 = !DILocation(line: 75, column: 1, scope: !766)
!1033 = !{i64 233}
!1034 = !{!"233"}
!1035 = !{i64 234}
!1036 = !{!"234"}
!1037 = !{i64 235}
!1038 = !{!"235"}
!1039 = !{i64 236}
!1040 = !{!"236"}
!1041 = !{i64 237}
!1042 = !{!"237"}
!1043 = !{i64 238}
!1044 = !{!"238"}
!1045 = !{i64 239}
!1046 = !{!"239"}
!1047 = !{i64 240}
!1048 = !{!"240"}
!1049 = !{i64 241}
!1050 = !{!"241"}
!1051 = !{i64 242}
!1052 = !{!"242"}
!1053 = !{i64 243}
!1054 = !{!"243"}
!1055 = !{i64 244}
!1056 = !{!"244"}
!1057 = !{i64 245}
!1058 = !{!"245"}
!1059 = !{i64 246}
!1060 = !{!"246"}
!1061 = !{i64 247}
!1062 = !{!"247"}
!1063 = !{i64 248}
!1064 = !{!"248"}
!1065 = !{i64 249}
!1066 = !{!"249"}
!1067 = !{i64 250}
!1068 = !{!"250"}
!1069 = !{i64 251}
!1070 = !{!"251"}
!1071 = !{i64 252}
!1072 = !{!"252"}
!1073 = !{i64 253}
!1074 = !{!"253"}
!1075 = !{i64 254}
!1076 = !{!"254"}
!1077 = !{i64 255}
!1078 = !{!"255"}
!1079 = !{i64 256}
!1080 = !{!"256"}
!1081 = !{i64 257}
!1082 = !{!"257"}
!1083 = !{i64 258}
!1084 = !{!"258"}
!1085 = !{i64 259}
!1086 = !{!"259"}
!1087 = !{i64 260}
!1088 = !{!"260"}
!1089 = !{i64 261}
!1090 = !{!"261"}
!1091 = !{i64 262}
!1092 = !{!"262"}
!1093 = !{i64 263}
!1094 = !{!"263"}
!1095 = !{i64 264}
!1096 = !{!"264"}
!1097 = !{i64 265}
!1098 = !{!"265"}
!1099 = !{i64 266}
!1100 = !{!"266"}
!1101 = !{i64 267}
!1102 = !{!"267"}
!1103 = !{i64 268}
!1104 = !{!"268"}
!1105 = !{i64 269}
!1106 = !{!"269"}
!1107 = !{i64 270}
!1108 = !{!"270"}
!1109 = !{i64 271}
!1110 = !{!"271"}
!1111 = !{i64 272}
!1112 = !{!"272"}
!1113 = !{i64 273}
!1114 = !{!"273"}
!1115 = !{i64 274}
!1116 = !{!"274"}
!1117 = !{i64 275}
!1118 = !{!"275"}
!1119 = !{i64 276}
!1120 = !{!"276"}
!1121 = !{i64 277}
!1122 = !{!"277"}
!1123 = !{i64 278}
!1124 = !{!"278"}
!1125 = !{i64 279}
!1126 = !{!"279"}
!1127 = !{i64 280}
!1128 = !{!"280"}
!1129 = !{i64 281}
!1130 = !{!"281"}
!1131 = !{i64 282}
!1132 = !{!"282"}
!1133 = !{i64 283}
!1134 = !{!"283"}
!1135 = !{i64 284}
!1136 = !{!"284"}
!1137 = !{i64 285}
!1138 = !{!"285"}
!1139 = !{i64 286}
!1140 = !{!"286"}
!1141 = !{i64 287}
!1142 = !{!"287"}
!1143 = !{i64 288}
!1144 = !{!"288"}
!1145 = !{i64 289}
!1146 = !{!"289"}
!1147 = !{i64 290}
!1148 = !{!"290"}
!1149 = !{i64 291}
!1150 = !{!"291"}
!1151 = !{i64 292}
!1152 = !{!"292"}
!1153 = !{i64 293}
!1154 = !{!"293"}
!1155 = !{i64 294}
!1156 = !{!"294"}
!1157 = !{i64 295}
!1158 = !{!"295"}
!1159 = !{i64 296}
!1160 = !{!"296"}
!1161 = !{i64 297}
!1162 = !{!"297"}
!1163 = !{i64 298}
!1164 = !{!"298"}
!1165 = !{i64 299}
!1166 = !{!"299"}
!1167 = !{i64 300}
!1168 = !{!"300"}
!1169 = !{i64 301}
!1170 = !{!"301"}
!1171 = !{i64 302}
!1172 = !{!"302"}
!1173 = !{i64 303}
!1174 = !{!"303"}
!1175 = !{i64 304}
!1176 = !{!"304"}
!1177 = !{!"305"}
