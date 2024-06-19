; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@float_rounding_mode = global i32 0, align 4
@float_exception_flags = global i32 0, align 4
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@countLeadingZeros32.countLeadingZerosHigh = internal constant [256 x i32] [i32 8, i32 7, i32 6, i32 6, i32 5, i32 5, i32 5, i32 5, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4

; Function Attrs: nounwind
define i64 @float64_abs(i64 %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64, i64* %x.addr, align 8
  %and = and i64 %0, 9223372036854775807
  ret i64 %and
}

; Function Attrs: nounwind
define i64 @local_sin(i64 %rad) #1 !fpga.function.pragma !4 {
entry:
  %rad.addr = alloca i64, align 8
  %app = alloca i64, align 8
  %diff = alloca i64, align 8
  %m_rad2 = alloca i64, align 8
  %inc = alloca i32, align 4
  store i64 %rad, i64* %rad.addr, align 8
  %0 = bitcast i64* %app to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = bitcast i64* %diff to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = bitcast i64* %m_rad2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5
  %3 = bitcast i32* %inc to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = load i64, i64* %rad.addr, align 8
  store i64 %4, i64* %diff, align 8
  store i64 %4, i64* %app, align 8
  store i32 1, i32* %inc, align 4
  %5 = load i64, i64* %rad.addr, align 8
  %6 = load i64, i64* %rad.addr, align 8
  %call = call i64 @float64_mul(i64 %5, i64 %6)
  %call1 = call i64 @float64_neg(i64 %call)
  store i64 %call1, i64* %m_rad2, align 8
  br label %VITIS_LOOP_56_1

VITIS_LOOP_56_1:                                  ; preds = %entry
  br label %do.body, !llvm.loop !6

do.body:                                          ; preds = %do.cond, %VITIS_LOOP_56_1
  %7 = load i64, i64* %diff, align 8
  %8 = load i64, i64* %m_rad2, align 8
  %call2 = call i64 @float64_mul(i64 %7, i64 %8)
  %9 = load i32, i32* %inc, align 4
  %mul = mul i32 2, %9
  %10 = load i32, i32* %inc, align 4
  %mul3 = mul i32 2, %10
  %add = add i32 %mul3, 1
  %mul4 = mul i32 %mul, %add
  %call5 = call i64 @int32_to_float64(i32 %mul4)
  %call6 = call i64 @float64_div(i64 %call2, i64 %call5)
  store i64 %call6, i64* %diff, align 8
  %11 = load i64, i64* %app, align 8
  %12 = load i64, i64* %diff, align 8
  %call7 = call i64 @float64_add(i64 %11, i64 %12)
  store i64 %call7, i64* %app, align 8
  %13 = load i32, i32* %inc, align 4
  %inc8 = add i32 %13, 1
  store i32 %inc8, i32* %inc, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %14 = load i64, i64* %diff, align 8
  %call9 = call i64 @float64_abs(i64 %14)
  %call10 = call i32 @float64_ge(i64 %call9, i64 4532020583610935537)
  %tobool = icmp ne i32 %call10, 0
  br i1 %tobool, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  %15 = load i64, i64* %app, align 8
  %16 = bitcast i32* %inc to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5
  %17 = bitcast i64* %m_rad2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #5
  %18 = bitcast i64* %diff to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  %19 = bitcast i64* %app to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5
  ret i64 %15
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i64 @float64_mul(i64 %a, i64 %b) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i64, align 8
  %bSig = alloca i64, align 8
  %zSig0 = alloca i64, align 8
  %zSig1 = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5
  %5 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5
  %6 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #5
  %8 = bitcast i64* %zSig0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #5
  %9 = bitcast i64* %zSig1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #5
  %10 = load i64, i64* %a.addr, align 8
  %call = call i64 @extractFloat64Frac(i64 %10)
  store i64 %call, i64* %aSig, align 8
  %11 = load i64, i64* %a.addr, align 8
  %call1 = call i32 @extractFloat64Exp(i64 %11)
  store i32 %call1, i32* %aExp, align 4
  %12 = load i64, i64* %a.addr, align 8
  %call2 = call i32 @extractFloat64Sign(i64 %12)
  store i32 %call2, i32* %aSign, align 4
  %13 = load i64, i64* %b.addr, align 8
  %call3 = call i64 @extractFloat64Frac(i64 %13)
  store i64 %call3, i64* %bSig, align 8
  %14 = load i64, i64* %b.addr, align 8
  %call4 = call i32 @extractFloat64Exp(i64 %14)
  store i32 %call4, i32* %bExp, align 4
  %15 = load i64, i64* %b.addr, align 8
  %call5 = call i32 @extractFloat64Sign(i64 %15)
  store i32 %call5, i32* %bSign, align 4
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %bSign, align 4
  %xor = xor i32 %16, %17
  store i32 %xor, i32* %zSign, align 4
  %18 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %18, 2047
  br i1 %cmp, label %if.then, label %if.end14

if.then:                                          ; preds = %entry
  %19 = load i64, i64* %aSig, align 8
  %tobool = icmp ne i64 %19, 0
  br i1 %tobool, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %20 = load i32, i32* %bExp, align 4
  %cmp6 = icmp eq i32 %20, 2047
  br i1 %cmp6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %21 = load i64, i64* %bSig, align 8
  %tobool7 = icmp ne i64 %21, 0
  br i1 %tobool7, label %if.then8, label %if.end

if.then8:                                         ; preds = %land.lhs.true, %if.then
  %22 = load i64, i64* %a.addr, align 8
  %23 = load i64, i64* %b.addr, align 8
  %call9 = call i64 @propagateFloat64NaN(i64 %22, i64 %23)
  store i64 %call9, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  %24 = load i32, i32* %bExp, align 4
  %conv = sext i32 %24 to i64
  %25 = load i64, i64* %bSig, align 8
  %or = or i64 %conv, %25
  %cmp10 = icmp eq i64 %or, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  call void @float_raise(i32 16)
  store i64 9223372036854775807, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end12:                                         ; preds = %if.end
  %26 = load i32, i32* %zSign, align 4
  %call13 = call i64 @packFloat64(i32 %26, i32 2047, i64 0)
  store i64 %call13, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end14:                                         ; preds = %entry
  %27 = load i32, i32* %bExp, align 4
  %cmp15 = icmp eq i32 %27, 2047
  br i1 %cmp15, label %if.then16, label %if.end27

if.then16:                                        ; preds = %if.end14
  %28 = load i64, i64* %bSig, align 8
  %tobool17 = icmp ne i64 %28, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then16
  %29 = load i64, i64* %a.addr, align 8
  %30 = load i64, i64* %b.addr, align 8
  %call19 = call i64 @propagateFloat64NaN(i64 %29, i64 %30)
  store i64 %call19, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end20:                                         ; preds = %if.then16
  %31 = load i32, i32* %aExp, align 4
  %conv21 = sext i32 %31 to i64
  %32 = load i64, i64* %aSig, align 8
  %or22 = or i64 %conv21, %32
  %cmp23 = icmp eq i64 %or22, 0
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end20
  call void @float_raise(i32 16)
  store i64 9223372036854775807, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end25:                                         ; preds = %if.end20
  %33 = load i32, i32* %zSign, align 4
  %call26 = call i64 @packFloat64(i32 %33, i32 2047, i64 0)
  store i64 %call26, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end27:                                         ; preds = %if.end14
  %34 = load i32, i32* %aExp, align 4
  %cmp28 = icmp eq i32 %34, 0
  br i1 %cmp28, label %if.then29, label %if.end34

if.then29:                                        ; preds = %if.end27
  %35 = load i64, i64* %aSig, align 8
  %cmp30 = icmp eq i64 %35, 0
  br i1 %cmp30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.then29
  %36 = load i32, i32* %zSign, align 4
  %call32 = call i64 @packFloat64(i32 %36, i32 0, i64 0)
  store i64 %call32, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end33:                                         ; preds = %if.then29
  %37 = load i64, i64* %aSig, align 8
  call void @normalizeFloat64Subnormal(i64 %37, i32* %aExp, i64* %aSig)
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end27
  %38 = load i32, i32* %bExp, align 4
  %cmp35 = icmp eq i32 %38, 0
  br i1 %cmp35, label %if.then36, label %if.end41

if.then36:                                        ; preds = %if.end34
  %39 = load i64, i64* %bSig, align 8
  %cmp37 = icmp eq i64 %39, 0
  br i1 %cmp37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then36
  %40 = load i32, i32* %zSign, align 4
  %call39 = call i64 @packFloat64(i32 %40, i32 0, i64 0)
  store i64 %call39, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end40:                                         ; preds = %if.then36
  %41 = load i64, i64* %bSig, align 8
  call void @normalizeFloat64Subnormal(i64 %41, i32* %bExp, i64* %bSig)
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.end34
  %42 = load i32, i32* %aExp, align 4
  %43 = load i32, i32* %bExp, align 4
  %add = add i32 %42, %43
  %sub = sub i32 %add, 1023
  store i32 %sub, i32* %zExp, align 4
  %44 = load i64, i64* %aSig, align 8
  %or42 = or i64 %44, 4503599627370496
  %shl = shl i64 %or42, 10
  store i64 %shl, i64* %aSig, align 8
  %45 = load i64, i64* %bSig, align 8
  %or43 = or i64 %45, 4503599627370496
  %shl44 = shl i64 %or43, 11
  store i64 %shl44, i64* %bSig, align 8
  %46 = load i64, i64* %aSig, align 8
  %47 = load i64, i64* %bSig, align 8
  call void @mul64To128(i64 %46, i64 %47, i64* %zSig0, i64* %zSig1)
  %48 = load i64, i64* %zSig1, align 8
  %cmp45 = icmp ne i64 %48, 0
  %conv46 = zext i1 %cmp45 to i64
  %49 = load i64, i64* %zSig0, align 8
  %or47 = or i64 %49, %conv46
  store i64 %or47, i64* %zSig0, align 8
  %50 = load i64, i64* %zSig0, align 8
  %shl48 = shl i64 %50, 1
  %cmp49 = icmp sle i64 0, %shl48
  br i1 %cmp49, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.end41
  %51 = load i64, i64* %zSig0, align 8
  %shl51 = shl i64 %51, 1
  store i64 %shl51, i64* %zSig0, align 8
  %52 = load i32, i32* %zExp, align 4
  %dec = add i32 %52, -1
  store i32 %dec, i32* %zExp, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.end41
  %53 = load i32, i32* %zSign, align 4
  %54 = load i32, i32* %zExp, align 4
  %55 = load i64, i64* %zSig0, align 8
  %call53 = call i64 @roundAndPackFloat64(i32 %53, i32 %54, i64 %55)
  store i64 %call53, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end52, %if.then38, %if.then31, %if.end25, %if.then24, %if.then18, %if.end12, %if.then11, %if.then8
  %56 = bitcast i64* %zSig1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %56) #5
  %57 = bitcast i64* %zSig0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %57) #5
  %58 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %58) #5
  %59 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %59) #5
  %60 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %60) #5
  %61 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %61) #5
  %62 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %62) #5
  %63 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %63) #5
  %64 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %64) #5
  %65 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #5
  %66 = load i64, i64* %retval, align 8
  ret i64 %66
}

