; ModuleID = '../src/spam_filter_host.cpp'
source_filename = "../src/spam_filter_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%"class.std::allocator" = type { i8 }
%struct.timeval = type { i64, i64 }

@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [25 x i8] c"Spam Filter Application\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"Usage: %s <data file> <label file>\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"Failed to open data file %s!\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Failed to open label file %s!\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"Checking results:\0A\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"elapsed time: %lld us\0A\00", align 1

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !793 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %data_points = alloca float*, align 8
  %labels = alloca i8*, align 8
  %param_vector = alloca float*, align 8
  %str_points_filepath = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp = alloca %"class.std::allocator", align 1
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %str_labels_filepath = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp7 = alloca %"class.std::allocator", align 1
  %data_file = alloca %struct._IO_FILE*, align 8
  %label_file = alloca %struct._IO_FILE*, align 8
  %cleanup.dest.slot = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp = alloca float, align 4
  %i34 = alloca i32, align 4
  %tmp38 = alloca i32, align 4
  %i48 = alloca i64, align 8
  %start = alloca %struct.timeval, align 8
  %end = alloca %struct.timeval, align 8
  %elapsed = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !796, metadata !DIExpression()), !dbg !797
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !798, metadata !DIExpression()), !dbg !799
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !800
  call void @setbuf(%struct._IO_FILE* %0, i8* null) #6, !dbg !801
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0)), !dbg !802
  call void @llvm.dbg.declare(metadata float** %data_points, metadata !803, metadata !DIExpression()), !dbg !806
  %call1 = call i8* @_Znam(i64 20480000) #7, !dbg !807
  %1 = bitcast i8* %call1 to float*, !dbg !807
  store float* %1, float** %data_points, align 8, !dbg !806
  call void @llvm.dbg.declare(metadata i8** %labels, metadata !808, metadata !DIExpression()), !dbg !811
  %call2 = call i8* @_Znam(i64 5000) #7, !dbg !812
  store i8* %call2, i8** %labels, align 8, !dbg !811
  call void @llvm.dbg.declare(metadata float** %param_vector, metadata !813, metadata !DIExpression()), !dbg !816
  %call3 = call i8* @_Znam(i64 4096) #7, !dbg !817
  %2 = bitcast i8* %call3 to float*, !dbg !817
  store float* %2, float** %param_vector, align 8, !dbg !816
  %3 = load i32, i32* %argc.addr, align 4, !dbg !818
  %cmp = icmp slt i32 %3, 3, !dbg !820
  br i1 %cmp, label %if.then, label %if.end, !dbg !821

if.then:                                          ; preds = %entry
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !822
  %arrayidx = getelementptr inbounds i8*, i8** %4, i64 0, !dbg !822
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !822
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i8* %5), !dbg !824
  store i32 1, i32* %retval, align 4, !dbg !825
  br label %return, !dbg !825

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %str_points_filepath, metadata !826, metadata !DIExpression()), !dbg !832
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !833
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !833
  %7 = load i8*, i8** %arrayidx5, align 8, !dbg !833
  call void @_ZNSaIcEC1Ev(%"class.std::allocator"* %ref.tmp) #6, !dbg !833
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"* %str_points_filepath, i8* %7, %"class.std::allocator"* dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad, !dbg !833

invoke.cont:                                      ; preds = %if.end
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp) #6, !dbg !832
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %str_labels_filepath, metadata !834, metadata !DIExpression()), !dbg !835
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !836
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i64 2, !dbg !836
  %9 = load i8*, i8** %arrayidx6, align 8, !dbg !836
  call void @_ZNSaIcEC1Ev(%"class.std::allocator"* %ref.tmp7) #6, !dbg !836
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"* %str_labels_filepath, i8* %9, %"class.std::allocator"* dereferenceable(1) %ref.tmp7)
          to label %invoke.cont9 unwind label %lpad8, !dbg !836

invoke.cont9:                                     ; preds = %invoke.cont
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp7) #6, !dbg !835
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %data_file, metadata !837, metadata !DIExpression()), !dbg !838
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %label_file, metadata !839, metadata !DIExpression()), !dbg !840
  %call10 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %str_points_filepath) #6, !dbg !841
  %call13 = invoke noalias %struct._IO_FILE* @fopen(i8* %call10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont12 unwind label %lpad11, !dbg !842

invoke.cont12:                                    ; preds = %invoke.cont9
  store %struct._IO_FILE* %call13, %struct._IO_FILE** %data_file, align 8, !dbg !843
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8, !dbg !844
  %tobool = icmp ne %struct._IO_FILE* %10, null, !dbg !844
  br i1 %tobool, label %if.end18, label %if.then14, !dbg !846

if.then14:                                        ; preds = %invoke.cont12
  %call15 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %str_points_filepath) #6, !dbg !847
  %call17 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0), i8* %call15)
          to label %invoke.cont16 unwind label %lpad11, !dbg !849

invoke.cont16:                                    ; preds = %if.then14
  store i32 1, i32* %retval, align 4, !dbg !850
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !850

lpad:                                             ; preds = %if.end
  %11 = landingpad { i8*, i32 }
          cleanup, !dbg !851
  %12 = extractvalue { i8*, i32 } %11, 0, !dbg !851
  store i8* %12, i8** %exn.slot, align 8, !dbg !851
  %13 = extractvalue { i8*, i32 } %11, 1, !dbg !851
  store i32 %13, i32* %ehselector.slot, align 4, !dbg !851
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp) #6, !dbg !832
  br label %eh.resume, !dbg !832

lpad8:                                            ; preds = %invoke.cont
  %14 = landingpad { i8*, i32 }
          cleanup, !dbg !851
  %15 = extractvalue { i8*, i32 } %14, 0, !dbg !851
  store i8* %15, i8** %exn.slot, align 8, !dbg !851
  %16 = extractvalue { i8*, i32 } %14, 1, !dbg !851
  store i32 %16, i32* %ehselector.slot, align 4, !dbg !851
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp7) #6, !dbg !835
  br label %ehcleanup, !dbg !835

lpad11:                                           ; preds = %invoke.cont61, %invoke.cont59, %invoke.cont57, %for.end55, %for.end45, %for.body37, %if.then29, %invoke.cont23, %for.end, %for.body, %if.then14, %invoke.cont9
  %17 = landingpad { i8*, i32 }
          cleanup, !dbg !851
  %18 = extractvalue { i8*, i32 } %17, 0, !dbg !851
  store i8* %18, i8** %exn.slot, align 8, !dbg !851
  %19 = extractvalue { i8*, i32 } %17, 1, !dbg !851
  store i32 %19, i32* %ehselector.slot, align 4, !dbg !851
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %str_labels_filepath) #6, !dbg !851
  br label %ehcleanup, !dbg !851

if.end18:                                         ; preds = %invoke.cont12
  call void @llvm.dbg.declare(metadata i32* %i, metadata !852, metadata !DIExpression()), !dbg !854
  store i32 0, i32* %i, align 4, !dbg !854
  br label %for.cond, !dbg !855

for.cond:                                         ; preds = %for.inc, %if.end18
  %20 = load i32, i32* %i, align 4, !dbg !856
  %cmp19 = icmp slt i32 %20, 5120000, !dbg !858
  br i1 %cmp19, label %for.body, label %for.end, !dbg !859

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata float* %tmp, metadata !860, metadata !DIExpression()), !dbg !862
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8, !dbg !863
  %call21 = invoke i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), float* %tmp)
          to label %invoke.cont20 unwind label %lpad11, !dbg !864

invoke.cont20:                                    ; preds = %for.body
  %22 = load float, float* %tmp, align 4, !dbg !865
  %23 = load float*, float** %data_points, align 8, !dbg !866
  %24 = load i32, i32* %i, align 4, !dbg !867
  %idxprom = sext i32 %24 to i64, !dbg !866
  %arrayidx22 = getelementptr inbounds float, float* %23, i64 %idxprom, !dbg !866
  store float %22, float* %arrayidx22, align 4, !dbg !868
  br label %for.inc, !dbg !869

for.inc:                                          ; preds = %invoke.cont20
  %25 = load i32, i32* %i, align 4, !dbg !870
  %inc = add nsw i32 %25, 1, !dbg !870
  store i32 %inc, i32* %i, align 4, !dbg !870
  br label %for.cond, !dbg !871, !llvm.loop !872

