; ModuleID = '../src/spam_filter_host.cpp'
source_filename = "../src/spam_filter_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdout = external global %struct._IO_FILE*, align 8

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %data_points = alloca float*, align 8
  %labels = alloca i8*, align 8
  %param_vector = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @setbuf(%struct._IO_FILE* %0, i8* null) #5
  %call = call i8* @_Znam(i64 20480000) #6
  %1 = bitcast i8* %call to float*
  store float* %1, float** %data_points, align 8
  %call1 = call i8* @_Znam(i64 5000) #6
  store i8* %call1, i8** %labels, align 8
  %call2 = call i8* @_Znam(i64 4096) #6
  %2 = bitcast i8* %call2 to float*
  store float* %2, float** %param_vector, align 8
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1
  %4 = load i8*, i8** %arrayidx, align 8
  %5 = load i8**, i8*** %argv.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i64 2
  %6 = load i8*, i8** %arrayidx3, align 8
  %7 = load float*, float** %data_points, align 8
  %8 = load i8*, i8** %labels, align 8
  call void @populateInput(i8* %4, i8* %6, float* %7, i8* %8)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %9, 1024
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load float*, float** %param_vector, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx4 = getelementptr inbounds float, float* %10, i64 %idxprom
  store float 0.000000e+00, float* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load float*, float** %data_points, align 8
  %14 = load i8*, i8** %labels, align 8
  %15 = load float*, float** %param_vector, align 8
  call void @_Z5SgdLRPfPhS_(float* %13, i8* %14, float* %15)
  %16 = load float*, float** %param_vector, align 8
  %17 = load float*, float** %data_points, align 8
  %18 = load i8*, i8** %labels, align 8
  call void @populateOutput(float* %16, float* %17, i8* %18)
  %19 = load float*, float** %data_points, align 8
  %isnull = icmp eq float* %19, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  %20 = bitcast float* %19 to i8*
  call void @_ZdaPv(i8* %20) #7
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  %21 = load i8*, i8** %labels, align 8
  %isnull5 = icmp eq i8* %21, null
  br i1 %isnull5, label %delete.end7, label %delete.notnull6

delete.notnull6:                                  ; preds = %delete.end
  call void @_ZdaPv(i8* %21) #7
  br label %delete.end7

delete.end7:                                      ; preds = %delete.notnull6, %delete.end
  %22 = load float*, float** %param_vector, align 8
  %isnull8 = icmp eq float* %22, null
  br i1 %isnull8, label %delete.end10, label %delete.notnull9

delete.notnull9:                                  ; preds = %delete.end7
  %23 = bitcast float* %22 to i8*
  call void @_ZdaPv(i8* %23) #7
  br label %delete.end10

delete.end10:                                     ; preds = %delete.notnull9, %delete.end7
  ret i32 0
}

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #2

declare void @populateInput(i8*, i8*, float*, i8*) #3

declare void @_Z5SgdLRPfPhS_(float*, i8*, float*) #3

declare void @populateOutput(float*, float*, i8*) #3

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #4

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { builtin }
attributes #7 = { builtin nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