; Function Attrs: nounwind
define i64 @float64_neg(i64 %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64, i64* %x.addr, align 8
  %neg = xor i64 %0, -1
  %and = and i64 %neg, -9223372036854775808
  %1 = load i64, i64* %x.addr, align 8
  %and1 = and i64 %1, 9223372036854775807
  %or = or i64 %and, %and1
  ret i64 %or
}

; Function Attrs: nounwind
define i64 @int32_to_float64(i32 %a) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i32, align 4
  %zSign = alloca i32, align 4
  %absA = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %zSig = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %absA to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = load i32, i32* %a.addr, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %entry
  %5 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp slt i32 %5, 0
  %conv = zext i1 %cmp1 to i32
  store i32 %conv, i32* %zSign, align 4
  %6 = load i32, i32* %zSign, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %7 = load i32, i32* %a.addr, align 4
  %sub = sub i32 0, %7
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %8 = load i32, i32* %a.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %8, %cond.false ]
  store i32 %cond, i32* %absA, align 4
  %9 = load i32, i32* %absA, align 4
  %call = call i32 @countLeadingZeros32(i32 %9)
  %add = add i32 %call, 21
  store i32 %add, i32* %shiftCount, align 4
  %10 = load i32, i32* %absA, align 4
  %conv2 = zext i32 %10 to i64
  store i64 %conv2, i64* %zSig, align 8
  %11 = load i32, i32* %zSign, align 4
  %12 = load i32, i32* %shiftCount, align 4
  %sub3 = sub i32 1074, %12
  %13 = load i64, i64* %zSig, align 8
  %14 = load i32, i32* %shiftCount, align 4
  %sh_prom = zext i32 %14 to i64
  %shl = shl i64 %13, %sh_prom
  %call4 = call i64 @packFloat64(i32 %11, i32 %sub3, i64 %shl)
  store i64 %call4, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %cond.end, %if.then
  %15 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #5
  %16 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5
  %17 = bitcast i32* %absA to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  %18 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #5
  %19 = load i64, i64* %retval, align 8
  ret i64 %19
}

; Function Attrs: nounwind
define i64 @float64_div(i64 %a, i64 %b) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i64, align 8
  %bSig = alloca i64, align 8
  %zSig = alloca i64, align 8
  %rem0 = alloca i64, align 8
  %rem1 = alloca i64, align 8
  %term0 = alloca i64, align 8
  %term1 = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5
  %5 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #5
  %6 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #5
  %8 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #5
  %9 = bitcast i64* %rem0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #5
  %10 = bitcast i64* %rem1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #5
  %11 = bitcast i64* %term0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %11) #5
  %12 = bitcast i64* %term1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %12) #5
  %13 = load i64, i64* %a.addr, align 8
  %call = call i64 @extractFloat64Frac(i64 %13)
  store i64 %call, i64* %aSig, align 8
  %14 = load i64, i64* %a.addr, align 8
  %call1 = call i32 @extractFloat64Exp(i64 %14)
  store i32 %call1, i32* %aExp, align 4
  %15 = load i64, i64* %a.addr, align 8
  %call2 = call i32 @extractFloat64Sign(i64 %15)
  store i32 %call2, i32* %aSign, align 4
  %16 = load i64, i64* %b.addr, align 8
  %call3 = call i64 @extractFloat64Frac(i64 %16)
  store i64 %call3, i64* %bSig, align 8
  %17 = load i64, i64* %b.addr, align 8
  %call4 = call i32 @extractFloat64Exp(i64 %17)
  store i32 %call4, i32* %bExp, align 4
  %18 = load i64, i64* %b.addr, align 8
  %call5 = call i32 @extractFloat64Sign(i64 %18)
  store i32 %call5, i32* %bSign, align 4
  %19 = load i32, i32* %aSign, align 4
  %20 = load i32, i32* %bSign, align 4
  %xor = xor i32 %19, %20
  store i32 %xor, i32* %zSign, align 4
  %21 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %21, 2047
  br i1 %cmp, label %if.then, label %if.end16

if.then:                                          ; preds = %entry
  %22 = load i64, i64* %aSig, align 8
  %tobool = icmp ne i64 %22, 0
  br i1 %tobool, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %23 = load i64, i64* %a.addr, align 8
  %24 = load i64, i64* %b.addr, align 8
  %call7 = call i64 @propagateFloat64NaN(i64 %23, i64 %24)
  store i64 %call7, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %if.then
  %25 = load i32, i32* %bExp, align 4
  %cmp8 = icmp eq i32 %25, 2047
  br i1 %cmp8, label %if.then9, label %if.end14

if.then9:                                         ; preds = %if.end
  %26 = load i64, i64* %bSig, align 8
  %tobool10 = icmp ne i64 %26, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.then9
  %27 = load i64, i64* %a.addr, align 8
  %28 = load i64, i64* %b.addr, align 8
  %call12 = call i64 @propagateFloat64NaN(i64 %27, i64 %28)
  store i64 %call12, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end13:                                         ; preds = %if.then9
  call void @float_raise(i32 16)
  store i64 9223372036854775807, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end14:                                         ; preds = %if.end
  %29 = load i32, i32* %zSign, align 4
  %call15 = call i64 @packFloat64(i32 %29, i32 2047, i64 0)
  store i64 %call15, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end16:                                         ; preds = %entry
  %30 = load i32, i32* %bExp, align 4
  %cmp17 = icmp eq i32 %30, 2047
  br i1 %cmp17, label %if.then18, label %if.end24

if.then18:                                        ; preds = %if.end16
  %31 = load i64, i64* %bSig, align 8
  %tobool19 = icmp ne i64 %31, 0
  br i1 %tobool19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.then18
  %32 = load i64, i64* %a.addr, align 8
  %33 = load i64, i64* %b.addr, align 8
  %call21 = call i64 @propagateFloat64NaN(i64 %32, i64 %33)
  store i64 %call21, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end22:                                         ; preds = %if.then18
  %34 = load i32, i32* %zSign, align 4
  %call23 = call i64 @packFloat64(i32 %34, i32 0, i64 0)
  store i64 %call23, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end24:                                         ; preds = %if.end16
  %35 = load i32, i32* %bExp, align 4
  %cmp25 = icmp eq i32 %35, 0
  br i1 %cmp25, label %if.then26, label %if.end34

if.then26:                                        ; preds = %if.end24
  %36 = load i64, i64* %bSig, align 8
  %cmp27 = icmp eq i64 %36, 0
  br i1 %cmp27, label %if.then28, label %if.end33

if.then28:                                        ; preds = %if.then26
  %37 = load i32, i32* %aExp, align 4
  %conv = sext i32 %37 to i64
  %38 = load i64, i64* %aSig, align 8
  %or = or i64 %conv, %38
  %cmp29 = icmp eq i64 %or, 0
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.then28
  call void @float_raise(i32 16)
  store i64 9223372036854775807, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end31:                                         ; preds = %if.then28
  call void @float_raise(i32 2)
  %39 = load i32, i32* %zSign, align 4
  %call32 = call i64 @packFloat64(i32 %39, i32 2047, i64 0)
  store i64 %call32, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end33:                                         ; preds = %if.then26
  %40 = load i64, i64* %bSig, align 8
  call void @normalizeFloat64Subnormal(i64 %40, i32* %bExp, i64* %bSig)
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end24
  %41 = load i32, i32* %aExp, align 4
  %cmp35 = icmp eq i32 %41, 0
  br i1 %cmp35, label %if.then36, label %if.end41

