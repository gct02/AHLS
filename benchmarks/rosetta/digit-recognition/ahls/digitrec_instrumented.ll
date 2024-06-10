; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@ops = global %struct.BinOpInfo* null, align 8
@filename = private constant [15 x i8] c"data_stats.txt\00"
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf|\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1.4 = private unnamed_addr constant [21 x i8] c"Error opening files\0A\00", align 1
@.str.2.7 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.3.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Failed to create output file!\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Test %d: expected = %d, result = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"\0A\09 %d / %d correct!\0A\00", align 1

; Function Attrs: nounwind
define i32 @_Z8popcounty(i64 %x) #0 !dbg !20 {
entry:
  %"1.x.addr" = alloca i64, align 8, !opID !25, !stats.instNumber !26, !opSignedness !27
  store i64 %x, i64* %"1.x.addr", align 8, !opID !28, !stats.instNumber !29, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64* %"1.x.addr", metadata !30, metadata !DIExpression()), !dbg !31, !opID !32, !stats.instNumber !33, !opSignedness !27
  %"4." = load i64, i64* %"1.x.addr", align 8, !dbg !34, !opID !35, !stats.instNumber !36, !opSignedness !27
  %"5.shr" = lshr i64 %"4.", 1, !dbg !37, !opID !38, !stats.instNumber !39, !opSignedness !27
  call void @profOp(i64 5, i8 24, i64 %"5.shr", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !40
  %"6.and" = and i64 %"5.shr", 6148914691236517205, !dbg !40, !opID !41, !stats.instNumber !42, !opSignedness !27
  call void @profOp(i64 6, i8 26, i64 %"6.and", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !43
  %"7." = load i64, i64* %"1.x.addr", align 8, !dbg !43, !opID !44, !stats.instNumber !45, !opSignedness !27
  %"8.sub" = sub i64 %"7.", %"6.and", !dbg !43, !opID !46, !stats.instNumber !47, !opSignedness !27
  call void @profOp(i64 8, i8 13, i64 %"8.sub", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !43
  store i64 %"8.sub", i64* %"1.x.addr", align 8, !dbg !43, !opID !48, !stats.instNumber !49, !opSignedness !27
  %"10." = load i64, i64* %"1.x.addr", align 8, !dbg !50, !opID !51, !stats.instNumber !52, !opSignedness !27
  %"11.and1" = and i64 %"10.", 3689348814741910323, !dbg !53, !opID !54, !stats.instNumber !55, !opSignedness !27
  call void @profOp(i64 11, i8 26, i64 %"11.and1", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !56
  %"12." = load i64, i64* %"1.x.addr", align 8, !dbg !56, !opID !57, !stats.instNumber !58, !opSignedness !27
  %"13.shr2" = lshr i64 %"12.", 2, !dbg !59, !opID !60, !stats.instNumber !61, !opSignedness !27
  call void @profOp(i64 13, i8 24, i64 %"13.shr2", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !62
  %"14.and3" = and i64 %"13.shr2", 3689348814741910323, !dbg !62, !opID !63, !stats.instNumber !64, !opSignedness !27
  call void @profOp(i64 14, i8 26, i64 %"14.and3", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !65
  %"15.add" = add i64 %"11.and1", %"14.and3", !dbg !65, !opID !66, !stats.instNumber !67, !opSignedness !27
  call void @profOp(i64 15, i8 11, i64 %"15.add", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !68
  store i64 %"15.add", i64* %"1.x.addr", align 8, !dbg !68, !opID !69, !stats.instNumber !70, !opSignedness !27
  %"17." = load i64, i64* %"1.x.addr", align 8, !dbg !71, !opID !72, !stats.instNumber !73, !opSignedness !27
  %"18." = load i64, i64* %"1.x.addr", align 8, !dbg !74, !opID !75, !stats.instNumber !76, !opSignedness !27
  %"19.shr4" = lshr i64 %"18.", 4, !dbg !77, !opID !78, !stats.instNumber !79, !opSignedness !27
  call void @profOp(i64 19, i8 24, i64 %"19.shr4", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !80
  %"20.add5" = add i64 %"17.", %"19.shr4", !dbg !80, !opID !81, !stats.instNumber !82, !opSignedness !27
  call void @profOp(i64 20, i8 11, i64 %"20.add5", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !83
  %"21.and6" = and i64 %"20.add5", 1085102592571150095, !dbg !83, !opID !84, !stats.instNumber !85, !opSignedness !27
  call void @profOp(i64 21, i8 26, i64 %"21.and6", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !86
  store i64 %"21.and6", i64* %"1.x.addr", align 8, !dbg !86, !opID !87, !stats.instNumber !88, !opSignedness !27
  %"23." = load i64, i64* %"1.x.addr", align 8, !dbg !89, !opID !90, !stats.instNumber !91, !opSignedness !27
  %"24.shr7" = lshr i64 %"23.", 8, !dbg !92, !opID !93, !stats.instNumber !94, !opSignedness !27
  call void @profOp(i64 24, i8 24, i64 %"24.shr7", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !95
  %"25." = load i64, i64* %"1.x.addr", align 8, !dbg !95, !opID !96, !stats.instNumber !97, !opSignedness !27
  %"26.add8" = add i64 %"25.", %"24.shr7", !dbg !95, !opID !98, !stats.instNumber !99, !opSignedness !27
  call void @profOp(i64 26, i8 11, i64 %"26.add8", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !95
  store i64 %"26.add8", i64* %"1.x.addr", align 8, !dbg !95, !opID !100, !stats.instNumber !101, !opSignedness !27
  %"28." = load i64, i64* %"1.x.addr", align 8, !dbg !102, !opID !103, !stats.instNumber !104, !opSignedness !27
  %"29.shr9" = lshr i64 %"28.", 16, !dbg !105, !opID !106, !stats.instNumber !107, !opSignedness !27
  call void @profOp(i64 29, i8 24, i64 %"29.shr9", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !108
  %"30." = load i64, i64* %"1.x.addr", align 8, !dbg !108, !opID !109, !stats.instNumber !110, !opSignedness !27
  %"31.add10" = add i64 %"30.", %"29.shr9", !dbg !108, !opID !111, !stats.instNumber !112, !opSignedness !27
  call void @profOp(i64 31, i8 11, i64 %"31.add10", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !108
  store i64 %"31.add10", i64* %"1.x.addr", align 8, !dbg !108, !opID !113, !stats.instNumber !114, !opSignedness !27
  %"33." = load i64, i64* %"1.x.addr", align 8, !dbg !115, !opID !116, !stats.instNumber !117, !opSignedness !27
  %"34.shr11" = lshr i64 %"33.", 32, !dbg !118, !opID !119, !stats.instNumber !120, !opSignedness !27
  call void @profOp(i64 34, i8 24, i64 %"34.shr11", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !121
  %"35." = load i64, i64* %"1.x.addr", align 8, !dbg !121, !opID !122, !stats.instNumber !123, !opSignedness !27
  %"36.add12" = add i64 %"35.", %"34.shr11", !dbg !121, !opID !124, !stats.instNumber !125, !opSignedness !27
  call void @profOp(i64 36, i8 11, i64 %"36.add12", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !121
  store i64 %"36.add12", i64* %"1.x.addr", align 8, !dbg !121, !opID !126, !stats.instNumber !127, !opSignedness !27
  %"38." = load i64, i64* %"1.x.addr", align 8, !dbg !128, !opID !129, !stats.instNumber !130, !opSignedness !27
  %"39.and13" = and i64 %"38.", 127, !dbg !131, !opID !132, !stats.instNumber !133, !opSignedness !27
  call void @profOp(i64 39, i8 26, i64 %"39.and13", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !128
  %"40.conv" = trunc i64 %"39.and13" to i32, !dbg !128, !opID !134, !stats.instNumber !135, !opSignedness !27
  ret i32 %"40.conv", !dbg !136, !opID !137, !stats.instNumber !138, !opSignedness !27
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %instID, i8 zeroext %instOpcode, i64 %signedIntValue, i64 %unsignedIntValue, double %fpValue, i1 zeroext %isSignedValue, i1 zeroext %isFpValue, i32 %bitwidth) #2 {
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
  %call = call double @pow(double %13, double 2.000000e+00) #12
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
  %call15 = call double @pow(double %conv14, double 2.000000e+00) #12
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
  %call31 = call double @pow(double %conv30, double 2.000000e+00) #12
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
  %call49 = call double @sqrt(double %59) #12
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
  %call55 = call noalias i8* @malloc(i64 64) #12
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
  %call63 = call double @pow(double %76, double 2.000000e+00) #12
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
  %call71 = call double @pow(double %conv70, double 2.000000e+00) #12
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
  %call77 = call double @pow(double %conv76, double 2.000000e+00) #12
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
declare double @pow(double, double) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
define void @_Z10update_knnPKyS0_PiS1_i(i64* %train_inst, i64* %test_inst, i32* "fpga.decayed.dim.hint"="3" %dists, i32* "fpga.decayed.dim.hint"="3" %labels, i32 %label) #4 !dbg !139 {
entry:
  %"42.train_inst.addr" = alloca i64*, align 8, !opID !145, !stats.instNumber !146, !opSignedness !27
  %"43.test_inst.addr" = alloca i64*, align 8, !opID !147, !stats.instNumber !148, !opSignedness !27
  %"44.dists.addr" = alloca i32*, align 8, !opID !149, !stats.instNumber !150, !opSignedness !27
  %"45.labels.addr" = alloca i32*, align 8, !opID !151, !stats.instNumber !152, !opSignedness !27
  %"46.label.addr" = alloca i32, align 4, !opID !153, !stats.instNumber !154, !opSignedness !27
  %"47.dist" = alloca i32, align 4, !opID !155, !stats.instNumber !156, !opSignedness !27
  %"48.i" = alloca i32, align 4, !opID !157, !stats.instNumber !158, !opSignedness !27
  %"49.diff" = alloca i64, align 8, !opID !159, !stats.instNumber !160, !opSignedness !27
  %"50.max_dist" = alloca i32, align 4, !opID !161, !stats.instNumber !162, !opSignedness !27
  %"51.max_dist_id" = alloca i32, align 4, !opID !163, !stats.instNumber !164, !opSignedness !27
  %"52.k" = alloca i32, align 4, !opID !165, !stats.instNumber !166, !opSignedness !27
  store i64* %train_inst, i64** %"42.train_inst.addr", align 8, !opID !167, !stats.instNumber !168, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64** %"42.train_inst.addr", metadata !169, metadata !DIExpression()), !dbg !170, !opID !171, !stats.instNumber !172, !opSignedness !27
  store i64* %test_inst, i64** %"43.test_inst.addr", align 8, !opID !173, !stats.instNumber !174, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64** %"43.test_inst.addr", metadata !175, metadata !DIExpression()), !dbg !176, !opID !177, !stats.instNumber !178, !opSignedness !27
  store i32* %dists, i32** %"44.dists.addr", align 8, !opID !179, !stats.instNumber !180, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32** %"44.dists.addr", metadata !181, metadata !DIExpression()), !dbg !182, !opID !183, !stats.instNumber !184, !opSignedness !27
  store i32* %labels, i32** %"45.labels.addr", align 8, !opID !185, !stats.instNumber !186, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32** %"45.labels.addr", metadata !187, metadata !DIExpression()), !dbg !188, !opID !189, !stats.instNumber !190, !opSignedness !27
  store i32 %label, i32* %"46.label.addr", align 4, !opID !191, !stats.instNumber !192, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"46.label.addr", metadata !193, metadata !DIExpression()), !dbg !194, !opID !195, !stats.instNumber !196, !opSignedness !27
  %"63." = bitcast i32* %"47.dist" to i8*, !dbg !197, !opID !198, !stats.instNumber !199, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"63.") #12, !dbg !197, !opID !200, !stats.instNumber !201, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"47.dist", metadata !202, metadata !DIExpression()), !dbg !203, !opID !204, !stats.instNumber !205, !opSignedness !27
  store i32 0, i32* %"47.dist", align 4, !dbg !203, !opID !206, !stats.instNumber !207, !opSignedness !27
  br label %VITIS_LOOP_33_1, !dbg !197, !opID !208, !stats.instNumber !209, !opSignedness !27

VITIS_LOOP_33_1:                                  ; preds = %entry
  %"68." = bitcast i32* %"48.i" to i8*, !dbg !210, !opID !212, !stats.instNumber !213, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"68.") #12, !dbg !210, !opID !214, !stats.instNumber !215, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"48.i", metadata !216, metadata !DIExpression()), !dbg !217, !opID !218, !stats.instNumber !219, !opSignedness !27
  store i32 0, i32* %"48.i", align 4, !dbg !217, !opID !220, !stats.instNumber !221, !opSignedness !27
  br label %for.cond, !dbg !210, !opID !222, !stats.instNumber !223, !opSignedness !27

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_33_1
  %"73." = load i32, i32* %"48.i", align 4, !dbg !224, !opID !226, !stats.instNumber !227, !opSignedness !27
  %"74.cmp" = icmp slt i32 %"73.", 4, !dbg !228, !opID !229, !stats.instNumber !230, !opSignedness !27
  br i1 %"74.cmp", label %for.body, label %for.cond.cleanup, !dbg !231, !opID !232, !stats.instNumber !233, !opSignedness !27

for.cond.cleanup:                                 ; preds = %for.cond
  %"76." = bitcast i32* %"48.i" to i8*, !dbg !234, !opID !235, !stats.instNumber !236, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"76.") #12, !dbg !234, !opID !237, !stats.instNumber !238, !opSignedness !27
  br label %for.end, !opID !239, !stats.instNumber !240, !opSignedness !27

for.body:                                         ; preds = %for.cond
  %"79." = bitcast i64* %"49.diff" to i8*, !dbg !241, !opID !243, !stats.instNumber !244, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %"79.") #12, !dbg !241, !opID !245, !stats.instNumber !246, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64* %"49.diff", metadata !247, metadata !DIExpression()), !dbg !248, !opID !249, !stats.instNumber !250, !opSignedness !27
  %"82." = load i64*, i64** %"43.test_inst.addr", align 8, !dbg !251, !opID !252, !stats.instNumber !253, !opSignedness !27
  %"83." = load i32, i32* %"48.i", align 4, !dbg !254, !opID !255, !stats.instNumber !256, !opSignedness !27
  %"84.idxprom" = sext i32 %"83." to i64, !dbg !251, !opID !257, !stats.instNumber !258, !opSignedness !27
  %"85.arrayidx" = getelementptr inbounds i64, i64* %"82.", i64 %"84.idxprom", !dbg !251, !opID !259, !stats.instNumber !260, !opSignedness !27
  %"86." = load i64, i64* %"85.arrayidx", align 8, !dbg !251, !opID !261, !stats.instNumber !262, !opSignedness !27
  %"87." = load i64*, i64** %"42.train_inst.addr", align 8, !dbg !263, !opID !264, !stats.instNumber !265, !opSignedness !27
  %"88." = load i32, i32* %"48.i", align 4, !dbg !266, !opID !267, !stats.instNumber !268, !opSignedness !27
  %"89.idxprom1" = sext i32 %"88." to i64, !dbg !263, !opID !269, !stats.instNumber !270, !opSignedness !27
  %"90.arrayidx2" = getelementptr inbounds i64, i64* %"87.", i64 %"89.idxprom1", !dbg !263, !opID !271, !stats.instNumber !272, !opSignedness !27
  %"91." = load i64, i64* %"90.arrayidx2", align 8, !dbg !263, !opID !273, !stats.instNumber !274, !opSignedness !27
  %"92.xor" = xor i64 %"86.", %"91.", !dbg !275, !opID !276, !stats.instNumber !277, !opSignedness !27
  call void @profOp(i64 92, i8 28, i64 %"92.xor", i64 0, double 0.000000e+00, i1 true, i1 false, i32 64), !dbg !248
  store i64 %"92.xor", i64* %"49.diff", align 8, !dbg !248, !opID !278, !stats.instNumber !279, !opSignedness !27
  %"94." = load i64, i64* %"49.diff", align 8, !dbg !280, !opID !281, !stats.instNumber !282, !opSignedness !27
  %"95.call" = call i32 @_Z8popcounty(i64 %"94."), !dbg !283, !opID !284, !stats.instNumber !285, !opSignedness !27
  %"96." = load i32, i32* %"47.dist", align 4, !dbg !286, !opID !287, !stats.instNumber !288, !opSignedness !27
  %"97.add" = add i32 %"96.", %"95.call", !dbg !286, !opID !289, !stats.instNumber !290, !opSignedness !27
  %0 = sext i32 %"97.add" to i64, !dbg !286
  call void @profOp(i64 97, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !286
  store i32 %"97.add", i32* %"47.dist", align 4, !dbg !286, !opID !291, !stats.instNumber !292, !opSignedness !27
  %"99." = bitcast i64* %"49.diff" to i8*, !dbg !293, !opID !294, !stats.instNumber !295, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %"99.") #12, !dbg !293, !opID !296, !stats.instNumber !297, !opSignedness !27
  br label %for.inc, !dbg !298, !opID !299, !stats.instNumber !300, !opSignedness !27

for.inc:                                          ; preds = %for.body
  %"102." = load i32, i32* %"48.i", align 4, !dbg !301, !opID !302, !stats.instNumber !303, !opSignedness !27
  %"103.inc" = add i32 %"102.", 1, !dbg !301, !opID !304, !stats.instNumber !305, !opSignedness !27
  %1 = sext i32 %"103.inc" to i64, !dbg !301
  call void @profOp(i64 103, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !301
  store i32 %"103.inc", i32* %"48.i", align 4, !dbg !301, !opID !306, !stats.instNumber !307, !opSignedness !27
  br label %for.cond, !dbg !234, !llvm.loop !308, !opID !311, !stats.instNumber !312, !opSignedness !27

for.end:                                          ; preds = %for.cond.cleanup
  %"106." = bitcast i32* %"50.max_dist" to i8*, !dbg !313, !opID !314, !stats.instNumber !315, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"106.") #12, !dbg !313, !opID !316, !stats.instNumber !317, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"50.max_dist", metadata !318, metadata !DIExpression()), !dbg !319, !opID !320, !stats.instNumber !321, !opSignedness !27
  store i32 0, i32* %"50.max_dist", align 4, !dbg !319, !opID !322, !stats.instNumber !323, !opSignedness !27
  %"110." = bitcast i32* %"51.max_dist_id" to i8*, !dbg !324, !opID !325, !stats.instNumber !326, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"110.") #12, !dbg !324, !opID !327, !stats.instNumber !328, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"51.max_dist_id", metadata !329, metadata !DIExpression()), !dbg !330, !opID !331, !stats.instNumber !332, !opSignedness !27
  store i32 4, i32* %"51.max_dist_id", align 4, !dbg !330, !opID !333, !stats.instNumber !334, !opSignedness !27
  br label %FIND_MAX_DIST, !dbg !324, !opID !335, !stats.instNumber !336, !opSignedness !27

FIND_MAX_DIST:                                    ; preds = %for.end
  %"115." = bitcast i32* %"52.k" to i8*, !dbg !337, !opID !339, !stats.instNumber !340, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"115.") #12, !dbg !337, !opID !341, !stats.instNumber !342, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"52.k", metadata !343, metadata !DIExpression()), !dbg !344, !opID !345, !stats.instNumber !346, !opSignedness !27
  store i32 0, i32* %"52.k", align 4, !dbg !344, !opID !347, !stats.instNumber !348, !opSignedness !27
  br label %for.cond3, !dbg !337, !opID !349, !stats.instNumber !350, !opSignedness !27

for.cond3:                                        ; preds = %for.inc12, %FIND_MAX_DIST
  %"120." = load i32, i32* %"52.k", align 4, !dbg !351, !opID !353, !stats.instNumber !354, !opSignedness !27
  %"121.cmp4" = icmp slt i32 %"120.", 3, !dbg !355, !opID !356, !stats.instNumber !357, !opSignedness !27
  br i1 %"121.cmp4", label %for.body6, label %for.cond.cleanup5, !dbg !358, !opID !359, !stats.instNumber !360, !opSignedness !27

for.cond.cleanup5:                                ; preds = %for.cond3
  %"123." = bitcast i32* %"52.k" to i8*, !dbg !361, !opID !362, !stats.instNumber !363, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"123.") #12, !dbg !361, !opID !364, !stats.instNumber !365, !opSignedness !27
  br label %for.end14, !opID !366, !stats.instNumber !367, !opSignedness !27

for.body6:                                        ; preds = %for.cond3
  %"126." = load i32*, i32** %"44.dists.addr", align 8, !dbg !368, !opID !371, !stats.instNumber !372, !opSignedness !27
  %"127." = load i32, i32* %"52.k", align 4, !dbg !373, !opID !374, !stats.instNumber !375, !opSignedness !27
  %"128.idxprom7" = sext i32 %"127." to i64, !dbg !368, !opID !376, !stats.instNumber !377, !opSignedness !27
  %"129.arrayidx8" = getelementptr inbounds i32, i32* %"126.", i64 %"128.idxprom7", !dbg !368, !opID !378, !stats.instNumber !379, !opSignedness !27
  %"130." = load i32, i32* %"129.arrayidx8", align 4, !dbg !368, !opID !380, !stats.instNumber !381, !opSignedness !27
  %"131." = load i32, i32* %"50.max_dist", align 4, !dbg !382, !opID !383, !stats.instNumber !384, !opSignedness !27
  %"132.cmp9" = icmp sgt i32 %"130.", %"131.", !dbg !385, !opID !386, !stats.instNumber !387, !opSignedness !27
  br i1 %"132.cmp9", label %if.then, label %if.end, !dbg !388, !opID !389, !stats.instNumber !390, !opSignedness !27

if.then:                                          ; preds = %for.body6
  %"134." = load i32*, i32** %"44.dists.addr", align 8, !dbg !391, !opID !393, !stats.instNumber !394, !opSignedness !27
  %"135." = load i32, i32* %"52.k", align 4, !dbg !395, !opID !396, !stats.instNumber !397, !opSignedness !27
  %"136.idxprom10" = sext i32 %"135." to i64, !dbg !391, !opID !398, !stats.instNumber !399, !opSignedness !27
  %"137.arrayidx11" = getelementptr inbounds i32, i32* %"134.", i64 %"136.idxprom10", !dbg !391, !opID !400, !stats.instNumber !401, !opSignedness !27
  %"138." = load i32, i32* %"137.arrayidx11", align 4, !dbg !391, !opID !402, !stats.instNumber !403, !opSignedness !27
  store i32 %"138.", i32* %"50.max_dist", align 4, !dbg !404, !opID !405, !stats.instNumber !406, !opSignedness !27
  %"140." = load i32, i32* %"52.k", align 4, !dbg !407, !opID !408, !stats.instNumber !409, !opSignedness !27
  store i32 %"140.", i32* %"51.max_dist_id", align 4, !dbg !410, !opID !411, !stats.instNumber !412, !opSignedness !27
  br label %if.end, !dbg !413, !opID !414, !stats.instNumber !415, !opSignedness !27

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc12, !dbg !416, !opID !417, !stats.instNumber !418, !opSignedness !27

for.inc12:                                        ; preds = %if.end
  %"144." = load i32, i32* %"52.k", align 4, !dbg !419, !opID !420, !stats.instNumber !421, !opSignedness !27
  %"145.inc13" = add i32 %"144.", 1, !dbg !419, !opID !422, !stats.instNumber !423, !opSignedness !27
  %2 = sext i32 %"145.inc13" to i64, !dbg !419
  call void @profOp(i64 145, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !419
  store i32 %"145.inc13", i32* %"52.k", align 4, !dbg !419, !opID !424, !stats.instNumber !425, !opSignedness !27
  br label %for.cond3, !dbg !361, !llvm.loop !426, !opID !429, !stats.instNumber !430, !opSignedness !27

for.end14:                                        ; preds = %for.cond.cleanup5
  %"148." = load i32, i32* %"47.dist", align 4, !dbg !431, !opID !433, !stats.instNumber !434, !opSignedness !27
  %"149." = load i32, i32* %"50.max_dist", align 4, !dbg !435, !opID !436, !stats.instNumber !437, !opSignedness !27
  %"150.cmp15" = icmp slt i32 %"148.", %"149.", !dbg !438, !opID !439, !stats.instNumber !440, !opSignedness !27
  br i1 %"150.cmp15", label %if.then16, label %if.end21, !dbg !441, !opID !442, !stats.instNumber !443, !opSignedness !27

if.then16:                                        ; preds = %for.end14
  %"152." = load i32, i32* %"47.dist", align 4, !dbg !444, !opID !446, !stats.instNumber !447, !opSignedness !27
  %"153." = load i32*, i32** %"44.dists.addr", align 8, !dbg !448, !opID !449, !stats.instNumber !450, !opSignedness !27
  %"154." = load i32, i32* %"51.max_dist_id", align 4, !dbg !451, !opID !452, !stats.instNumber !453, !opSignedness !27
  %"155.idxprom17" = sext i32 %"154." to i64, !dbg !448, !opID !454, !stats.instNumber !455, !opSignedness !27
  %"156.arrayidx18" = getelementptr inbounds i32, i32* %"153.", i64 %"155.idxprom17", !dbg !448, !opID !456, !stats.instNumber !457, !opSignedness !27
  store i32 %"152.", i32* %"156.arrayidx18", align 4, !dbg !458, !opID !459, !stats.instNumber !460, !opSignedness !27
  %"158." = load i32, i32* %"46.label.addr", align 4, !dbg !461, !opID !462, !stats.instNumber !463, !opSignedness !27
  %"159." = load i32*, i32** %"45.labels.addr", align 8, !dbg !464, !opID !465, !stats.instNumber !466, !opSignedness !27
  %"160." = load i32, i32* %"51.max_dist_id", align 4, !dbg !467, !opID !468, !stats.instNumber !469, !opSignedness !27
  %"161.idxprom19" = sext i32 %"160." to i64, !dbg !464, !opID !470, !stats.instNumber !471, !opSignedness !27
  %"162.arrayidx20" = getelementptr inbounds i32, i32* %"159.", i64 %"161.idxprom19", !dbg !464, !opID !472, !stats.instNumber !473, !opSignedness !27
  store i32 %"158.", i32* %"162.arrayidx20", align 4, !dbg !474, !opID !475, !stats.instNumber !476, !opSignedness !27
  br label %if.end21, !dbg !477, !opID !478, !stats.instNumber !479, !opSignedness !27

if.end21:                                         ; preds = %if.then16, %for.end14
  %"165." = bitcast i32* %"51.max_dist_id" to i8*, !dbg !480, !opID !481, !stats.instNumber !482, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"165.") #12, !dbg !480, !opID !483, !stats.instNumber !484, !opSignedness !27
  %"167." = bitcast i32* %"50.max_dist" to i8*, !dbg !480, !opID !485, !stats.instNumber !486, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"167.") #12, !dbg !480, !opID !487, !stats.instNumber !488, !opSignedness !27
  %"169." = bitcast i32* %"47.dist" to i8*, !dbg !480, !opID !489, !stats.instNumber !490, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"169.") #12, !dbg !480, !opID !491, !stats.instNumber !492, !opSignedness !27
  ret void, !dbg !480, !opID !493, !stats.instNumber !494, !opSignedness !27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #5

; Function Attrs: nounwind
define zeroext i8 @_Z8knn_votePi(i32* "fpga.decayed.dim.hint"="3" %labels) #6 !dbg !495 {
entry:
  %"172.labels.addr" = alloca i32*, align 8, !opID !500, !stats.instNumber !501, !opSignedness !27
  %"173.max_vote" = alloca i32, align 4, !opID !502, !stats.instNumber !503, !opSignedness !27
  %"174.max_label" = alloca i8, align 1, !opID !504, !stats.instNumber !505, !opSignedness !27
  %"175.votes" = alloca [10 x i32], align 4, !opID !506, !stats.instNumber !507, !opSignedness !27
  %"176.i" = alloca i32, align 4, !opID !508, !stats.instNumber !509, !opSignedness !27
  %"177.i4" = alloca i32, align 4, !opID !510, !stats.instNumber !511, !opSignedness !27
  store i32* %labels, i32** %"172.labels.addr", align 8, !opID !512, !stats.instNumber !513, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32** %"172.labels.addr", metadata !514, metadata !DIExpression()), !dbg !515, !opID !516, !stats.instNumber !517, !opSignedness !27
  %"180." = bitcast i32* %"173.max_vote" to i8*, !dbg !518, !opID !519, !stats.instNumber !520, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"180.") #12, !dbg !518, !opID !521, !stats.instNumber !522, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"173.max_vote", metadata !523, metadata !DIExpression()), !dbg !524, !opID !525, !stats.instNumber !526, !opSignedness !27
  store i32 0, i32* %"173.max_vote", align 4, !dbg !524, !opID !527, !stats.instNumber !528, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"174.max_label") #12, !dbg !529, !opID !530, !stats.instNumber !531, !opSignedness !27
  call void @llvm.dbg.declare(metadata i8* %"174.max_label", metadata !532, metadata !DIExpression()), !dbg !533, !opID !534, !stats.instNumber !535, !opSignedness !27
  store i8 0, i8* %"174.max_label", align 1, !dbg !533, !opID !536, !stats.instNumber !537, !opSignedness !27
  %"187." = bitcast [10 x i32]* %"175.votes" to i8*, !dbg !538, !opID !539, !stats.instNumber !540, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %"187.") #12, !dbg !538, !opID !541, !stats.instNumber !542, !opSignedness !27
  call void @llvm.dbg.declare(metadata [10 x i32]* %"175.votes", metadata !543, metadata !DIExpression()), !dbg !547, !opID !548, !stats.instNumber !549, !opSignedness !27
  %"190." = bitcast [10 x i32]* %"175.votes" to i8*, !dbg !547, !opID !550, !stats.instNumber !551, !opSignedness !27
  call void @llvm.memset.p0i8.i64(i8* align 4 %"190.", i8 0, i64 40, i1 false), !dbg !547, !opID !552, !stats.instNumber !553, !opSignedness !27
  br label %VITIS_LOOP_69_1, !dbg !538, !opID !554, !stats.instNumber !555, !opSignedness !27

