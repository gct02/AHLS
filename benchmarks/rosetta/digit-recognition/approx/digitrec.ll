; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind
define i32 @_Z8popcounty(i64 %x) #0 !dbg !17 {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i64, i64* %x.addr, align 8, !dbg !25
  %shr = lshr i64 %0, 1, !dbg !26
  %and = and i64 %shr, 6148914691236517205, !dbg !27
  %1 = load i64, i64* %x.addr, align 8, !dbg !28
  %sub = sub i64 %1, %and, !dbg !28
  store i64 %sub, i64* %x.addr, align 8, !dbg !28
  %2 = load i64, i64* %x.addr, align 8, !dbg !29
  %and1 = and i64 %2, 3689348814741910323, !dbg !30
  %3 = load i64, i64* %x.addr, align 8, !dbg !31
  %shr2 = lshr i64 %3, 2, !dbg !32
  %and3 = and i64 %shr2, 3689348814741910323, !dbg !33
  %add = add i64 %and1, %and3, !dbg !34
  store i64 %add, i64* %x.addr, align 8, !dbg !35
  %4 = load i64, i64* %x.addr, align 8, !dbg !36
  %5 = load i64, i64* %x.addr, align 8, !dbg !37
  %shr4 = lshr i64 %5, 4, !dbg !38
  %add5 = add i64 %4, %shr4, !dbg !39
  %and6 = and i64 %add5, 1085102592571150095, !dbg !40
  store i64 %and6, i64* %x.addr, align 8, !dbg !41
  %6 = load i64, i64* %x.addr, align 8, !dbg !42
  %shr7 = lshr i64 %6, 8, !dbg !43
  %7 = load i64, i64* %x.addr, align 8, !dbg !44
  %add8 = add i64 %7, %shr7, !dbg !44
  store i64 %add8, i64* %x.addr, align 8, !dbg !44
  %8 = load i64, i64* %x.addr, align 8, !dbg !45
  %shr9 = lshr i64 %8, 16, !dbg !46
  %9 = load i64, i64* %x.addr, align 8, !dbg !47
  %add10 = add i64 %9, %shr9, !dbg !47
  store i64 %add10, i64* %x.addr, align 8, !dbg !47
  %10 = load i64, i64* %x.addr, align 8, !dbg !48
  %shr11 = lshr i64 %10, 32, !dbg !49
  %11 = load i64, i64* %x.addr, align 8, !dbg !50
  %add12 = add i64 %11, %shr11, !dbg !50
  store i64 %add12, i64* %x.addr, align 8, !dbg !50
  %12 = load i64, i64* %x.addr, align 8, !dbg !51
  %and13 = and i64 %12, 127, !dbg !52
  %conv = trunc i64 %and13 to i32, !dbg !51
  ret i32 %conv, !dbg !53
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
define void @_Z10update_knnPKyS0_PiS1_i(i64* %train_inst, i64* %test_inst, i32* "fpga.decayed.dim.hint"="3" %dists, i32* "fpga.decayed.dim.hint"="3" %labels, i32 %label) #2 !dbg !54 {
entry:
  %train_inst.addr = alloca i64*, align 8
  %test_inst.addr = alloca i64*, align 8
  %dists.addr = alloca i32*, align 8
  %labels.addr = alloca i32*, align 8
  %label.addr = alloca i32, align 4
  %dist = alloca i32, align 4
  %i = alloca i32, align 4
  %diff = alloca i64, align 8
  %max_dist = alloca i32, align 4
  %max_dist_id = alloca i32, align 4
  %k = alloca i32, align 4
  store i64* %train_inst, i64** %train_inst.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %train_inst.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i64* %test_inst, i64** %test_inst.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %test_inst.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i32* %dists, i32** %dists.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dists.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* %labels, i32** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %labels.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 %label, i32* %label.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %label.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = bitcast i32* %dist to i8*, !dbg !70
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %dist, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 0, i32* %dist, align 4, !dbg !72
  br label %VITIS_LOOP_33_1, !dbg !70

VITIS_LOOP_33_1:                                  ; preds = %entry
  %1 = bitcast i32* %i to i8*, !dbg !73
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 0, i32* %i, align 4, !dbg !76
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_33_1
  %2 = load i32, i32* %i, align 4, !dbg !77
  %cmp = icmp slt i32 %2, 4, !dbg !79
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !80

for.cond.cleanup:                                 ; preds = %for.cond
  %3 = bitcast i32* %i to i8*, !dbg !81
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #6, !dbg !81
  br label %for.end

for.body:                                         ; preds = %for.cond
  %4 = bitcast i64* %diff to i8*, !dbg !82
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !dbg !82
  call void @llvm.dbg.declare(metadata i64* %diff, metadata !84, metadata !DIExpression()), !dbg !85
  %5 = load i64*, i64** %test_inst.addr, align 8, !dbg !86
  %6 = load i32, i32* %i, align 4, !dbg !87
  %idxprom = sext i32 %6 to i64, !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %idxprom, !dbg !86
  %7 = load i64, i64* %arrayidx, align 8, !dbg !86
  %8 = load i64*, i64** %train_inst.addr, align 8, !dbg !88
  %9 = load i32, i32* %i, align 4, !dbg !89
  %idxprom1 = sext i32 %9 to i64, !dbg !88
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 %idxprom1, !dbg !88
  %10 = load i64, i64* %arrayidx2, align 8, !dbg !88
  %xor = xor i64 %7, %10, !dbg !90
  store i64 %xor, i64* %diff, align 8, !dbg !85
  %11 = load i64, i64* %diff, align 8, !dbg !91
  %call = call i32 @_Z8popcounty(i64 %11), !dbg !92
  %12 = load i32, i32* %dist, align 4, !dbg !93
  %add = add i32 %12, %call, !dbg !93
  store i32 %add, i32* %dist, align 4, !dbg !93
  %13 = bitcast i64* %diff to i8*, !dbg !94
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #6, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !96
  %inc = add i32 %14, 1, !dbg !96
  store i32 %inc, i32* %i, align 4, !dbg !96
  br label %for.cond, !dbg !81, !llvm.loop !97