for.end:                                          ; preds = %for.cond
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8, !dbg !874
  %call24 = invoke i32 @fclose(%struct._IO_FILE* %26)
          to label %invoke.cont23 unwind label %lpad11, !dbg !875

invoke.cont23:                                    ; preds = %for.end
  %call25 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %str_labels_filepath) #6, !dbg !876
  %call27 = invoke noalias %struct._IO_FILE* @fopen(i8* %call25, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont26 unwind label %lpad11, !dbg !877

invoke.cont26:                                    ; preds = %invoke.cont23
  store %struct._IO_FILE* %call27, %struct._IO_FILE** %label_file, align 8, !dbg !878
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8, !dbg !879
  %tobool28 = icmp ne %struct._IO_FILE* %27, null, !dbg !879
  br i1 %tobool28, label %if.end33, label %if.then29, !dbg !881

if.then29:                                        ; preds = %invoke.cont26
  %call30 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %str_labels_filepath) #6, !dbg !882
  %call32 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i32 0, i32 0), i8* %call30)
          to label %invoke.cont31 unwind label %lpad11, !dbg !884

invoke.cont31:                                    ; preds = %if.then29
  store i32 1, i32* %retval, align 4, !dbg !885
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !885

if.end33:                                         ; preds = %invoke.cont26
  call void @llvm.dbg.declare(metadata i32* %i34, metadata !886, metadata !DIExpression()), !dbg !888
  store i32 0, i32* %i34, align 4, !dbg !888
  br label %for.cond35, !dbg !889

for.cond35:                                       ; preds = %for.inc43, %if.end33
  %28 = load i32, i32* %i34, align 4, !dbg !890
  %cmp36 = icmp slt i32 %28, 5000, !dbg !892
  br i1 %cmp36, label %for.body37, label %for.end45, !dbg !893

for.body37:                                       ; preds = %for.cond35
  call void @llvm.dbg.declare(metadata i32* %tmp38, metadata !894, metadata !DIExpression()), !dbg !896
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8, !dbg !897
  %call40 = invoke i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i32* %tmp38)
          to label %invoke.cont39 unwind label %lpad11, !dbg !898

invoke.cont39:                                    ; preds = %for.body37
  %30 = load i32, i32* %tmp38, align 4, !dbg !899
  %conv = trunc i32 %30 to i8, !dbg !899
  %31 = load i8*, i8** %labels, align 8, !dbg !900
  %32 = load i32, i32* %i34, align 4, !dbg !901
  %idxprom41 = sext i32 %32 to i64, !dbg !900
  %arrayidx42 = getelementptr inbounds i8, i8* %31, i64 %idxprom41, !dbg !900
  store i8 %conv, i8* %arrayidx42, align 1, !dbg !902
  br label %for.inc43, !dbg !903

for.inc43:                                        ; preds = %invoke.cont39
  %33 = load i32, i32* %i34, align 4, !dbg !904
  %inc44 = add nsw i32 %33, 1, !dbg !904
  store i32 %inc44, i32* %i34, align 4, !dbg !904
  br label %for.cond35, !dbg !905, !llvm.loop !906

for.end45:                                        ; preds = %for.cond35
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8, !dbg !908
  %call47 = invoke i32 @fclose(%struct._IO_FILE* %34)
          to label %invoke.cont46 unwind label %lpad11, !dbg !909

invoke.cont46:                                    ; preds = %for.end45
  call void @llvm.dbg.declare(metadata i64* %i48, metadata !910, metadata !DIExpression()), !dbg !912
  store i64 0, i64* %i48, align 8, !dbg !912
  br label %for.cond49, !dbg !913

for.cond49:                                       ; preds = %for.inc53, %invoke.cont46
  %35 = load i64, i64* %i48, align 8, !dbg !914
  %cmp50 = icmp ult i64 %35, 1024, !dbg !916
  br i1 %cmp50, label %for.body51, label %for.end55, !dbg !917

for.body51:                                       ; preds = %for.cond49
  %36 = load float*, float** %param_vector, align 8, !dbg !918
  %37 = load i64, i64* %i48, align 8, !dbg !919
  %arrayidx52 = getelementptr inbounds float, float* %36, i64 %37, !dbg !918
  store float 0.000000e+00, float* %arrayidx52, align 4, !dbg !920
  br label %for.inc53, !dbg !918

for.inc53:                                        ; preds = %for.body51
  %38 = load i64, i64* %i48, align 8, !dbg !921
  %inc54 = add i64 %38, 1, !dbg !921
  store i64 %inc54, i64* %i48, align 8, !dbg !921
  br label %for.cond49, !dbg !922, !llvm.loop !923

for.end55:                                        ; preds = %for.cond49
  call void @llvm.dbg.declare(metadata %struct.timeval* %start, metadata !925, metadata !DIExpression()), !dbg !933
  call void @llvm.dbg.declare(metadata %struct.timeval* %end, metadata !934, metadata !DIExpression()), !dbg !935
  %call56 = call i32 @gettimeofday(%struct.timeval* %start, i8* null) #6, !dbg !936
  %39 = load float*, float** %data_points, align 8, !dbg !937
  %40 = load i8*, i8** %labels, align 8, !dbg !938
  %41 = load float*, float** %param_vector, align 8, !dbg !939
  invoke void @_Z5SgdLRPfPhS_(float* %39, i8* %40, float* %41)
          to label %invoke.cont57 unwind label %lpad11, !dbg !940

invoke.cont57:                                    ; preds = %for.end55
  %call58 = call i32 @gettimeofday(%struct.timeval* %end, i8* null) #6, !dbg !941
  %call60 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i32 0, i32 0))
          to label %invoke.cont59 unwind label %lpad11, !dbg !942

invoke.cont59:                                    ; preds = %invoke.cont57
  %42 = load float*, float** %param_vector, align 8, !dbg !943
  %43 = load float*, float** %data_points, align 8, !dbg !944
  %44 = load i8*, i8** %labels, align 8, !dbg !945
  invoke void @_Z13check_resultsPfS_Ph(float* %42, float* %43, i8* %44)
          to label %invoke.cont61 unwind label %lpad11, !dbg !946

invoke.cont61:                                    ; preds = %invoke.cont59
  call void @llvm.dbg.declare(metadata i64* %elapsed, metadata !947, metadata !DIExpression()), !dbg !948
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 0, !dbg !949
  %45 = load i64, i64* %tv_sec, align 8, !dbg !949
  %tv_sec62 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 0, !dbg !950
  %46 = load i64, i64* %tv_sec62, align 8, !dbg !950
  %sub = sub nsw i64 %45, %46, !dbg !951
  %mul = mul nsw i64 %sub, 1000000, !dbg !952
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 1, !dbg !953
  %47 = load i64, i64* %tv_usec, align 8, !dbg !953
  %add = add nsw i64 %mul, %47, !dbg !954
  %tv_usec63 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 1, !dbg !955
  %48 = load i64, i64* %tv_usec63, align 8, !dbg !955
  %sub64 = sub nsw i64 %add, %48, !dbg !956
  store i64 %sub64, i64* %elapsed, align 8, !dbg !948
  %49 = load i64, i64* %elapsed, align 8, !dbg !957
  %call66 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0), i64 %49)
          to label %invoke.cont65 unwind label %lpad11, !dbg !958

invoke.cont65:                                    ; preds = %invoke.cont61
  %50 = load float*, float** %data_points, align 8, !dbg !959
  %isnull = icmp eq float* %50, null, !dbg !960
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !960

delete.notnull:                                   ; preds = %invoke.cont65
  %51 = bitcast float* %50 to i8*, !dbg !960
  call void @_ZdaPv(i8* %51) #8, !dbg !960
  br label %delete.end, !dbg !960

delete.end:                                       ; preds = %delete.notnull, %invoke.cont65
  %52 = load i8*, i8** %labels, align 8, !dbg !961
  %isnull67 = icmp eq i8* %52, null, !dbg !962
  br i1 %isnull67, label %delete.end69, label %delete.notnull68, !dbg !962

delete.notnull68:                                 ; preds = %delete.end
  call void @_ZdaPv(i8* %52) #8, !dbg !962
  br label %delete.end69, !dbg !962

delete.end69:                                     ; preds = %delete.notnull68, %delete.end
  %53 = load float*, float** %param_vector, align 8, !dbg !963
  %isnull70 = icmp eq float* %53, null, !dbg !964
  br i1 %isnull70, label %delete.end72, label %delete.notnull71, !dbg !964