VITIS_LOOP_69_1:                                  ; preds = %entry
  %"193." = bitcast i32* %"176.i" to i8*, !dbg !556, !opID !558, !stats.instNumber !559, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"193.") #12, !dbg !556, !opID !560, !stats.instNumber !561, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"176.i", metadata !562, metadata !DIExpression()), !dbg !563, !opID !564, !stats.instNumber !565, !opSignedness !27
  store i32 0, i32* %"176.i", align 4, !dbg !563, !opID !566, !stats.instNumber !567, !opSignedness !27
  br label %for.cond, !dbg !556, !opID !568, !stats.instNumber !569, !opSignedness !27

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_69_1
  %"198." = load i32, i32* %"176.i", align 4, !dbg !570, !opID !572, !stats.instNumber !573, !opSignedness !27
  %"199.cmp" = icmp slt i32 %"198.", 3, !dbg !574, !opID !575, !stats.instNumber !576, !opSignedness !27
  br i1 %"199.cmp", label %for.body, label %for.cond.cleanup, !dbg !577, !opID !578, !stats.instNumber !579, !opSignedness !27

for.cond.cleanup:                                 ; preds = %for.cond
  %"201." = bitcast i32* %"176.i" to i8*, !dbg !580, !opID !581, !stats.instNumber !582, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"201.") #12, !dbg !580, !opID !583, !stats.instNumber !584, !opSignedness !27
  br label %for.end, !opID !585, !stats.instNumber !586, !opSignedness !27