for.end:                                          ; preds = %for.cond.cleanup
  %15 = bitcast i32* %max_dist to i8*, !dbg !100
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #6, !dbg !100
  call void @llvm.dbg.declare(metadata i32* %max_dist, metadata !101, metadata !DIExpression()), !dbg !102
  store i32 0, i32* %max_dist, align 4, !dbg !102
  %16 = bitcast i32* %max_dist_id to i8*, !dbg !103
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #6, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %max_dist_id, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 4, i32* %max_dist_id, align 4, !dbg !105
  br label %FIND_MAX_DIST, !dbg !103

FIND_MAX_DIST:                                    ; preds = %for.end
  %17 = bitcast i32* %k to i8*, !dbg !106
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #6, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %k, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 0, i32* %k, align 4, !dbg !109
  br label %for.cond3, !dbg !106

for.cond3:                                        ; preds = %for.inc12, %FIND_MAX_DIST
  %18 = load i32, i32* %k, align 4, !dbg !110
  %cmp4 = icmp slt i32 %18, 3, !dbg !112
  br i1 %cmp4, label %for.body6, label %for.cond.cleanup5, !dbg !113

for.cond.cleanup5:                                ; preds = %for.cond3
  %19 = bitcast i32* %k to i8*, !dbg !114
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #6, !dbg !114
  br label %for.end14

for.body6:                                        ; preds = %for.cond3
  %20 = load i32*, i32** %dists.addr, align 8, !dbg !115
  %21 = load i32, i32* %k, align 4, !dbg !118
  %idxprom7 = sext i32 %21 to i64, !dbg !115
  %arrayidx8 = getelementptr inbounds i32, i32* %20, i64 %idxprom7, !dbg !115
  %22 = load i32, i32* %arrayidx8, align 4, !dbg !115
  %23 = load i32, i32* %max_dist, align 4, !dbg !119
  %cmp9 = icmp sgt i32 %22, %23, !dbg !120
  br i1 %cmp9, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %for.body6
  %24 = load i32*, i32** %dists.addr, align 8, !dbg !122
  %25 = load i32, i32* %k, align 4, !dbg !124
  %idxprom10 = sext i32 %25 to i64, !dbg !122
  %arrayidx11 = getelementptr inbounds i32, i32* %24, i64 %idxprom10, !dbg !122
  %26 = load i32, i32* %arrayidx11, align 4, !dbg !122
  store i32 %26, i32* %max_dist, align 4, !dbg !125
  %27 = load i32, i32* %k, align 4, !dbg !126
  store i32 %27, i32* %max_dist_id, align 4, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc12, !dbg !129

for.inc12:                                        ; preds = %if.end
  %28 = load i32, i32* %k, align 4, !dbg !130
  %inc13 = add i32 %28, 1, !dbg !130
  store i32 %inc13, i32* %k, align 4, !dbg !130
  br label %for.cond3, !dbg !114, !llvm.loop !131

for.end14:                                        ; preds = %for.cond.cleanup5
  %29 = load i32, i32* %dist, align 4, !dbg !134
  %30 = load i32, i32* %max_dist, align 4, !dbg !136
  %cmp15 = icmp slt i32 %29, %30, !dbg !137
  br i1 %cmp15, label %if.then16, label %if.end21, !dbg !138

if.then16:                                        ; preds = %for.end14
  %31 = load i32, i32* %dist, align 4, !dbg !139
  %32 = load i32*, i32** %dists.addr, align 8, !dbg !141
  %33 = load i32, i32* %max_dist_id, align 4, !dbg !142
  %idxprom17 = sext i32 %33 to i64, !dbg !141
  %arrayidx18 = getelementptr inbounds i32, i32* %32, i64 %idxprom17, !dbg !141
  store i32 %31, i32* %arrayidx18, align 4, !dbg !143
  %34 = load i32, i32* %label.addr, align 4, !dbg !144
  %35 = load i32*, i32** %labels.addr, align 8, !dbg !145
  %36 = load i32, i32* %max_dist_id, align 4, !dbg !146
  %idxprom19 = sext i32 %36 to i64, !dbg !145
  %arrayidx20 = getelementptr inbounds i32, i32* %35, i64 %idxprom19, !dbg !145
  store i32 %34, i32* %arrayidx20, align 4, !dbg !147
  br label %if.end21, !dbg !148

if.end21:                                         ; preds = %if.then16, %for.end14
  %37 = bitcast i32* %max_dist_id to i8*, !dbg !149
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #6, !dbg !149
  %38 = bitcast i32* %max_dist to i8*, !dbg !149
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #6, !dbg !149
  %39 = bitcast i32* %dist to i8*, !dbg !149
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #6, !dbg !149
  ret void, !dbg !149
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define zeroext i8 @_Z8knn_votePi(i32* "fpga.decayed.dim.hint"="3" %labels) #4 !dbg !150 {
entry:
  %labels.addr = alloca i32*, align 8
  %max_vote = alloca i32, align 4
  %max_label = alloca i8, align 1
  %votes = alloca [10 x i32], align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32* %labels, i32** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %labels.addr, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = bitcast i32* %max_vote to i8*, !dbg !157
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !157
  call void @llvm.dbg.declare(metadata i32* %max_vote, metadata !158, metadata !DIExpression()), !dbg !159
  store i32 0, i32* %max_vote, align 4, !dbg !159
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_label) #6, !dbg !160
  call void @llvm.dbg.declare(metadata i8* %max_label, metadata !161, metadata !DIExpression()), !dbg !162
  store i8 0, i8* %max_label, align 1, !dbg !162
  %1 = bitcast [10 x i32]* %votes to i8*, !dbg !163
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %1) #6, !dbg !163
  call void @llvm.dbg.declare(metadata [10 x i32]* %votes, metadata !164, metadata !DIExpression()), !dbg !168
  %2 = bitcast [10 x i32]* %votes to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 40, i1 false), !dbg !168
  br label %VITIS_LOOP_69_1, !dbg !163