if.then36:                                        ; preds = %if.end34
  %42 = load i64, i64* %aSig, align 8
  %cmp37 = icmp eq i64 %42, 0
  br i1 %cmp37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then36
  %43 = load i32, i32* %zSign, align 4
  %call39 = call i64 @packFloat64(i32 %43, i32 0, i64 0)
  store i64 %call39, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end40:                                         ; preds = %if.then36
  %44 = load i64, i64* %aSig, align 8
  call void @normalizeFloat64Subnormal(i64 %44, i32* %aExp, i64* %aSig)
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.end34
  %45 = load i32, i32* %aExp, align 4
  %46 = load i32, i32* %bExp, align 4
  %sub = sub i32 %45, %46
  %add = add i32 %sub, 1021
  store i32 %add, i32* %zExp, align 4
  %47 = load i64, i64* %aSig, align 8
  %or42 = or i64 %47, 4503599627370496
  %shl = shl i64 %or42, 10
  store i64 %shl, i64* %aSig, align 8
  %48 = load i64, i64* %bSig, align 8
  %or43 = or i64 %48, 4503599627370496
  %shl44 = shl i64 %or43, 11
  store i64 %shl44, i64* %bSig, align 8
  %49 = load i64, i64* %bSig, align 8
  %50 = load i64, i64* %aSig, align 8
  %51 = load i64, i64* %aSig, align 8
  %add45 = add i64 %50, %51
  %cmp46 = icmp ule i64 %49, %add45
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end41
  %52 = load i64, i64* %aSig, align 8
  %shr = lshr i64 %52, 1
  store i64 %shr, i64* %aSig, align 8
  %53 = load i32, i32* %zExp, align 4
  %inc = add i32 %53, 1
  store i32 %inc, i32* %zExp, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end41
  %54 = load i64, i64* %aSig, align 8
  %55 = load i64, i64* %bSig, align 8
  %call49 = call i64 @estimateDiv128To64(i64 %54, i64 0, i64 %55)
  store i64 %call49, i64* %zSig, align 8
  %56 = load i64, i64* %zSig, align 8
  %and = and i64 %56, 511
  %cmp50 = icmp ule i64 %and, 2
  br i1 %cmp50, label %if.then51, label %if.end56

if.then51:                                        ; preds = %if.end48
  %57 = load i64, i64* %bSig, align 8
  %58 = load i64, i64* %zSig, align 8
  call void @mul64To128(i64 %57, i64 %58, i64* %term0, i64* %term1)
  %59 = load i64, i64* %aSig, align 8
  %60 = load i64, i64* %term0, align 8
  %61 = load i64, i64* %term1, align 8
  call void @sub128(i64 %59, i64 0, i64 %60, i64 %61, i64* %rem0, i64* %rem1)
  br label %VITIS_LOOP_602_1

VITIS_LOOP_602_1:                                 ; preds = %if.then51
  br label %while.cond

while.cond:                                       ; preds = %while.body, %VITIS_LOOP_602_1
  %62 = load i64, i64* %rem0, align 8
  %cmp52 = icmp slt i64 %62, 0
  br i1 %cmp52, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %63 = load i64, i64* %zSig, align 8
  %dec = add i64 %63, -1
  store i64 %dec, i64* %zSig, align 8
  %64 = load i64, i64* %rem0, align 8
  %65 = load i64, i64* %rem1, align 8
  %66 = load i64, i64* %bSig, align 8
  call void @add128(i64 %64, i64 %65, i64 0, i64 %66, i64* %rem0, i64* %rem1)
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %67 = load i64, i64* %rem1, align 8
  %cmp53 = icmp ne i64 %67, 0
  %conv54 = zext i1 %cmp53 to i64
  %68 = load i64, i64* %zSig, align 8
  %or55 = or i64 %68, %conv54
  store i64 %or55, i64* %zSig, align 8
  br label %if.end56

if.end56:                                         ; preds = %while.end, %if.end48
  %69 = load i32, i32* %zSign, align 4
  %70 = load i32, i32* %zExp, align 4
  %71 = load i64, i64* %zSig, align 8
  %call57 = call i64 @roundAndPackFloat64(i32 %69, i32 %70, i64 %71)
  store i64 %call57, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end56, %if.then38, %if.end31, %if.then30, %if.end22, %if.then20, %if.end14, %if.end13, %if.then11, %if.then6
  %72 = bitcast i64* %term1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %72) #5
  %73 = bitcast i64* %term0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %73) #5
  %74 = bitcast i64* %rem1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %74) #5
  %75 = bitcast i64* %rem0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %75) #5
  %76 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %76) #5
  %77 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %77) #5
  %78 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %78) #5
  %79 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %79) #5
  %80 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %80) #5
  %81 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %81) #5
  %82 = bitcast i32* %zSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %82) #5
  %83 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %83) #5
  %84 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %84) #5
  %85 = load i64, i64* %retval, align 8
  ret i64 %85
}

; Function Attrs: nounwind
define i64 @float64_add(i64 %a, i64 %b) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = load i64, i64* %a.addr, align 8
  %call = call i32 @extractFloat64Sign(i64 %2)
  store i32 %call, i32* %aSign, align 4
  %3 = load i64, i64* %b.addr, align 8
  %call1 = call i32 @extractFloat64Sign(i64 %3)
  store i32 %call1, i32* %bSign, align 4
  %4 = load i32, i32* %aSign, align 4
  %5 = load i32, i32* %bSign, align 4
  %cmp = icmp eq i32 %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %a.addr, align 8
  %7 = load i64, i64* %b.addr, align 8
  %8 = load i32, i32* %aSign, align 4
  %call2 = call i64 @addFloat64Sigs(i64 %6, i64 %7, i32 %8)
  store i64 %call2, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.else:                                          ; preds = %entry
  %9 = load i64, i64* %a.addr, align 8
  %10 = load i64, i64* %b.addr, align 8
  %11 = load i32, i32* %aSign, align 4
  %call3 = call i64 @subFloat64Sigs(i64 %9, i64 %10, i32 %11)
  store i64 %call3, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %12 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #5
  %13 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #5
  %14 = load i64, i64* %retval, align 8
  ret i64 %14
}