for.body:                                         ; preds = %for.cond
  %"204." = load i32*, i32** %"172.labels.addr", align 8, !dbg !587, !opID !588, !stats.instNumber !589, !opSignedness !27
  %"205." = load i32, i32* %"176.i", align 4, !dbg !590, !opID !591, !stats.instNumber !592, !opSignedness !27
  %"206.idxprom" = sext i32 %"205." to i64, !dbg !587, !opID !593, !stats.instNumber !594, !opSignedness !27
  %"207.arrayidx" = getelementptr inbounds i32, i32* %"204.", i64 %"206.idxprom", !dbg !587, !opID !595, !stats.instNumber !596, !opSignedness !27
  %"208." = load i32, i32* %"207.arrayidx", align 4, !dbg !587, !opID !597, !stats.instNumber !598, !opSignedness !27
  %"209.idxprom1" = sext i32 %"208." to i64, !dbg !599, !opID !600, !stats.instNumber !601, !opSignedness !27
  %"210.arrayidx2" = getelementptr inbounds [10 x i32], [10 x i32]* %"175.votes", i64 0, i64 %"209.idxprom1", !dbg !599, !opID !602, !stats.instNumber !603, !opSignedness !27
  %"211." = load i32, i32* %"210.arrayidx2", align 4, !dbg !604, !opID !605, !stats.instNumber !606, !opSignedness !27
  %"212.inc" = add i32 %"211.", 1, !dbg !604, !opID !607, !stats.instNumber !608, !opSignedness !27
  %0 = sext i32 %"212.inc" to i64, !dbg !604
  call void @profOp(i64 212, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !604
  store i32 %"212.inc", i32* %"210.arrayidx2", align 4, !dbg !604, !opID !609, !stats.instNumber !610, !opSignedness !27
  br label %for.inc, !dbg !599, !opID !611, !stats.instNumber !612, !opSignedness !27

for.inc:                                          ; preds = %for.body
  %"215." = load i32, i32* %"176.i", align 4, !dbg !613, !opID !614, !stats.instNumber !615, !opSignedness !27
  %"216.inc3" = add i32 %"215.", 1, !dbg !613, !opID !616, !stats.instNumber !617, !opSignedness !27
  %1 = sext i32 %"216.inc3" to i64, !dbg !613
  call void @profOp(i64 216, i8 11, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !613
  store i32 %"216.inc3", i32* %"176.i", align 4, !dbg !613, !opID !618, !stats.instNumber !619, !opSignedness !27
  br label %for.cond, !dbg !580, !llvm.loop !620, !opID !623, !stats.instNumber !624, !opSignedness !27

for.end:                                          ; preds = %for.cond.cleanup
  br label %VITIS_LOOP_72_2, !dbg !621, !opID !625, !stats.instNumber !626, !opSignedness !27

VITIS_LOOP_72_2:                                  ; preds = %for.end
  %"220." = bitcast i32* %"177.i4" to i8*, !dbg !627, !opID !629, !stats.instNumber !630, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"220.") #12, !dbg !627, !opID !631, !stats.instNumber !632, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"177.i4", metadata !633, metadata !DIExpression()), !dbg !634, !opID !635, !stats.instNumber !636, !opSignedness !27
  store i32 0, i32* %"177.i4", align 4, !dbg !634, !opID !637, !stats.instNumber !638, !opSignedness !27
  br label %for.cond5, !dbg !627, !opID !639, !stats.instNumber !640, !opSignedness !27

for.cond5:                                        ; preds = %for.inc14, %VITIS_LOOP_72_2
  %"225." = load i32, i32* %"177.i4", align 4, !dbg !641, !opID !643, !stats.instNumber !644, !opSignedness !27
  %"226.cmp6" = icmp slt i32 %"225.", 10, !dbg !645, !opID !646, !stats.instNumber !647, !opSignedness !27
  br i1 %"226.cmp6", label %for.body8, label %for.cond.cleanup7, !dbg !648, !opID !649, !stats.instNumber !650, !opSignedness !27

for.cond.cleanup7:                                ; preds = %for.cond5
  %"228." = bitcast i32* %"177.i4" to i8*, !dbg !651, !opID !652, !stats.instNumber !653, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"228.") #12, !dbg !651, !opID !654, !stats.instNumber !655, !opSignedness !27
  br label %for.end16, !opID !656, !stats.instNumber !657, !opSignedness !27

for.body8:                                        ; preds = %for.cond5
  %"231." = load i32, i32* %"177.i4", align 4, !dbg !658, !opID !661, !stats.instNumber !662, !opSignedness !27
  %"232.idxprom9" = sext i32 %"231." to i64, !dbg !663, !opID !664, !stats.instNumber !665, !opSignedness !27
  %"233.arrayidx10" = getelementptr inbounds [10 x i32], [10 x i32]* %"175.votes", i64 0, i64 %"232.idxprom9", !dbg !663, !opID !666, !stats.instNumber !667, !opSignedness !27
  %"234." = load i32, i32* %"233.arrayidx10", align 4, !dbg !663, !opID !668, !stats.instNumber !669, !opSignedness !27
  %"235." = load i32, i32* %"173.max_vote", align 4, !dbg !670, !opID !671, !stats.instNumber !672, !opSignedness !27
  %"236.cmp11" = icmp sgt i32 %"234.", %"235.", !dbg !673, !opID !674, !stats.instNumber !675, !opSignedness !27
  br i1 %"236.cmp11", label %if.then, label %if.end, !dbg !676, !opID !677, !stats.instNumber !678, !opSignedness !27

if.then:                                          ; preds = %for.body8
  %"238." = load i32, i32* %"177.i4", align 4, !dbg !679, !opID !681, !stats.instNumber !682, !opSignedness !27
  %"239.idxprom12" = sext i32 %"238." to i64, !dbg !683, !opID !684, !stats.instNumber !685, !opSignedness !27
  %"240.arrayidx13" = getelementptr inbounds [10 x i32], [10 x i32]* %"175.votes", i64 0, i64 %"239.idxprom12", !dbg !683, !opID !686, !stats.instNumber !687, !opSignedness !27
  %"241." = load i32, i32* %"240.arrayidx13", align 4, !dbg !683, !opID !688, !stats.instNumber !689, !opSignedness !27
  store i32 %"241.", i32* %"173.max_vote", align 4, !dbg !690, !opID !691, !stats.instNumber !692, !opSignedness !27
  %"243." = load i32, i32* %"177.i4", align 4, !dbg !693, !opID !694, !stats.instNumber !695, !opSignedness !27
  %"244.conv" = trunc i32 %"243." to i8, !dbg !693, !opID !696, !stats.instNumber !697, !opSignedness !27
  store i8 %"244.conv", i8* %"174.max_label", align 1, !dbg !698, !opID !699, !stats.instNumber !700, !opSignedness !27
  br label %if.end, !dbg !701, !opID !702, !stats.instNumber !703, !opSignedness !27

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc14, !dbg !704, !opID !705, !stats.instNumber !706, !opSignedness !27

for.inc14:                                        ; preds = %if.end
  %"248." = load i32, i32* %"177.i4", align 4, !dbg !707, !opID !708, !stats.instNumber !709, !opSignedness !27
  %"249.inc15" = add i32 %"248.", 1, !dbg !707, !opID !710, !stats.instNumber !711, !opSignedness !27
  %2 = sext i32 %"249.inc15" to i64, !dbg !707
  call void @profOp(i64 249, i8 11, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !707
  store i32 %"249.inc15", i32* %"177.i4", align 4, !dbg !707, !opID !712, !stats.instNumber !713, !opSignedness !27
  br label %for.cond5, !dbg !651, !llvm.loop !714, !opID !717, !stats.instNumber !718, !opSignedness !27

for.end16:                                        ; preds = %for.cond.cleanup7
  %"252." = load i8, i8* %"174.max_label", align 1, !dbg !719, !opID !720, !stats.instNumber !721, !opSignedness !27
  %"253." = bitcast [10 x i32]* %"175.votes" to i8*, !dbg !722, !opID !723, !stats.instNumber !724, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %"253.") #12, !dbg !722, !opID !725, !stats.instNumber !726, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"174.max_label") #12, !dbg !722, !opID !727, !stats.instNumber !728, !opSignedness !27
  %"256." = bitcast i32* %"173.max_vote" to i8*, !dbg !722, !opID !729, !stats.instNumber !730, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"256.") #12, !dbg !722, !opID !731, !stats.instNumber !732, !opSignedness !27
  ret i8 %"252.", !dbg !733, !opID !734, !stats.instNumber !735, !opSignedness !27
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #5

; Function Attrs: nounwind
define void @_Z8DigitRecPKyS0_PKhPh(i64* "fpga.decayed.dim.hint"="72000" %training_samples, i64* "fpga.decayed.dim.hint"="8000" %test_set, i8* "fpga.decayed.dim.hint"="18000" %training_labels, i8* "fpga.decayed.dim.hint"="2000" %results) #7 !dbg !736 !fpga.function.pragma !742 {
entry:
  %"259.training_samples.addr" = alloca i64*, align 8, !opID !745, !stats.instNumber !746, !opSignedness !27
  %"260.test_set.addr" = alloca i64*, align 8, !opID !747, !stats.instNumber !748, !opSignedness !27
  %"261.training_labels.addr" = alloca i8*, align 8, !opID !749, !stats.instNumber !750, !opSignedness !27
  %"262.results.addr" = alloca i8*, align 8, !opID !751, !stats.instNumber !752, !opSignedness !27
  %"263.dists" = alloca [3 x i32], align 4, !opID !753, !stats.instNumber !754, !opSignedness !27
  %"264.labels" = alloca [3 x i32], align 4, !opID !755, !stats.instNumber !756, !opSignedness !27
  %"265.t" = alloca i32, align 4, !opID !757, !stats.instNumber !758, !opSignedness !27
  %"266.cleanup.dest.slot" = alloca i32, align 4, !opID !759, !stats.instNumber !760, !opSignedness !27
  %"267.i" = alloca i32, align 4, !opID !761, !stats.instNumber !762, !opSignedness !27
  %"268.i7" = alloca i32, align 4, !opID !763, !stats.instNumber !764, !opSignedness !27
  %"269.max_vote" = alloca i8, align 1, !opID !765, !stats.instNumber !766, !opSignedness !27
  store i64* %training_samples, i64** %"259.training_samples.addr", align 8, !opID !767, !stats.instNumber !768, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64** %"259.training_samples.addr", metadata !769, metadata !DIExpression()), !dbg !770, !opID !771, !stats.instNumber !772, !opSignedness !27
  store i64* %test_set, i64** %"260.test_set.addr", align 8, !opID !773, !stats.instNumber !774, !opSignedness !27
  call void @llvm.dbg.declare(metadata i64** %"260.test_set.addr", metadata !775, metadata !DIExpression()), !dbg !776, !opID !777, !stats.instNumber !778, !opSignedness !27
  store i8* %training_labels, i8** %"261.training_labels.addr", align 8, !opID !779, !stats.instNumber !780, !opSignedness !27
  call void @llvm.dbg.declare(metadata i8** %"261.training_labels.addr", metadata !781, metadata !DIExpression()), !dbg !782, !opID !783, !stats.instNumber !784, !opSignedness !27
  store i8* %results, i8** %"262.results.addr", align 8, !opID !785, !stats.instNumber !786, !opSignedness !27
  call void @llvm.dbg.declare(metadata i8** %"262.results.addr", metadata !787, metadata !DIExpression()), !dbg !788, !opID !789, !stats.instNumber !790, !opSignedness !27
  %"278." = bitcast [3 x i32]* %"263.dists" to i8*, !dbg !791, !opID !792, !stats.instNumber !793, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %"278.") #12, !dbg !791, !opID !794, !stats.instNumber !795, !opSignedness !27
  call void @llvm.dbg.declare(metadata [3 x i32]* %"263.dists", metadata !796, metadata !DIExpression()), !dbg !800, !opID !801, !stats.instNumber !802, !opSignedness !27
  %"281." = bitcast [3 x i32]* %"264.labels" to i8*, !dbg !803, !opID !804, !stats.instNumber !805, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %"281.") #12, !dbg !803, !opID !806, !stats.instNumber !807, !opSignedness !27
  call void @llvm.dbg.declare(metadata [3 x i32]* %"264.labels", metadata !808, metadata !DIExpression()), !dbg !809, !opID !810, !stats.instNumber !811, !opSignedness !27
  br label %TEST_LOOP, !dbg !803, !opID !812, !stats.instNumber !813, !opSignedness !27

