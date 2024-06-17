; ModuleID = '../src/face_detect_host.cpp'
source_filename = "../src/face_detect_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %input_image = alloca [240 x [320 x i8]], align 16
  %result_x = alloca [100 x i32], align 16
  %result_y = alloca [100 x i32], align 16
  %result_w = alloca [100 x i32], align 16
  %result_h = alloca [100 x i32], align 16
  %res_size = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %res_size, align 4
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  %arraydecay = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %input_image, i32 0, i32 0
  call void @populateInput(i8* %1, [320 x i8]* %arraydecay)
  %arraydecay1 = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %input_image, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %result_x, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %result_y, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %result_w, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %result_h, i32 0, i32 0
  call void @_Z11face_detectPA320_hPiS1_S1_S1_S1_([320 x i8]* %arraydecay1, i32* %arraydecay2, i32* %arraydecay3, i32* %arraydecay4, i32* %arraydecay5, i32* %res_size)
  %2 = load i32, i32* %res_size, align 4
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %result_x, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %result_y, i32 0, i32 0
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %result_w, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %result_h, i32 0, i32 0
  %arraydecay10 = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %input_image, i32 0, i32 0
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx11 = getelementptr inbounds i8*, i8** %3, i64 2
  %4 = load i8*, i8** %arrayidx11, align 8
  call void @populateOutput(i32 %2, i32* %arraydecay6, i32* %arraydecay7, i32* %arraydecay8, i32* %arraydecay9, [320 x i8]* %arraydecay10, i8* %4)
  ret i32 0
}

declare void @populateInput(i8*, [320 x i8]*) #1

declare void @_Z11face_detectPA320_hPiS1_S1_S1_S1_([320 x i8]*, i32*, i32*, i32*, i32*, i32*) #1

declare void @populateOutput(i32, i32*, i32*, i32*, i32*, [320 x i8]*, i8*) #1

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