; Function Attrs: nounwind
define i32 @float64_ge(i64 %a, i64 %b) #0 {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = load i64, i64* %b.addr, align 8
  %1 = load i64, i64* %a.addr, align 8
  %call = call i32 @float64_le(i64 %0, i64 %1)
  ret i32 %call
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i32 @float64_le(i64 %a, i64 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = load i64, i64* %a.addr, align 8
  %call = call i32 @extractFloat64Exp(i64 %2)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %3 = load i64, i64* %a.addr, align 8
  %call1 = call i64 @extractFloat64Frac(i64 %3)
  %tobool = icmp ne i64 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %4 = load i64, i64* %b.addr, align 8
  %call2 = call i32 @extractFloat64Exp(i64 %4)
  %cmp3 = icmp eq i32 %call2, 2047
  br i1 %cmp3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %lor.lhs.false
  %5 = load i64, i64* %b.addr, align 8
  %call5 = call i64 @extractFloat64Frac(i64 %5)
  %tobool6 = icmp ne i64 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true4, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true4, %lor.lhs.false
  %6 = load i64, i64* %a.addr, align 8
  %call7 = call i32 @extractFloat64Sign(i64 %6)
  store i32 %call7, i32* %aSign, align 4
  %7 = load i64, i64* %b.addr, align 8
  %call8 = call i32 @extractFloat64Sign(i64 %7)
  store i32 %call8, i32* %bSign, align 4
  %8 = load i32, i32* %aSign, align 4
  %9 = load i32, i32* %bSign, align 4
  %cmp9 = icmp ne i32 %8, %9
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end
  %10 = load i32, i32* %aSign, align 4
  %tobool11 = icmp ne i32 %10, 0
  br i1 %tobool11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then10
  %11 = load i64, i64* %a.addr, align 8
  %12 = load i64, i64* %b.addr, align 8
  %or = or i64 %11, %12
  %shl = shl i64 %or, 1
  %cmp12 = icmp eq i64 %shl, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then10
  %13 = phi i1 [ true, %if.then10 ], [ %cmp12, %lor.rhs ]
  %lor.ext = zext i1 %13 to i32
  store i32 %lor.ext, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end13:                                         ; preds = %if.end
  %14 = load i64, i64* %a.addr, align 8
  %15 = load i64, i64* %b.addr, align 8
  %cmp14 = icmp eq i64 %14, %15
  br i1 %cmp14, label %lor.end18, label %lor.rhs15

lor.rhs15:                                        ; preds = %if.end13
  %16 = load i32, i32* %aSign, align 4
  %17 = load i64, i64* %a.addr, align 8
  %18 = load i64, i64* %b.addr, align 8
  %cmp16 = icmp ult i64 %17, %18
  %conv = zext i1 %cmp16 to i32
  %xor = xor i32 %16, %conv
  %tobool17 = icmp ne i32 %xor, 0
  br label %lor.end18

lor.end18:                                        ; preds = %lor.rhs15, %if.end13
  %19 = phi i1 [ true, %if.end13 ], [ %tobool17, %lor.rhs15 ]
  %lor.ext19 = zext i1 %19 to i32
  store i32 %lor.ext19, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %lor.end18, %lor.end, %if.then
  %20 = bitcast i32* %bSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
  %21 = bitcast i32* %aSign to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: nounwind
define i32 @extractFloat64Exp(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64, i64* %a.addr, align 8
  %shr = lshr i64 %0, 52
  %and = and i64 %shr, 2047
  %conv = trunc i64 %and to i32
  ret i32 %conv
}

; Function Attrs: nounwind
define i64 @extractFloat64Frac(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64, i64* %a.addr, align 8
  %and = and i64 %0, 4503599627370495
  ret i64 %and
}

; Function Attrs: nounwind
define void @float_raise(i32 %flags) #0 {
entry:
  %flags.addr = alloca i32, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %1 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %1, %0
  store i32 %or, i32* @float_exception_flags, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @extractFloat64Sign(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64, i64* %a.addr, align 8
  %shr = lshr i64 %0, 63
  %conv = trunc i64 %shr to i32
  ret i32 %conv
}

; Function Attrs: nounwind
define internal i64 @addFloat64Sigs(i64 %a, i64 %b, i32 %zSign) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i64, align 8
  %bSig = alloca i64, align 8
  %zSig = alloca i64, align 8
  %expDiff = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  store i32 %zSign, i32* %zSign.addr, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i32* %expDiff to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5
  %7 = load i64, i64* %a.addr, align 8
  %call = call i64 @extractFloat64Frac(i64 %7)
  store i64 %call, i64* %aSig, align 8
  %8 = load i64, i64* %a.addr, align 8
  %call1 = call i32 @extractFloat64Exp(i64 %8)
  store i32 %call1, i32* %aExp, align 4
  %9 = load i64, i64* %b.addr, align 8
  %call2 = call i64 @extractFloat64Frac(i64 %9)
  store i64 %call2, i64* %bSig, align 8
  %10 = load i64, i64* %b.addr, align 8
  %call3 = call i32 @extractFloat64Exp(i64 %10)
  store i32 %call3, i32* %bExp, align 4
  %11 = load i32, i32* %aExp, align 4
  %12 = load i32, i32* %bExp, align 4
  %sub = sub i32 %11, %12
  store i32 %sub, i32* %expDiff, align 4
  %13 = load i64, i64* %aSig, align 8
  %shl = shl i64 %13, 9
  store i64 %shl, i64* %aSig, align 8
  %14 = load i64, i64* %bSig, align 8
  %shl4 = shl i64 %14, 9
  store i64 %shl4, i64* %bSig, align 8
  %15 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %15
  br i1 %cmp, label %if.then, label %if.else13

if.then:                                          ; preds = %entry
  %16 = load i32, i32* %aExp, align 4
  %cmp5 = icmp eq i32 %16, 2047
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.then
  %17 = load i64, i64* %aSig, align 8
  %tobool = icmp ne i64 %17, 0
  br i1 %tobool, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then6
  %18 = load i64, i64* %a.addr, align 8
  %19 = load i64, i64* %b.addr, align 8
  %call8 = call i64 @propagateFloat64NaN(i64 %18, i64 %19)
  store i64 %call8, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %if.then6
  %20 = load i64, i64* %a.addr, align 8
  store i64 %20, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end9:                                          ; preds = %if.then
  %21 = load i32, i32* %bExp, align 4
  %cmp10 = icmp eq i32 %21, 0
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end9
  %22 = load i32, i32* %expDiff, align 4
  %dec = add i32 %22, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end12

if.else:                                          ; preds = %if.end9
  %23 = load i64, i64* %bSig, align 8
  %or = or i64 %23, 2305843009213693952
  store i64 %or, i64* %bSig, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then11
  %24 = load i64, i64* %bSig, align 8
  %25 = load i32, i32* %expDiff, align 4
  call void @shift64RightJamming(i64 %24, i32 %25, i64* %bSig)
  %26 = load i32, i32* %aExp, align 4
  store i32 %26, i32* %zExp, align 4
  br label %if.end46

if.else13:                                        ; preds = %entry
  %27 = load i32, i32* %expDiff, align 4
  %cmp14 = icmp slt i32 %27, 0
  br i1 %cmp14, label %if.then15, label %if.else30

if.then15:                                        ; preds = %if.else13
  %28 = load i32, i32* %bExp, align 4
  %cmp16 = icmp eq i32 %28, 2047
  br i1 %cmp16, label %if.then17, label %if.end23

if.then17:                                        ; preds = %if.then15
  %29 = load i64, i64* %bSig, align 8
  %tobool18 = icmp ne i64 %29, 0
  br i1 %tobool18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.then17
  %30 = load i64, i64* %a.addr, align 8
  %31 = load i64, i64* %b.addr, align 8
  %call20 = call i64 @propagateFloat64NaN(i64 %30, i64 %31)
  store i64 %call20, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end21:                                         ; preds = %if.then17
  %32 = load i32, i32* %zSign.addr, align 4
  %call22 = call i64 @packFloat64(i32 %32, i32 2047, i64 0)
  store i64 %call22, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end23:                                         ; preds = %if.then15
  %33 = load i32, i32* %aExp, align 4
  %cmp24 = icmp eq i32 %33, 0
  br i1 %cmp24, label %if.then25, label %if.else26

if.then25:                                        ; preds = %if.end23
  %34 = load i32, i32* %expDiff, align 4
  %inc = add i32 %34, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end28

if.else26:                                        ; preds = %if.end23
  %35 = load i64, i64* %aSig, align 8
  %or27 = or i64 %35, 2305843009213693952
  store i64 %or27, i64* %aSig, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.else26, %if.then25
  %36 = load i64, i64* %aSig, align 8
  %37 = load i32, i32* %expDiff, align 4
  %sub29 = sub i32 0, %37
  call void @shift64RightJamming(i64 %36, i32 %sub29, i64* %aSig)
  %38 = load i32, i32* %bExp, align 4
  store i32 %38, i32* %zExp, align 4
  br label %if.end45

if.else30:                                        ; preds = %if.else13
  %39 = load i32, i32* %aExp, align 4
  %cmp31 = icmp eq i32 %39, 2047
  br i1 %cmp31, label %if.then32, label %if.end38

if.then32:                                        ; preds = %if.else30
  %40 = load i64, i64* %aSig, align 8
  %41 = load i64, i64* %bSig, align 8
  %or33 = or i64 %40, %41
  %tobool34 = icmp ne i64 %or33, 0
  br i1 %tobool34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.then32
  %42 = load i64, i64* %a.addr, align 8
  %43 = load i64, i64* %b.addr, align 8
  %call36 = call i64 @propagateFloat64NaN(i64 %42, i64 %43)
  store i64 %call36, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end37:                                         ; preds = %if.then32
  %44 = load i64, i64* %a.addr, align 8
  store i64 %44, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end38:                                         ; preds = %if.else30
  %45 = load i32, i32* %aExp, align 4
  %cmp39 = icmp eq i32 %45, 0
  br i1 %cmp39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.end38
  %46 = load i32, i32* %zSign.addr, align 4
  %47 = load i64, i64* %aSig, align 8
  %48 = load i64, i64* %bSig, align 8
  %add = add i64 %47, %48
  %shr = lshr i64 %add, 9
  %call41 = call i64 @packFloat64(i32 %46, i32 0, i64 %shr)
  store i64 %call41, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end42:                                         ; preds = %if.end38
  %49 = load i64, i64* %aSig, align 8
  %add43 = add i64 4611686018427387904, %49
  %50 = load i64, i64* %bSig, align 8
  %add44 = add i64 %add43, %50
  store i64 %add44, i64* %zSig, align 8
  %51 = load i32, i32* %aExp, align 4
  store i32 %51, i32* %zExp, align 4
  br label %roundAndPack

if.end45:                                         ; preds = %if.end28
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.end12
  %52 = load i64, i64* %aSig, align 8
  %or47 = or i64 %52, 2305843009213693952
  store i64 %or47, i64* %aSig, align 8
  %53 = load i64, i64* %aSig, align 8
  %54 = load i64, i64* %bSig, align 8
  %add48 = add i64 %53, %54
  %shl49 = shl i64 %add48, 1
  store i64 %shl49, i64* %zSig, align 8
  %55 = load i32, i32* %zExp, align 4
  %dec50 = add i32 %55, -1
  store i32 %dec50, i32* %zExp, align 4
  %56 = load i64, i64* %zSig, align 8
  %cmp51 = icmp slt i64 %56, 0
  br i1 %cmp51, label %if.then52, label %if.end55

if.then52:                                        ; preds = %if.end46
  %57 = load i64, i64* %aSig, align 8
  %58 = load i64, i64* %bSig, align 8
  %add53 = add i64 %57, %58
  store i64 %add53, i64* %zSig, align 8
  %59 = load i32, i32* %zExp, align 4
  %inc54 = add i32 %59, 1
  store i32 %inc54, i32* %zExp, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then52, %if.end46
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end55, %if.end42
  %60 = load i32, i32* %zSign.addr, align 4
  %61 = load i32, i32* %zExp, align 4
  %62 = load i64, i64* %zSig, align 8
  %call56 = call i64 @roundAndPackFloat64(i32 %60, i32 %61, i64 %62)
  store i64 %call56, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %roundAndPack, %if.then40, %if.end37, %if.then35, %if.end21, %if.then19, %if.end, %if.then7
  %63 = bitcast i32* %expDiff to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %63) #5
  %64 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %64) #5
  %65 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %65) #5
  %66 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %66) #5
  %67 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %67) #5
  %68 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %68) #5
  %69 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %69) #5
  %70 = load i64, i64* %retval, align 8
  ret i64 %70
}

; Function Attrs: nounwind
define internal i64 @subFloat64Sigs(i64 %a, i64 %b, i32 %zSign) #0 {
entry:
  %retval = alloca i64, align 8
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i64, align 8
  %bSig = alloca i64, align 8
  %zSig = alloca i64, align 8
  %expDiff = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  store i32 %zSign, i32* %zSign.addr, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i32* %expDiff to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5
  %7 = load i64, i64* %a.addr, align 8
  %call = call i64 @extractFloat64Frac(i64 %7)
  store i64 %call, i64* %aSig, align 8
  %8 = load i64, i64* %a.addr, align 8
  %call1 = call i32 @extractFloat64Exp(i64 %8)
  store i32 %call1, i32* %aExp, align 4
  %9 = load i64, i64* %b.addr, align 8
  %call2 = call i64 @extractFloat64Frac(i64 %9)
  store i64 %call2, i64* %bSig, align 8
  %10 = load i64, i64* %b.addr, align 8
  %call3 = call i32 @extractFloat64Exp(i64 %10)
  store i32 %call3, i32* %bExp, align 4
  %11 = load i32, i32* %aExp, align 4
  %12 = load i32, i32* %bExp, align 4
  %sub = sub i32 %11, %12
  store i32 %sub, i32* %expDiff, align 4
  %13 = load i64, i64* %aSig, align 8
  %shl = shl i64 %13, 10
  store i64 %shl, i64* %aSig, align 8
  %14 = load i64, i64* %bSig, align 8
  %shl4 = shl i64 %14, 10
  store i64 %shl4, i64* %bSig, align 8
  %15 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %aExpBigger

if.end:                                           ; preds = %entry
  %16 = load i32, i32* %expDiff, align 4
  %cmp5 = icmp slt i32 %16, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  br label %bExpBigger