VITIS_LOOP_69_1:                                  ; preds = %entry
  %3 = bitcast i32* %i to i8*, !dbg !169
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #6, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !172
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_69_1
  %4 = load i32, i32* %i, align 4, !dbg !173
  %cmp = icmp slt i32 %4, 3, !dbg !175
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !176

for.cond.cleanup:                                 ; preds = %for.cond
  %5 = bitcast i32* %i to i8*, !dbg !177
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6, !dbg !177
  br label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %labels.addr, align 8, !dbg !178
  %7 = load i32, i32* %i, align 4, !dbg !179
  %idxprom = sext i32 %7 to i64, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !178
  %8 = load i32, i32* %arrayidx, align 4, !dbg !178
  %idxprom1 = sext i32 %8 to i64, !dbg !180
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom1, !dbg !180
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !181
  %inc = add i32 %9, 1, !dbg !181
  store i32 %inc, i32* %arrayidx2, align 4, !dbg !181
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !182
  %inc3 = add i32 %10, 1, !dbg !182
  store i32 %inc3, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !177, !llvm.loop !183

for.end:                                          ; preds = %for.cond.cleanup
  br label %VITIS_LOOP_72_2, !dbg !184

VITIS_LOOP_72_2:                                  ; preds = %for.end
  %11 = bitcast i32* %i4 to i8*, !dbg !186
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #6, !dbg !186
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 0, i32* %i4, align 4, !dbg !189
  br label %for.cond5, !dbg !186

for.cond5:                                        ; preds = %for.inc14, %VITIS_LOOP_72_2
  %12 = load i32, i32* %i4, align 4, !dbg !190
  %cmp6 = icmp slt i32 %12, 10, !dbg !192
  br i1 %cmp6, label %for.body8, label %for.cond.cleanup7, !dbg !193

for.cond.cleanup7:                                ; preds = %for.cond5
  %13 = bitcast i32* %i4 to i8*, !dbg !194
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #6, !dbg !194
  br label %for.end16

for.body8:                                        ; preds = %for.cond5
  %14 = load i32, i32* %i4, align 4, !dbg !195
  %idxprom9 = sext i32 %14 to i64, !dbg !198
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom9, !dbg !198
  %15 = load i32, i32* %arrayidx10, align 4, !dbg !198
  %16 = load i32, i32* %max_vote, align 4, !dbg !199
  %cmp11 = icmp sgt i32 %15, %16, !dbg !200
  br i1 %cmp11, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %for.body8
  %17 = load i32, i32* %i4, align 4, !dbg !202
  %idxprom12 = sext i32 %17 to i64, !dbg !204
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom12, !dbg !204
  %18 = load i32, i32* %arrayidx13, align 4, !dbg !204
  store i32 %18, i32* %max_vote, align 4, !dbg !205
  %19 = load i32, i32* %i4, align 4, !dbg !206
  %conv = trunc i32 %19 to i8, !dbg !206
  store i8 %conv, i8* %max_label, align 1, !dbg !207
  br label %if.end, !dbg !208

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc14, !dbg !209

for.inc14:                                        ; preds = %if.end
  %20 = load i32, i32* %i4, align 4, !dbg !210
  %inc15 = add i32 %20, 1, !dbg !210
  store i32 %inc15, i32* %i4, align 4, !dbg !210
  br label %for.cond5, !dbg !194, !llvm.loop !211

for.end16:                                        ; preds = %for.cond.cleanup7
  %21 = load i8, i8* %max_label, align 1, !dbg !214
  %22 = bitcast [10 x i32]* %votes to i8*, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %22) #6, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_label) #6, !dbg !215
  %23 = bitcast i32* %max_vote to i8*, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #6, !dbg !215
  ret i8 %21, !dbg !216
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

; Function Attrs: nounwind
define void @_Z8DigitRecPKyS0_Phii(i64* %training_set, i64* %test_set, i8* %results, i32 %num_test, i32 %num_training) #5 !dbg !217 !fpga.function.pragma !221 {
entry:
  %training_set.addr = alloca i64*, align 8
  %test_set.addr = alloca i64*, align 8
  %results.addr = alloca i8*, align 8
  %num_test.addr = alloca i32, align 4
  %num_training.addr = alloca i32, align 4
  %CLASS_SIZE = alloca i32, align 4
  %dists = alloca [3 x i32], align 4
  %labels = alloca [3 x i32], align 4
  %t = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %max_vote = alloca i8, align 1
  store i64* %training_set, i64** %training_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %training_set.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i64* %test_set, i64** %test_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %test_set.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i8* %results, i8** %results.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %results.addr, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 %num_test, i32* %num_test.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_test.addr, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 %num_training, i32* %num_training.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_training.addr, metadata !232, metadata !DIExpression()), !dbg !233
  %0 = bitcast i32* %CLASS_SIZE to i8*, !dbg !234
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !234
  call void @llvm.dbg.declare(metadata i32* %CLASS_SIZE, metadata !235, metadata !DIExpression()), !dbg !237
  %1 = load i32, i32* %num_training.addr, align 4, !dbg !238
  %div = sdiv i32 %1, 10, !dbg !239
  store i32 %div, i32* %CLASS_SIZE, align 4, !dbg !237
  %2 = bitcast [3 x i32]* %dists to i8*, !dbg !240
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %2) #6, !dbg !240
  call void @llvm.dbg.declare(metadata [3 x i32]* %dists, metadata !241, metadata !DIExpression()), !dbg !245
  %3 = bitcast [3 x i32]* %labels to i8*, !dbg !246
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %3) #6, !dbg !246
  call void @llvm.dbg.declare(metadata [3 x i32]* %labels, metadata !247, metadata !DIExpression()), !dbg !248
  br label %TEST_LOOP, !dbg !246