TEST_LOOP:                                        ; preds = %entry
  %"285." = bitcast i32* %"265.t" to i8*, !dbg !814, !opID !816, !stats.instNumber !817, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"285.") #12, !dbg !814, !opID !818, !stats.instNumber !819, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"265.t", metadata !820, metadata !DIExpression()), !dbg !821, !opID !822, !stats.instNumber !823, !opSignedness !27
  store i32 0, i32* %"265.t", align 4, !dbg !821, !opID !824, !stats.instNumber !825, !opSignedness !27
  br label %for.cond, !dbg !814, !opID !826, !stats.instNumber !827, !opSignedness !27

for.cond:                                         ; preds = %for.inc26, %TEST_LOOP
  %"290." = load i32, i32* %"265.t", align 4, !dbg !828, !opID !830, !stats.instNumber !831, !opSignedness !27
  %"291.cmp" = icmp slt i32 %"290.", 2000, !dbg !832, !opID !833, !stats.instNumber !834, !opSignedness !27
  br i1 %"291.cmp", label %for.body, label %for.cond.cleanup, !dbg !835, !opID !836, !stats.instNumber !837, !opSignedness !27

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %"266.cleanup.dest.slot", align 4, !opID !838, !stats.instNumber !839, !opSignedness !27
  %"294." = bitcast i32* %"265.t" to i8*, !dbg !840, !opID !841, !stats.instNumber !842, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"294.") #12, !dbg !840, !opID !843, !stats.instNumber !844, !opSignedness !27
  br label %for.end28, !opID !845, !stats.instNumber !846, !opSignedness !27

for.body:                                         ; preds = %for.cond
  br label %SET_KNN_SET, !dbg !847, !opID !848, !stats.instNumber !849, !opSignedness !27

SET_KNN_SET:                                      ; preds = %for.body
  %"298." = bitcast i32* %"267.i" to i8*, !dbg !850, !opID !853, !stats.instNumber !854, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"298.") #12, !dbg !850, !opID !855, !stats.instNumber !856, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"267.i", metadata !857, metadata !DIExpression()), !dbg !858, !opID !859, !stats.instNumber !860, !opSignedness !27
  store i32 0, i32* %"267.i", align 4, !dbg !858, !opID !861, !stats.instNumber !862, !opSignedness !27
  br label %for.cond1, !dbg !850, !opID !863, !stats.instNumber !864, !opSignedness !27

for.cond1:                                        ; preds = %for.inc, %SET_KNN_SET
  %"303." = load i32, i32* %"267.i", align 4, !dbg !865, !opID !867, !stats.instNumber !868, !opSignedness !27
  %"304.cmp2" = icmp slt i32 %"303.", 3, !dbg !869, !opID !870, !stats.instNumber !871, !opSignedness !27
  br i1 %"304.cmp2", label %for.body4, label %for.cond.cleanup3, !dbg !872, !opID !873, !stats.instNumber !874, !opSignedness !27

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %"266.cleanup.dest.slot", align 4, !opID !875, !stats.instNumber !876, !opSignedness !27
  %"307." = bitcast i32* %"267.i" to i8*, !dbg !877, !opID !878, !stats.instNumber !879, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"307.") #12, !dbg !877, !opID !880, !stats.instNumber !881, !opSignedness !27
  br label %for.end, !opID !882, !stats.instNumber !883, !opSignedness !27

for.body4:                                        ; preds = %for.cond1
  %"310." = load i32, i32* %"267.i", align 4, !dbg !884, !opID !886, !stats.instNumber !887, !opSignedness !27
  %"311.idxprom" = sext i32 %"310." to i64, !dbg !888, !opID !889, !stats.instNumber !890, !opSignedness !27
  %"312.arrayidx" = getelementptr inbounds [3 x i32], [3 x i32]* %"263.dists", i64 0, i64 %"311.idxprom", !dbg !888, !opID !891, !stats.instNumber !892, !opSignedness !27
  store i32 256, i32* %"312.arrayidx", align 4, !dbg !893, !opID !894, !stats.instNumber !895, !opSignedness !27
  %"314." = load i32, i32* %"267.i", align 4, !dbg !896, !opID !897, !stats.instNumber !898, !opSignedness !27
  %"315.idxprom5" = sext i32 %"314." to i64, !dbg !899, !opID !900, !stats.instNumber !901, !opSignedness !27
  %"316.arrayidx6" = getelementptr inbounds [3 x i32], [3 x i32]* %"264.labels", i64 0, i64 %"315.idxprom5", !dbg !899, !opID !902, !stats.instNumber !903, !opSignedness !27
  store i32 0, i32* %"316.arrayidx6", align 4, !dbg !904, !opID !905, !stats.instNumber !906, !opSignedness !27
  br label %for.inc, !dbg !907, !opID !908, !stats.instNumber !909, !opSignedness !27

for.inc:                                          ; preds = %for.body4
  %"319." = load i32, i32* %"267.i", align 4, !dbg !910, !opID !911, !stats.instNumber !912, !opSignedness !27
  %"320.inc" = add i32 %"319.", 1, !dbg !910, !opID !913, !stats.instNumber !914, !opSignedness !27
  %0 = sext i32 %"320.inc" to i64, !dbg !910
  call void @profOp(i64 320, i8 11, i64 %0, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !910
  store i32 %"320.inc", i32* %"267.i", align 4, !dbg !910, !opID !915, !stats.instNumber !916, !opSignedness !27
  br label %for.cond1, !dbg !877, !llvm.loop !917, !opID !920, !stats.instNumber !921, !opSignedness !27

for.end:                                          ; preds = %for.cond.cleanup3
  br label %TRAINING_LOOP, !dbg !918, !opID !922, !stats.instNumber !923, !opSignedness !27

TRAINING_LOOP:                                    ; preds = %for.end
  %"324." = bitcast i32* %"268.i7" to i8*, !dbg !924, !opID !926, !stats.instNumber !927, !opSignedness !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %"324.") #12, !dbg !924, !opID !928, !stats.instNumber !929, !opSignedness !27
  call void @llvm.dbg.declare(metadata i32* %"268.i7", metadata !930, metadata !DIExpression()), !dbg !931, !opID !932, !stats.instNumber !933, !opSignedness !27
  store i32 0, i32* %"268.i7", align 4, !dbg !931, !opID !934, !stats.instNumber !935, !opSignedness !27
  br label %for.cond8, !dbg !924, !opID !936, !stats.instNumber !937, !opSignedness !27

for.cond8:                                        ; preds = %for.inc20, %TRAINING_LOOP
  %"329." = load i32, i32* %"268.i7", align 4, !dbg !938, !opID !940, !stats.instNumber !941, !opSignedness !27
  %"330.cmp9" = icmp slt i32 %"329.", 18000, !dbg !942, !opID !943, !stats.instNumber !944, !opSignedness !27
  br i1 %"330.cmp9", label %for.body11, label %for.cond.cleanup10, !dbg !945, !opID !946, !stats.instNumber !947, !opSignedness !27

for.cond.cleanup10:                               ; preds = %for.cond8
  store i32 11, i32* %"266.cleanup.dest.slot", align 4, !opID !948, !stats.instNumber !949, !opSignedness !27
  %"333." = bitcast i32* %"268.i7" to i8*, !dbg !950, !opID !951, !stats.instNumber !952, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %"333.") #12, !dbg !950, !opID !953, !stats.instNumber !954, !opSignedness !27
  br label %for.end22, !opID !955, !stats.instNumber !956, !opSignedness !27

for.body11:                                       ; preds = %for.cond8
  %"336." = load i64*, i64** %"259.training_samples.addr", align 8, !dbg !957, !opID !958, !stats.instNumber !959, !opSignedness !27
  %"337." = load i32, i32* %"268.i7", align 4, !dbg !960, !opID !961, !stats.instNumber !962, !opSignedness !27
  %"338.mul" = mul i32 %"337.", 4, !dbg !963, !opID !964, !stats.instNumber !965, !opSignedness !27
  %1 = sext i32 %"338.mul" to i64, !dbg !957
  call void @profOp(i64 338, i8 15, i64 %1, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !957
  %"339.idxprom12" = sext i32 %"338.mul" to i64, !dbg !957, !opID !966, !stats.instNumber !967, !opSignedness !27
  %"340.arrayidx13" = getelementptr inbounds i64, i64* %"336.", i64 %"339.idxprom12", !dbg !957, !opID !968, !stats.instNumber !969, !opSignedness !27
  %"341." = load i64*, i64** %"260.test_set.addr", align 8, !dbg !970, !opID !971, !stats.instNumber !972, !opSignedness !27
  %"342." = load i32, i32* %"265.t", align 4, !dbg !973, !opID !974, !stats.instNumber !975, !opSignedness !27
  %"343.mul14" = mul i32 %"342.", 4, !dbg !976, !opID !977, !stats.instNumber !978, !opSignedness !27
  %2 = sext i32 %"343.mul14" to i64, !dbg !970
  call void @profOp(i64 343, i8 15, i64 %2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !970
  %"344.idxprom15" = sext i32 %"343.mul14" to i64, !dbg !970, !opID !979, !stats.instNumber !980, !opSignedness !27
  %"345.arrayidx16" = getelementptr inbounds i64, i64* %"341.", i64 %"344.idxprom15", !dbg !970, !opID !981, !stats.instNumber !982, !opSignedness !27
  %"346.arraydecay" = getelementptr inbounds [3 x i32], [3 x i32]* %"263.dists", i32 0, i32 0, !dbg !983, !opID !984, !stats.instNumber !985, !opSignedness !27
  %"347.arraydecay17" = getelementptr inbounds [3 x i32], [3 x i32]* %"264.labels", i32 0, i32 0, !dbg !986, !opID !987, !stats.instNumber !988, !opSignedness !27
  %"348." = load i8*, i8** %"261.training_labels.addr", align 8, !dbg !989, !opID !990, !stats.instNumber !991, !opSignedness !27
  %"349." = load i32, i32* %"268.i7", align 4, !dbg !992, !opID !993, !stats.instNumber !994, !opSignedness !27
  %"350.idxprom18" = sext i32 %"349." to i64, !dbg !989, !opID !995, !stats.instNumber !996, !opSignedness !27
  %"351.arrayidx19" = getelementptr inbounds i8, i8* %"348.", i64 %"350.idxprom18", !dbg !989, !opID !997, !stats.instNumber !998, !opSignedness !27
  %"352." = load i8, i8* %"351.arrayidx19", align 1, !dbg !989, !opID !999, !stats.instNumber !1000, !opSignedness !27
  %"353.conv" = zext i8 %"352." to i32, !dbg !989, !opID !1001, !stats.instNumber !1002, !opSignedness !27
  call void @_Z10update_knnPKyS0_PiS1_i(i64* %"340.arrayidx13", i64* %"345.arrayidx16", i32* %"346.arraydecay", i32* %"347.arraydecay17", i32 %"353.conv"), !dbg !1003, !opID !1004, !stats.instNumber !1005, !opSignedness !27
  br label %for.inc20, !dbg !1003, !opID !1006, !stats.instNumber !1007, !opSignedness !27

for.inc20:                                        ; preds = %for.body11
  %"356." = load i32, i32* %"268.i7", align 4, !dbg !1008, !opID !1009, !stats.instNumber !1010, !opSignedness !27
  %"357.inc21" = add i32 %"356.", 1, !dbg !1008, !opID !1011, !stats.instNumber !1012, !opSignedness !27
  %3 = sext i32 %"357.inc21" to i64, !dbg !1008
  call void @profOp(i64 357, i8 11, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1008
  store i32 %"357.inc21", i32* %"268.i7", align 4, !dbg !1008, !opID !1013, !stats.instNumber !1014, !opSignedness !27
  br label %for.cond8, !dbg !950, !llvm.loop !1015, !opID !1018, !stats.instNumber !1019, !opSignedness !27

for.end22:                                        ; preds = %for.cond.cleanup10
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %"269.max_vote") #12, !dbg !1020, !opID !1021, !stats.instNumber !1022, !opSignedness !27
  call void @llvm.dbg.declare(metadata i8* %"269.max_vote", metadata !1023, metadata !DIExpression()), !dbg !1024, !opID !1025, !stats.instNumber !1026, !opSignedness !27
  %"362.arraydecay23" = getelementptr inbounds [3 x i32], [3 x i32]* %"264.labels", i32 0, i32 0, !dbg !1027, !opID !1028, !stats.instNumber !1029, !opSignedness !27
  %"363.call" = call zeroext i8 @_Z8knn_votePi(i32* %"362.arraydecay23"), !dbg !1030, !opID !1031, !stats.instNumber !1032, !opSignedness !27
  store i8 %"363.call", i8* %"269.max_vote", align 1, !dbg !1024, !opID !1033, !stats.instNumber !1034, !opSignedness !27
  %"365." = load i8, i8* %"269.max_vote", align 1, !dbg !1035, !opID !1036, !stats.instNumber !1037, !opSignedness !27
  %"366." = load i8*, i8** %"262.results.addr", align 8, !dbg !1038, !opID !1039, !stats.instNumber !1040, !opSignedness !27
  %"367." = load i32, i32* %"265.t", align 4, !dbg !1041, !opID !1042, !stats.instNumber !1043, !opSignedness !27
  %"368.idxprom24" = sext i32 %"367." to i64, !dbg !1038, !opID !1044, !stats.instNumber !1045, !opSignedness !27
  %"369.arrayidx25" = getelementptr inbounds i8, i8* %"366.", i64 %"368.idxprom24", !dbg !1038, !opID !1046, !stats.instNumber !1047, !opSignedness !27
  store i8 %"365.", i8* %"369.arrayidx25", align 1, !dbg !1048, !opID !1049, !stats.instNumber !1050, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %"269.max_vote") #12, !dbg !1051, !opID !1052, !stats.instNumber !1053, !opSignedness !27
  br label %for.inc26, !dbg !1054, !opID !1055, !stats.instNumber !1056, !opSignedness !27

for.inc26:                                        ; preds = %for.end22
  %"373." = load i32, i32* %"265.t", align 4, !dbg !1057, !opID !1058, !stats.instNumber !1059, !opSignedness !27
  %"374.inc27" = add i32 %"373.", 1, !dbg !1057, !opID !1060, !stats.instNumber !1061, !opSignedness !27
  %4 = sext i32 %"374.inc27" to i64, !dbg !1057
  call void @profOp(i64 374, i8 11, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32), !dbg !1057
  store i32 %"374.inc27", i32* %"265.t", align 4, !dbg !1057, !opID !1062, !stats.instNumber !1063, !opSignedness !27
  br label %for.cond, !dbg !840, !llvm.loop !1064, !opID !1067, !stats.instNumber !1068, !opSignedness !27

for.end28:                                        ; preds = %for.cond.cleanup
  %"377." = bitcast [3 x i32]* %"264.labels" to i8*, !dbg !1069, !opID !1070, !stats.instNumber !1071, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %"377.") #12, !dbg !1069, !opID !1072, !stats.instNumber !1073, !opSignedness !27
  %"379." = bitcast [3 x i32]* %"263.dists" to i8*, !dbg !1069, !opID !1074, !stats.instNumber !1075, !opSignedness !27
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %"379.") #12, !dbg !1069, !opID !1076, !stats.instNumber !1077, !opSignedness !27
  ret void, !dbg !1069, !opID !1078, !stats.instNumber !1079, !opSignedness !27
}

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #8 {
entry:
  %"382.retval" = alloca i32, align 4, !opID !1080, !stats.instNumber !1081, !opSignedness !27
  %"383.argc.addr" = alloca i32, align 4, !opID !1082, !stats.instNumber !1083, !opSignedness !27
  %"384.argv.addr" = alloca i8**, align 8, !opID !1084, !stats.instNumber !1085, !opSignedness !27
  %"385.training_samples" = alloca [72000 x i64], align 16, !opID !1086, !stats.instNumber !1087, !opSignedness !27
  %"386.testing_samples" = alloca [8000 x i64], align 16, !opID !1088, !stats.instNumber !1089, !opSignedness !27
  %"387.training_labels" = alloca [18000 x i8], align 16, !opID !1090, !stats.instNumber !1091, !opSignedness !27
  %"388.test_labels" = alloca [2000 x i8], align 16, !opID !1092, !stats.instNumber !1093, !opSignedness !27
  %"389.result" = alloca [2000 x i8], align 16, !opID !1094, !stats.instNumber !1095, !opSignedness !27
  store i32 0, i32* %"382.retval", align 4, !opID !1096, !stats.instNumber !1097, !opSignedness !27
  store i32 %argc, i32* %"383.argc.addr", align 4, !opID !1098, !stats.instNumber !1099, !opSignedness !27
  store i8** %argv, i8*** %"384.argv.addr", align 8, !opID !1100, !stats.instNumber !1101, !opSignedness !27
  %"393." = load i8**, i8*** %"384.argv.addr", align 8, !opID !1102, !stats.instNumber !1103, !opSignedness !27
  %"394.arrayidx" = getelementptr inbounds i8*, i8** %"393.", i64 1, !opID !1104, !stats.instNumber !1105, !opSignedness !27
  %"395." = load i8*, i8** %"394.arrayidx", align 8, !opID !1106, !stats.instNumber !1107, !opSignedness !27
  %"396." = load i8**, i8*** %"384.argv.addr", align 8, !opID !1108, !stats.instNumber !1109, !opSignedness !27
  %"397.arrayidx1" = getelementptr inbounds i8*, i8** %"396.", i64 2, !opID !1110, !stats.instNumber !1111, !opSignedness !27
  %"398." = load i8*, i8** %"397.arrayidx1", align 8, !opID !1112, !stats.instNumber !1113, !opSignedness !27
  %"399." = load i8**, i8*** %"384.argv.addr", align 8, !opID !1114, !stats.instNumber !1115, !opSignedness !27
  %"400.arrayidx2" = getelementptr inbounds i8*, i8** %"399.", i64 3, !opID !1116, !stats.instNumber !1117, !opSignedness !27
  %"401." = load i8*, i8** %"400.arrayidx2", align 8, !opID !1118, !stats.instNumber !1119, !opSignedness !27
  %"402." = load i8**, i8*** %"384.argv.addr", align 8, !opID !1120, !stats.instNumber !1121, !opSignedness !27
  %"403.arrayidx3" = getelementptr inbounds i8*, i8** %"402.", i64 4, !opID !1122, !stats.instNumber !1123, !opSignedness !27
  %"404." = load i8*, i8** %"403.arrayidx3", align 8, !opID !1124, !stats.instNumber !1125, !opSignedness !27
  %"405.arraydecay" = getelementptr inbounds [72000 x i64], [72000 x i64]* %"385.training_samples", i32 0, i32 0, !opID !1126, !stats.instNumber !1127, !opSignedness !27
  %"406.arraydecay4" = getelementptr inbounds [18000 x i8], [18000 x i8]* %"387.training_labels", i32 0, i32 0, !opID !1128, !stats.instNumber !1129, !opSignedness !27
  %"407.arraydecay5" = getelementptr inbounds [8000 x i64], [8000 x i64]* %"386.testing_samples", i32 0, i32 0, !opID !1130, !stats.instNumber !1131, !opSignedness !27
  %"408.arraydecay6" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"388.test_labels", i32 0, i32 0, !opID !1132, !stats.instNumber !1133, !opSignedness !27
  call void @populateInput(i8* %"395.", i8* %"398.", i8* %"401.", i8* %"404.", i64* %"405.arraydecay", i8* %"406.arraydecay4", i64* %"407.arraydecay5", i8* %"408.arraydecay6"), !opID !1134, !stats.instNumber !1135, !opSignedness !27
  %"410.arraydecay7" = getelementptr inbounds [72000 x i64], [72000 x i64]* %"385.training_samples", i32 0, i32 0, !opID !1136, !stats.instNumber !1137, !opSignedness !27
  %"411.arraydecay8" = getelementptr inbounds [8000 x i64], [8000 x i64]* %"386.testing_samples", i32 0, i32 0, !opID !1138, !stats.instNumber !1139, !opSignedness !27
  %"412.arraydecay9" = getelementptr inbounds [18000 x i8], [18000 x i8]* %"387.training_labels", i32 0, i32 0, !opID !1140, !stats.instNumber !1141, !opSignedness !27
  %"413.arraydecay10" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"389.result", i32 0, i32 0, !opID !1142, !stats.instNumber !1143, !opSignedness !27
  call void @_Z8DigitRecPKyS0_PKhPh(i64* %"410.arraydecay7", i64* %"411.arraydecay8", i8* %"412.arraydecay9", i8* %"413.arraydecay10"), !opID !1144, !stats.instNumber !1145, !opSignedness !27
  %"415.arraydecay11" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"389.result", i32 0, i32 0, !opID !1146, !stats.instNumber !1147, !opSignedness !27
  %"416.arraydecay12" = getelementptr inbounds [2000 x i8], [2000 x i8]* %"388.test_labels", i32 0, i32 0, !opID !1148, !stats.instNumber !1149, !opSignedness !27
  call void @populateOutput(i8* %"415.arraydecay11", i8* %"416.arraydecay12"), !opID !1150, !stats.instNumber !1151, !opSignedness !27
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @filename, i32 0, i32 0))
  ret i32 0, !opID !16, !stats.instNumber !1152, !opSignedness !27
}