if.end7:                                          ; preds = %if.end
  %17 = load i32, i32* %aExp, align 4
  %cmp8 = icmp eq i32 %17, 2047
  br i1 %cmp8, label %if.then9, label %if.end13

if.then9:                                         ; preds = %if.end7
  %18 = load i64, i64* %aSig, align 8
  %19 = load i64, i64* %bSig, align 8
  %or = or i64 %18, %19
  %tobool = icmp ne i64 %or, 0
  br i1 %tobool, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.then9
  %20 = load i64, i64* %a.addr, align 8
  %21 = load i64, i64* %b.addr, align 8
  %call11 = call i64 @propagateFloat64NaN(i64 %20, i64 %21)
  store i64 %call11, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end12:                                         ; preds = %if.then9
  call void @float_raise(i32 16)
  store i64 9223372036854775807, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end13:                                         ; preds = %if.end7
  %22 = load i32, i32* %aExp, align 4
  %cmp14 = icmp eq i32 %22, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  store i32 1, i32* %aExp, align 4
  store i32 1, i32* %bExp, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %23 = load i64, i64* %bSig, align 8
  %24 = load i64, i64* %aSig, align 8
  %cmp17 = icmp ult i64 %23, %24
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  br label %aBigger

if.end19:                                         ; preds = %if.end16
  %25 = load i64, i64* %aSig, align 8
  %26 = load i64, i64* %bSig, align 8
  %cmp20 = icmp ult i64 %25, %26
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  br label %bBigger

if.end22:                                         ; preds = %if.end19
  %27 = load i32, i32* @float_rounding_mode, align 4
  %cmp23 = icmp eq i32 %27, 3
  %conv = zext i1 %cmp23 to i32
  %call24 = call i64 @packFloat64(i32 %conv, i32 0, i64 0)
  store i64 %call24, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

bExpBigger:                                       ; preds = %if.then6
  %28 = load i32, i32* %bExp, align 4
  %cmp25 = icmp eq i32 %28, 2047
  br i1 %cmp25, label %if.then26, label %if.end32

if.then26:                                        ; preds = %bExpBigger
  %29 = load i64, i64* %bSig, align 8
  %tobool27 = icmp ne i64 %29, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.then26
  %30 = load i64, i64* %a.addr, align 8
  %31 = load i64, i64* %b.addr, align 8
  %call29 = call i64 @propagateFloat64NaN(i64 %30, i64 %31)
  store i64 %call29, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end30:                                         ; preds = %if.then26
  %32 = load i32, i32* %zSign.addr, align 4
  %xor = xor i32 %32, 1
  %call31 = call i64 @packFloat64(i32 %xor, i32 2047, i64 0)
  store i64 %call31, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end32:                                         ; preds = %bExpBigger
  %33 = load i32, i32* %aExp, align 4
  %cmp33 = icmp eq i32 %33, 0
  br i1 %cmp33, label %if.then34, label %if.else

if.then34:                                        ; preds = %if.end32
  %34 = load i32, i32* %expDiff, align 4
  %inc = add i32 %34, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end36

if.else:                                          ; preds = %if.end32
  %35 = load i64, i64* %aSig, align 8
  %or35 = or i64 %35, 4611686018427387904
  store i64 %or35, i64* %aSig, align 8
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.then34
  %36 = load i64, i64* %aSig, align 8
  %37 = load i32, i32* %expDiff, align 4
  %sub37 = sub i32 0, %37
  call void @shift64RightJamming(i64 %36, i32 %sub37, i64* %aSig)
  %38 = load i64, i64* %bSig, align 8
  %or38 = or i64 %38, 4611686018427387904
  store i64 %or38, i64* %bSig, align 8
  br label %bBigger

bBigger:                                          ; preds = %if.end36, %if.then21
  %39 = load i64, i64* %bSig, align 8
  %40 = load i64, i64* %aSig, align 8
  %sub39 = sub i64 %39, %40
  store i64 %sub39, i64* %zSig, align 8
  %41 = load i32, i32* %bExp, align 4
  store i32 %41, i32* %zExp, align 4
  %42 = load i32, i32* %zSign.addr, align 4
  %xor40 = xor i32 %42, 1
  store i32 %xor40, i32* %zSign.addr, align 4
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %if.then
  %43 = load i32, i32* %aExp, align 4
  %cmp41 = icmp eq i32 %43, 2047
  br i1 %cmp41, label %if.then42, label %if.end47

if.then42:                                        ; preds = %aExpBigger
  %44 = load i64, i64* %aSig, align 8
  %tobool43 = icmp ne i64 %44, 0
  br i1 %tobool43, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.then42
  %45 = load i64, i64* %a.addr, align 8
  %46 = load i64, i64* %b.addr, align 8
  %call45 = call i64 @propagateFloat64NaN(i64 %45, i64 %46)
  store i64 %call45, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end46:                                         ; preds = %if.then42
  %47 = load i64, i64* %a.addr, align 8
  store i64 %47, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end47:                                         ; preds = %aExpBigger
  %48 = load i32, i32* %bExp, align 4
  %cmp48 = icmp eq i32 %48, 0
  br i1 %cmp48, label %if.then49, label %if.else50

if.then49:                                        ; preds = %if.end47
  %49 = load i32, i32* %expDiff, align 4
  %dec = add i32 %49, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end52

if.else50:                                        ; preds = %if.end47
  %50 = load i64, i64* %bSig, align 8
  %or51 = or i64 %50, 4611686018427387904
  store i64 %or51, i64* %bSig, align 8
  br label %if.end52

if.end52:                                         ; preds = %if.else50, %if.then49
  %51 = load i64, i64* %bSig, align 8
  %52 = load i32, i32* %expDiff, align 4
  call void @shift64RightJamming(i64 %51, i32 %52, i64* %bSig)
  %53 = load i64, i64* %aSig, align 8
  %or53 = or i64 %53, 4611686018427387904
  store i64 %or53, i64* %aSig, align 8
  br label %aBigger

aBigger:                                          ; preds = %if.end52, %if.then18
  %54 = load i64, i64* %aSig, align 8
  %55 = load i64, i64* %bSig, align 8
  %sub54 = sub i64 %54, %55
  store i64 %sub54, i64* %zSig, align 8
  %56 = load i32, i32* %aExp, align 4
  store i32 %56, i32* %zExp, align 4
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %57 = load i32, i32* %zExp, align 4
  %dec55 = add i32 %57, -1
  store i32 %dec55, i32* %zExp, align 4
  %58 = load i32, i32* %zSign.addr, align 4
  %59 = load i32, i32* %zExp, align 4
  %60 = load i64, i64* %zSig, align 8
  %call56 = call i64 @normalizeRoundAndPackFloat64(i32 %58, i32 %59, i64 %60)
  store i64 %call56, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %normalizeRoundAndPack, %if.end46, %if.then44, %if.end30, %if.then28, %if.end22, %if.end12, %if.then10
  %61 = bitcast i32* %expDiff to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %61) #5
  %62 = bitcast i64* %zSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %62) #5
  %63 = bitcast i64* %bSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %63) #5
  %64 = bitcast i64* %aSig to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %64) #5
  %65 = bitcast i32* %zExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #5
  %66 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #5
  %67 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %67) #5
  %68 = load i64, i64* %retval, align 8
  ret i64 %68
}

; Function Attrs: nounwind
define internal i64 @propagateFloat64NaN(i64 %a, i64 %b) #0 {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %aIsNaN = alloca i32, align 4
  %aIsSignalingNaN = alloca i32, align 4
  %bIsNaN = alloca i32, align 4
  %bIsSignalingNaN = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i32* %aIsNaN to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %aIsSignalingNaN to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %bIsNaN to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i32* %bIsSignalingNaN to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = load i64, i64* %a.addr, align 8
  %call = call i32 @float64_is_nan(i64 %4)
  store i32 %call, i32* %aIsNaN, align 4
  %5 = load i64, i64* %a.addr, align 8
  %call1 = call i32 @float64_is_signaling_nan(i64 %5)
  store i32 %call1, i32* %aIsSignalingNaN, align 4
  %6 = load i64, i64* %b.addr, align 8
  %call2 = call i32 @float64_is_nan(i64 %6)
  store i32 %call2, i32* %bIsNaN, align 4
  %7 = load i64, i64* %b.addr, align 8
  %call3 = call i32 @float64_is_signaling_nan(i64 %7)
  store i32 %call3, i32* %bIsSignalingNaN, align 4
  %8 = load i64, i64* %a.addr, align 8
  %or = or i64 %8, 2251799813685248
  store i64 %or, i64* %a.addr, align 8
  %9 = load i64, i64* %b.addr, align 8
  %or4 = or i64 %9, 2251799813685248
  store i64 %or4, i64* %b.addr, align 8
  %10 = load i32, i32* %aIsSignalingNaN, align 4
  %11 = load i32, i32* %bIsSignalingNaN, align 4
  %or5 = or i32 %10, %11
  %tobool = icmp ne i32 %or5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %12 = load i32, i32* %bIsSignalingNaN, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %13 = load i64, i64* %b.addr, align 8
  br label %cond.end15

cond.false:                                       ; preds = %if.end
  %14 = load i32, i32* %aIsSignalingNaN, align 4
  %tobool7 = icmp ne i32 %14, 0
  br i1 %tobool7, label %cond.true8, label %cond.false9

cond.true8:                                       ; preds = %cond.false
  %15 = load i64, i64* %a.addr, align 8
  br label %cond.end13

cond.false9:                                      ; preds = %cond.false
  %16 = load i32, i32* %bIsNaN, align 4
  %tobool10 = icmp ne i32 %16, 0
  br i1 %tobool10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %cond.false9
  %17 = load i64, i64* %b.addr, align 8
  br label %cond.end

cond.false12:                                     ; preds = %cond.false9
  %18 = load i64, i64* %a.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false12, %cond.true11
  %cond = phi i64 [ %17, %cond.true11 ], [ %18, %cond.false12 ]
  br label %cond.end13

