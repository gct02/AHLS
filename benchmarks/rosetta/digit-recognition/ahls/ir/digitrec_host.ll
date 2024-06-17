; ModuleID = '../src/digitrec_host.cpp'
source_filename = "../src/digitrec_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %training_samples = alloca [12000 x i64], align 16
  %testing_samples = alloca [2000 x i64], align 16
  %training_labels = alloca [3000 x i8], align 16
  %test_labels = alloca [500 x i8], align 16
  %result = alloca [500 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2
  %3 = load i8*, i8** %arrayidx1, align 8
  %4 = load i8**, i8*** %argv.addr, align 8
  %arrayidx2 = getelementptr inbounds i8*, i8** %4, i64 3
  %5 = load i8*, i8** %arrayidx2, align 8
  %6 = load i8**, i8*** %argv.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %6, i64 4
  %7 = load i8*, i8** %arrayidx3, align 8
  %arraydecay = getelementptr inbounds [12000 x i64], [12000 x i64]* %training_samples, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [3000 x i8], [3000 x i8]* %training_labels, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [2000 x i64], [2000 x i64]* %testing_samples, i32 0, i32 0
  %arraydecay6 = getelementptr inbounds [500 x i8], [500 x i8]* %test_labels, i32 0, i32 0
  call void @populateInput(i8* %1, i8* %3, i8* %5, i8* %7, i64* %arraydecay, i8* %arraydecay4, i64* %arraydecay5, i8* %arraydecay6)
  %arraydecay7 = getelementptr inbounds [12000 x i64], [12000 x i64]* %training_samples, i32 0, i32 0
  %arraydecay8 = getelementptr inbounds [2000 x i64], [2000 x i64]* %testing_samples, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [3000 x i8], [3000 x i8]* %training_labels, i32 0, i32 0
  %arraydecay10 = getelementptr inbounds [500 x i8], [500 x i8]* %result, i32 0, i32 0
  call void @_Z8DigitRecPKyS0_PKhPh(i64* %arraydecay7, i64* %arraydecay8, i8* %arraydecay9, i8* %arraydecay10)
  %arraydecay11 = getelementptr inbounds [500 x i8], [500 x i8]* %result, i32 0, i32 0
  %arraydecay12 = getelementptr inbounds [500 x i8], [500 x i8]* %test_labels, i32 0, i32 0
  %8 = load i8**, i8*** %argv.addr, align 8
  %arrayidx13 = getelementptr inbounds i8*, i8** %8, i64 5
  %9 = load i8*, i8** %arrayidx13, align 8
  call void @populateOutput(i8* %arraydecay11, i8* %arraydecay12, i8* %9)
  ret i32 0
}

declare void @populateInput(i8*, i8*, i8*, i8*, i64*, i8*, i64*, i8*) #1

declare void @_Z8DigitRecPKyS0_PKhPh(i64*, i64*, i8*, i8*) #1

declare void @populateOutput(i8*, i8*, i8*) #1

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