delete.notnull71:                                 ; preds = %delete.end69
  %54 = bitcast float* %53 to i8*, !dbg !964
  call void @_ZdaPv(i8* %54) #8, !dbg !964
  br label %delete.end72, !dbg !964

delete.end72:                                     ; preds = %delete.notnull71, %delete.end69
  store i32 0, i32* %retval, align 4, !dbg !965
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !965

cleanup:                                          ; preds = %delete.end72, %invoke.cont31, %invoke.cont16
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %str_labels_filepath) #6, !dbg !851
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %str_points_filepath) #6, !dbg !851
  br label %return

ehcleanup:                                        ; preds = %lpad11, %lpad8
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %str_points_filepath) #6, !dbg !851
  br label %eh.resume, !dbg !851

return:                                           ; preds = %cleanup, %if.then
  %55 = load i32, i32* %retval, align 4, !dbg !851
  ret i32 %55, !dbg !851

eh.resume:                                        ; preds = %ehcleanup, %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !832
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !832
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !832
  %lpad.val74 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !832
  resume { i8*, i32 } %lpad.val74, !dbg !832
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #4

; Function Attrs: nounwind
declare void @_ZNSaIcEC1Ev(%"class.std::allocator"*) unnamed_addr #2

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"*, i8*, %"class.std::allocator"* dereferenceable(1)) unnamed_addr #3

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @_ZNSaIcED1Ev(%"class.std::allocator"*) unnamed_addr #2

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #3

; Function Attrs: nounwind
declare i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"*) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, i8*) #2

declare void @_Z5SgdLRPfPhS_(float*, i8*, float*) #3