cond.end13:                                       ; preds = %cond.end, %cond.true8
  %cond14 = phi i64 [ %15, %cond.true8 ], [ %cond, %cond.end ]
  br label %cond.end15

cond.end15:                                       ; preds = %cond.end13, %cond.true
  %cond16 = phi i64 [ %13, %cond.true ], [ %cond14, %cond.end13 ]
  %19 = bitcast i32* %bIsSignalingNaN to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #5
  %20 = bitcast i32* %bIsNaN to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
  %21 = bitcast i32* %aIsSignalingNaN to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5
  %22 = bitcast i32* %aIsNaN to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #5
  ret i64 %cond16
}

; Function Attrs: nounwind
define i64 @packFloat64(i32 %zSign, i32 %zExp, i64 %zSig) #0 {
entry:
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i64, align 8
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i64 %zSig, i64* %zSig.addr, align 8
  %0 = load i32, i32* %zSign.addr, align 4
  %conv = sext i32 %0 to i64
  %shl = shl i64 %conv, 63
  %1 = load i32, i32* %zExp.addr, align 4
  %conv1 = sext i32 %1 to i64
  %shl2 = shl i64 %conv1, 52
  %add = add i64 %shl, %shl2
  %2 = load i64, i64* %zSig.addr, align 8
  %add3 = add i64 %add, %2
  ret i64 %add3
}

; Function Attrs: nounwind
define void @shift64RightJamming(i64 %a, i32 %count, i64* %zPtr) #0 {
entry:
  %a.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  %zPtr.addr = alloca i64*, align 8
  %z = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i32 %count, i32* %count.addr, align 4
  store i64* %zPtr, i64** %zPtr.addr, align 8
  %0 = bitcast i64* %z to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i64, i64* %a.addr, align 8
  store i64 %2, i64* %z, align 8
  br label %if.end8

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %3, 64
  br i1 %cmp1, label %if.then2, label %if.else5

if.then2:                                         ; preds = %if.else
  %4 = load i64, i64* %a.addr, align 8
  %5 = load i32, i32* %count.addr, align 4
  %sh_prom = zext i32 %5 to i64
  %shr = lshr i64 %4, %sh_prom
  %6 = load i64, i64* %a.addr, align 8
  %7 = load i32, i32* %count.addr, align 4
  %sub = sub i32 0, %7
  %and = and i32 %sub, 63
  %sh_prom3 = zext i32 %and to i64
  %shl = shl i64 %6, %sh_prom3
  %cmp4 = icmp ne i64 %shl, 0
  %conv = zext i1 %cmp4 to i64
  %or = or i64 %shr, %conv
  store i64 %or, i64* %z, align 8
  br label %if.end

if.else5:                                         ; preds = %if.else
  %8 = load i64, i64* %a.addr, align 8
  %cmp6 = icmp ne i64 %8, 0
  %conv7 = zext i1 %cmp6 to i64
  store i64 %conv7, i64* %z, align 8
  br label %if.end

if.end:                                           ; preds = %if.else5, %if.then2
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %9 = load i64, i64* %z, align 8
  %10 = load i64*, i64** %zPtr.addr, align 8
  store i64 %9, i64* %10, align 8
  %11 = bitcast i64* %z to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #5
  ret void
}

; Function Attrs: nounwind
define internal i64 @normalizeRoundAndPackFloat64(i32 %zSign, i32 %zExp, i64 %zSig) #0 {
entry:
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i64, align 8
  %shiftCount = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i64 %zSig, i64* %zSig.addr, align 8
  %0 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load i64, i64* %zSig.addr, align 8
  %call = call i32 @countLeadingZeros64(i64 %1)
  %sub = sub i32 %call, 1
  store i32 %sub, i32* %shiftCount, align 4
  %2 = load i32, i32* %zSign.addr, align 4
  %3 = load i32, i32* %zExp.addr, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %sub1 = sub i32 %3, %4
  %5 = load i64, i64* %zSig.addr, align 8
  %6 = load i32, i32* %shiftCount, align 4
  %sh_prom = zext i32 %6 to i64
  %shl = shl i64 %5, %sh_prom
  %call2 = call i64 @roundAndPackFloat64(i32 %2, i32 %sub1, i64 %shl)
  %7 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #5
  ret i64 %call2
}

; Function Attrs: nounwind
define internal i32 @countLeadingZeros64(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  %shiftCount = alloca i32, align 4
  store i64 %a, i64* %a.addr, align 8
  %0 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  store i32 0, i32* %shiftCount, align 4
  %1 = load i64, i64* %a.addr, align 8
  %cmp = icmp ult i64 %1, 4294967296
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %shiftCount, align 4
  %add = add i32 %2, 32
  store i32 %add, i32* %shiftCount, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i64, i64* %a.addr, align 8
  %shr = lshr i64 %3, 32
  store i64 %shr, i64* %a.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i64, i64* %a.addr, align 8
  %conv = trunc i64 %4 to i32
  %call = call i32 @countLeadingZeros32(i32 %conv)
  %5 = load i32, i32* %shiftCount, align 4
  %add1 = add i32 %5, %call
  store i32 %add1, i32* %shiftCount, align 4
  %6 = load i32, i32* %shiftCount, align 4
  %7 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #5
  ret i32 %6
}

; Function Attrs: nounwind
define internal i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp, i64 %zSig) #0 {
entry:
  %retval = alloca i64, align 8
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i64, align 8
  %roundingMode = alloca i32, align 4
  %roundNearestEven = alloca i32, align 4
  %isTiny = alloca i32, align 4
  %roundIncrement = alloca i32, align 4
  %roundBits = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i64 %zSig, i64* %zSig.addr, align 8
  %0 = bitcast i32* %roundingMode to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %roundNearestEven to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %isTiny to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i32* %roundIncrement to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = bitcast i32* %roundBits to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5
  %5 = load i32, i32* @float_rounding_mode, align 4
  store i32 %5, i32* %roundingMode, align 4
  %6 = load i32, i32* %roundingMode, align 4
  %cmp = icmp eq i32 %6, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %roundNearestEven, align 4
  store i32 512, i32* %roundIncrement, align 4
  %7 = load i32, i32* %roundNearestEven, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %if.end13, label %if.then

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %roundingMode, align 4
  %cmp1 = icmp eq i32 %8, 1
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end12

if.else:                                          ; preds = %if.then
  store i32 1023, i32* %roundIncrement, align 4
  %9 = load i32, i32* %zSign.addr, align 4
  %tobool3 = icmp ne i32 %9, 0
  br i1 %tobool3, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %10 = load i32, i32* %roundingMode, align 4
  %cmp5 = icmp eq i32 %10, 2
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then4
  br label %if.end11

if.else7:                                         ; preds = %if.else
  %11 = load i32, i32* %roundingMode, align 4
  %cmp8 = icmp eq i32 %11, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else7
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.else7
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then2
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %entry
  %12 = load i64, i64* %zSig.addr, align 8
  %and = and i64 %12, 1023
  %conv14 = trunc i64 %and to i32
  store i32 %conv14, i32* %roundBits, align 4
  %13 = load i32, i32* %zExp.addr, align 4
  %conv15 = trunc i32 %13 to i16
  %conv16 = zext i16 %conv15 to i32
  %cmp17 = icmp sle i32 2045, %conv16
  br i1 %cmp17, label %if.then18, label %if.end41

if.then18:                                        ; preds = %if.end13
  %14 = load i32, i32* %zExp.addr, align 4
  %cmp19 = icmp slt i32 2045, %14
  br i1 %cmp19, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then18
  %15 = load i32, i32* %zExp.addr, align 4
  %cmp21 = icmp eq i32 %15, 2045
  br i1 %cmp21, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %lor.lhs.false
  %16 = load i64, i64* %zSig.addr, align 8
  %17 = load i32, i32* %roundIncrement, align 4
  %conv23 = sext i32 %17 to i64
  %add = add i64 %16, %conv23
  %cmp24 = icmp slt i64 %add, 0
  br i1 %cmp24, label %if.then26, label %if.end29

if.then26:                                        ; preds = %land.lhs.true, %if.then18
  call void @float_raise(i32 9)
  %18 = load i32, i32* %zSign.addr, align 4
  %call = call i64 @packFloat64(i32 %18, i32 2047, i64 0)
  %19 = load i32, i32* %roundIncrement, align 4
  %cmp27 = icmp eq i32 %19, 0
  %conv28 = zext i1 %cmp27 to i64
  %sub = sub i64 %call, %conv28
  store i64 %sub, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end29:                                         ; preds = %land.lhs.true, %lor.lhs.false
  %20 = load i32, i32* %zExp.addr, align 4
  %cmp30 = icmp slt i32 %20, 0
  br i1 %cmp30, label %if.then31, label %if.end40

if.then31:                                        ; preds = %if.end29
  store i32 1, i32* %isTiny, align 4
  %21 = load i64, i64* %zSig.addr, align 8
  %22 = load i32, i32* %zExp.addr, align 4
  %sub32 = sub i32 0, %22
  call void @shift64RightJamming(i64 %21, i32 %sub32, i64* %zSig.addr)
  store i32 0, i32* %zExp.addr, align 4
  %23 = load i64, i64* %zSig.addr, align 8
  %and33 = and i64 %23, 1023
  %conv34 = trunc i64 %and33 to i32
  store i32 %conv34, i32* %roundBits, align 4
  %24 = load i32, i32* %isTiny, align 4
  %tobool35 = icmp ne i32 %24, 0
  br i1 %tobool35, label %land.lhs.true36, label %if.end39