TEST_LOOP:                                        ; preds = %entry
  %4 = bitcast i32* %t to i8*, !dbg !249
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #6, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %t, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 0, i32* %t, align 4, !dbg !252
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc25, %TEST_LOOP
  %5 = load i32, i32* %t, align 4, !dbg !253
  %6 = load i32, i32* %num_test.addr, align 4, !dbg !255
  %cmp = icmp slt i32 %5, %6, !dbg !256
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !257

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %7 = bitcast i32* %t to i8*, !dbg !258
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #6, !dbg !258
  br label %for.end27

for.body:                                         ; preds = %for.cond
  br label %SET_KNN_SET, !dbg !259

SET_KNN_SET:                                      ; preds = %for.body
  %8 = bitcast i32* %i to i8*, !dbg !260
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #6, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %i, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 0, i32* %i, align 4, !dbg !264
  br label %for.cond1, !dbg !260

for.cond1:                                        ; preds = %for.inc, %SET_KNN_SET
  %9 = load i32, i32* %i, align 4, !dbg !265
  %cmp2 = icmp slt i32 %9, 3, !dbg !267
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3, !dbg !268

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %cleanup.dest.slot, align 4
  %10 = bitcast i32* %i to i8*, !dbg !269
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #6, !dbg !269
  br label %for.end

for.body4:                                        ; preds = %for.cond1
  %11 = load i32, i32* %i, align 4, !dbg !270
  %idxprom = sext i32 %11 to i64, !dbg !272
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i64 0, i64 %idxprom, !dbg !272
  store i32 256, i32* %arrayidx, align 4, !dbg !273
  %12 = load i32, i32* %i, align 4, !dbg !274
  %idxprom5 = sext i32 %12 to i64, !dbg !275
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i64 0, i64 %idxprom5, !dbg !275
  store i32 0, i32* %arrayidx6, align 4, !dbg !276
  br label %for.inc, !dbg !277

for.inc:                                          ; preds = %for.body4
  %13 = load i32, i32* %i, align 4, !dbg !278
  %inc = add i32 %13, 1, !dbg !278
  store i32 %inc, i32* %i, align 4, !dbg !278
  br label %for.cond1, !dbg !269, !llvm.loop !279

for.end:                                          ; preds = %for.cond.cleanup3
  br label %TRAINING_LOOP, !dbg !280

TRAINING_LOOP:                                    ; preds = %for.end
  %14 = bitcast i32* %i7 to i8*, !dbg !282
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %14) #6, !dbg !282
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 0, i32* %i7, align 4, !dbg !285
  br label %for.cond8, !dbg !282

for.cond8:                                        ; preds = %for.inc19, %TRAINING_LOOP
  %15 = load i32, i32* %i7, align 4, !dbg !286
  %16 = load i32, i32* %num_training.addr, align 4, !dbg !288
  %cmp9 = icmp slt i32 %15, %16, !dbg !289
  br i1 %cmp9, label %for.body11, label %for.cond.cleanup10, !dbg !290

for.cond.cleanup10:                               ; preds = %for.cond8
  store i32 11, i32* %cleanup.dest.slot, align 4
  %17 = bitcast i32* %i7 to i8*, !dbg !291
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !dbg !291
  br label %for.end21

for.body11:                                       ; preds = %for.cond8
  %18 = load i64*, i64** %training_set.addr, align 8, !dbg !292
  %19 = load i32, i32* %i7, align 4, !dbg !293
  %mul = mul i32 %19, 4, !dbg !294
  %idxprom12 = sext i32 %mul to i64, !dbg !292
  %arrayidx13 = getelementptr inbounds i64, i64* %18, i64 %idxprom12, !dbg !292
  %20 = load i64*, i64** %test_set.addr, align 8, !dbg !295
  %21 = load i32, i32* %t, align 4, !dbg !296
  %mul14 = mul i32 %21, 4, !dbg !297
  %idxprom15 = sext i32 %mul14 to i64, !dbg !295
  %arrayidx16 = getelementptr inbounds i64, i64* %20, i64 %idxprom15, !dbg !295
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i32 0, i32 0, !dbg !298
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !299
  %22 = load i32, i32* %i7, align 4, !dbg !300
  %23 = load i32, i32* %CLASS_SIZE, align 4, !dbg !301
  %div18 = sdiv i32 %22, %23, !dbg !302
  call void @_Z10update_knnPKyS0_PiS1_i(i64* %arrayidx13, i64* %arrayidx16, i32* %arraydecay, i32* %arraydecay17, i32 %div18), !dbg !303
  br label %for.inc19, !dbg !303

for.inc19:                                        ; preds = %for.body11
  %24 = load i32, i32* %i7, align 4, !dbg !304
  %inc20 = add i32 %24, 1, !dbg !304
  store i32 %inc20, i32* %i7, align 4, !dbg !304
  br label %for.cond8, !dbg !291, !llvm.loop !305