declare void @_Z13check_resultsPfS_Ph(float*, float*, i8*) #3

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #5

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { builtin }
attributes #8 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!788, !789, !790, !791}
!llvm.ident = !{!792}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3, imports: !13)
!1 = !DIFile(filename: "../src/spam_filter_host.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!2 = !{}
!3 = !{!4, !9, !11}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 5120000, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "DATA_SET_SIZE", scope: !0, file: !6, line: 19, type: !7, isLocal: true, isDefinition: true)
!6 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression(DW_OP_constu, 5000, DW_OP_stack_value))
!10 = distinct !DIGlobalVariable(name: "NUM_SAMPLES", scope: !0, file: !6, line: 14, type: !7, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "NUM_FEATURES", scope: !0, file: !6, line: 13, type: !7, isLocal: true, isDefinition: true)
!13 = !{!14, !21, !27, !32, !36, !38, !40, !42, !44, !51, !58, !65, !69, !73, !77, !86, !90, !92, !97, !103, !107, !114, !116, !120, !124, !128, !130, !134, !138, !140, !144, !146, !148, !152, !156, !160, !164, !168, !172, !174, !186, !190, !194, !199, !201, !203, !207, !211, !212, !213, !214, !215, !216, !220, !224, !230, !234, !239, !241, !246, !248, !252, !260, !264, !268, !272, !276, !280, !284, !288, !292, !296, !303, !307, !311, !313, !315, !319, !323, !329, !333, !337, !339, !346, !350, !357, !359, !363, !367, !371, !375, !380, !385, !390, !391, !392, !393, !395, !396, !397, !398, !399, !400, !401, !405, !422, !425, !430, !437, !442, !446, !450, !454, !458, !460, !462, !466, !472, !476, !482, !488, !490, !494, !498, !502, !506, !510, !512, !516, !520, !524, !526, !530, !534, !538, !540, !542, !546, !554, !558, !562, !566, !568, !574, !576, !582, !586, !590, !594, !598, !602, !606, !608, !610, !614, !618, !622, !624, !628, !632, !634, !636, !640, !644, !648, !652, !653, !654, !655, !656, !657, !658, !659, !660, !661, !662, !669, !673, !676, !679, !682, !684, !686, !688, !691, !694, !697, !700, !703, !705, !710, !714, !717, !720, !722, !724, !726, !728, !731, !734, !737, !740, !743, !745, !749, !753, !758, !762, !764, !766, !768, !770, !772, !774, !776, !778, !780, !782, !784, !786}
!14 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !16, file: !20, line: 98)
!15 = !DINamespace(name: "std", scope: null)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !17, line: 7, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !19, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!20 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !22, file: !20, line: 99)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !23, line: 84, baseType: !24)
!23 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !25, line: 14, baseType: !26)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!26 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !25, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !28, file: !20, line: 101)
!28 = !DISubprogram(name: "clearerr", scope: !23, file: !23, line: 786, type: !29, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !33, file: !20, line: 102)
!33 = !DISubprogram(name: "fclose", scope: !23, file: !23, line: 178, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DISubroutineType(types: !35)
!35 = !{!8, !31}
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !37, file: !20, line: 103)
!37 = !DISubprogram(name: "feof", scope: !23, file: !23, line: 788, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !39, file: !20, line: 104)
!39 = !DISubprogram(name: "ferror", scope: !23, file: !23, line: 790, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !41, file: !20, line: 105)
!41 = !DISubprogram(name: "fflush", scope: !23, file: !23, line: 230, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !43, file: !20, line: 106)
!43 = !DISubprogram(name: "fgetc", scope: !23, file: !23, line: 513, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !45, file: !20, line: 107)
!45 = !DISubprogram(name: "fgetpos", scope: !23, file: !23, line: 760, type: !46, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DISubroutineType(types: !47)
!47 = !{!8, !48, !49}
!48 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !31)
!49 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !52, file: !20, line: 108)
!52 = !DISubprogram(name: "fgets", scope: !23, file: !23, line: 592, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !57, !8, !48}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !55)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !59, file: !20, line: 109)
!59 = !DISubprogram(name: "fopen", scope: !23, file: !23, line: 258, type: !60, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DISubroutineType(types: !61)
!61 = !{!31, !62, !62}
!62 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !66, file: !20, line: 110)
!66 = !DISubprogram(name: "fprintf", scope: !23, file: !23, line: 350, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{!8, !48, !62, null}
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !70, file: !20, line: 111)
!70 = !DISubprogram(name: "fputc", scope: !23, file: !23, line: 549, type: !71, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DISubroutineType(types: !72)
!72 = !{!8, !8, !31}
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !74, file: !20, line: 112)
!74 = !DISubprogram(name: "fputs", scope: !23, file: !23, line: 655, type: !75, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!8, !62, !48}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !78, file: !20, line: 113)
!78 = !DISubprogram(name: "fread", scope: !23, file: !23, line: 675, type: !79, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !84, !81, !81, !48}
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !82, line: 62, baseType: !83)
!82 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!83 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!84 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !87, file: !20, line: 114)
!87 = !DISubprogram(name: "freopen", scope: !23, file: !23, line: 265, type: !88, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!31, !62, !62, !48}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !91, file: !20, line: 115)
!91 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !23, file: !23, line: 434, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !93, file: !20, line: 116)
!93 = !DISubprogram(name: "fseek", scope: !23, file: !23, line: 713, type: !94, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DISubroutineType(types: !95)
!95 = !{!8, !31, !96, !8}
!96 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !98, file: !20, line: 117)
!98 = !DISubprogram(name: "fsetpos", scope: !23, file: !23, line: 765, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!8, !31, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !104, file: !20, line: 118)
!104 = !DISubprogram(name: "ftell", scope: !23, file: !23, line: 718, type: !105, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DISubroutineType(types: !106)
!106 = !{!96, !31}
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !108, file: !20, line: 119)
!108 = !DISubprogram(name: "fwrite", scope: !23, file: !23, line: 681, type: !109, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DISubroutineType(types: !110)
!110 = !{!81, !111, !81, !81, !48}
!111 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !112)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !115, file: !20, line: 120)
!115 = !DISubprogram(name: "getc", scope: !23, file: !23, line: 514, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !117, file: !20, line: 121)
!117 = !DISubprogram(name: "getchar", scope: !23, file: !23, line: 520, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!8}
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !121, file: !20, line: 126)
!121 = !DISubprogram(name: "perror", scope: !23, file: !23, line: 804, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{null, !63}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !125, file: !20, line: 127)
!125 = !DISubprogram(name: "printf", scope: !23, file: !23, line: 356, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DISubroutineType(types: !127)
!127 = !{!8, !62, null}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !129, file: !20, line: 128)
!129 = !DISubprogram(name: "putc", scope: !23, file: !23, line: 550, type: !71, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !131, file: !20, line: 129)
!131 = !DISubprogram(name: "putchar", scope: !23, file: !23, line: 556, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DISubroutineType(types: !133)
!133 = !{!8, !8}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !135, file: !20, line: 130)
!135 = !DISubprogram(name: "puts", scope: !23, file: !23, line: 661, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!8, !63}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !139, file: !20, line: 131)
!139 = !DISubprogram(name: "remove", scope: !23, file: !23, line: 152, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !141, file: !20, line: 132)
!141 = !DISubprogram(name: "rename", scope: !23, file: !23, line: 154, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!8, !63, !63}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !145, file: !20, line: 133)
!145 = !DISubprogram(name: "rewind", scope: !23, file: !23, line: 723, type: !29, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !147, file: !20, line: 134)
!147 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !23, file: !23, line: 437, type: !126, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !149, file: !20, line: 135)
!149 = !DISubprogram(name: "setbuf", scope: !23, file: !23, line: 328, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{null, !48, !57}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !153, file: !20, line: 136)
!153 = !DISubprogram(name: "setvbuf", scope: !23, file: !23, line: 332, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DISubroutineType(types: !155)
!155 = !{!8, !48, !57, !8, !81}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !157, file: !20, line: 137)
!157 = !DISubprogram(name: "sprintf", scope: !23, file: !23, line: 358, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!8, !57, !62, null}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !161, file: !20, line: 138)
!161 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !23, file: !23, line: 439, type: !162, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DISubroutineType(types: !163)
!163 = !{!8, !62, !62, null}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !165, file: !20, line: 139)
!165 = !DISubprogram(name: "tmpfile", scope: !23, file: !23, line: 188, type: !166, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!31}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !169, file: !20, line: 141)
!169 = !DISubprogram(name: "tmpnam", scope: !23, file: !23, line: 205, type: !170, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DISubroutineType(types: !171)
!171 = !{!55, !55}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !173, file: !20, line: 143)
!173 = !DISubprogram(name: "ungetc", scope: !23, file: !23, line: 668, type: !71, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !175, file: !20, line: 144)
!175 = !DISubprogram(name: "vfprintf", scope: !23, file: !23, line: 365, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!8, !48, !62, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, size: 192, flags: DIFlagTypePassByValue, elements: !180, identifier: "_ZTS13__va_list_tag")
!180 = !{!181, !183, !184, !185}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !179, file: !1, baseType: !182, size: 32)
!182 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !179, file: !1, baseType: !182, size: 32, offset: 32)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !179, file: !1, baseType: !85, size: 64, offset: 64)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !179, file: !1, baseType: !85, size: 64, offset: 128)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !187, file: !20, line: 145)
!187 = !DISubprogram(name: "vprintf", scope: !23, file: !23, line: 371, type: !188, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{!8, !62, !178}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !191, file: !20, line: 146)
!191 = !DISubprogram(name: "vsprintf", scope: !23, file: !23, line: 373, type: !192, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubroutineType(types: !193)
!193 = !{!8, !57, !62, !178}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !196, file: !20, line: 175)
!195 = !DINamespace(name: "__gnu_cxx", scope: null)
!196 = !DISubprogram(name: "snprintf", scope: !23, file: !23, line: 378, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!8, !57, !81, !62, null}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !200, file: !20, line: 176)
!200 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !23, file: !23, line: 479, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !202, file: !20, line: 177)
!202 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !23, file: !23, line: 484, type: !188, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !204, file: !20, line: 178)
!204 = !DISubprogram(name: "vsnprintf", scope: !23, file: !23, line: 382, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!8, !57, !81, !62, !178}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !208, file: !20, line: 179)
!208 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !23, file: !23, line: 487, type: !209, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DISubroutineType(types: !210)
!210 = !{!8, !62, !62, !178}
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !196, file: !20, line: 185)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !200, file: !20, line: 186)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !202, file: !20, line: 187)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !204, file: !20, line: 188)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !208, file: !20, line: 189)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !217, file: !219, line: 52)
!217 = !DISubprogram(name: "abs", scope: !218, file: !218, line: 848, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!219 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !221, file: !223, line: 127)
!221 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !218, line: 63, baseType: !222)
!222 = !DICompositeType(tag: DW_TAG_structure_type, file: !218, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!223 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !225, file: !223, line: 128)
!225 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !218, line: 71, baseType: !226)
!226 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !218, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !227, identifier: "_ZTS6ldiv_t")
!227 = !{!228, !229}
!228 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !226, file: !218, line: 69, baseType: !96, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !226, file: !218, line: 70, baseType: !96, size: 64, offset: 64)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !231, file: !223, line: 130)
!231 = !DISubprogram(name: "abort", scope: !218, file: !218, line: 598, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{null}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !235, file: !223, line: 134)
!235 = !DISubprogram(name: "atexit", scope: !218, file: !218, line: 602, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!8, !238}
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !240, file: !223, line: 137)
!240 = !DISubprogram(name: "at_quick_exit", scope: !218, file: !218, line: 607, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !242, file: !223, line: 140)
!242 = !DISubprogram(name: "atof", scope: !218, file: !218, line: 102, type: !243, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!245, !63}
!245 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !247, file: !223, line: 141)
!247 = !DISubprogram(name: "atoi", scope: !218, file: !218, line: 105, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !249, file: !223, line: 142)
!249 = !DISubprogram(name: "atol", scope: !218, file: !218, line: 108, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!96, !63}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !253, file: !223, line: 143)
!253 = !DISubprogram(name: "bsearch", scope: !218, file: !218, line: 828, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!85, !112, !112, !81, !81, !256}
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !218, line: 816, baseType: !257)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!258 = !DISubroutineType(types: !259)
!259 = !{!8, !112, !112}
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !261, file: !223, line: 144)
!261 = !DISubprogram(name: "calloc", scope: !218, file: !218, line: 543, type: !262, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!85, !81, !81}
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !265, file: !223, line: 145)
!265 = !DISubprogram(name: "div", scope: !218, file: !218, line: 860, type: !266, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DISubroutineType(types: !267)
!267 = !{!221, !8, !8}
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !269, file: !223, line: 146)
!269 = !DISubprogram(name: "exit", scope: !218, file: !218, line: 624, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!270 = !DISubroutineType(types: !271)
!271 = !{null, !8}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !273, file: !223, line: 147)
!273 = !DISubprogram(name: "free", scope: !218, file: !218, line: 555, type: !274, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{null, !85}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !277, file: !223, line: 148)
!277 = !DISubprogram(name: "getenv", scope: !218, file: !218, line: 641, type: !278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DISubroutineType(types: !279)
!279 = !{!55, !63}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !281, file: !223, line: 149)
!281 = !DISubprogram(name: "labs", scope: !218, file: !218, line: 849, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{!96, !96}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !285, file: !223, line: 150)
!285 = !DISubprogram(name: "ldiv", scope: !218, file: !218, line: 862, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!225, !96, !96}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !289, file: !223, line: 151)
!289 = !DISubprogram(name: "malloc", scope: !218, file: !218, line: 540, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!85, !81}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !293, file: !223, line: 153)
!293 = !DISubprogram(name: "mblen", scope: !218, file: !218, line: 930, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!8, !63, !81}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !297, file: !223, line: 154)
!297 = !DISubprogram(name: "mbstowcs", scope: !218, file: !218, line: 941, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!81, !300, !62, !81}
!300 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !301)
!301 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!302 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !304, file: !223, line: 155)
!304 = !DISubprogram(name: "mbtowc", scope: !218, file: !218, line: 933, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!8, !300, !62, !81}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !308, file: !223, line: 157)
!308 = !DISubprogram(name: "qsort", scope: !218, file: !218, line: 838, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !85, !81, !81, !256}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !312, file: !223, line: 160)
!312 = !DISubprogram(name: "quick_exit", scope: !218, file: !218, line: 630, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !314, file: !223, line: 163)
!314 = !DISubprogram(name: "rand", scope: !218, file: !218, line: 454, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !316, file: !223, line: 164)
!316 = !DISubprogram(name: "realloc", scope: !218, file: !218, line: 551, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!85, !85, !81}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !320, file: !223, line: 165)
!320 = !DISubprogram(name: "srand", scope: !218, file: !218, line: 456, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{null, !182}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !324, file: !223, line: 166)
!324 = !DISubprogram(name: "strtod", scope: !218, file: !218, line: 118, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{!245, !62, !327}
!327 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !328)
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !330, file: !223, line: 167)
!330 = !DISubprogram(name: "strtol", scope: !218, file: !218, line: 177, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{!96, !62, !327, !8}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !334, file: !223, line: 168)
!334 = !DISubprogram(name: "strtoul", scope: !218, file: !218, line: 181, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!83, !62, !327, !8}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !338, file: !223, line: 169)
!338 = !DISubprogram(name: "system", scope: !218, file: !218, line: 791, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !340, file: !223, line: 171)
!340 = !DISubprogram(name: "wcstombs", scope: !218, file: !218, line: 945, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!81, !57, !343, !81}
!343 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !344)
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !302)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !347, file: !223, line: 172)
!347 = !DISubprogram(name: "wctomb", scope: !218, file: !218, line: 937, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!8, !55, !302}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !351, file: !223, line: 200)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !218, line: 81, baseType: !352)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !218, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !353, identifier: "_ZTS7lldiv_t")
!353 = !{!354, !356}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !352, file: !218, line: 79, baseType: !355, size: 64)
!355 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !352, file: !218, line: 80, baseType: !355, size: 64, offset: 64)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !358, file: !223, line: 206)
!358 = !DISubprogram(name: "_Exit", scope: !218, file: !218, line: 636, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !360, file: !223, line: 210)
!360 = !DISubprogram(name: "llabs", scope: !218, file: !218, line: 852, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{!355, !355}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !364, file: !223, line: 216)
!364 = !DISubprogram(name: "lldiv", scope: !218, file: !218, line: 866, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!351, !355, !355}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !368, file: !223, line: 227)
!368 = !DISubprogram(name: "atoll", scope: !218, file: !218, line: 113, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!355, !63}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !372, file: !223, line: 228)
!372 = !DISubprogram(name: "strtoll", scope: !218, file: !218, line: 201, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!355, !62, !327, !8}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !376, file: !223, line: 229)
!376 = !DISubprogram(name: "strtoull", scope: !218, file: !218, line: 206, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!379, !62, !327, !8}
!379 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !381, file: !223, line: 231)
!381 = !DISubprogram(name: "strtof", scope: !218, file: !218, line: 124, type: !382, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!382 = !DISubroutineType(types: !383)
!383 = !{!384, !62, !327}
!384 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !386, file: !223, line: 232)
!386 = !DISubprogram(name: "strtold", scope: !218, file: !218, line: 127, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{!389, !62, !327}
!389 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !351, file: !223, line: 240)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !358, file: !223, line: 242)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !360, file: !223, line: 244)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !394, file: !223, line: 245)
!394 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !195, file: !223, line: 213, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !364, file: !223, line: 246)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !368, file: !223, line: 248)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !381, file: !223, line: 249)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !372, file: !223, line: 250)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !376, file: !223, line: 251)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !386, file: !223, line: 252)
!401 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !402, entity: !403, file: !404, line: 58)
!402 = !DINamespace(name: "__gnu_debug", scope: null)
!403 = !DINamespace(name: "__debug", scope: !15)
!404 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !406, file: !421, line: 64)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !407, line: 6, baseType: !408)
!407 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !409, line: 21, baseType: !410)
!409 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!410 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !409, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !411, identifier: "_ZTS11__mbstate_t")
!411 = !{!412, !413}
!412 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !410, file: !409, line: 15, baseType: !8, size: 32)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !410, file: !409, line: 20, baseType: !414, size: 32, offset: 32)
!414 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !410, file: !409, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !415, identifier: "_ZTSN11__mbstate_tUt_E")
!415 = !{!416, !417}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !414, file: !409, line: 18, baseType: !182, size: 32)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !414, file: !409, line: 19, baseType: !418, size: 32)
!418 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 32, elements: !419)
!419 = !{!420}
!420 = !DISubrange(count: 4)
!421 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !423, file: !421, line: 141)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !424, line: 20, baseType: !182)
!424 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !426, file: !421, line: 143)
!426 = !DISubprogram(name: "btowc", scope: !427, file: !427, line: 285, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!428 = !DISubroutineType(types: !429)
!429 = !{!423, !8}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !431, file: !421, line: 144)
!431 = !DISubprogram(name: "fgetwc", scope: !427, file: !427, line: 744, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!423, !434}
!434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!435 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !436, line: 5, baseType: !18)
!436 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !438, file: !421, line: 145)
!438 = !DISubprogram(name: "fgetws", scope: !427, file: !427, line: 773, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!301, !300, !8, !441}
!441 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !434)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !443, file: !421, line: 146)
!443 = !DISubprogram(name: "fputwc", scope: !427, file: !427, line: 758, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!423, !302, !434}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !447, file: !421, line: 147)
!447 = !DISubprogram(name: "fputws", scope: !427, file: !427, line: 780, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DISubroutineType(types: !449)
!449 = !{!8, !343, !441}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !451, file: !421, line: 148)
!451 = !DISubprogram(name: "fwide", scope: !427, file: !427, line: 588, type: !452, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DISubroutineType(types: !453)
!453 = !{!8, !434, !8}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !455, file: !421, line: 149)
!455 = !DISubprogram(name: "fwprintf", scope: !427, file: !427, line: 595, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DISubroutineType(types: !457)
!457 = !{!8, !441, !343, null}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !459, file: !421, line: 150)
!459 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !427, file: !427, line: 657, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !461, file: !421, line: 151)
!461 = !DISubprogram(name: "getwc", scope: !427, file: !427, line: 745, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !463, file: !421, line: 152)
!463 = !DISubprogram(name: "getwchar", scope: !427, file: !427, line: 751, type: !464, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DISubroutineType(types: !465)
!465 = !{!423}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !467, file: !421, line: 153)
!467 = !DISubprogram(name: "mbrlen", scope: !427, file: !427, line: 308, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DISubroutineType(types: !469)
!469 = !{!81, !62, !81, !470}
!470 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !471)
!471 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !406, size: 64)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !473, file: !421, line: 154)
!473 = !DISubprogram(name: "mbrtowc", scope: !427, file: !427, line: 297, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!81, !300, !62, !81, !470}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !477, file: !421, line: 155)
!477 = !DISubprogram(name: "mbsinit", scope: !427, file: !427, line: 293, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{!8, !480}
!480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64)
!481 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !406)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !483, file: !421, line: 156)
!483 = !DISubprogram(name: "mbsrtowcs", scope: !427, file: !427, line: 338, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DISubroutineType(types: !485)
!485 = !{!81, !300, !486, !81, !470}
!486 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !487)
!487 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !489, file: !421, line: 157)
!489 = !DISubprogram(name: "putwc", scope: !427, file: !427, line: 759, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !491, file: !421, line: 158)
!491 = !DISubprogram(name: "putwchar", scope: !427, file: !427, line: 765, type: !492, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{!423, !302}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !495, file: !421, line: 160)
!495 = !DISubprogram(name: "swprintf", scope: !427, file: !427, line: 605, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!8, !300, !81, !343, null}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !499, file: !421, line: 162)
!499 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !427, file: !427, line: 664, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!8, !343, !343, null}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !503, file: !421, line: 163)
!503 = !DISubprogram(name: "ungetwc", scope: !427, file: !427, line: 788, type: !504, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DISubroutineType(types: !505)
!505 = !{!423, !423, !434}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !507, file: !421, line: 164)
!507 = !DISubprogram(name: "vfwprintf", scope: !427, file: !427, line: 613, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DISubroutineType(types: !509)
!509 = !{!8, !441, !343, !178}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !511, file: !421, line: 166)
!511 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !427, file: !427, line: 711, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !513, file: !421, line: 169)
!513 = !DISubprogram(name: "vswprintf", scope: !427, file: !427, line: 626, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DISubroutineType(types: !515)
!515 = !{!8, !300, !81, !343, !178}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !517, file: !421, line: 172)
!517 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !427, file: !427, line: 718, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!8, !343, !343, !178}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !521, file: !421, line: 174)
!521 = !DISubprogram(name: "vwprintf", scope: !427, file: !427, line: 621, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!8, !343, !178}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !525, file: !421, line: 176)
!525 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !427, file: !427, line: 715, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !527, file: !421, line: 178)
!527 = !DISubprogram(name: "wcrtomb", scope: !427, file: !427, line: 302, type: !528, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DISubroutineType(types: !529)
!529 = !{!81, !57, !302, !470}
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !531, file: !421, line: 179)
!531 = !DISubprogram(name: "wcscat", scope: !427, file: !427, line: 97, type: !532, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DISubroutineType(types: !533)
!533 = !{!301, !300, !343}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !535, file: !421, line: 180)
!535 = !DISubprogram(name: "wcscmp", scope: !427, file: !427, line: 106, type: !536, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DISubroutineType(types: !537)
!537 = !{!8, !344, !344}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !539, file: !421, line: 181)
!539 = !DISubprogram(name: "wcscoll", scope: !427, file: !427, line: 131, type: !536, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !541, file: !421, line: 182)
!541 = !DISubprogram(name: "wcscpy", scope: !427, file: !427, line: 87, type: !532, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !543, file: !421, line: 183)
!543 = !DISubprogram(name: "wcscspn", scope: !427, file: !427, line: 188, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!81, !344, !344}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !547, file: !421, line: 184)
!547 = !DISubprogram(name: "wcsftime", scope: !427, file: !427, line: 852, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!81, !300, !81, !343, !550}
!550 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !551)
!551 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !552, size: 64)
!552 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !553)
!553 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !427, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !555, file: !421, line: 185)
!555 = !DISubprogram(name: "wcslen", scope: !427, file: !427, line: 223, type: !556, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DISubroutineType(types: !557)
!557 = !{!81, !344}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !559, file: !421, line: 186)
!559 = !DISubprogram(name: "wcsncat", scope: !427, file: !427, line: 101, type: !560, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DISubroutineType(types: !561)
!561 = !{!301, !300, !343, !81}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !563, file: !421, line: 187)
!563 = !DISubprogram(name: "wcsncmp", scope: !427, file: !427, line: 109, type: !564, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DISubroutineType(types: !565)
!565 = !{!8, !344, !344, !81}
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !567, file: !421, line: 188)
!567 = !DISubprogram(name: "wcsncpy", scope: !427, file: !427, line: 92, type: !560, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !569, file: !421, line: 189)
!569 = !DISubprogram(name: "wcsrtombs", scope: !427, file: !427, line: 344, type: !570, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DISubroutineType(types: !571)
!571 = !{!81, !57, !572, !81, !470}
!572 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !573)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !575, file: !421, line: 190)
!575 = !DISubprogram(name: "wcsspn", scope: !427, file: !427, line: 192, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !577, file: !421, line: 191)
!577 = !DISubprogram(name: "wcstod", scope: !427, file: !427, line: 378, type: !578, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DISubroutineType(types: !579)
!579 = !{!245, !343, !580}
!580 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !581)
!581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !583, file: !421, line: 193)
!583 = !DISubprogram(name: "wcstof", scope: !427, file: !427, line: 383, type: !584, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DISubroutineType(types: !585)
!585 = !{!384, !343, !580}
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !587, file: !421, line: 195)
!587 = !DISubprogram(name: "wcstok", scope: !427, file: !427, line: 218, type: !588, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DISubroutineType(types: !589)
!589 = !{!301, !300, !343, !580}
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !591, file: !421, line: 196)
!591 = !DISubprogram(name: "wcstol", scope: !427, file: !427, line: 429, type: !592, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DISubroutineType(types: !593)
!593 = !{!96, !343, !580, !8}
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !595, file: !421, line: 197)
!595 = !DISubprogram(name: "wcstoul", scope: !427, file: !427, line: 434, type: !596, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DISubroutineType(types: !597)
!597 = !{!83, !343, !580, !8}
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !599, file: !421, line: 198)
!599 = !DISubprogram(name: "wcsxfrm", scope: !427, file: !427, line: 135, type: !600, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DISubroutineType(types: !601)
!601 = !{!81, !300, !343, !81}
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !603, file: !421, line: 199)
!603 = !DISubprogram(name: "wctob", scope: !427, file: !427, line: 289, type: !604, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DISubroutineType(types: !605)
!605 = !{!8, !423}
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !607, file: !421, line: 200)
!607 = !DISubprogram(name: "wmemcmp", scope: !427, file: !427, line: 259, type: !564, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !609, file: !421, line: 201)
!609 = !DISubprogram(name: "wmemcpy", scope: !427, file: !427, line: 263, type: !560, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !611, file: !421, line: 202)
!611 = !DISubprogram(name: "wmemmove", scope: !427, file: !427, line: 268, type: !612, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DISubroutineType(types: !613)
!613 = !{!301, !301, !344, !81}
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !615, file: !421, line: 203)
!615 = !DISubprogram(name: "wmemset", scope: !427, file: !427, line: 272, type: !616, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DISubroutineType(types: !617)
!617 = !{!301, !301, !302, !81}
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !619, file: !421, line: 204)
!619 = !DISubprogram(name: "wprintf", scope: !427, file: !427, line: 602, type: !620, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DISubroutineType(types: !621)
!621 = !{!8, !343, null}
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !623, file: !421, line: 205)
!623 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !427, file: !427, line: 661, type: !620, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !625, file: !421, line: 206)
!625 = !DISubprogram(name: "wcschr", scope: !427, file: !427, line: 165, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DISubroutineType(types: !627)
!627 = !{!301, !344, !302}
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !629, file: !421, line: 207)
!629 = !DISubprogram(name: "wcspbrk", scope: !427, file: !427, line: 202, type: !630, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DISubroutineType(types: !631)
!631 = !{!301, !344, !344}
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !633, file: !421, line: 208)
!633 = !DISubprogram(name: "wcsrchr", scope: !427, file: !427, line: 175, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !635, file: !421, line: 209)
!635 = !DISubprogram(name: "wcsstr", scope: !427, file: !427, line: 213, type: !630, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !637, file: !421, line: 210)
!637 = !DISubprogram(name: "wmemchr", scope: !427, file: !427, line: 254, type: !638, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DISubroutineType(types: !639)
!639 = !{!301, !344, !302, !81}
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !641, file: !421, line: 251)
!641 = !DISubprogram(name: "wcstold", scope: !427, file: !427, line: 385, type: !642, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!642 = !DISubroutineType(types: !643)
!643 = !{!389, !343, !580}
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !645, file: !421, line: 260)
!645 = !DISubprogram(name: "wcstoll", scope: !427, file: !427, line: 442, type: !646, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DISubroutineType(types: !647)
!647 = !{!355, !343, !580, !8}
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !195, entity: !649, file: !421, line: 261)
!649 = !DISubprogram(name: "wcstoull", scope: !427, file: !427, line: 449, type: !650, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!650 = !DISubroutineType(types: !651)
!651 = !{!379, !343, !580, !8}
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !641, file: !421, line: 267)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !645, file: !421, line: 268)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !649, file: !421, line: 269)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !583, file: !421, line: 283)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !511, file: !421, line: 286)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !517, file: !421, line: 289)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !525, file: !421, line: 292)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !641, file: !421, line: 296)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !645, file: !421, line: 297)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !649, file: !421, line: 298)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !663, file: !668, line: 47)
!663 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !664, line: 24, baseType: !665)
!664 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !666, line: 37, baseType: !667)
!666 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!667 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!668 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !670, file: !668, line: 48)
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !664, line: 25, baseType: !671)
!671 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !666, line: 39, baseType: !672)
!672 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !674, file: !668, line: 49)
!674 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !664, line: 26, baseType: !675)
!675 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !666, line: 41, baseType: !8)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !677, file: !668, line: 50)
!677 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !664, line: 27, baseType: !678)
!678 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !666, line: 44, baseType: !96)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !680, file: !668, line: 52)
!680 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !681, line: 58, baseType: !667)
!681 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !683, file: !668, line: 53)
!683 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !681, line: 60, baseType: !96)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !685, file: !668, line: 54)
!685 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !681, line: 61, baseType: !96)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !687, file: !668, line: 55)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !681, line: 62, baseType: !96)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !689, file: !668, line: 57)
!689 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !681, line: 43, baseType: !690)
!690 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !666, line: 52, baseType: !665)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !692, file: !668, line: 58)
!692 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !681, line: 44, baseType: !693)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !666, line: 54, baseType: !671)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !695, file: !668, line: 59)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !681, line: 45, baseType: !696)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !666, line: 56, baseType: !675)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !698, file: !668, line: 60)
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !681, line: 46, baseType: !699)
!699 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !666, line: 58, baseType: !678)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !701, file: !668, line: 62)
!701 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !681, line: 101, baseType: !702)
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !666, line: 72, baseType: !96)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !704, file: !668, line: 63)
!704 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !681, line: 87, baseType: !96)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !706, file: !668, line: 65)
!706 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !707, line: 24, baseType: !708)
!707 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!708 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !666, line: 38, baseType: !709)
!709 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !711, file: !668, line: 66)
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !707, line: 25, baseType: !712)
!712 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !666, line: 40, baseType: !713)
!713 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !715, file: !668, line: 67)
!715 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !707, line: 26, baseType: !716)
!716 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !666, line: 42, baseType: !182)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !718, file: !668, line: 68)
!718 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !707, line: 27, baseType: !719)
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !666, line: 45, baseType: !83)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !721, file: !668, line: 70)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !681, line: 71, baseType: !709)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !723, file: !668, line: 71)
!723 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !681, line: 73, baseType: !83)
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !725, file: !668, line: 72)
!725 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !681, line: 74, baseType: !83)
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !727, file: !668, line: 73)
!727 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !681, line: 75, baseType: !83)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !729, file: !668, line: 75)
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !681, line: 49, baseType: !730)
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !666, line: 53, baseType: !708)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !732, file: !668, line: 76)
!732 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !681, line: 50, baseType: !733)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !666, line: 55, baseType: !712)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !735, file: !668, line: 77)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !681, line: 51, baseType: !736)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !666, line: 57, baseType: !716)
!737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !738, file: !668, line: 78)
!738 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !681, line: 52, baseType: !739)
!739 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !666, line: 59, baseType: !719)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !741, file: !668, line: 80)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !681, line: 102, baseType: !742)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !666, line: 73, baseType: !83)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !744, file: !668, line: 81)
!744 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !681, line: 90, baseType: !83)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !746, file: !748, line: 53)
!746 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !747, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!747 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!748 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !750, file: !748, line: 54)
!750 = !DISubprogram(name: "setlocale", scope: !747, file: !747, line: 122, type: !751, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!751 = !DISubroutineType(types: !752)
!752 = !{!55, !8, !63}
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !754, file: !748, line: 55)
!754 = !DISubprogram(name: "localeconv", scope: !747, file: !747, line: 125, type: !755, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!755 = !DISubroutineType(types: !756)
!756 = !{!757}
!757 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !746, size: 64)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !759, file: !761, line: 64)
!759 = !DISubprogram(name: "isalnum", scope: !760, file: !760, line: 108, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!760 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!761 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !763, file: !761, line: 65)
!763 = !DISubprogram(name: "isalpha", scope: !760, file: !760, line: 109, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !765, file: !761, line: 66)
!765 = !DISubprogram(name: "iscntrl", scope: !760, file: !760, line: 110, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !767, file: !761, line: 67)
!767 = !DISubprogram(name: "isdigit", scope: !760, file: !760, line: 111, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !769, file: !761, line: 68)
!769 = !DISubprogram(name: "isgraph", scope: !760, file: !760, line: 113, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !771, file: !761, line: 69)
!771 = !DISubprogram(name: "islower", scope: !760, file: !760, line: 112, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !773, file: !761, line: 70)
!773 = !DISubprogram(name: "isprint", scope: !760, file: !760, line: 114, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !775, file: !761, line: 71)
!775 = !DISubprogram(name: "ispunct", scope: !760, file: !760, line: 115, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !777, file: !761, line: 72)
!777 = !DISubprogram(name: "isspace", scope: !760, file: !760, line: 116, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !779, file: !761, line: 73)
!779 = !DISubprogram(name: "isupper", scope: !760, file: !760, line: 117, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !781, file: !761, line: 74)
!781 = !DISubprogram(name: "isxdigit", scope: !760, file: !760, line: 118, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !783, file: !761, line: 75)
!783 = !DISubprogram(name: "tolower", scope: !760, file: !760, line: 122, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !785, file: !761, line: 76)
!785 = !DISubprogram(name: "toupper", scope: !760, file: !760, line: 125, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !787, file: !761, line: 87)
!787 = !DISubprogram(name: "isblank", scope: !760, file: !760, line: 130, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !{i32 2, !"Dwarf Version", i32 4}
!789 = !{i32 2, !"Debug Info Version", i32 3}
!790 = !{i32 1, !"wchar_size", i32 4}
!791 = !{i32 7, !"PIC Level", i32 2}
!792 = !{!"clang version 7.0.0 "}
!793 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 23, type: !794, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!794 = !DISubroutineType(types: !795)
!795 = !{!8, !8, !328}
!796 = !DILocalVariable(name: "argc", arg: 1, scope: !793, file: !1, line: 23, type: !8)
!797 = !DILocation(line: 23, column: 14, scope: !793)
!798 = !DILocalVariable(name: "argv", arg: 2, scope: !793, file: !1, line: 23, type: !328)
!799 = !DILocation(line: 23, column: 26, scope: !793)
!800 = !DILocation(line: 25, column: 10, scope: !793)
!801 = !DILocation(line: 25, column: 3, scope: !793)
!802 = !DILocation(line: 27, column: 3, scope: !793)
!803 = !DILocalVariable(name: "data_points", scope: !793, file: !1, line: 31, type: !804)
!804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64)
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataType", file: !6, line: 23, baseType: !384)
!806 = !DILocation(line: 31, column: 16, scope: !793)
!807 = !DILocation(line: 31, column: 31, scope: !793)
!808 = !DILocalVariable(name: "labels", scope: !793, file: !1, line: 32, type: !809)
!809 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !810, size: 64)
!810 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !6, line: 24, baseType: !709)
!811 = !DILocation(line: 32, column: 16, scope: !793)
!812 = !DILocation(line: 32, column: 31, scope: !793)
!813 = !DILocalVariable(name: "param_vector", scope: !793, file: !1, line: 33, type: !814)
!814 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !815, size: 64)
!815 = !DIDerivedType(tag: DW_TAG_typedef, name: "FeatureType", file: !6, line: 22, baseType: !384)
!816 = !DILocation(line: 33, column: 16, scope: !793)
!817 = !DILocation(line: 33, column: 31, scope: !793)
!818 = !DILocation(line: 36, column: 7, scope: !819)
!819 = distinct !DILexicalBlock(scope: !793, file: !1, line: 36, column: 7)
!820 = !DILocation(line: 36, column: 12, scope: !819)
!821 = !DILocation(line: 36, column: 7, scope: !793)
!822 = !DILocation(line: 38, column: 52, scope: !823)
!823 = distinct !DILexicalBlock(scope: !819, file: !1, line: 37, column: 3)
!824 = !DILocation(line: 38, column: 5, scope: !823)
!825 = !DILocation(line: 39, column: 5, scope: !823)
!826 = !DILocalVariable(name: "str_points_filepath", scope: !793, file: !1, line: 41, type: !827)
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !15, file: !828, line: 79, baseType: !829)
!828 = !DIFile(filename: "/usr/include/c++/11/bits/stringfwd.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!829 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !831, file: !830, line: 1627, size: 256, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!830 = !DIFile(filename: "/usr/include/c++/11/bits/basic_string.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!831 = !DINamespace(name: "__cxx11", scope: !15, exportSymbols: true)
!832 = !DILocation(line: 41, column: 15, scope: !793)
!833 = !DILocation(line: 41, column: 37, scope: !793)
!834 = !DILocalVariable(name: "str_labels_filepath", scope: !793, file: !1, line: 42, type: !827)
!835 = !DILocation(line: 42, column: 15, scope: !793)
!836 = !DILocation(line: 42, column: 37, scope: !793)
!837 = !DILocalVariable(name: "data_file", scope: !793, file: !1, line: 44, type: !31)
!838 = !DILocation(line: 44, column: 9, scope: !793)
!839 = !DILocalVariable(name: "label_file", scope: !793, file: !1, line: 45, type: !31)
!840 = !DILocation(line: 45, column: 9, scope: !793)
!841 = !DILocation(line: 47, column: 41, scope: !793)
!842 = !DILocation(line: 47, column: 15, scope: !793)
!843 = !DILocation(line: 47, column: 13, scope: !793)
!844 = !DILocation(line: 48, column: 8, scope: !845)
!845 = distinct !DILexicalBlock(scope: !793, file: !1, line: 48, column: 7)
!846 = !DILocation(line: 48, column: 7, scope: !793)
!847 = !DILocation(line: 50, column: 66, scope: !848)
!848 = distinct !DILexicalBlock(scope: !845, file: !1, line: 49, column: 3)
!849 = !DILocation(line: 50, column: 5, scope: !848)
!850 = !DILocation(line: 51, column: 5, scope: !848)
!851 = !DILocation(line: 100, column: 1, scope: !793)
!852 = !DILocalVariable(name: "i", scope: !853, file: !1, line: 53, type: !8)
!853 = distinct !DILexicalBlock(scope: !793, file: !1, line: 53, column: 3)
!854 = !DILocation(line: 53, column: 12, scope: !853)
!855 = !DILocation(line: 53, column: 8, scope: !853)
!856 = !DILocation(line: 53, column: 19, scope: !857)
!857 = distinct !DILexicalBlock(scope: !853, file: !1, line: 53, column: 3)
!858 = !DILocation(line: 53, column: 21, scope: !857)
!859 = !DILocation(line: 53, column: 3, scope: !853)
!860 = !DILocalVariable(name: "tmp", scope: !861, file: !1, line: 55, type: !384)
!861 = distinct !DILexicalBlock(scope: !857, file: !1, line: 54, column: 3)
!862 = !DILocation(line: 55, column: 11, scope: !861)
!863 = !DILocation(line: 56, column: 12, scope: !861)
!864 = !DILocation(line: 56, column: 5, scope: !861)
!865 = !DILocation(line: 57, column: 22, scope: !861)
!866 = !DILocation(line: 57, column: 5, scope: !861)
!867 = !DILocation(line: 57, column: 17, scope: !861)
!868 = !DILocation(line: 57, column: 20, scope: !861)
!869 = !DILocation(line: 58, column: 3, scope: !861)
!870 = !DILocation(line: 53, column: 40, scope: !857)
!871 = !DILocation(line: 53, column: 3, scope: !857)
!872 = distinct !{!872, !859, !873}
!873 = !DILocation(line: 58, column: 3, scope: !853)
!874 = !DILocation(line: 59, column: 10, scope: !793)
!875 = !DILocation(line: 59, column: 3, scope: !793)
!876 = !DILocation(line: 61, column: 42, scope: !793)
!877 = !DILocation(line: 61, column: 16, scope: !793)
!878 = !DILocation(line: 61, column: 14, scope: !793)
!879 = !DILocation(line: 62, column: 8, scope: !880)
!880 = distinct !DILexicalBlock(scope: !793, file: !1, line: 62, column: 7)
!881 = !DILocation(line: 62, column: 7, scope: !793)
!882 = !DILocation(line: 64, column: 67, scope: !883)
!883 = distinct !DILexicalBlock(scope: !880, file: !1, line: 63, column: 3)
!884 = !DILocation(line: 64, column: 5, scope: !883)
!885 = !DILocation(line: 65, column: 5, scope: !883)
!886 = !DILocalVariable(name: "i", scope: !887, file: !1, line: 67, type: !8)
!887 = distinct !DILexicalBlock(scope: !793, file: !1, line: 67, column: 3)
!888 = !DILocation(line: 67, column: 12, scope: !887)
!889 = !DILocation(line: 67, column: 8, scope: !887)
!890 = !DILocation(line: 67, column: 19, scope: !891)
!891 = distinct !DILexicalBlock(scope: !887, file: !1, line: 67, column: 3)
!892 = !DILocation(line: 67, column: 21, scope: !891)
!893 = !DILocation(line: 67, column: 3, scope: !887)
!894 = !DILocalVariable(name: "tmp", scope: !895, file: !1, line: 69, type: !8)
!895 = distinct !DILexicalBlock(scope: !891, file: !1, line: 68, column: 3)
!896 = !DILocation(line: 69, column: 9, scope: !895)
!897 = !DILocation(line: 70, column: 12, scope: !895)
!898 = !DILocation(line: 70, column: 5, scope: !895)
!899 = !DILocation(line: 71, column: 17, scope: !895)
!900 = !DILocation(line: 71, column: 5, scope: !895)
!901 = !DILocation(line: 71, column: 12, scope: !895)
!902 = !DILocation(line: 71, column: 15, scope: !895)
!903 = !DILocation(line: 72, column: 3, scope: !895)
!904 = !DILocation(line: 67, column: 38, scope: !891)
!905 = !DILocation(line: 67, column: 3, scope: !891)
!906 = distinct !{!906, !893, !907}
!907 = !DILocation(line: 72, column: 3, scope: !887)
!908 = !DILocation(line: 73, column: 10, scope: !793)
!909 = !DILocation(line: 73, column: 3, scope: !793)
!910 = !DILocalVariable(name: "i", scope: !911, file: !1, line: 76, type: !81)
!911 = distinct !DILexicalBlock(scope: !793, file: !1, line: 76, column: 3)
!912 = !DILocation(line: 76, column: 15, scope: !911)
!913 = !DILocation(line: 76, column: 8, scope: !911)
!914 = !DILocation(line: 76, column: 22, scope: !915)
!915 = distinct !DILexicalBlock(scope: !911, file: !1, line: 76, column: 3)
!916 = !DILocation(line: 76, column: 24, scope: !915)
!917 = !DILocation(line: 76, column: 3, scope: !911)
!918 = !DILocation(line: 77, column: 5, scope: !915)
!919 = !DILocation(line: 77, column: 18, scope: !915)
!920 = !DILocation(line: 77, column: 21, scope: !915)
!921 = !DILocation(line: 76, column: 41, scope: !915)
!922 = !DILocation(line: 76, column: 3, scope: !915)
!923 = distinct !{!923, !917, !924}
!924 = !DILocation(line: 77, column: 23, scope: !911)
!925 = !DILocalVariable(name: "start", scope: !793, file: !1, line: 80, type: !926)
!926 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !927, line: 8, size: 128, flags: DIFlagTypePassByValue, elements: !928, identifier: "_ZTS7timeval")
!927 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!928 = !{!929, !931}
!929 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !926, file: !927, line: 14, baseType: !930, size: 64)
!930 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !666, line: 160, baseType: !96)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !926, file: !927, line: 15, baseType: !932, size: 64, offset: 64)
!932 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !666, line: 162, baseType: !96)
!933 = !DILocation(line: 80, column: 18, scope: !793)
!934 = !DILocalVariable(name: "end", scope: !793, file: !1, line: 80, type: !926)
!935 = !DILocation(line: 80, column: 25, scope: !793)
!936 = !DILocation(line: 83, column: 3, scope: !793)
!937 = !DILocation(line: 84, column: 9, scope: !793)
!938 = !DILocation(line: 84, column: 22, scope: !793)
!939 = !DILocation(line: 84, column: 30, scope: !793)
!940 = !DILocation(line: 84, column: 3, scope: !793)
!941 = !DILocation(line: 85, column: 3, scope: !793)
!942 = !DILocation(line: 88, column: 3, scope: !793)
!943 = !DILocation(line: 89, column: 18, scope: !793)
!944 = !DILocation(line: 89, column: 32, scope: !793)
!945 = !DILocation(line: 89, column: 45, scope: !793)
!946 = !DILocation(line: 89, column: 3, scope: !793)
!947 = !DILocalVariable(name: "elapsed", scope: !793, file: !1, line: 92, type: !355)
!948 = !DILocation(line: 92, column: 13, scope: !793)
!949 = !DILocation(line: 92, column: 28, scope: !793)
!950 = !DILocation(line: 92, column: 43, scope: !793)
!951 = !DILocation(line: 92, column: 35, scope: !793)
!952 = !DILocation(line: 92, column: 51, scope: !793)
!953 = !DILocation(line: 92, column: 69, scope: !793)
!954 = !DILocation(line: 92, column: 63, scope: !793)
!955 = !DILocation(line: 92, column: 85, scope: !793)
!956 = !DILocation(line: 92, column: 77, scope: !793)
!957 = !DILocation(line: 93, column: 37, scope: !793)
!958 = !DILocation(line: 93, column: 3, scope: !793)
!959 = !DILocation(line: 95, column: 12, scope: !793)
!960 = !DILocation(line: 95, column: 3, scope: !793)
!961 = !DILocation(line: 96, column: 12, scope: !793)
!962 = !DILocation(line: 96, column: 3, scope: !793)
!963 = !DILocation(line: 97, column: 12, scope: !793)
!964 = !DILocation(line: 97, column: 3, scope: !793)
!965 = !DILocation(line: 99, column: 3, scope: !793)