land.lhs.true36:                                  ; preds = %if.then31
  %25 = load i32, i32* %roundBits, align 4
  %tobool37 = icmp ne i32 %25, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %land.lhs.true36
  call void @float_raise(i32 4)
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %land.lhs.true36, %if.then31
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end29
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.end13
  %26 = load i32, i32* %roundBits, align 4
  %tobool42 = icmp ne i32 %26, 0
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end41
  %27 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %27, 1
  store i32 %or, i32* @float_exception_flags, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.end41
  %28 = load i64, i64* %zSig.addr, align 8
  %29 = load i32, i32* %roundIncrement, align 4
  %conv45 = sext i32 %29 to i64
  %add46 = add i64 %28, %conv45
  %shr = lshr i64 %add46, 10
  store i64 %shr, i64* %zSig.addr, align 8
  %30 = load i32, i32* %roundBits, align 4
  %xor = xor i32 %30, 512
  %cmp47 = icmp eq i32 %xor, 0
  %conv48 = zext i1 %cmp47 to i32
  %31 = load i32, i32* %roundNearestEven, align 4
  %and49 = and i32 %conv48, %31
  %neg = xor i32 %and49, -1
  %conv50 = sext i32 %neg to i64
  %32 = load i64, i64* %zSig.addr, align 8
  %and51 = and i64 %32, %conv50
  store i64 %and51, i64* %zSig.addr, align 8
  %33 = load i64, i64* %zSig.addr, align 8
  %cmp52 = icmp eq i64 %33, 0
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end44
  store i32 0, i32* %zExp.addr, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.end44
  %34 = load i32, i32* %zSign.addr, align 4
  %35 = load i32, i32* %zExp.addr, align 4
  %36 = load i64, i64* %zSig.addr, align 8
  %call55 = call i64 @packFloat64(i32 %34, i32 %35, i64 %36)
  store i64 %call55, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end54, %if.then26
  %37 = bitcast i32* %roundBits to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #5
  %38 = bitcast i32* %roundIncrement to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #5
  %39 = bitcast i32* %isTiny to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #5
  %40 = bitcast i32* %roundNearestEven to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #5
  %41 = bitcast i32* %roundingMode to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #5
  %42 = load i64, i64* %retval, align 8
  ret i64 %42
}

; Function Attrs: nounwind
define internal i32 @countLeadingZeros32(i32 %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  store i32 0, i32* %shiftCount, align 4
  %1 = load i32, i32* %a.addr, align 4
  %cmp = icmp ult i32 %1, 65536
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %shiftCount, align 4
  %add = add i32 %2, 16
  store i32 %add, i32* %shiftCount, align 4
  %3 = load i32, i32* %a.addr, align 4
  %shl = shl i32 %3, 16
  store i32 %shl, i32* %a.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp ult i32 %4, 16777216
  br i1 %cmp1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %5 = load i32, i32* %shiftCount, align 4
  %add3 = add i32 %5, 8
  store i32 %add3, i32* %shiftCount, align 4
  %6 = load i32, i32* %a.addr, align 4
  %shl4 = shl i32 %6, 8
  store i32 %shl4, i32* %a.addr, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %7 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %7, 24
  %idxprom = zext i32 %shr to i64
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  %9 = load i32, i32* %shiftCount, align 4
  %add6 = add i32 %9, %8
  store i32 %add6, i32* %shiftCount, align 4
  %10 = load i32, i32* %shiftCount, align 4
  %11 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #5
  ret i32 %10
}

; Function Attrs: nounwind
define i32 @float64_is_nan(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64, i64* %a.addr, align 8
  %shl = shl i64 %0, 1
  %cmp = icmp ult i64 -9007199254740992, %shl
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: nounwind
define i32 @float64_is_signaling_nan(i64 %a) #0 {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64, i64* %a.addr, align 8
  %shr = lshr i64 %0, 51
  %and = and i64 %shr, 4095
  %cmp = icmp eq i64 %and, 4094
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i64, i64* %a.addr, align 8
  %and1 = and i64 %1, 2251799813685247
  %tobool = icmp ne i64 %and1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind
define internal void @normalizeFloat64Subnormal(i64 %aSig, i32* %zExpPtr, i64* %zSigPtr) #0 {
entry:
  %aSig.addr = alloca i64, align 8
  %zExpPtr.addr = alloca i32*, align 8
  %zSigPtr.addr = alloca i64*, align 8
  %shiftCount = alloca i32, align 4
  store i64 %aSig, i64* %aSig.addr, align 8
  store i32* %zExpPtr, i32** %zExpPtr.addr, align 8
  store i64* %zSigPtr, i64** %zSigPtr.addr, align 8
  %0 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load i64, i64* %aSig.addr, align 8
  %call = call i32 @countLeadingZeros64(i64 %1)
  %sub = sub i32 %call, 11
  store i32 %sub, i32* %shiftCount, align 4
  %2 = load i64, i64* %aSig.addr, align 8
  %3 = load i32, i32* %shiftCount, align 4
  %sh_prom = zext i32 %3 to i64
  %shl = shl i64 %2, %sh_prom
  %4 = load i64*, i64** %zSigPtr.addr, align 8
  store i64 %shl, i64* %4, align 8
  %5 = load i32, i32* %shiftCount, align 4
  %sub1 = sub i32 1, %5
  %6 = load i32*, i32** %zExpPtr.addr, align 8
  store i32 %sub1, i32* %6, align 4
  %7 = bitcast i32* %shiftCount to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #5
  ret void
}

; Function Attrs: nounwind
define internal i64 @estimateDiv128To64(i64 %a0, i64 %a1, i64 %b) #0 {
entry:
  %retval = alloca i64, align 8
  %a0.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %b0 = alloca i64, align 8
  %b1 = alloca i64, align 8
  %rem0 = alloca i64, align 8
  %rem1 = alloca i64, align 8
  %term0 = alloca i64, align 8
  %term1 = alloca i64, align 8
  %z = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store i64 %a0, i64* %a0.addr, align 8
  store i64 %a1, i64* %a1.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = bitcast i64* %b0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = bitcast i64* %b1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = bitcast i64* %rem0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5
  %3 = bitcast i64* %rem1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = bitcast i64* %term0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i64* %term1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i64* %z to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = load i64, i64* %b.addr, align 8
  %8 = load i64, i64* %a0.addr, align 8
  %cmp = icmp ule i64 %7, %8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end:                                           ; preds = %entry
  %9 = load i64, i64* %b.addr, align 8
  %shr = lshr i64 %9, 32
  store i64 %shr, i64* %b0, align 8
  %10 = load i64, i64* %b0, align 8
  %shl = shl i64 %10, 32
  %11 = load i64, i64* %a0.addr, align 8
  %cmp1 = icmp ule i64 %shl, %11
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %12 = load i64, i64* %a0.addr, align 8
  %13 = load i64, i64* %b0, align 8
  %div = udiv i64 %12, %13
  %shl2 = shl i64 %div, 32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ -4294967296, %cond.true ], [ %shl2, %cond.false ]
  store i64 %cond, i64* %z, align 8
  %14 = load i64, i64* %b.addr, align 8
  %15 = load i64, i64* %z, align 8
  call void @mul64To128(i64 %14, i64 %15, i64* %term0, i64* %term1)
  %16 = load i64, i64* %a0.addr, align 8
  %17 = load i64, i64* %a1.addr, align 8
  %18 = load i64, i64* %term0, align 8
  %19 = load i64, i64* %term1, align 8
  call void @sub128(i64 %16, i64 %17, i64 %18, i64 %19, i64* %rem0, i64* %rem1)
  br label %VITIS_LOOP_224_1

VITIS_LOOP_224_1:                                 ; preds = %cond.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %VITIS_LOOP_224_1
  %20 = load i64, i64* %rem0, align 8
  %cmp3 = icmp slt i64 %20, 0
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %21 = load i64, i64* %z, align 8
  %sub = sub i64 %21, 4294967296
  store i64 %sub, i64* %z, align 8
  %22 = load i64, i64* %b.addr, align 8
  %shl4 = shl i64 %22, 32
  store i64 %shl4, i64* %b1, align 8
  %23 = load i64, i64* %rem0, align 8
  %24 = load i64, i64* %rem1, align 8
  %25 = load i64, i64* %b0, align 8
  %26 = load i64, i64* %b1, align 8
  call void @add128(i64 %23, i64 %24, i64 %25, i64 %26, i64* %rem0, i64* %rem1)
  br label %while.cond, !llvm.loop !10

while.end:                                        ; preds = %while.cond
  %27 = load i64, i64* %rem0, align 8
  %shl5 = shl i64 %27, 32
  %28 = load i64, i64* %rem1, align 8
  %shr6 = lshr i64 %28, 32
  %or = or i64 %shl5, %shr6
  store i64 %or, i64* %rem0, align 8
  %29 = load i64, i64* %b0, align 8
  %shl7 = shl i64 %29, 32
  %30 = load i64, i64* %rem0, align 8
  %cmp8 = icmp ule i64 %shl7, %30
  br i1 %cmp8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %while.end
  br label %cond.end12

cond.false10:                                     ; preds = %while.end
  %31 = load i64, i64* %rem0, align 8
  %32 = load i64, i64* %b0, align 8
  %div11 = udiv i64 %31, %32
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false10, %cond.true9
  %cond13 = phi i64 [ 4294967295, %cond.true9 ], [ %div11, %cond.false10 ]
  %33 = load i64, i64* %z, align 8
  %or14 = or i64 %33, %cond13
  store i64 %or14, i64* %z, align 8
  %34 = load i64, i64* %z, align 8
  store i64 %34, i64* %retval, align 8
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %cond.end12, %if.then
  %35 = bitcast i64* %z to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %35) #5
  %36 = bitcast i64* %term1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #5
  %37 = bitcast i64* %term0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #5
  %38 = bitcast i64* %rem1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #5
  %39 = bitcast i64* %rem0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #5
  %40 = bitcast i64* %b1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #5
  %41 = bitcast i64* %b0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #5
  %42 = load i64, i64* %retval, align 8
  ret i64 %42
}