for.end21:                                        ; preds = %for.cond.cleanup10
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_vote) #6, !dbg !308
  call void @llvm.dbg.declare(metadata i8* %max_vote, metadata !309, metadata !DIExpression()), !dbg !310
  %arraydecay22 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !311
  %call = call zeroext i8 @_Z8knn_votePi(i32* %arraydecay22), !dbg !312
  store i8 %call, i8* %max_vote, align 1, !dbg !310
  %25 = load i8, i8* %max_vote, align 1, !dbg !313
  %26 = load i8*, i8** %results.addr, align 8, !dbg !314
  %27 = load i32, i32* %t, align 4, !dbg !315
  %idxprom23 = sext i32 %27 to i64, !dbg !314
  %arrayidx24 = getelementptr inbounds i8, i8* %26, i64 %idxprom23, !dbg !314
  store i8 %25, i8* %arrayidx24, align 1, !dbg !316
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_vote) #6, !dbg !317
  br label %for.inc25, !dbg !318

for.inc25:                                        ; preds = %for.end21
  %28 = load i32, i32* %t, align 4, !dbg !319
  %inc26 = add i32 %28, 1, !dbg !319
  store i32 %inc26, i32* %t, align 4, !dbg !319
  br label %for.cond, !dbg !258, !llvm.loop !320