; Function Attrs: noinline nounwind optnone uwtable
define void @saveProfile(i8* %fileName) #2 {
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
  call void @free(i8* %27) #12
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

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #9

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #9

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fclose(%struct._IO_FILE*) #9

declare i32 @printf(i8*, ...) #9

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %training_samples_filename, i8* %training_labels_filename, i8* %test_samples_filename, i8* %test_labels_filename, i64* %training_samples, i8* %training_labels, i64* %test_samples, i8* %test_labels) #10 {
entry:
  %training_samples_filename.addr = alloca i8*, align 8
  %training_labels_filename.addr = alloca i8*, align 8
  %test_samples_filename.addr = alloca i8*, align 8
  %test_labels_filename.addr = alloca i8*, align 8
  %training_samples.addr = alloca i64*, align 8
  %training_labels.addr = alloca i8*, align 8
  %test_samples.addr = alloca i64*, align 8
  %test_labels.addr = alloca i8*, align 8
  %training_samples_file = alloca %struct._IO_FILE*, align 8
  %training_labels_file = alloca %struct._IO_FILE*, align 8
  %test_samples_file = alloca %struct._IO_FILE*, align 8
  %test_labels_file = alloca %struct._IO_FILE*, align 8
  store i8* %training_samples_filename, i8** %training_samples_filename.addr, align 8
  store i8* %training_labels_filename, i8** %training_labels_filename.addr, align 8
  store i8* %test_samples_filename, i8** %test_samples_filename.addr, align 8
  store i8* %test_labels_filename, i8** %test_labels_filename.addr, align 8
  store i64* %training_samples, i64** %training_samples.addr, align 8
  store i8* %training_labels, i8** %training_labels.addr, align 8
  store i64* %test_samples, i64** %test_samples.addr, align 8
  store i8* %test_labels, i8** %test_labels.addr, align 8
  %0 = load i8*, i8** %training_samples_filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %training_samples_file, align 8
  %1 = load i8*, i8** %training_labels_filename.addr, align 8
  %call1 = call noalias %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %training_labels_file, align 8
  %2 = load i8*, i8** %test_samples_filename.addr, align 8
  %call2 = call noalias %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call2, %struct._IO_FILE** %test_samples_file, align 8
  %3 = load i8*, i8** %test_labels_filename.addr, align 8
  %call3 = call noalias %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %test_labels_file, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %tobool = icmp ne %struct._IO_FILE* %4, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %tobool4 = icmp ne %struct._IO_FILE* %5, null
  br i1 %tobool4, label %lor.lhs.false5, label %if.then

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %tobool6 = icmp ne %struct._IO_FILE* %6, null
  br i1 %tobool6, label %lor.lhs.false7, label %if.then

lor.lhs.false7:                                   ; preds = %lor.lhs.false5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %tobool8 = icmp ne %struct._IO_FILE* %7, null
  br i1 %tobool8, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false5, %lor.lhs.false, %entry
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1.4, i32 0, i32 0))
  call void @exit(i32 -1) #13
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  %8 = load i64*, i64** %training_samples.addr, align 8
  %9 = bitcast i64* %8 to i8*
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %call10 = call i64 @fread(i8* %9, i64 8, i64 72000, %struct._IO_FILE* %10)
  %11 = load i8*, i8** %training_labels.addr, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %call11 = call i64 @fread(i8* %11, i64 1, i64 18000, %struct._IO_FILE* %12)
  %13 = load i64*, i64** %test_samples.addr, align 8
  %14 = bitcast i64* %13 to i8*
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %call12 = call i64 @fread(i8* %14, i64 8, i64 8000, %struct._IO_FILE* %15)
  %16 = load i8*, i8** %test_labels.addr, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %call13 = call i64 @fread(i8* %16, i64 1, i64 2000, %struct._IO_FILE* %17)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %call14 = call i32 @fclose(%struct._IO_FILE* %18)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %call15 = call i32 @fclose(%struct._IO_FILE* %19)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %call16 = call i32 @fclose(%struct._IO_FILE* %20)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %call17 = call i32 @fclose(%struct._IO_FILE* %21)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #11

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #9

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i8* %result, i8* %expected) #10 {
entry:
  %result.addr = alloca i8*, align 8
  %expected.addr = alloca i8*, align 8
  %correct_cnt = alloca i32, align 4
  %ofile = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  store i8* %expected, i8** %expected.addr, align 8
  store i32 0, i32* %correct_cnt, align 4
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2.7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.8, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 -1) #13
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 2000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %result.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %5 = load i8*, i8** %expected.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %idxprom2
  %7 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %7 to i32
  %cmp5 = icmp ne i32 %conv, %conv4
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %9 = load i32, i32* %i, align 4
  %10 = load i8*, i8** %expected.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i64 %idxprom7
  %12 = load i8, i8* %arrayidx8, align 1
  %conv9 = zext i8 %12 to i32
  %13 = load i8*, i8** %result.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i64 %idxprom10
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %15 to i32
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i32 0, i32 0), i32 %9, i32 %conv9, i32 %conv12)
  br label %if.end14