; Function Attrs: nounwind
define void @mul64To128(i64 %a, i64 %b, i64* %z0Ptr, i64* %z1Ptr) #0 {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %z0Ptr.addr = alloca i64*, align 8
  %z1Ptr.addr = alloca i64*, align 8
  %aHigh = alloca i32, align 4
  %aLow = alloca i32, align 4
  %bHigh = alloca i32, align 4
  %bLow = alloca i32, align 4
  %z0 = alloca i64, align 8
  %zMiddleA = alloca i64, align 8
  %zMiddleB = alloca i64, align 8
  %z1 = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  store i64* %z0Ptr, i64** %z0Ptr.addr, align 8
  store i64* %z1Ptr, i64** %z1Ptr.addr, align 8
  %0 = bitcast i32* %aHigh to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %aLow to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %bHigh to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = bitcast i32* %bLow to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = bitcast i64* %z0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i64* %zMiddleA to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i64* %zMiddleB to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = bitcast i64* %z1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #5
  %8 = load i64, i64* %a.addr, align 8
  %conv = trunc i64 %8 to i32
  store i32 %conv, i32* %aLow, align 4
  %9 = load i64, i64* %a.addr, align 8
  %shr = lshr i64 %9, 32
  %conv1 = trunc i64 %shr to i32
  store i32 %conv1, i32* %aHigh, align 4
  %10 = load i64, i64* %b.addr, align 8
  %conv2 = trunc i64 %10 to i32
  store i32 %conv2, i32* %bLow, align 4
  %11 = load i64, i64* %b.addr, align 8
  %shr3 = lshr i64 %11, 32
  %conv4 = trunc i64 %shr3 to i32
  store i32 %conv4, i32* %bHigh, align 4
  %12 = load i32, i32* %aLow, align 4
  %conv5 = zext i32 %12 to i64
  %13 = load i32, i32* %bLow, align 4
  %conv6 = zext i32 %13 to i64
  %mul = mul i64 %conv5, %conv6
  store i64 %mul, i64* %z1, align 8
  %14 = load i32, i32* %aLow, align 4
  %conv7 = zext i32 %14 to i64
  %15 = load i32, i32* %bHigh, align 4
  %conv8 = zext i32 %15 to i64
  %mul9 = mul i64 %conv7, %conv8
  store i64 %mul9, i64* %zMiddleA, align 8
  %16 = load i32, i32* %aHigh, align 4
  %conv10 = zext i32 %16 to i64
  %17 = load i32, i32* %bLow, align 4
  %conv11 = zext i32 %17 to i64
  %mul12 = mul i64 %conv10, %conv11
  store i64 %mul12, i64* %zMiddleB, align 8
  %18 = load i32, i32* %aHigh, align 4
  %conv13 = zext i32 %18 to i64
  %19 = load i32, i32* %bHigh, align 4
  %conv14 = zext i32 %19 to i64
  %mul15 = mul i64 %conv13, %conv14
  store i64 %mul15, i64* %z0, align 8
  %20 = load i64, i64* %zMiddleB, align 8
  %21 = load i64, i64* %zMiddleA, align 8
  %add = add i64 %21, %20
  store i64 %add, i64* %zMiddleA, align 8
  %22 = load i64, i64* %zMiddleA, align 8
  %23 = load i64, i64* %zMiddleB, align 8
  %cmp = icmp ult i64 %22, %23
  %conv16 = zext i1 %cmp to i64
  %shl = shl i64 %conv16, 32
  %24 = load i64, i64* %zMiddleA, align 8
  %shr17 = lshr i64 %24, 32
  %add18 = add i64 %shl, %shr17
  %25 = load i64, i64* %z0, align 8
  %add19 = add i64 %25, %add18
  store i64 %add19, i64* %z0, align 8
  %26 = load i64, i64* %zMiddleA, align 8
  %shl20 = shl i64 %26, 32
  store i64 %shl20, i64* %zMiddleA, align 8
  %27 = load i64, i64* %zMiddleA, align 8
  %28 = load i64, i64* %z1, align 8
  %add21 = add i64 %28, %27
  store i64 %add21, i64* %z1, align 8
  %29 = load i64, i64* %z1, align 8
  %30 = load i64, i64* %zMiddleA, align 8
  %cmp22 = icmp ult i64 %29, %30
  %conv23 = zext i1 %cmp22 to i64
  %31 = load i64, i64* %z0, align 8
  %add24 = add i64 %31, %conv23
  store i64 %add24, i64* %z0, align 8
  %32 = load i64, i64* %z1, align 8
  %33 = load i64*, i64** %z1Ptr.addr, align 8
  store i64 %32, i64* %33, align 8
  %34 = load i64, i64* %z0, align 8
  %35 = load i64*, i64** %z0Ptr.addr, align 8
  store i64 %34, i64* %35, align 8
  %36 = bitcast i64* %z1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %36) #5
  %37 = bitcast i64* %zMiddleB to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %37) #5
  %38 = bitcast i64* %zMiddleA to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #5
  %39 = bitcast i64* %z0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #5
  %40 = bitcast i32* %bLow to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #5
  %41 = bitcast i32* %bHigh to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #5
  %42 = bitcast i32* %aLow to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #5
  %43 = bitcast i32* %aHigh to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #5
  ret void
}

; Function Attrs: nounwind
define void @sub128(i64 %a0, i64 %a1, i64 %b0, i64 %b1, i64* %z0Ptr, i64* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %b0.addr = alloca i64, align 8
  %b1.addr = alloca i64, align 8
  %z0Ptr.addr = alloca i64*, align 8
  %z1Ptr.addr = alloca i64*, align 8
  store i64 %a0, i64* %a0.addr, align 8
  store i64 %a1, i64* %a1.addr, align 8
  store i64 %b0, i64* %b0.addr, align 8
  store i64 %b1, i64* %b1.addr, align 8
  store i64* %z0Ptr, i64** %z0Ptr.addr, align 8
  store i64* %z1Ptr, i64** %z1Ptr.addr, align 8
  %0 = load i64, i64* %a1.addr, align 8
  %1 = load i64, i64* %b1.addr, align 8
  %sub = sub i64 %0, %1
  %2 = load i64*, i64** %z1Ptr.addr, align 8
  store i64 %sub, i64* %2, align 8
  %3 = load i64, i64* %a0.addr, align 8
  %4 = load i64, i64* %b0.addr, align 8
  %sub1 = sub i64 %3, %4
  %5 = load i64, i64* %a1.addr, align 8
  %6 = load i64, i64* %b1.addr, align 8
  %cmp = icmp ult i64 %5, %6
  %conv = zext i1 %cmp to i64
  %sub2 = sub i64 %sub1, %conv
  %7 = load i64*, i64** %z0Ptr.addr, align 8
  store i64 %sub2, i64* %7, align 8
  ret void
}

; Function Attrs: nounwind
define void @add128(i64 %a0, i64 %a1, i64 %b0, i64 %b1, i64* %z0Ptr, i64* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i64, align 8
  %a1.addr = alloca i64, align 8
  %b0.addr = alloca i64, align 8
  %b1.addr = alloca i64, align 8
  %z0Ptr.addr = alloca i64*, align 8
  %z1Ptr.addr = alloca i64*, align 8
  %z1 = alloca i64, align 8
  store i64 %a0, i64* %a0.addr, align 8
  store i64 %a1, i64* %a1.addr, align 8
  store i64 %b0, i64* %b0.addr, align 8
  store i64 %b1, i64* %b1.addr, align 8
  store i64* %z0Ptr, i64** %z0Ptr.addr, align 8
  store i64* %z1Ptr, i64** %z1Ptr.addr, align 8
  %0 = bitcast i64* %z1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load i64, i64* %a1.addr, align 8
  %2 = load i64, i64* %b1.addr, align 8
  %add = add i64 %1, %2
  store i64 %add, i64* %z1, align 8
  %3 = load i64, i64* %z1, align 8
  %4 = load i64*, i64** %z1Ptr.addr, align 8
  store i64 %3, i64* %4, align 8
  %5 = load i64, i64* %a0.addr, align 8
  %6 = load i64, i64* %b0.addr, align 8
  %add1 = add i64 %5, %6
  %7 = load i64, i64* %z1, align 8
  %8 = load i64, i64* %a1.addr, align 8
  %cmp = icmp ult i64 %7, %8
  %conv = zext i1 %cmp to i64
  %add2 = add i64 %add1, %conv
  %9 = load i64*, i64** %z0Ptr.addr, align 8
  store i64 %add2, i64* %9, align 8
  %10 = bitcast i64* %z1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #3 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %inputVector = alloca [36 x i64], align 16
  %outputVector = alloca [36 x i64], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %arraydecay = getelementptr inbounds [36 x i64], [36 x i64]* %inputVector, i32 0, i32 0
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  call void @populateInput(i64* %arraydecay, i8* %1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 36
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx1 = getelementptr inbounds [36 x i64], [36 x i64]* %inputVector, i64 0, i64 %idxprom
  %4 = load i64, i64* %arrayidx1, align 8
  %call = call i64 @local_sin(i64 %4)
  %5 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [36 x i64], [36 x i64]* %outputVector, i64 0, i64 %idxprom2
  store i64 %call, i64* %arrayidx3, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [36 x i64], [36 x i64]* %outputVector, i32 0, i32 0
  %7 = load i8**, i8*** %argv.addr, align 8
  %arrayidx5 = getelementptr inbounds i8*, i8** %7, i64 2
  %8 = load i8*, i8** %arrayidx5, align 8
  call void @populateOutput(i64* %arraydecay4, i8* %8)
  ret i32 0
}

declare void @populateInput(i64*, i8*) #4

declare void @populateOutput(i64*, i8*) #4

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.top.func"="local_sin" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5}
!5 = !{!"fpga.top", !"user"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"VITIS_LOOP_56_1"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"VITIS_LOOP_602_1"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.name", !"VITIS_LOOP_224_1"}