for.end27:                                        ; preds = %for.cond.cleanup
  %29 = bitcast [3 x i32]* %labels to i8*, !dbg !323
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %29) #6, !dbg !323
  %30 = bitcast [3 x i32]* %dists to i8*, !dbg !323
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %30) #6, !dbg !323
  %31 = bitcast i32* %CLASS_SIZE to i8*, !dbg !323
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #6, !dbg !323
  ret void, !dbg !323
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="popcount" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="update_knn" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="knn_vote" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="DigitRec" "fpga.top.func"="DigitRec" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13}
!llvm.module.flags = !{!14, !15, !16}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/Approx/raise_digitrec/solution1/.autopilot/db/digitrec.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!2 = !{}
!3 = !{!4, !9, !11}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 6148914691236517205, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "m1", scope: !0, file: !6, line: 12, type: !7, isLocal: true, isDefinition: true)
!6 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/digitrec.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression(DW_OP_constu, 3689348814741910323, DW_OP_stack_value))
!10 = distinct !DIGlobalVariable(name: "m2", scope: !0, file: !6, line: 13, type: !7, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "m4", scope: !0, file: !6, line: 14, type: !7, isLocal: true, isDefinition: true)
!13 = !{!"clang version 7.0.0 "}
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = distinct !DISubprogram(name: "popcount", linkageName: "_Z8popcounty", scope: !6, file: !6, line: 18, type: !18, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "DigitType", file: !22, line: 17, baseType: !8)
!22 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!23 = !DILocalVariable(name: "x", arg: 1, scope: !17, file: !6, line: 18, type: !21)
!24 = !DILocation(line: 18, column: 24, scope: !17)
!25 = !DILocation(line: 20, column: 10, scope: !17)
!26 = !DILocation(line: 20, column: 12, scope: !17)
!27 = !DILocation(line: 20, column: 18, scope: !17)
!28 = !DILocation(line: 20, column: 6, scope: !17)
!29 = !DILocation(line: 21, column: 9, scope: !17)
!30 = !DILocation(line: 21, column: 11, scope: !17)
!31 = !DILocation(line: 21, column: 21, scope: !17)
!32 = !DILocation(line: 21, column: 23, scope: !17)
!33 = !DILocation(line: 21, column: 29, scope: !17)
!34 = !DILocation(line: 21, column: 17, scope: !17)
!35 = !DILocation(line: 21, column: 6, scope: !17)
!36 = !DILocation(line: 22, column: 9, scope: !17)
!37 = !DILocation(line: 22, column: 14, scope: !17)
!38 = !DILocation(line: 22, column: 16, scope: !17)
!39 = !DILocation(line: 22, column: 11, scope: !17)
!40 = !DILocation(line: 22, column: 23, scope: !17)
!41 = !DILocation(line: 22, column: 6, scope: !17)
!42 = !DILocation(line: 23, column: 9, scope: !17)
!43 = !DILocation(line: 23, column: 11, scope: !17)
!44 = !DILocation(line: 23, column: 6, scope: !17)
!45 = !DILocation(line: 24, column: 9, scope: !17)
!46 = !DILocation(line: 24, column: 11, scope: !17)
!47 = !DILocation(line: 24, column: 6, scope: !17)
!48 = !DILocation(line: 25, column: 9, scope: !17)
!49 = !DILocation(line: 25, column: 11, scope: !17)
!50 = !DILocation(line: 25, column: 6, scope: !17)
!51 = !DILocation(line: 26, column: 11, scope: !17)
!52 = !DILocation(line: 26, column: 13, scope: !17)
!53 = !DILocation(line: 26, column: 4, scope: !17)
!54 = distinct !DISubprogram(name: "update_knn", linkageName: "_Z10update_knnPKyS0_PiS1_i", scope: !6, file: !6, line: 29, type: !55, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !57, !57, !59, !59, !20}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!60 = !DILocalVariable(name: "train_inst", arg: 1, scope: !54, file: !6, line: 29, type: !57)
!61 = !DILocation(line: 29, column: 35, scope: !54)
!62 = !DILocalVariable(name: "test_inst", arg: 2, scope: !54, file: !6, line: 29, type: !57)
!63 = !DILocation(line: 29, column: 64, scope: !54)
!64 = !DILocalVariable(name: "dists", arg: 3, scope: !54, file: !6, line: 29, type: !59)
!65 = !DILocation(line: 29, column: 79, scope: !54)
!66 = !DILocalVariable(name: "labels", arg: 4, scope: !54, file: !6, line: 29, type: !59)
!67 = !DILocation(line: 29, column: 93, scope: !54)
!68 = !DILocalVariable(name: "label", arg: 5, scope: !54, file: !6, line: 29, type: !20)
!69 = !DILocation(line: 29, column: 108, scope: !54)
!70 = !DILocation(line: 31, column: 3, scope: !54)
!71 = !DILocalVariable(name: "dist", scope: !54, file: !6, line: 31, type: !20)
!72 = !DILocation(line: 31, column: 7, scope: !54)
!73 = !DILocation(line: 33, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !54, file: !6, line: 33, column: 20)
!75 = !DILocalVariable(name: "i", scope: !74, file: !6, line: 33, type: !20)
!76 = !DILocation(line: 33, column: 29, scope: !74)
!77 = !DILocation(line: 33, column: 36, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !6, line: 33, column: 20)
!79 = !DILocation(line: 33, column: 38, scope: !78)
!80 = !DILocation(line: 33, column: 20, scope: !74)
!81 = !DILocation(line: 33, column: 20, scope: !78)
!82 = !DILocation(line: 35, column: 5, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !6, line: 34, column: 3)
!84 = !DILocalVariable(name: "diff", scope: !83, file: !6, line: 35, type: !21)
!85 = !DILocation(line: 35, column: 15, scope: !83)
!86 = !DILocation(line: 35, column: 22, scope: !83)
!87 = !DILocation(line: 35, column: 32, scope: !83)
!88 = !DILocation(line: 35, column: 37, scope: !83)
!89 = !DILocation(line: 35, column: 48, scope: !83)
!90 = !DILocation(line: 35, column: 35, scope: !83)
!91 = !DILocation(line: 36, column: 22, scope: !83)
!92 = !DILocation(line: 36, column: 13, scope: !83)
!93 = !DILocation(line: 36, column: 10, scope: !83)
!94 = !DILocation(line: 37, column: 3, scope: !78)
!95 = !DILocation(line: 37, column: 3, scope: !83)
!96 = !DILocation(line: 33, column: 45, scope: !78)
!97 = distinct !{!97, !80, !98, !99}
!98 = !DILocation(line: 37, column: 3, scope: !74)
!99 = !{!"llvm.loop.name", !"VITIS_LOOP_33_1"}
!100 = !DILocation(line: 39, column: 3, scope: !54)
!101 = !DILocalVariable(name: "max_dist", scope: !54, file: !6, line: 39, type: !20)
!102 = !DILocation(line: 39, column: 7, scope: !54)
!103 = !DILocation(line: 40, column: 3, scope: !54)
!104 = !DILocalVariable(name: "max_dist_id", scope: !54, file: !6, line: 40, type: !20)
!105 = !DILocation(line: 40, column: 7, scope: !54)
!106 = !DILocation(line: 43, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !54, file: !6, line: 43, column: 18)
!108 = !DILocalVariable(name: "k", scope: !107, file: !6, line: 43, type: !20)
!109 = !DILocation(line: 43, column: 28, scope: !107)
!110 = !DILocation(line: 43, column: 35, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !6, line: 43, column: 18)
!112 = !DILocation(line: 43, column: 37, scope: !111)
!113 = !DILocation(line: 43, column: 18, scope: !107)
!114 = !DILocation(line: 43, column: 18, scope: !111)
!115 = !DILocation(line: 45, column: 10, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !6, line: 45, column: 10)
!117 = distinct !DILexicalBlock(scope: !111, file: !6, line: 44, column: 3)
!118 = !DILocation(line: 45, column: 16, scope: !116)
!119 = !DILocation(line: 45, column: 21, scope: !116)
!120 = !DILocation(line: 45, column: 19, scope: !116)
!121 = !DILocation(line: 45, column: 10, scope: !117)
!122 = !DILocation(line: 47, column: 18, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !6, line: 46, column: 5)
!124 = !DILocation(line: 47, column: 24, scope: !123)
!125 = !DILocation(line: 47, column: 16, scope: !123)
!126 = !DILocation(line: 48, column: 21, scope: !123)
!127 = !DILocation(line: 48, column: 19, scope: !123)
!128 = !DILocation(line: 49, column: 5, scope: !123)
!129 = !DILocation(line: 50, column: 3, scope: !117)
!130 = !DILocation(line: 43, column: 42, scope: !111)
!131 = distinct !{!131, !113, !132, !133}
!132 = !DILocation(line: 50, column: 3, scope: !107)
!133 = !{!"llvm.loop.name", !"FIND_MAX_DIST"}
!134 = !DILocation(line: 53, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !54, file: !6, line: 53, column: 8)
!136 = !DILocation(line: 53, column: 15, scope: !135)
!137 = !DILocation(line: 53, column: 13, scope: !135)
!138 = !DILocation(line: 53, column: 8, scope: !54)
!139 = !DILocation(line: 55, column: 26, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !6, line: 54, column: 3)
!141 = !DILocation(line: 55, column: 5, scope: !140)
!142 = !DILocation(line: 55, column: 11, scope: !140)
!143 = !DILocation(line: 55, column: 24, scope: !140)
!144 = !DILocation(line: 56, column: 27, scope: !140)
!145 = !DILocation(line: 56, column: 5, scope: !140)
!146 = !DILocation(line: 56, column: 12, scope: !140)
!147 = !DILocation(line: 56, column: 25, scope: !140)
!148 = !DILocation(line: 57, column: 3, scope: !140)
!149 = !DILocation(line: 60, column: 1, scope: !54)
!150 = distinct !DISubprogram(name: "knn_vote", linkageName: "_Z8knn_votePi", scope: !6, file: !6, line: 62, type: !151, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!151 = !DISubroutineType(types: !152)
!152 = !{!153, !59}
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !22, line: 18, baseType: !154)
!154 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!155 = !DILocalVariable(name: "labels", arg: 1, scope: !150, file: !6, line: 62, type: !59)
!156 = !DILocation(line: 62, column: 24, scope: !150)
!157 = !DILocation(line: 64, column: 3, scope: !150)
!158 = !DILocalVariable(name: "max_vote", scope: !150, file: !6, line: 64, type: !20)
!159 = !DILocation(line: 64, column: 7, scope: !150)
!160 = !DILocation(line: 65, column: 3, scope: !150)
!161 = !DILocalVariable(name: "max_label", scope: !150, file: !6, line: 65, type: !153)
!162 = !DILocation(line: 65, column: 13, scope: !150)
!163 = !DILocation(line: 67, column: 3, scope: !150)
!164 = !DILocalVariable(name: "votes", scope: !150, file: !6, line: 67, type: !165)
!165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !166)
!166 = !{!167}
!167 = !DISubrange(count: 10)
!168 = !DILocation(line: 67, column: 7, scope: !150)
!169 = !DILocation(line: 69, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !150, file: !6, line: 69, column: 20)
!171 = !DILocalVariable(name: "i", scope: !170, file: !6, line: 69, type: !20)
!172 = !DILocation(line: 69, column: 29, scope: !170)
!173 = !DILocation(line: 69, column: 36, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !6, line: 69, column: 20)
!175 = !DILocation(line: 69, column: 38, scope: !174)
!176 = !DILocation(line: 69, column: 20, scope: !170)
!177 = !DILocation(line: 69, column: 20, scope: !174)
!178 = !DILocation(line: 70, column: 11, scope: !174)
!179 = !DILocation(line: 70, column: 18, scope: !174)
!180 = !DILocation(line: 70, column: 5, scope: !174)
!181 = !DILocation(line: 70, column: 22, scope: !174)
!182 = !DILocation(line: 69, column: 45, scope: !174)
!183 = distinct !{!183, !176, !184, !185}
!184 = !DILocation(line: 70, column: 22, scope: !170)
!185 = !{!"llvm.loop.name", !"VITIS_LOOP_69_1"}
!186 = !DILocation(line: 72, column: 25, scope: !187)
!187 = distinct !DILexicalBlock(scope: !150, file: !6, line: 72, column: 20)
!188 = !DILocalVariable(name: "i", scope: !187, file: !6, line: 72, type: !20)
!189 = !DILocation(line: 72, column: 29, scope: !187)
!190 = !DILocation(line: 72, column: 36, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !6, line: 72, column: 20)
!192 = !DILocation(line: 72, column: 38, scope: !191)
!193 = !DILocation(line: 72, column: 20, scope: !187)
!194 = !DILocation(line: 72, column: 20, scope: !191)
!195 = !DILocation(line: 74, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !6, line: 74, column: 9)
!197 = distinct !DILexicalBlock(scope: !191, file: !6, line: 73, column: 3)
!198 = !DILocation(line: 74, column: 9, scope: !196)
!199 = !DILocation(line: 74, column: 20, scope: !196)
!200 = !DILocation(line: 74, column: 18, scope: !196)
!201 = !DILocation(line: 74, column: 9, scope: !197)
!202 = !DILocation(line: 76, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !6, line: 75, column: 5)
!204 = !DILocation(line: 76, column: 18, scope: !203)
!205 = !DILocation(line: 76, column: 16, scope: !203)
!206 = !DILocation(line: 77, column: 19, scope: !203)
!207 = !DILocation(line: 77, column: 17, scope: !203)
!208 = !DILocation(line: 78, column: 5, scope: !203)
!209 = !DILocation(line: 79, column: 3, scope: !197)
!210 = !DILocation(line: 72, column: 46, scope: !191)
!211 = distinct !{!211, !193, !212, !213}
!212 = !DILocation(line: 79, column: 3, scope: !187)
!213 = !{!"llvm.loop.name", !"VITIS_LOOP_72_2"}
!214 = !DILocation(line: 81, column: 10, scope: !150)
!215 = !DILocation(line: 82, column: 1, scope: !150)
!216 = !DILocation(line: 81, column: 3, scope: !150)
!217 = distinct !DISubprogram(name: "DigitRec", linkageName: "_Z8DigitRecPKyS0_Phii", scope: !6, file: !6, line: 85, type: !218, isLocal: false, isDefinition: true, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!218 = !DISubroutineType(types: !219)
!219 = !{null, !57, !57, !220, !20, !20}
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!221 = !{!222}
!222 = !{!"fpga.top", !"user", !223}
!223 = !DILocation(line: 85, column: 16, scope: !217)
!224 = !DILocalVariable(name: "training_set", arg: 1, scope: !217, file: !6, line: 86, type: !57)
!225 = !DILocation(line: 86, column: 20, scope: !217)
!226 = !DILocalVariable(name: "test_set", arg: 2, scope: !217, file: !6, line: 87, type: !57)
!227 = !DILocation(line: 87, column: 20, scope: !217)
!228 = !DILocalVariable(name: "results", arg: 3, scope: !217, file: !6, line: 88, type: !220)
!229 = !DILocation(line: 88, column: 14, scope: !217)
!230 = !DILocalVariable(name: "num_test", arg: 4, scope: !217, file: !6, line: 89, type: !20)
!231 = !DILocation(line: 89, column: 7, scope: !217)
!232 = !DILocalVariable(name: "num_training", arg: 5, scope: !217, file: !6, line: 90, type: !20)
!233 = !DILocation(line: 90, column: 7, scope: !217)
!234 = !DILocation(line: 92, column: 3, scope: !217)
!235 = !DILocalVariable(name: "CLASS_SIZE", scope: !217, file: !6, line: 92, type: !236)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!237 = !DILocation(line: 92, column: 13, scope: !217)
!238 = !DILocation(line: 92, column: 26, scope: !217)
!239 = !DILocation(line: 92, column: 39, scope: !217)
!240 = !DILocation(line: 95, column: 3, scope: !217)
!241 = !DILocalVariable(name: "dists", scope: !217, file: !6, line: 95, type: !242)
!242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 96, elements: !243)
!243 = !{!244}
!244 = !DISubrange(count: 3)
!245 = !DILocation(line: 95, column: 7, scope: !217)
!246 = !DILocation(line: 96, column: 3, scope: !217)
!247 = !DILocalVariable(name: "labels", scope: !217, file: !6, line: 96, type: !242)
!248 = !DILocation(line: 96, column: 7, scope: !217)
!249 = !DILocation(line: 99, column: 19, scope: !250)
!250 = distinct !DILexicalBlock(scope: !217, file: !6, line: 99, column: 14)
!251 = !DILocalVariable(name: "t", scope: !250, file: !6, line: 99, type: !20)
!252 = !DILocation(line: 99, column: 23, scope: !250)
!253 = !DILocation(line: 99, column: 30, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !6, line: 99, column: 14)
!255 = !DILocation(line: 99, column: 34, scope: !254)
!256 = !DILocation(line: 99, column: 32, scope: !254)
!257 = !DILocation(line: 99, column: 14, scope: !250)
!258 = !DILocation(line: 99, column: 14, scope: !254)
!259 = !DILocation(line: 100, column: 3, scope: !254)
!260 = !DILocation(line: 102, column: 24, scope: !261)
!261 = distinct !DILexicalBlock(scope: !262, file: !6, line: 102, column: 18)
!262 = distinct !DILexicalBlock(scope: !254, file: !6, line: 100, column: 3)
!263 = !DILocalVariable(name: "i", scope: !261, file: !6, line: 102, type: !20)
!264 = !DILocation(line: 102, column: 28, scope: !261)
!265 = !DILocation(line: 102, column: 35, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !6, line: 102, column: 18)
!267 = !DILocation(line: 102, column: 37, scope: !266)
!268 = !DILocation(line: 102, column: 18, scope: !261)
!269 = !DILocation(line: 102, column: 18, scope: !266)
!270 = !DILocation(line: 105, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !6, line: 103, column: 5)
!272 = !DILocation(line: 105, column: 7, scope: !271)
!273 = !DILocation(line: 105, column: 16, scope: !271)
!274 = !DILocation(line: 106, column: 14, scope: !271)
!275 = !DILocation(line: 106, column: 7, scope: !271)
!276 = !DILocation(line: 106, column: 17, scope: !271)
!277 = !DILocation(line: 107, column: 5, scope: !271)
!278 = !DILocation(line: 102, column: 42, scope: !266)
!279 = distinct !{!279, !268, !280, !281}
!280 = !DILocation(line: 107, column: 5, scope: !261)
!281 = !{!"llvm.loop.name", !"SET_KNN_SET"}
!282 = !DILocation(line: 110, column: 27, scope: !283)
!283 = distinct !DILexicalBlock(scope: !262, file: !6, line: 110, column: 21)
!284 = !DILocalVariable(name: "i", scope: !283, file: !6, line: 110, type: !20)
!285 = !DILocation(line: 110, column: 31, scope: !283)
!286 = !DILocation(line: 110, column: 38, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !6, line: 110, column: 21)
!288 = !DILocation(line: 110, column: 42, scope: !287)
!289 = !DILocation(line: 110, column: 40, scope: !287)
!290 = !DILocation(line: 110, column: 21, scope: !283)
!291 = !DILocation(line: 110, column: 21, scope: !287)
!292 = !DILocation(line: 111, column: 19, scope: !287)
!293 = !DILocation(line: 111, column: 32, scope: !287)
!294 = !DILocation(line: 111, column: 34, scope: !287)
!295 = !DILocation(line: 111, column: 41, scope: !287)
!296 = !DILocation(line: 111, column: 50, scope: !287)
!297 = !DILocation(line: 111, column: 52, scope: !287)
!298 = !DILocation(line: 111, column: 58, scope: !287)
!299 = !DILocation(line: 111, column: 65, scope: !287)
!300 = !DILocation(line: 111, column: 73, scope: !287)
!301 = !DILocation(line: 111, column: 77, scope: !287)
!302 = !DILocation(line: 111, column: 75, scope: !287)
!303 = !DILocation(line: 111, column: 7, scope: !287)
!304 = !DILocation(line: 110, column: 56, scope: !287)
!305 = distinct !{!305, !290, !306, !307}
!306 = !DILocation(line: 111, column: 87, scope: !283)
!307 = !{!"llvm.loop.name", !"TRAINING_LOOP"}
!308 = !DILocation(line: 114, column: 5, scope: !262)
!309 = !DILocalVariable(name: "max_vote", scope: !262, file: !6, line: 114, type: !153)
!310 = !DILocation(line: 114, column: 15, scope: !262)
!311 = !DILocation(line: 114, column: 35, scope: !262)
!312 = !DILocation(line: 114, column: 26, scope: !262)
!313 = !DILocation(line: 115, column: 18, scope: !262)
!314 = !DILocation(line: 115, column: 5, scope: !262)
!315 = !DILocation(line: 115, column: 13, scope: !262)
!316 = !DILocation(line: 115, column: 16, scope: !262)
!317 = !DILocation(line: 116, column: 3, scope: !254)
!318 = !DILocation(line: 116, column: 3, scope: !262)
!319 = !DILocation(line: 99, column: 44, scope: !254)
!320 = distinct !{!320, !257, !321, !322}
!321 = !DILocation(line: 116, column: 3, scope: !250)
!322 = !{!"llvm.loop.name", !"TEST_LOOP"}
!323 = !DILocation(line: 117, column: 1, scope: !217)
