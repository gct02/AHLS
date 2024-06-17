; ModuleID = '../src/adpcm_host.c'
source_filename = "../src/adpcm_host.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@test_data = common global [8000 x i32] zeroinitializer, align 16
@compressed = common global [4000 x i32] zeroinitializer, align 16
@result = common global [8000 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  call void @populateInput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32 8000, i8* %1)
  call void @adpcm_main(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32* getelementptr inbounds ([4000 x i32], [4000 x i32]* @compressed, i32 0, i32 0), i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0))
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2
  %3 = load i8*, i8** %arrayidx1, align 8
  call void @populateOutput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0), i32 4000, i8* %3)
  ret i32 0
}

declare void @populateInput(i32*, i32, i8*) #1

declare void @adpcm_main(i32*, i32*, i32*) #1

declare void @populateOutput(i32*, i32, i8*) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
