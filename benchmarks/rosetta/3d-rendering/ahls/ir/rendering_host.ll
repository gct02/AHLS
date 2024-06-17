; ModuleID = '../src/rendering_host.cpp'
source_filename = "../src/rendering_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num_3d_tri = alloca i32, align 4
  %triangle_3ds = alloca %struct.Triangle_3D*, align 8
  %output = alloca [256 x [256 x i8]], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2
  %1 = load i8*, i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %1) #3
  store i32 %call, i32* %num_3d_tri, align 4
  store %struct.Triangle_3D* null, %struct.Triangle_3D** %triangle_3ds, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 1
  %3 = load i8*, i8** %arrayidx1, align 8
  %4 = load i32, i32* %num_3d_tri, align 4
  call void @populateInput(i8* %3, %struct.Triangle_3D** %triangle_3ds, i32 %4)
  %5 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds, align 8
  %arraydecay = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0
  %6 = load i32, i32* %num_3d_tri, align 4
  call void @_Z9renderingP11Triangle_3DPA256_hi(%struct.Triangle_3D* %5, [256 x i8]* %arraydecay, i32 %6)
  %arraydecay2 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0
  %7 = load i8**, i8*** %argv.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %7, i64 3
  %8 = load i8*, i8** %arrayidx3, align 8
  call void @populateOutput([256 x i8]* %arraydecay2, i8* %8)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(i8*) #1

declare void @populateInput(i8*, %struct.Triangle_3D**, i32) #2

declare void @_Z9renderingP11Triangle_3DPA256_hi(%struct.Triangle_3D*, [256 x i8]*, i32) #2

declare void @populateOutput([256 x i8]*, i8*) #2

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