if.else:                                          ; preds = %for.body
  %16 = load i32, i32* %correct_cnt, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %correct_cnt, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then6
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %17 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %17, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %19 = load i32, i32* %correct_cnt, align 4
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i32 %19, i32 2000)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call17 = call i32 @fclose(%struct._IO_FILE* %20)
  ret void
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="popcount" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="update_knn" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="knn_vote" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="DigitRec" "fpga.top.func"="DigitRec" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15}
!OP-ID-COUNTER = !{!16}
!llvm.module.flags = !{!17, !18, !19}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/digitrec_ahls/solution1/.autopilot/db/digitrec.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{!6, !11, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression(DW_OP_constu, 6148914691236517205, DW_OP_stack_value))
!7 = distinct !DIGlobalVariable(name: "m1", scope: !0, file: !8, line: 12, type: !9, isLocal: true, isDefinition: true)
!8 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/digitrec.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!10 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 3689348814741910323, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "m2", scope: !0, file: !8, line: 13, type: !9, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_stack_value))
!14 = distinct !DIGlobalVariable(name: "m4", scope: !0, file: !8, line: 14, type: !9, isLocal: true, isDefinition: true)
!15 = !{!"clang version 7.0.0 "}
!16 = !{i64 418}
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = distinct !DISubprogram(name: "popcount", linkageName: "_Z8popcounty", scope: !8, file: !8, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!4, !23}
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "DigitType", file: !24, line: 19, baseType: !10)
!24 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!25 = !{i64 1}
!26 = !{!"1"}
!27 = !{!"unknownSignedness"}
!28 = !{i64 2}
!29 = !{!"2"}
!30 = !DILocalVariable(name: "x", arg: 1, scope: !20, file: !8, line: 18, type: !23)
!31 = !DILocation(line: 18, column: 24, scope: !20)
!32 = !{i64 3}
!33 = !{!"3"}
!34 = !DILocation(line: 20, column: 10, scope: !20)
!35 = !{i64 4}
!36 = !{!"4"}
!37 = !DILocation(line: 20, column: 12, scope: !20)
!38 = !{i64 5}
!39 = !{!"5"}
!40 = !DILocation(line: 20, column: 18, scope: !20)
!41 = !{i64 6}
!42 = !{!"6"}
!43 = !DILocation(line: 20, column: 6, scope: !20)
!44 = !{i64 7}
!45 = !{!"7"}
!46 = !{i64 8}
!47 = !{!"8"}
!48 = !{i64 9}
!49 = !{!"9"}
!50 = !DILocation(line: 21, column: 9, scope: !20)
!51 = !{i64 10}
!52 = !{!"10"}
!53 = !DILocation(line: 21, column: 11, scope: !20)
!54 = !{i64 11}
!55 = !{!"11"}
!56 = !DILocation(line: 21, column: 21, scope: !20)
!57 = !{i64 12}
!58 = !{!"12"}
!59 = !DILocation(line: 21, column: 23, scope: !20)
!60 = !{i64 13}
!61 = !{!"13"}
!62 = !DILocation(line: 21, column: 29, scope: !20)
!63 = !{i64 14}
!64 = !{!"14"}
!65 = !DILocation(line: 21, column: 17, scope: !20)
!66 = !{i64 15}
!67 = !{!"15"}
!68 = !DILocation(line: 21, column: 6, scope: !20)
!69 = !{i64 16}
!70 = !{!"16"}
!71 = !DILocation(line: 22, column: 9, scope: !20)
!72 = !{i64 17}
!73 = !{!"17"}
!74 = !DILocation(line: 22, column: 14, scope: !20)
!75 = !{i64 18}
!76 = !{!"18"}
!77 = !DILocation(line: 22, column: 16, scope: !20)
!78 = !{i64 19}
!79 = !{!"19"}
!80 = !DILocation(line: 22, column: 11, scope: !20)
!81 = !{i64 20}
!82 = !{!"20"}
!83 = !DILocation(line: 22, column: 23, scope: !20)
!84 = !{i64 21}
!85 = !{!"21"}
!86 = !DILocation(line: 22, column: 6, scope: !20)
!87 = !{i64 22}
!88 = !{!"22"}
!89 = !DILocation(line: 23, column: 9, scope: !20)
!90 = !{i64 23}
!91 = !{!"23"}
!92 = !DILocation(line: 23, column: 11, scope: !20)
!93 = !{i64 24}
!94 = !{!"24"}
!95 = !DILocation(line: 23, column: 6, scope: !20)
!96 = !{i64 25}
!97 = !{!"25"}
!98 = !{i64 26}
!99 = !{!"26"}
!100 = !{i64 27}
!101 = !{!"27"}
!102 = !DILocation(line: 24, column: 9, scope: !20)
!103 = !{i64 28}
!104 = !{!"28"}
!105 = !DILocation(line: 24, column: 11, scope: !20)
!106 = !{i64 29}
!107 = !{!"29"}
!108 = !DILocation(line: 24, column: 6, scope: !20)
!109 = !{i64 30}
!110 = !{!"30"}
!111 = !{i64 31}
!112 = !{!"31"}
!113 = !{i64 32}
!114 = !{!"32"}
!115 = !DILocation(line: 25, column: 9, scope: !20)
!116 = !{i64 33}
!117 = !{!"33"}
!118 = !DILocation(line: 25, column: 11, scope: !20)
!119 = !{i64 34}
!120 = !{!"34"}
!121 = !DILocation(line: 25, column: 6, scope: !20)
!122 = !{i64 35}
!123 = !{!"35"}
!124 = !{i64 36}
!125 = !{!"36"}
!126 = !{i64 37}
!127 = !{!"37"}
!128 = !DILocation(line: 26, column: 11, scope: !20)
!129 = !{i64 38}
!130 = !{!"38"}
!131 = !DILocation(line: 26, column: 13, scope: !20)
!132 = !{i64 39}
!133 = !{!"39"}
!134 = !{i64 40}
!135 = !{!"40"}
!136 = !DILocation(line: 26, column: 4, scope: !20)
!137 = !{i64 41}
!138 = !{!"41"}
!139 = distinct !DISubprogram(name: "update_knn", linkageName: "_Z10update_knnPKyS0_PiS1_i", scope: !8, file: !8, line: 29, type: !140, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !142, !142, !144, !144, !4}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!145 = !{i64 42}
!146 = !{!"42"}
!147 = !{i64 43}
!148 = !{!"43"}
!149 = !{i64 44}
!150 = !{!"44"}
!151 = !{i64 45}
!152 = !{!"45"}
!153 = !{i64 46}
!154 = !{!"46"}
!155 = !{i64 47}
!156 = !{!"47"}
!157 = !{i64 48}
!158 = !{!"48"}
!159 = !{i64 49}
!160 = !{!"49"}
!161 = !{i64 50}
!162 = !{!"50"}
!163 = !{i64 51}
!164 = !{!"51"}
!165 = !{i64 52}
!166 = !{!"52"}
!167 = !{i64 53}
!168 = !{!"53"}
!169 = !DILocalVariable(name: "train_inst", arg: 1, scope: !139, file: !8, line: 29, type: !142)
!170 = !DILocation(line: 29, column: 34, scope: !139)
!171 = !{i64 54}
!172 = !{!"54"}
!173 = !{i64 55}
!174 = !{!"55"}
!175 = !DILocalVariable(name: "test_inst", arg: 2, scope: !139, file: !8, line: 29, type: !142)
!176 = !DILocation(line: 29, column: 63, scope: !139)
!177 = !{i64 56}
!178 = !{!"56"}
!179 = !{i64 57}
!180 = !{!"57"}
!181 = !DILocalVariable(name: "dists", arg: 3, scope: !139, file: !8, line: 29, type: !144)
!182 = !DILocation(line: 29, column: 78, scope: !139)
!183 = !{i64 58}
!184 = !{!"58"}
!185 = !{i64 59}
!186 = !{!"59"}
!187 = !DILocalVariable(name: "labels", arg: 4, scope: !139, file: !8, line: 29, type: !144)
!188 = !DILocation(line: 29, column: 92, scope: !139)
!189 = !{i64 60}
!190 = !{!"60"}
!191 = !{i64 61}
!192 = !{!"61"}
!193 = !DILocalVariable(name: "label", arg: 5, scope: !139, file: !8, line: 29, type: !4)
!194 = !DILocation(line: 29, column: 107, scope: !139)
!195 = !{i64 62}
!196 = !{!"62"}
!197 = !DILocation(line: 31, column: 3, scope: !139)
!198 = !{i64 63}
!199 = !{!"63"}
!200 = !{i64 64}
!201 = !{!"64"}
!202 = !DILocalVariable(name: "dist", scope: !139, file: !8, line: 31, type: !4)
!203 = !DILocation(line: 31, column: 7, scope: !139)
!204 = !{i64 65}
!205 = !{!"65"}
!206 = !{i64 66}
!207 = !{!"66"}
!208 = !{i64 67}
!209 = !{!"67"}
!210 = !DILocation(line: 33, column: 25, scope: !211)
!211 = distinct !DILexicalBlock(scope: !139, file: !8, line: 33, column: 20)
!212 = !{i64 68}
!213 = !{!"68"}
!214 = !{i64 69}
!215 = !{!"69"}
!216 = !DILocalVariable(name: "i", scope: !211, file: !8, line: 33, type: !4)
!217 = !DILocation(line: 33, column: 29, scope: !211)
!218 = !{i64 70}
!219 = !{!"70"}
!220 = !{i64 71}
!221 = !{!"71"}
!222 = !{i64 72}
!223 = !{!"72"}
!224 = !DILocation(line: 33, column: 36, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !8, line: 33, column: 20)
!226 = !{i64 73}
!227 = !{!"73"}
!228 = !DILocation(line: 33, column: 38, scope: !225)
!229 = !{i64 74}
!230 = !{!"74"}
!231 = !DILocation(line: 33, column: 20, scope: !211)
!232 = !{i64 75}
!233 = !{!"75"}
!234 = !DILocation(line: 33, column: 20, scope: !225)
!235 = !{i64 76}
!236 = !{!"76"}
!237 = !{i64 77}
!238 = !{!"77"}
!239 = !{i64 78}
!240 = !{!"78"}
!241 = !DILocation(line: 35, column: 5, scope: !242)
!242 = distinct !DILexicalBlock(scope: !225, file: !8, line: 34, column: 3)
!243 = !{i64 79}
!244 = !{!"79"}
!245 = !{i64 80}
!246 = !{!"80"}
!247 = !DILocalVariable(name: "diff", scope: !242, file: !8, line: 35, type: !23)
!248 = !DILocation(line: 35, column: 15, scope: !242)
!249 = !{i64 81}
!250 = !{!"81"}
!251 = !DILocation(line: 35, column: 22, scope: !242)
!252 = !{i64 82}
!253 = !{!"82"}
!254 = !DILocation(line: 35, column: 32, scope: !242)
!255 = !{i64 83}
!256 = !{!"83"}
!257 = !{i64 84}
!258 = !{!"84"}
!259 = !{i64 85}
!260 = !{!"85"}
!261 = !{i64 86}
!262 = !{!"86"}
!263 = !DILocation(line: 35, column: 37, scope: !242)
!264 = !{i64 87}
!265 = !{!"87"}
!266 = !DILocation(line: 35, column: 48, scope: !242)
!267 = !{i64 88}
!268 = !{!"88"}
!269 = !{i64 89}
!270 = !{!"89"}
!271 = !{i64 90}
!272 = !{!"90"}
!273 = !{i64 91}
!274 = !{!"91"}
!275 = !DILocation(line: 35, column: 35, scope: !242)
!276 = !{i64 92}
!277 = !{!"92"}
!278 = !{i64 93}
!279 = !{!"93"}
!280 = !DILocation(line: 36, column: 22, scope: !242)
!281 = !{i64 94}
!282 = !{!"94"}
!283 = !DILocation(line: 36, column: 13, scope: !242)
!284 = !{i64 95}
!285 = !{!"95"}
!286 = !DILocation(line: 36, column: 10, scope: !242)
!287 = !{i64 96}
!288 = !{!"96"}
!289 = !{i64 97}
!290 = !{!"97"}
!291 = !{i64 98}
!292 = !{!"98"}
!293 = !DILocation(line: 37, column: 3, scope: !225)
!294 = !{i64 99}
!295 = !{!"99"}
!296 = !{i64 100}
!297 = !{!"100"}
!298 = !DILocation(line: 37, column: 3, scope: !242)
!299 = !{i64 101}
!300 = !{!"101"}
!301 = !DILocation(line: 33, column: 45, scope: !225)
!302 = !{i64 102}
!303 = !{!"102"}
!304 = !{i64 103}
!305 = !{!"103"}
!306 = !{i64 104}
!307 = !{!"104"}
!308 = distinct !{!308, !231, !309, !310}
!309 = !DILocation(line: 37, column: 3, scope: !211)
!310 = !{!"llvm.loop.name", !"VITIS_LOOP_33_1"}
!311 = !{i64 105}
!312 = !{!"105"}
!313 = !DILocation(line: 39, column: 3, scope: !139)
!314 = !{i64 106}
!315 = !{!"106"}
!316 = !{i64 107}
!317 = !{!"107"}
!318 = !DILocalVariable(name: "max_dist", scope: !139, file: !8, line: 39, type: !4)
!319 = !DILocation(line: 39, column: 7, scope: !139)
!320 = !{i64 108}
!321 = !{!"108"}
!322 = !{i64 109}
!323 = !{!"109"}
!324 = !DILocation(line: 40, column: 3, scope: !139)
!325 = !{i64 110}
!326 = !{!"110"}
!327 = !{i64 111}
!328 = !{!"111"}
!329 = !DILocalVariable(name: "max_dist_id", scope: !139, file: !8, line: 40, type: !4)
!330 = !DILocation(line: 40, column: 7, scope: !139)
!331 = !{i64 112}
!332 = !{!"112"}
!333 = !{i64 113}
!334 = !{!"113"}
!335 = !{i64 114}
!336 = !{!"114"}
!337 = !DILocation(line: 43, column: 24, scope: !338)
!338 = distinct !DILexicalBlock(scope: !139, file: !8, line: 43, column: 18)
!339 = !{i64 115}
!340 = !{!"115"}
!341 = !{i64 116}
!342 = !{!"116"}
!343 = !DILocalVariable(name: "k", scope: !338, file: !8, line: 43, type: !4)
!344 = !DILocation(line: 43, column: 28, scope: !338)
!345 = !{i64 117}
!346 = !{!"117"}
!347 = !{i64 118}
!348 = !{!"118"}
!349 = !{i64 119}
!350 = !{!"119"}
!351 = !DILocation(line: 43, column: 35, scope: !352)
!352 = distinct !DILexicalBlock(scope: !338, file: !8, line: 43, column: 18)
!353 = !{i64 120}
!354 = !{!"120"}
!355 = !DILocation(line: 43, column: 37, scope: !352)
!356 = !{i64 121}
!357 = !{!"121"}
!358 = !DILocation(line: 43, column: 18, scope: !338)
!359 = !{i64 122}
!360 = !{!"122"}
!361 = !DILocation(line: 43, column: 18, scope: !352)
!362 = !{i64 123}
!363 = !{!"123"}
!364 = !{i64 124}
!365 = !{!"124"}
!366 = !{i64 125}
!367 = !{!"125"}
!368 = !DILocation(line: 45, column: 10, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !8, line: 45, column: 10)
!370 = distinct !DILexicalBlock(scope: !352, file: !8, line: 44, column: 3)
!371 = !{i64 126}
!372 = !{!"126"}
!373 = !DILocation(line: 45, column: 16, scope: !369)
!374 = !{i64 127}
!375 = !{!"127"}
!376 = !{i64 128}
!377 = !{!"128"}
!378 = !{i64 129}
!379 = !{!"129"}
!380 = !{i64 130}
!381 = !{!"130"}
!382 = !DILocation(line: 45, column: 21, scope: !369)
!383 = !{i64 131}
!384 = !{!"131"}
!385 = !DILocation(line: 45, column: 19, scope: !369)
!386 = !{i64 132}
!387 = !{!"132"}
!388 = !DILocation(line: 45, column: 10, scope: !370)
!389 = !{i64 133}
!390 = !{!"133"}
!391 = !DILocation(line: 47, column: 18, scope: !392)
!392 = distinct !DILexicalBlock(scope: !369, file: !8, line: 46, column: 5)
!393 = !{i64 134}
!394 = !{!"134"}
!395 = !DILocation(line: 47, column: 24, scope: !392)
!396 = !{i64 135}
!397 = !{!"135"}
!398 = !{i64 136}
!399 = !{!"136"}
!400 = !{i64 137}
!401 = !{!"137"}
!402 = !{i64 138}
!403 = !{!"138"}
!404 = !DILocation(line: 47, column: 16, scope: !392)
!405 = !{i64 139}
!406 = !{!"139"}
!407 = !DILocation(line: 48, column: 21, scope: !392)
!408 = !{i64 140}
!409 = !{!"140"}
!410 = !DILocation(line: 48, column: 19, scope: !392)
!411 = !{i64 141}
!412 = !{!"141"}
!413 = !DILocation(line: 49, column: 5, scope: !392)
!414 = !{i64 142}
!415 = !{!"142"}
!416 = !DILocation(line: 50, column: 3, scope: !370)
!417 = !{i64 143}
!418 = !{!"143"}
!419 = !DILocation(line: 43, column: 42, scope: !352)
!420 = !{i64 144}
!421 = !{!"144"}
!422 = !{i64 145}
!423 = !{!"145"}
!424 = !{i64 146}
!425 = !{!"146"}
!426 = distinct !{!426, !358, !427, !428}
!427 = !DILocation(line: 50, column: 3, scope: !338)
!428 = !{!"llvm.loop.name", !"FIND_MAX_DIST"}
!429 = !{i64 147}
!430 = !{!"147"}
!431 = !DILocation(line: 53, column: 8, scope: !432)
!432 = distinct !DILexicalBlock(scope: !139, file: !8, line: 53, column: 8)
!433 = !{i64 148}
!434 = !{!"148"}
!435 = !DILocation(line: 53, column: 15, scope: !432)
!436 = !{i64 149}
!437 = !{!"149"}
!438 = !DILocation(line: 53, column: 13, scope: !432)
!439 = !{i64 150}
!440 = !{!"150"}
!441 = !DILocation(line: 53, column: 8, scope: !139)
!442 = !{i64 151}
!443 = !{!"151"}
!444 = !DILocation(line: 55, column: 26, scope: !445)
!445 = distinct !DILexicalBlock(scope: !432, file: !8, line: 54, column: 3)
!446 = !{i64 152}
!447 = !{!"152"}
!448 = !DILocation(line: 55, column: 5, scope: !445)
!449 = !{i64 153}
!450 = !{!"153"}
!451 = !DILocation(line: 55, column: 11, scope: !445)
!452 = !{i64 154}
!453 = !{!"154"}
!454 = !{i64 155}
!455 = !{!"155"}
!456 = !{i64 156}
!457 = !{!"156"}
!458 = !DILocation(line: 55, column: 24, scope: !445)
!459 = !{i64 157}
!460 = !{!"157"}
!461 = !DILocation(line: 56, column: 27, scope: !445)
!462 = !{i64 158}
!463 = !{!"158"}
!464 = !DILocation(line: 56, column: 5, scope: !445)
!465 = !{i64 159}
!466 = !{!"159"}
!467 = !DILocation(line: 56, column: 12, scope: !445)
!468 = !{i64 160}
!469 = !{!"160"}
!470 = !{i64 161}
!471 = !{!"161"}
!472 = !{i64 162}
!473 = !{!"162"}
!474 = !DILocation(line: 56, column: 25, scope: !445)
!475 = !{i64 163}
!476 = !{!"163"}
!477 = !DILocation(line: 57, column: 3, scope: !445)
!478 = !{i64 164}
!479 = !{!"164"}
!480 = !DILocation(line: 60, column: 1, scope: !139)
!481 = !{i64 165}
!482 = !{!"165"}
!483 = !{i64 166}
!484 = !{!"166"}
!485 = !{i64 167}
!486 = !{!"167"}
!487 = !{i64 168}
!488 = !{!"168"}
!489 = !{i64 169}
!490 = !{!"169"}
!491 = !{i64 170}
!492 = !{!"170"}
!493 = !{i64 171}
!494 = !{!"171"}
!495 = distinct !DISubprogram(name: "knn_vote", linkageName: "_Z8knn_votePi", scope: !8, file: !8, line: 62, type: !496, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!496 = !DISubroutineType(types: !497)
!497 = !{!498, !144}
!498 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !24, line: 20, baseType: !499)
!499 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!500 = !{i64 172}
!501 = !{!"172"}
!502 = !{i64 173}
!503 = !{!"173"}
!504 = !{i64 174}
!505 = !{!"174"}
!506 = !{i64 175}
!507 = !{!"175"}
!508 = !{i64 176}
!509 = !{!"176"}
!510 = !{i64 177}
!511 = !{!"177"}
!512 = !{i64 178}
!513 = !{!"178"}
!514 = !DILocalVariable(name: "labels", arg: 1, scope: !495, file: !8, line: 62, type: !144)
!515 = !DILocation(line: 62, column: 24, scope: !495)
!516 = !{i64 179}
!517 = !{!"179"}
!518 = !DILocation(line: 64, column: 3, scope: !495)
!519 = !{i64 180}
!520 = !{!"180"}
!521 = !{i64 181}
!522 = !{!"181"}
!523 = !DILocalVariable(name: "max_vote", scope: !495, file: !8, line: 64, type: !4)
!524 = !DILocation(line: 64, column: 7, scope: !495)
!525 = !{i64 182}
!526 = !{!"182"}
!527 = !{i64 183}
!528 = !{!"183"}
!529 = !DILocation(line: 65, column: 3, scope: !495)
!530 = !{i64 184}
!531 = !{!"184"}
!532 = !DILocalVariable(name: "max_label", scope: !495, file: !8, line: 65, type: !498)
!533 = !DILocation(line: 65, column: 13, scope: !495)
!534 = !{i64 185}
!535 = !{!"185"}
!536 = !{i64 186}
!537 = !{!"186"}
!538 = !DILocation(line: 67, column: 3, scope: !495)
!539 = !{i64 187}
!540 = !{!"187"}
!541 = !{i64 188}
!542 = !{!"188"}
!543 = !DILocalVariable(name: "votes", scope: !495, file: !8, line: 67, type: !544)
!544 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !545)
!545 = !{!546}
!546 = !DISubrange(count: 10)
!547 = !DILocation(line: 67, column: 7, scope: !495)
!548 = !{i64 189}
!549 = !{!"189"}
!550 = !{i64 190}
!551 = !{!"190"}
!552 = !{i64 191}
!553 = !{!"191"}
!554 = !{i64 192}
!555 = !{!"192"}
!556 = !DILocation(line: 69, column: 25, scope: !557)
!557 = distinct !DILexicalBlock(scope: !495, file: !8, line: 69, column: 20)
!558 = !{i64 193}
!559 = !{!"193"}
!560 = !{i64 194}
!561 = !{!"194"}
!562 = !DILocalVariable(name: "i", scope: !557, file: !8, line: 69, type: !4)
!563 = !DILocation(line: 69, column: 29, scope: !557)
!564 = !{i64 195}
!565 = !{!"195"}
!566 = !{i64 196}
!567 = !{!"196"}
!568 = !{i64 197}
!569 = !{!"197"}
!570 = !DILocation(line: 69, column: 36, scope: !571)
!571 = distinct !DILexicalBlock(scope: !557, file: !8, line: 69, column: 20)
!572 = !{i64 198}
!573 = !{!"198"}
!574 = !DILocation(line: 69, column: 38, scope: !571)
!575 = !{i64 199}
!576 = !{!"199"}
!577 = !DILocation(line: 69, column: 20, scope: !557)
!578 = !{i64 200}
!579 = !{!"200"}
!580 = !DILocation(line: 69, column: 20, scope: !571)
!581 = !{i64 201}
!582 = !{!"201"}
!583 = !{i64 202}
!584 = !{!"202"}
!585 = !{i64 203}
!586 = !{!"203"}
!587 = !DILocation(line: 70, column: 11, scope: !571)
!588 = !{i64 204}
!589 = !{!"204"}
!590 = !DILocation(line: 70, column: 18, scope: !571)
!591 = !{i64 205}
!592 = !{!"205"}
!593 = !{i64 206}
!594 = !{!"206"}
!595 = !{i64 207}
!596 = !{!"207"}
!597 = !{i64 208}
!598 = !{!"208"}
!599 = !DILocation(line: 70, column: 5, scope: !571)
!600 = !{i64 209}
!601 = !{!"209"}
!602 = !{i64 210}
!603 = !{!"210"}
!604 = !DILocation(line: 70, column: 22, scope: !571)
!605 = !{i64 211}
!606 = !{!"211"}
!607 = !{i64 212}
!608 = !{!"212"}
!609 = !{i64 213}
!610 = !{!"213"}
!611 = !{i64 214}
!612 = !{!"214"}
!613 = !DILocation(line: 69, column: 45, scope: !571)
!614 = !{i64 215}
!615 = !{!"215"}
!616 = !{i64 216}
!617 = !{!"216"}
!618 = !{i64 217}
!619 = !{!"217"}
!620 = distinct !{!620, !577, !621, !622}
!621 = !DILocation(line: 70, column: 22, scope: !557)
!622 = !{!"llvm.loop.name", !"VITIS_LOOP_69_1"}
!623 = !{i64 218}
!624 = !{!"218"}
!625 = !{i64 219}
!626 = !{!"219"}
!627 = !DILocation(line: 72, column: 25, scope: !628)
!628 = distinct !DILexicalBlock(scope: !495, file: !8, line: 72, column: 20)
!629 = !{i64 220}
!630 = !{!"220"}
!631 = !{i64 221}
!632 = !{!"221"}
!633 = !DILocalVariable(name: "i", scope: !628, file: !8, line: 72, type: !4)
!634 = !DILocation(line: 72, column: 29, scope: !628)
!635 = !{i64 222}
!636 = !{!"222"}
!637 = !{i64 223}
!638 = !{!"223"}
!639 = !{i64 224}
!640 = !{!"224"}
!641 = !DILocation(line: 72, column: 36, scope: !642)
!642 = distinct !DILexicalBlock(scope: !628, file: !8, line: 72, column: 20)
!643 = !{i64 225}
!644 = !{!"225"}
!645 = !DILocation(line: 72, column: 38, scope: !642)
!646 = !{i64 226}
!647 = !{!"226"}
!648 = !DILocation(line: 72, column: 20, scope: !628)
!649 = !{i64 227}
!650 = !{!"227"}
!651 = !DILocation(line: 72, column: 20, scope: !642)
!652 = !{i64 228}
!653 = !{!"228"}
!654 = !{i64 229}
!655 = !{!"229"}
!656 = !{i64 230}
!657 = !{!"230"}
!658 = !DILocation(line: 74, column: 15, scope: !659)
!659 = distinct !DILexicalBlock(scope: !660, file: !8, line: 74, column: 9)
!660 = distinct !DILexicalBlock(scope: !642, file: !8, line: 73, column: 3)
!661 = !{i64 231}
!662 = !{!"231"}
!663 = !DILocation(line: 74, column: 9, scope: !659)
!664 = !{i64 232}
!665 = !{!"232"}
!666 = !{i64 233}
!667 = !{!"233"}
!668 = !{i64 234}
!669 = !{!"234"}
!670 = !DILocation(line: 74, column: 20, scope: !659)
!671 = !{i64 235}
!672 = !{!"235"}
!673 = !DILocation(line: 74, column: 18, scope: !659)
!674 = !{i64 236}
!675 = !{!"236"}
!676 = !DILocation(line: 74, column: 9, scope: !660)
!677 = !{i64 237}
!678 = !{!"237"}
!679 = !DILocation(line: 76, column: 24, scope: !680)
!680 = distinct !DILexicalBlock(scope: !659, file: !8, line: 75, column: 5)
!681 = !{i64 238}
!682 = !{!"238"}
!683 = !DILocation(line: 76, column: 18, scope: !680)
!684 = !{i64 239}
!685 = !{!"239"}
!686 = !{i64 240}
!687 = !{!"240"}
!688 = !{i64 241}
!689 = !{!"241"}
!690 = !DILocation(line: 76, column: 16, scope: !680)
!691 = !{i64 242}
!692 = !{!"242"}
!693 = !DILocation(line: 77, column: 19, scope: !680)
!694 = !{i64 243}
!695 = !{!"243"}
!696 = !{i64 244}
!697 = !{!"244"}
!698 = !DILocation(line: 77, column: 17, scope: !680)
!699 = !{i64 245}
!700 = !{!"245"}
!701 = !DILocation(line: 78, column: 5, scope: !680)
!702 = !{i64 246}
!703 = !{!"246"}
!704 = !DILocation(line: 79, column: 3, scope: !660)
!705 = !{i64 247}
!706 = !{!"247"}
!707 = !DILocation(line: 72, column: 46, scope: !642)
!708 = !{i64 248}
!709 = !{!"248"}
!710 = !{i64 249}
!711 = !{!"249"}
!712 = !{i64 250}
!713 = !{!"250"}
!714 = distinct !{!714, !648, !715, !716}
!715 = !DILocation(line: 79, column: 3, scope: !628)
!716 = !{!"llvm.loop.name", !"VITIS_LOOP_72_2"}
!717 = !{i64 251}
!718 = !{!"251"}
!719 = !DILocation(line: 81, column: 10, scope: !495)
!720 = !{i64 252}
!721 = !{!"252"}
!722 = !DILocation(line: 82, column: 1, scope: !495)
!723 = !{i64 253}
!724 = !{!"253"}
!725 = !{i64 254}
!726 = !{!"254"}
!727 = !{i64 255}
!728 = !{!"255"}
!729 = !{i64 256}
!730 = !{!"256"}
!731 = !{i64 257}
!732 = !{!"257"}
!733 = !DILocation(line: 81, column: 3, scope: !495)
!734 = !{i64 258}
!735 = !{!"258"}
!736 = distinct !DISubprogram(name: "DigitRec", linkageName: "_Z8DigitRecPKyS0_PKhPh", scope: !8, file: !8, line: 85, type: !737, isLocal: false, isDefinition: true, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!737 = !DISubroutineType(types: !738)
!738 = !{null, !142, !142, !739, !741}
!739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64)
!740 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !498)
!741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !498, size: 64)
!742 = !{!743}
!743 = !{!"fpga.top", !"user", !744}
!744 = !DILocation(line: 85, column: 16, scope: !736)
!745 = !{i64 259}
!746 = !{!"259"}
!747 = !{i64 260}
!748 = !{!"260"}
!749 = !{i64 261}
!750 = !{!"261"}
!751 = !{i64 262}
!752 = !{!"262"}
!753 = !{i64 263}
!754 = !{!"263"}
!755 = !{i64 264}
!756 = !{!"264"}
!757 = !{i64 265}
!758 = !{!"265"}
!759 = !{i64 266}
!760 = !{!"266"}
!761 = !{i64 267}
!762 = !{!"267"}
!763 = !{i64 268}
!764 = !{!"268"}
!765 = !{i64 269}
!766 = !{!"269"}
!767 = !{i64 270}
!768 = !{!"270"}
!769 = !DILocalVariable(name: "training_samples", arg: 1, scope: !736, file: !8, line: 86, type: !142)
!770 = !DILocation(line: 86, column: 19, scope: !736)
!771 = !{i64 271}
!772 = !{!"271"}
!773 = !{i64 272}
!774 = !{!"272"}
!775 = !DILocalVariable(name: "test_set", arg: 2, scope: !736, file: !8, line: 87, type: !142)
!776 = !DILocation(line: 87, column: 19, scope: !736)
!777 = !{i64 273}
!778 = !{!"273"}
!779 = !{i64 274}
!780 = !{!"274"}
!781 = !DILocalVariable(name: "training_labels", arg: 3, scope: !736, file: !8, line: 88, type: !739)
!782 = !DILocation(line: 88, column: 19, scope: !736)
!783 = !{i64 275}
!784 = !{!"275"}
!785 = !{i64 276}
!786 = !{!"276"}
!787 = !DILocalVariable(name: "results", arg: 4, scope: !736, file: !8, line: 89, type: !741)
!788 = !DILocation(line: 89, column: 13, scope: !736)
!789 = !{i64 277}
!790 = !{!"277"}
!791 = !DILocation(line: 92, column: 3, scope: !736)
!792 = !{i64 278}
!793 = !{!"278"}
!794 = !{i64 279}
!795 = !{!"279"}
!796 = !DILocalVariable(name: "dists", scope: !736, file: !8, line: 92, type: !797)
!797 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !798)
!798 = !{!799}
!799 = !DISubrange(count: 3)
!800 = !DILocation(line: 92, column: 7, scope: !736)
!801 = !{i64 280}
!802 = !{!"280"}
!803 = !DILocation(line: 93, column: 3, scope: !736)
!804 = !{i64 281}
!805 = !{!"281"}
!806 = !{i64 282}
!807 = !{!"282"}
!808 = !DILocalVariable(name: "labels", scope: !736, file: !8, line: 93, type: !797)
!809 = !DILocation(line: 93, column: 7, scope: !736)
!810 = !{i64 283}
!811 = !{!"283"}
!812 = !{i64 284}
!813 = !{!"284"}
!814 = !DILocation(line: 96, column: 19, scope: !815)
!815 = distinct !DILexicalBlock(scope: !736, file: !8, line: 96, column: 14)
!816 = !{i64 285}
!817 = !{!"285"}
!818 = !{i64 286}
!819 = !{!"286"}
!820 = !DILocalVariable(name: "t", scope: !815, file: !8, line: 96, type: !4)
!821 = !DILocation(line: 96, column: 23, scope: !815)
!822 = !{i64 287}
!823 = !{!"287"}
!824 = !{i64 288}
!825 = !{!"288"}
!826 = !{i64 289}
!827 = !{!"289"}
!828 = !DILocation(line: 96, column: 30, scope: !829)
!829 = distinct !DILexicalBlock(scope: !815, file: !8, line: 96, column: 14)
!830 = !{i64 290}
!831 = !{!"290"}
!832 = !DILocation(line: 96, column: 32, scope: !829)
!833 = !{i64 291}
!834 = !{!"291"}
!835 = !DILocation(line: 96, column: 14, scope: !815)
!836 = !{i64 292}
!837 = !{!"292"}
!838 = !{i64 293}
!839 = !{!"293"}
!840 = !DILocation(line: 96, column: 14, scope: !829)
!841 = !{i64 294}
!842 = !{!"294"}
!843 = !{i64 295}
!844 = !{!"295"}
!845 = !{i64 296}
!846 = !{!"296"}
!847 = !DILocation(line: 97, column: 3, scope: !829)
!848 = !{i64 297}
!849 = !{!"297"}
!850 = !DILocation(line: 99, column: 24, scope: !851)
!851 = distinct !DILexicalBlock(scope: !852, file: !8, line: 99, column: 18)
!852 = distinct !DILexicalBlock(scope: !829, file: !8, line: 97, column: 3)
!853 = !{i64 298}
!854 = !{!"298"}
!855 = !{i64 299}
!856 = !{!"299"}
!857 = !DILocalVariable(name: "i", scope: !851, file: !8, line: 99, type: !4)
!858 = !DILocation(line: 99, column: 28, scope: !851)
!859 = !{i64 300}
!860 = !{!"300"}
!861 = !{i64 301}
!862 = !{!"301"}
!863 = !{i64 302}
!864 = !{!"302"}
!865 = !DILocation(line: 99, column: 35, scope: !866)
!866 = distinct !DILexicalBlock(scope: !851, file: !8, line: 99, column: 18)
!867 = !{i64 303}
!868 = !{!"303"}
!869 = !DILocation(line: 99, column: 37, scope: !866)
!870 = !{i64 304}
!871 = !{!"304"}
!872 = !DILocation(line: 99, column: 18, scope: !851)
!873 = !{i64 305}
!874 = !{!"305"}
!875 = !{i64 306}
!876 = !{!"306"}
!877 = !DILocation(line: 99, column: 18, scope: !866)
!878 = !{i64 307}
!879 = !{!"307"}
!880 = !{i64 308}
!881 = !{!"308"}
!882 = !{i64 309}
!883 = !{!"309"}
!884 = !DILocation(line: 102, column: 13, scope: !885)
!885 = distinct !DILexicalBlock(scope: !866, file: !8, line: 100, column: 5)
!886 = !{i64 310}
!887 = !{!"310"}
!888 = !DILocation(line: 102, column: 7, scope: !885)
!889 = !{i64 311}
!890 = !{!"311"}
!891 = !{i64 312}
!892 = !{!"312"}
!893 = !DILocation(line: 102, column: 16, scope: !885)
!894 = !{i64 313}
!895 = !{!"313"}
!896 = !DILocation(line: 103, column: 14, scope: !885)
!897 = !{i64 314}
!898 = !{!"314"}
!899 = !DILocation(line: 103, column: 7, scope: !885)
!900 = !{i64 315}
!901 = !{!"315"}
!902 = !{i64 316}
!903 = !{!"316"}
!904 = !DILocation(line: 103, column: 17, scope: !885)
!905 = !{i64 317}
!906 = !{!"317"}
!907 = !DILocation(line: 104, column: 5, scope: !885)
!908 = !{i64 318}
!909 = !{!"318"}
!910 = !DILocation(line: 99, column: 42, scope: !866)
!911 = !{i64 319}
!912 = !{!"319"}
!913 = !{i64 320}
!914 = !{!"320"}
!915 = !{i64 321}
!916 = !{!"321"}
!917 = distinct !{!917, !872, !918, !919}
!918 = !DILocation(line: 104, column: 5, scope: !851)
!919 = !{!"llvm.loop.name", !"SET_KNN_SET"}
!920 = !{i64 322}
!921 = !{!"322"}
!922 = !{i64 323}
!923 = !{!"323"}
!924 = !DILocation(line: 107, column: 27, scope: !925)
!925 = distinct !DILexicalBlock(scope: !852, file: !8, line: 107, column: 21)
!926 = !{i64 324}
!927 = !{!"324"}
!928 = !{i64 325}
!929 = !{!"325"}
!930 = !DILocalVariable(name: "i", scope: !925, file: !8, line: 107, type: !4)
!931 = !DILocation(line: 107, column: 31, scope: !925)
!932 = !{i64 326}
!933 = !{!"326"}
!934 = !{i64 327}
!935 = !{!"327"}
!936 = !{i64 328}
!937 = !{!"328"}
!938 = !DILocation(line: 107, column: 38, scope: !939)
!939 = distinct !DILexicalBlock(scope: !925, file: !8, line: 107, column: 21)
!940 = !{i64 329}
!941 = !{!"329"}
!942 = !DILocation(line: 107, column: 40, scope: !939)
!943 = !{i64 330}
!944 = !{!"330"}
!945 = !DILocation(line: 107, column: 21, scope: !925)
!946 = !{i64 331}
!947 = !{!"331"}
!948 = !{i64 332}
!949 = !{!"332"}
!950 = !DILocation(line: 107, column: 21, scope: !939)
!951 = !{i64 333}
!952 = !{!"333"}
!953 = !{i64 334}
!954 = !{!"334"}
!955 = !{i64 335}
!956 = !{!"335"}
!957 = !DILocation(line: 108, column: 19, scope: !939)
!958 = !{i64 336}
!959 = !{!"336"}
!960 = !DILocation(line: 108, column: 36, scope: !939)
!961 = !{i64 337}
!962 = !{!"337"}
!963 = !DILocation(line: 108, column: 38, scope: !939)
!964 = !{i64 338}
!965 = !{!"338"}
!966 = !{i64 339}
!967 = !{!"339"}
!968 = !{i64 340}
!969 = !{!"340"}
!970 = !DILocation(line: 108, column: 45, scope: !939)
!971 = !{i64 341}
!972 = !{!"341"}
!973 = !DILocation(line: 108, column: 54, scope: !939)
!974 = !{i64 342}
!975 = !{!"342"}
!976 = !DILocation(line: 108, column: 56, scope: !939)
!977 = !{i64 343}
!978 = !{!"343"}
!979 = !{i64 344}
!980 = !{!"344"}
!981 = !{i64 345}
!982 = !{!"345"}
!983 = !DILocation(line: 108, column: 62, scope: !939)
!984 = !{i64 346}
!985 = !{!"346"}
!986 = !DILocation(line: 108, column: 69, scope: !939)
!987 = !{i64 347}
!988 = !{!"347"}
!989 = !DILocation(line: 108, column: 82, scope: !939)
!990 = !{i64 348}
!991 = !{!"348"}
!992 = !DILocation(line: 108, column: 98, scope: !939)
!993 = !{i64 349}
!994 = !{!"349"}
!995 = !{i64 350}
!996 = !{!"350"}
!997 = !{i64 351}
!998 = !{!"351"}
!999 = !{i64 352}
!1000 = !{!"352"}
!1001 = !{i64 353}
!1002 = !{!"353"}
!1003 = !DILocation(line: 108, column: 7, scope: !939)
!1004 = !{i64 354}
!1005 = !{!"354"}
!1006 = !{i64 355}
!1007 = !{!"355"}
!1008 = !DILocation(line: 107, column: 49, scope: !939)
!1009 = !{i64 356}
!1010 = !{!"356"}
!1011 = !{i64 357}
!1012 = !{!"357"}
!1013 = !{i64 358}
!1014 = !{!"358"}
!1015 = distinct !{!1015, !945, !1016, !1017}
!1016 = !DILocation(line: 108, column: 100, scope: !925)
!1017 = !{!"llvm.loop.name", !"TRAINING_LOOP"}
!1018 = !{i64 359}
!1019 = !{!"359"}
!1020 = !DILocation(line: 111, column: 5, scope: !852)
!1021 = !{i64 360}
!1022 = !{!"360"}
!1023 = !DILocalVariable(name: "max_vote", scope: !852, file: !8, line: 111, type: !498)
!1024 = !DILocation(line: 111, column: 15, scope: !852)
!1025 = !{i64 361}
!1026 = !{!"361"}
!1027 = !DILocation(line: 111, column: 35, scope: !852)
!1028 = !{i64 362}
!1029 = !{!"362"}
!1030 = !DILocation(line: 111, column: 26, scope: !852)
!1031 = !{i64 363}
!1032 = !{!"363"}
!1033 = !{i64 364}
!1034 = !{!"364"}
!1035 = !DILocation(line: 112, column: 18, scope: !852)
!1036 = !{i64 365}
!1037 = !{!"365"}
!1038 = !DILocation(line: 112, column: 5, scope: !852)
!1039 = !{i64 366}
!1040 = !{!"366"}
!1041 = !DILocation(line: 112, column: 13, scope: !852)
!1042 = !{i64 367}
!1043 = !{!"367"}
!1044 = !{i64 368}
!1045 = !{!"368"}
!1046 = !{i64 369}
!1047 = !{!"369"}
!1048 = !DILocation(line: 112, column: 16, scope: !852)
!1049 = !{i64 370}
!1050 = !{!"370"}
!1051 = !DILocation(line: 113, column: 3, scope: !829)
!1052 = !{i64 371}
!1053 = !{!"371"}
!1054 = !DILocation(line: 113, column: 3, scope: !852)
!1055 = !{i64 372}
!1056 = !{!"372"}
!1057 = !DILocation(line: 96, column: 40, scope: !829)
!1058 = !{i64 373}
!1059 = !{!"373"}
!1060 = !{i64 374}
!1061 = !{!"374"}
!1062 = !{i64 375}
!1063 = !{!"375"}
!1064 = distinct !{!1064, !835, !1065, !1066}
!1065 = !DILocation(line: 113, column: 3, scope: !815)
!1066 = !{!"llvm.loop.name", !"TEST_LOOP"}
!1067 = !{i64 376}
!1068 = !{!"376"}
!1069 = !DILocation(line: 114, column: 1, scope: !736)
!1070 = !{i64 377}
!1071 = !{!"377"}
!1072 = !{i64 378}
!1073 = !{!"378"}
!1074 = !{i64 379}
!1075 = !{!"379"}
!1076 = !{i64 380}
!1077 = !{!"380"}
!1078 = !{i64 381}
!1079 = !{!"381"}
!1080 = !{i64 382}
!1081 = !{!"382"}
!1082 = !{i64 383}
!1083 = !{!"383"}
!1084 = !{i64 384}
!1085 = !{!"384"}
!1086 = !{i64 385}
!1087 = !{!"385"}
!1088 = !{i64 386}
!1089 = !{!"386"}
!1090 = !{i64 387}
!1091 = !{!"387"}
!1092 = !{i64 388}
!1093 = !{!"388"}
!1094 = !{i64 389}
!1095 = !{!"389"}
!1096 = !{i64 390}
!1097 = !{!"390"}
!1098 = !{i64 391}
!1099 = !{!"391"}
!1100 = !{i64 392}
!1101 = !{!"392"}
!1102 = !{i64 393}
!1103 = !{!"393"}
!1104 = !{i64 394}
!1105 = !{!"394"}
!1106 = !{i64 395}
!1107 = !{!"395"}
!1108 = !{i64 396}
!1109 = !{!"396"}
!1110 = !{i64 397}
!1111 = !{!"397"}
!1112 = !{i64 398}
!1113 = !{!"398"}
!1114 = !{i64 399}
!1115 = !{!"399"}
!1116 = !{i64 400}
!1117 = !{!"400"}
!1118 = !{i64 401}
!1119 = !{!"401"}
!1120 = !{i64 402}
!1121 = !{!"402"}
!1122 = !{i64 403}
!1123 = !{!"403"}
!1124 = !{i64 404}
!1125 = !{!"404"}
!1126 = !{i64 405}
!1127 = !{!"405"}
!1128 = !{i64 406}
!1129 = !{!"406"}
!1130 = !{i64 407}
!1131 = !{!"407"}
!1132 = !{i64 408}
!1133 = !{!"408"}
!1134 = !{i64 409}
!1135 = !{!"409"}
!1136 = !{i64 410}
!1137 = !{!"410"}
!1138 = !{i64 411}
!1139 = !{!"411"}
!1140 = !{i64 412}
!1141 = !{!"412"}
!1142 = !{i64 413}
!1143 = !{!"413"}
!1144 = !{i64 414}
!1145 = !{!"414"}
!1146 = !{i64 415}
!1147 = !{!"415"}
!1148 = !{i64 416}
!1149 = !{!"416"}
!1150 = !{i64 417}
!1151 = !{!"417"}
!1152 = !{!"418"}
