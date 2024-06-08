; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind
define i32 @_Z8popcounty(i64 %x) #0 !dbg !19 {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i64, i64* %x.addr, align 8, !dbg !26
  %shr = lshr i64 %0, 1, !dbg !27
  %and = and i64 %shr, 6148914691236517205, !dbg !28
  %1 = load i64, i64* %x.addr, align 8, !dbg !29
  %sub = sub i64 %1, %and, !dbg !29
  store i64 %sub, i64* %x.addr, align 8, !dbg !29
  %2 = load i64, i64* %x.addr, align 8, !dbg !30
  %and1 = and i64 %2, 3689348814741910323, !dbg !31
  %3 = load i64, i64* %x.addr, align 8, !dbg !32
  %shr2 = lshr i64 %3, 2, !dbg !33
  %and3 = and i64 %shr2, 3689348814741910323, !dbg !34
  %add = add i64 %and1, %and3, !dbg !35
  store i64 %add, i64* %x.addr, align 8, !dbg !36
  %4 = load i64, i64* %x.addr, align 8, !dbg !37
  %5 = load i64, i64* %x.addr, align 8, !dbg !38
  %shr4 = lshr i64 %5, 4, !dbg !39
  %add5 = add i64 %4, %shr4, !dbg !40
  %and6 = and i64 %add5, 1085102592571150095, !dbg !41
  store i64 %and6, i64* %x.addr, align 8, !dbg !42
  %6 = load i64, i64* %x.addr, align 8, !dbg !43
  %shr7 = lshr i64 %6, 8, !dbg !44
  %7 = load i64, i64* %x.addr, align 8, !dbg !45
  %add8 = add i64 %7, %shr7, !dbg !45
  store i64 %add8, i64* %x.addr, align 8, !dbg !45
  %8 = load i64, i64* %x.addr, align 8, !dbg !46
  %shr9 = lshr i64 %8, 16, !dbg !47
  %9 = load i64, i64* %x.addr, align 8, !dbg !48
  %add10 = add i64 %9, %shr9, !dbg !48
  store i64 %add10, i64* %x.addr, align 8, !dbg !48
  %10 = load i64, i64* %x.addr, align 8, !dbg !49
  %shr11 = lshr i64 %10, 32, !dbg !50
  %11 = load i64, i64* %x.addr, align 8, !dbg !51
  %add12 = add i64 %11, %shr11, !dbg !51
  store i64 %add12, i64* %x.addr, align 8, !dbg !51
  %12 = load i64, i64* %x.addr, align 8, !dbg !52
  %and13 = and i64 %12, 127, !dbg !53
  %conv = trunc i64 %and13 to i32, !dbg !52
  ret i32 %conv, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
define void @_Z10update_knnPKyS0_PiS1_i(i64* %train_inst, i64* %test_inst, i32* "fpga.decayed.dim.hint"="3" %dists, i32* "fpga.decayed.dim.hint"="3" %labels, i32 %label) #2 !dbg !55 {
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
  call void @llvm.dbg.declare(metadata i64** %train_inst.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i64* %test_inst, i64** %test_inst.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %test_inst.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i32* %dists, i32** %dists.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dists.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* %labels, i32** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %labels.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 %label, i32* %label.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %label.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = bitcast i32* %dist to i8*, !dbg !71
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !71
  call void @llvm.dbg.declare(metadata i32* %dist, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %dist, align 4, !dbg !73
  br label %VITIS_LOOP_33_1, !dbg !71

VITIS_LOOP_33_1:                                  ; preds = %entry
  %1 = bitcast i32* %i to i8*, !dbg !74
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %i, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 0, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_33_1
  %2 = load i32, i32* %i, align 4, !dbg !78
  %cmp = icmp slt i32 %2, 4, !dbg !80
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !81

for.cond.cleanup:                                 ; preds = %for.cond
  %3 = bitcast i32* %i to i8*, !dbg !82
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #6, !dbg !82
  br label %for.end

for.body:                                         ; preds = %for.cond
  %4 = bitcast i64* %diff to i8*, !dbg !83
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !dbg !83
  call void @llvm.dbg.declare(metadata i64* %diff, metadata !85, metadata !DIExpression()), !dbg !86
  %5 = load i64*, i64** %test_inst.addr, align 8, !dbg !87
  %6 = load i32, i32* %i, align 4, !dbg !88
  %idxprom = sext i32 %6 to i64, !dbg !87
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %idxprom, !dbg !87
  %7 = load i64, i64* %arrayidx, align 8, !dbg !87
  %8 = load i64*, i64** %train_inst.addr, align 8, !dbg !89
  %9 = load i32, i32* %i, align 4, !dbg !90
  %idxprom1 = sext i32 %9 to i64, !dbg !89
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 %idxprom1, !dbg !89
  %10 = load i64, i64* %arrayidx2, align 8, !dbg !89
  %xor = xor i64 %7, %10, !dbg !91
  store i64 %xor, i64* %diff, align 8, !dbg !86
  %11 = load i64, i64* %diff, align 8, !dbg !92
  %call = call i32 @_Z8popcounty(i64 %11), !dbg !93
  %12 = load i32, i32* %dist, align 4, !dbg !94
  %add = add i32 %12, %call, !dbg !94
  store i32 %add, i32* %dist, align 4, !dbg !94
  %13 = bitcast i64* %diff to i8*, !dbg !95
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #6, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4, !dbg !97
  %inc = add i32 %14, 1, !dbg !97
  store i32 %inc, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !82, !llvm.loop !98

for.end:                                          ; preds = %for.cond.cleanup
  %15 = bitcast i32* %max_dist to i8*, !dbg !101
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #6, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %max_dist, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 0, i32* %max_dist, align 4, !dbg !103
  %16 = bitcast i32* %max_dist_id to i8*, !dbg !104
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #6, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %max_dist_id, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 4, i32* %max_dist_id, align 4, !dbg !106
  br label %FIND_MAX_DIST, !dbg !104

FIND_MAX_DIST:                                    ; preds = %for.end
  %17 = bitcast i32* %k to i8*, !dbg !107
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #6, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %k, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 0, i32* %k, align 4, !dbg !110
  br label %for.cond3, !dbg !107

for.cond3:                                        ; preds = %for.inc12, %FIND_MAX_DIST
  %18 = load i32, i32* %k, align 4, !dbg !111
  %cmp4 = icmp slt i32 %18, 3, !dbg !113
  br i1 %cmp4, label %for.body6, label %for.cond.cleanup5, !dbg !114

for.cond.cleanup5:                                ; preds = %for.cond3
  %19 = bitcast i32* %k to i8*, !dbg !115
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #6, !dbg !115
  br label %for.end14

for.body6:                                        ; preds = %for.cond3
  %20 = load i32*, i32** %dists.addr, align 8, !dbg !116
  %21 = load i32, i32* %k, align 4, !dbg !119
  %idxprom7 = sext i32 %21 to i64, !dbg !116
  %arrayidx8 = getelementptr inbounds i32, i32* %20, i64 %idxprom7, !dbg !116
  %22 = load i32, i32* %arrayidx8, align 4, !dbg !116
  %23 = load i32, i32* %max_dist, align 4, !dbg !120
  %cmp9 = icmp sgt i32 %22, %23, !dbg !121
  br i1 %cmp9, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %for.body6
  %24 = load i32*, i32** %dists.addr, align 8, !dbg !123
  %25 = load i32, i32* %k, align 4, !dbg !125
  %idxprom10 = sext i32 %25 to i64, !dbg !123
  %arrayidx11 = getelementptr inbounds i32, i32* %24, i64 %idxprom10, !dbg !123
  %26 = load i32, i32* %arrayidx11, align 4, !dbg !123
  store i32 %26, i32* %max_dist, align 4, !dbg !126
  %27 = load i32, i32* %k, align 4, !dbg !127
  store i32 %27, i32* %max_dist_id, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc12, !dbg !130

for.inc12:                                        ; preds = %if.end
  %28 = load i32, i32* %k, align 4, !dbg !131
  %inc13 = add i32 %28, 1, !dbg !131
  store i32 %inc13, i32* %k, align 4, !dbg !131
  br label %for.cond3, !dbg !115, !llvm.loop !132

for.end14:                                        ; preds = %for.cond.cleanup5
  %29 = load i32, i32* %dist, align 4, !dbg !135
  %30 = load i32, i32* %max_dist, align 4, !dbg !137
  %cmp15 = icmp slt i32 %29, %30, !dbg !138
  br i1 %cmp15, label %if.then16, label %if.end21, !dbg !139

if.then16:                                        ; preds = %for.end14
  %31 = load i32, i32* %dist, align 4, !dbg !140
  %32 = load i32*, i32** %dists.addr, align 8, !dbg !142
  %33 = load i32, i32* %max_dist_id, align 4, !dbg !143
  %idxprom17 = sext i32 %33 to i64, !dbg !142
  %arrayidx18 = getelementptr inbounds i32, i32* %32, i64 %idxprom17, !dbg !142
  store i32 %31, i32* %arrayidx18, align 4, !dbg !144
  %34 = load i32, i32* %label.addr, align 4, !dbg !145
  %35 = load i32*, i32** %labels.addr, align 8, !dbg !146
  %36 = load i32, i32* %max_dist_id, align 4, !dbg !147
  %idxprom19 = sext i32 %36 to i64, !dbg !146
  %arrayidx20 = getelementptr inbounds i32, i32* %35, i64 %idxprom19, !dbg !146
  store i32 %34, i32* %arrayidx20, align 4, !dbg !148
  br label %if.end21, !dbg !149

if.end21:                                         ; preds = %if.then16, %for.end14
  %37 = bitcast i32* %max_dist_id to i8*, !dbg !150
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #6, !dbg !150
  %38 = bitcast i32* %max_dist to i8*, !dbg !150
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #6, !dbg !150
  %39 = bitcast i32* %dist to i8*, !dbg !150
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #6, !dbg !150
  ret void, !dbg !150
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define zeroext i8 @_Z8knn_votePi(i32* "fpga.decayed.dim.hint"="3" %labels) #4 !dbg !151 {
entry:
  %labels.addr = alloca i32*, align 8
  %max_vote = alloca i32, align 4
  %max_label = alloca i8, align 1
  %votes = alloca [10 x i32], align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32* %labels, i32** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %labels.addr, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = bitcast i32* %max_vote to i8*, !dbg !158
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !158
  call void @llvm.dbg.declare(metadata i32* %max_vote, metadata !159, metadata !DIExpression()), !dbg !160
  store i32 0, i32* %max_vote, align 4, !dbg !160
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_label) #6, !dbg !161
  call void @llvm.dbg.declare(metadata i8* %max_label, metadata !162, metadata !DIExpression()), !dbg !163
  store i8 0, i8* %max_label, align 1, !dbg !163
  %1 = bitcast [10 x i32]* %votes to i8*, !dbg !164
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %1) #6, !dbg !164
  call void @llvm.dbg.declare(metadata [10 x i32]* %votes, metadata !165, metadata !DIExpression()), !dbg !169
  %2 = bitcast [10 x i32]* %votes to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 40, i1 false), !dbg !169
  br label %VITIS_LOOP_69_1, !dbg !164

VITIS_LOOP_69_1:                                  ; preds = %entry
  %3 = bitcast i32* %i to i8*, !dbg !170
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #6, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_69_1
  %4 = load i32, i32* %i, align 4, !dbg !174
  %cmp = icmp slt i32 %4, 3, !dbg !176
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !177

for.cond.cleanup:                                 ; preds = %for.cond
  %5 = bitcast i32* %i to i8*, !dbg !178
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6, !dbg !178
  br label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %labels.addr, align 8, !dbg !179
  %7 = load i32, i32* %i, align 4, !dbg !180
  %idxprom = sext i32 %7 to i64, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !179
  %8 = load i32, i32* %arrayidx, align 4, !dbg !179
  %idxprom1 = sext i32 %8 to i64, !dbg !181
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom1, !dbg !181
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !182
  %inc = add i32 %9, 1, !dbg !182
  store i32 %inc, i32* %arrayidx2, align 4, !dbg !182
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !183
  %inc3 = add i32 %10, 1, !dbg !183
  store i32 %inc3, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !178, !llvm.loop !184

for.end:                                          ; preds = %for.cond.cleanup
  br label %VITIS_LOOP_72_2, !dbg !185

VITIS_LOOP_72_2:                                  ; preds = %for.end
  %11 = bitcast i32* %i4 to i8*, !dbg !187
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #6, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 0, i32* %i4, align 4, !dbg !190
  br label %for.cond5, !dbg !187

for.cond5:                                        ; preds = %for.inc14, %VITIS_LOOP_72_2
  %12 = load i32, i32* %i4, align 4, !dbg !191
  %cmp6 = icmp slt i32 %12, 10, !dbg !193
  br i1 %cmp6, label %for.body8, label %for.cond.cleanup7, !dbg !194

for.cond.cleanup7:                                ; preds = %for.cond5
  %13 = bitcast i32* %i4 to i8*, !dbg !195
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #6, !dbg !195
  br label %for.end16

for.body8:                                        ; preds = %for.cond5
  %14 = load i32, i32* %i4, align 4, !dbg !196
  %idxprom9 = sext i32 %14 to i64, !dbg !199
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom9, !dbg !199
  %15 = load i32, i32* %arrayidx10, align 4, !dbg !199
  %16 = load i32, i32* %max_vote, align 4, !dbg !200
  %cmp11 = icmp sgt i32 %15, %16, !dbg !201
  br i1 %cmp11, label %if.then, label %if.end, !dbg !202

if.then:                                          ; preds = %for.body8
  %17 = load i32, i32* %i4, align 4, !dbg !203
  %idxprom12 = sext i32 %17 to i64, !dbg !205
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom12, !dbg !205
  %18 = load i32, i32* %arrayidx13, align 4, !dbg !205
  store i32 %18, i32* %max_vote, align 4, !dbg !206
  %19 = load i32, i32* %i4, align 4, !dbg !207
  %conv = trunc i32 %19 to i8, !dbg !207
  store i8 %conv, i8* %max_label, align 1, !dbg !208
  br label %if.end, !dbg !209

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc14, !dbg !210

for.inc14:                                        ; preds = %if.end
  %20 = load i32, i32* %i4, align 4, !dbg !211
  %inc15 = add i32 %20, 1, !dbg !211
  store i32 %inc15, i32* %i4, align 4, !dbg !211
  br label %for.cond5, !dbg !195, !llvm.loop !212

for.end16:                                        ; preds = %for.cond.cleanup7
  %21 = load i8, i8* %max_label, align 1, !dbg !215
  %22 = bitcast [10 x i32]* %votes to i8*, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %22) #6, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_label) #6, !dbg !216
  %23 = bitcast i32* %max_vote to i8*, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #6, !dbg !216
  ret i8 %21, !dbg !217
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

; Function Attrs: nounwind
define void @_Z8DigitRecPKyS0_PKhPhii(i64* %training_set, i64* %test_set, i8* %training_labels, i8* %results, i32 %num_test, i32 %num_training) #5 !dbg !218 !fpga.function.pragma !224 {
entry:
  %training_set.addr = alloca i64*, align 8
  %test_set.addr = alloca i64*, align 8
  %training_labels.addr = alloca i8*, align 8
  %results.addr = alloca i8*, align 8
  %num_test.addr = alloca i32, align 4
  %num_training.addr = alloca i32, align 4
  %dists = alloca [3 x i32], align 4
  %labels = alloca [3 x i32], align 4
  %t = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %max_vote = alloca i8, align 1
  store i64* %training_set, i64** %training_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %training_set.addr, metadata !227, metadata !DIExpression()), !dbg !228
  store i64* %test_set, i64** %test_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %test_set.addr, metadata !229, metadata !DIExpression()), !dbg !230
  store i8* %training_labels, i8** %training_labels.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %training_labels.addr, metadata !231, metadata !DIExpression()), !dbg !232
  store i8* %results, i8** %results.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %results.addr, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 %num_test, i32* %num_test.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_test.addr, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 %num_training, i32* %num_training.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_training.addr, metadata !237, metadata !DIExpression()), !dbg !238
  %0 = bitcast [3 x i32]* %dists to i8*, !dbg !239
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %0) #6, !dbg !239
  call void @llvm.dbg.declare(metadata [3 x i32]* %dists, metadata !240, metadata !DIExpression()), !dbg !244
  %1 = bitcast [3 x i32]* %labels to i8*, !dbg !245
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %1) #6, !dbg !245
  call void @llvm.dbg.declare(metadata [3 x i32]* %labels, metadata !246, metadata !DIExpression()), !dbg !247
  br label %TEST_LOOP, !dbg !245

TEST_LOOP:                                        ; preds = %entry
  %2 = bitcast i32* %t to i8*, !dbg !248
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !dbg !248
  call void @llvm.dbg.declare(metadata i32* %t, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 0, i32* %t, align 4, !dbg !251
  br label %for.cond, !dbg !248

for.cond:                                         ; preds = %for.inc26, %TEST_LOOP
  %3 = load i32, i32* %t, align 4, !dbg !252
  %4 = load i32, i32* %num_test.addr, align 4, !dbg !254
  %cmp = icmp slt i32 %3, %4, !dbg !255
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !256

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %5 = bitcast i32* %t to i8*, !dbg !257
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6, !dbg !257
  br label %for.end28

for.body:                                         ; preds = %for.cond
  br label %SET_KNN_SET, !dbg !258

SET_KNN_SET:                                      ; preds = %for.body
  %6 = bitcast i32* %i to i8*, !dbg !259
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #6, !dbg !259
  call void @llvm.dbg.declare(metadata i32* %i, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond1, !dbg !259

for.cond1:                                        ; preds = %for.inc, %SET_KNN_SET
  %7 = load i32, i32* %i, align 4, !dbg !264
  %cmp2 = icmp slt i32 %7, 3, !dbg !266
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3, !dbg !267

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %cleanup.dest.slot, align 4
  %8 = bitcast i32* %i to i8*, !dbg !268
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #6, !dbg !268
  br label %for.end

for.body4:                                        ; preds = %for.cond1
  %9 = load i32, i32* %i, align 4, !dbg !269
  %idxprom = sext i32 %9 to i64, !dbg !271
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i64 0, i64 %idxprom, !dbg !271
  store i32 256, i32* %arrayidx, align 4, !dbg !272
  %10 = load i32, i32* %i, align 4, !dbg !273
  %idxprom5 = sext i32 %10 to i64, !dbg !274
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i64 0, i64 %idxprom5, !dbg !274
  store i32 0, i32* %arrayidx6, align 4, !dbg !275
  br label %for.inc, !dbg !276

for.inc:                                          ; preds = %for.body4
  %11 = load i32, i32* %i, align 4, !dbg !277
  %inc = add i32 %11, 1, !dbg !277
  store i32 %inc, i32* %i, align 4, !dbg !277
  br label %for.cond1, !dbg !268, !llvm.loop !278

for.end:                                          ; preds = %for.cond.cleanup3
  br label %TRAINING_LOOP, !dbg !279

TRAINING_LOOP:                                    ; preds = %for.end
  %12 = bitcast i32* %i7 to i8*, !dbg !281
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #6, !dbg !281
  call void @llvm.dbg.declare(metadata i32* %i7, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 0, i32* %i7, align 4, !dbg !284
  br label %for.cond8, !dbg !281

for.cond8:                                        ; preds = %for.inc20, %TRAINING_LOOP
  %13 = load i32, i32* %i7, align 4, !dbg !285
  %14 = load i32, i32* %num_training.addr, align 4, !dbg !287
  %cmp9 = icmp slt i32 %13, %14, !dbg !288
  br i1 %cmp9, label %for.body11, label %for.cond.cleanup10, !dbg !289

for.cond.cleanup10:                               ; preds = %for.cond8
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %i7 to i8*, !dbg !290
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #6, !dbg !290
  br label %for.end22

for.body11:                                       ; preds = %for.cond8
  %16 = load i64*, i64** %training_set.addr, align 8, !dbg !291
  %17 = load i32, i32* %i7, align 4, !dbg !292
  %mul = mul i32 %17, 4, !dbg !293
  %idxprom12 = sext i32 %mul to i64, !dbg !291
  %arrayidx13 = getelementptr inbounds i64, i64* %16, i64 %idxprom12, !dbg !291
  %18 = load i64*, i64** %test_set.addr, align 8, !dbg !294
  %19 = load i32, i32* %t, align 4, !dbg !295
  %mul14 = mul i32 %19, 4, !dbg !296
  %idxprom15 = sext i32 %mul14 to i64, !dbg !294
  %arrayidx16 = getelementptr inbounds i64, i64* %18, i64 %idxprom15, !dbg !294
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i32 0, i32 0, !dbg !297
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !298
  %20 = load i8*, i8** %training_labels.addr, align 8, !dbg !299
  %21 = load i32, i32* %i7, align 4, !dbg !300
  %idxprom18 = sext i32 %21 to i64, !dbg !299
  %arrayidx19 = getelementptr inbounds i8, i8* %20, i64 %idxprom18, !dbg !299
  %22 = load i8, i8* %arrayidx19, align 1, !dbg !299
  %conv = zext i8 %22 to i32, !dbg !299
  call void @_Z10update_knnPKyS0_PiS1_i(i64* %arrayidx13, i64* %arrayidx16, i32* %arraydecay, i32* %arraydecay17, i32 %conv), !dbg !301
  br label %for.inc20, !dbg !301

for.inc20:                                        ; preds = %for.body11
  %23 = load i32, i32* %i7, align 4, !dbg !302
  %inc21 = add i32 %23, 1, !dbg !302
  store i32 %inc21, i32* %i7, align 4, !dbg !302
  br label %for.cond8, !dbg !290, !llvm.loop !303

for.end22:                                        ; preds = %for.cond.cleanup10
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_vote) #6, !dbg !306
  call void @llvm.dbg.declare(metadata i8* %max_vote, metadata !307, metadata !DIExpression()), !dbg !308
  %arraydecay23 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !309
  %call = call zeroext i8 @_Z8knn_votePi(i32* %arraydecay23), !dbg !310
  store i8 %call, i8* %max_vote, align 1, !dbg !308
  %24 = load i8, i8* %max_vote, align 1, !dbg !311
  %25 = load i8*, i8** %results.addr, align 8, !dbg !312
  %26 = load i32, i32* %t, align 4, !dbg !313
  %idxprom24 = sext i32 %26 to i64, !dbg !312
  %arrayidx25 = getelementptr inbounds i8, i8* %25, i64 %idxprom24, !dbg !312
  store i8 %24, i8* %arrayidx25, align 1, !dbg !314
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_vote) #6, !dbg !315
  br label %for.inc26, !dbg !316

for.inc26:                                        ; preds = %for.end22
  %27 = load i32, i32* %t, align 4, !dbg !317
  %inc27 = add i32 %27, 1, !dbg !317
  store i32 %inc27, i32* %t, align 4, !dbg !317
  br label %for.cond, !dbg !257, !llvm.loop !318

for.end28:                                        ; preds = %for.cond.cleanup
  %28 = bitcast [3 x i32]* %labels to i8*, !dbg !321
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %28) #6, !dbg !321
  %29 = bitcast [3 x i32]* %dists to i8*, !dbg !321
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %29) #6, !dbg !321
  ret void, !dbg !321
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="popcount" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="update_knn" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="knn_vote" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="DigitRec" "fpga.top.func"="DigitRec" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15, !15}
!llvm.module.flags = !{!16, !17, !18}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !5)
!1 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/Approx/raise_digitrec/solution1/.autopilot/db/digitrec.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{!6, !11, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression(DW_OP_constu, 6148914691236517205, DW_OP_stack_value))
!7 = distinct !DIGlobalVariable(name: "m1", scope: !0, file: !8, line: 12, type: !9, isLocal: true, isDefinition: true)
!8 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/digitrec.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!9 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!10 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 3689348814741910323, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "m2", scope: !0, file: !8, line: 13, type: !9, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_stack_value))
!14 = distinct !DIGlobalVariable(name: "m4", scope: !0, file: !8, line: 14, type: !9, isLocal: true, isDefinition: true)
!15 = !{!"clang version 7.0.0 "}
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = distinct !DISubprogram(name: "popcount", linkageName: "_Z8popcounty", scope: !8, file: !8, line: 18, type: !20, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!4, !22}
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "DigitType", file: !23, line: 17, baseType: !10)
!23 = !DIFile(filename: "benchmarks/rosetta/digit-recognition/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!24 = !DILocalVariable(name: "x", arg: 1, scope: !19, file: !8, line: 18, type: !22)
!25 = !DILocation(line: 18, column: 24, scope: !19)
!26 = !DILocation(line: 20, column: 10, scope: !19)
!27 = !DILocation(line: 20, column: 12, scope: !19)
!28 = !DILocation(line: 20, column: 18, scope: !19)
!29 = !DILocation(line: 20, column: 6, scope: !19)
!30 = !DILocation(line: 21, column: 9, scope: !19)
!31 = !DILocation(line: 21, column: 11, scope: !19)
!32 = !DILocation(line: 21, column: 21, scope: !19)
!33 = !DILocation(line: 21, column: 23, scope: !19)
!34 = !DILocation(line: 21, column: 29, scope: !19)
!35 = !DILocation(line: 21, column: 17, scope: !19)
!36 = !DILocation(line: 21, column: 6, scope: !19)
!37 = !DILocation(line: 22, column: 9, scope: !19)
!38 = !DILocation(line: 22, column: 14, scope: !19)
!39 = !DILocation(line: 22, column: 16, scope: !19)
!40 = !DILocation(line: 22, column: 11, scope: !19)
!41 = !DILocation(line: 22, column: 23, scope: !19)
!42 = !DILocation(line: 22, column: 6, scope: !19)
!43 = !DILocation(line: 23, column: 9, scope: !19)
!44 = !DILocation(line: 23, column: 11, scope: !19)
!45 = !DILocation(line: 23, column: 6, scope: !19)
!46 = !DILocation(line: 24, column: 9, scope: !19)
!47 = !DILocation(line: 24, column: 11, scope: !19)
!48 = !DILocation(line: 24, column: 6, scope: !19)
!49 = !DILocation(line: 25, column: 9, scope: !19)
!50 = !DILocation(line: 25, column: 11, scope: !19)
!51 = !DILocation(line: 25, column: 6, scope: !19)
!52 = !DILocation(line: 26, column: 11, scope: !19)
!53 = !DILocation(line: 26, column: 13, scope: !19)
!54 = !DILocation(line: 26, column: 4, scope: !19)
!55 = distinct !DISubprogram(name: "update_knn", linkageName: "_Z10update_knnPKyS0_PiS1_i", scope: !8, file: !8, line: 29, type: !56, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !58, !58, !60, !60, !4}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !22)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "train_inst", arg: 1, scope: !55, file: !8, line: 29, type: !58)
!62 = !DILocation(line: 29, column: 34, scope: !55)
!63 = !DILocalVariable(name: "test_inst", arg: 2, scope: !55, file: !8, line: 29, type: !58)
!64 = !DILocation(line: 29, column: 63, scope: !55)
!65 = !DILocalVariable(name: "dists", arg: 3, scope: !55, file: !8, line: 29, type: !60)
!66 = !DILocation(line: 29, column: 78, scope: !55)
!67 = !DILocalVariable(name: "labels", arg: 4, scope: !55, file: !8, line: 29, type: !60)
!68 = !DILocation(line: 29, column: 92, scope: !55)
!69 = !DILocalVariable(name: "label", arg: 5, scope: !55, file: !8, line: 29, type: !4)
!70 = !DILocation(line: 29, column: 107, scope: !55)
!71 = !DILocation(line: 31, column: 3, scope: !55)
!72 = !DILocalVariable(name: "dist", scope: !55, file: !8, line: 31, type: !4)
!73 = !DILocation(line: 31, column: 7, scope: !55)
!74 = !DILocation(line: 33, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !55, file: !8, line: 33, column: 20)
!76 = !DILocalVariable(name: "i", scope: !75, file: !8, line: 33, type: !4)
!77 = !DILocation(line: 33, column: 29, scope: !75)
!78 = !DILocation(line: 33, column: 36, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !8, line: 33, column: 20)
!80 = !DILocation(line: 33, column: 38, scope: !79)
!81 = !DILocation(line: 33, column: 20, scope: !75)
!82 = !DILocation(line: 33, column: 20, scope: !79)
!83 = !DILocation(line: 35, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !8, line: 34, column: 3)
!85 = !DILocalVariable(name: "diff", scope: !84, file: !8, line: 35, type: !22)
!86 = !DILocation(line: 35, column: 15, scope: !84)
!87 = !DILocation(line: 35, column: 22, scope: !84)
!88 = !DILocation(line: 35, column: 32, scope: !84)
!89 = !DILocation(line: 35, column: 37, scope: !84)
!90 = !DILocation(line: 35, column: 48, scope: !84)
!91 = !DILocation(line: 35, column: 35, scope: !84)
!92 = !DILocation(line: 36, column: 22, scope: !84)
!93 = !DILocation(line: 36, column: 13, scope: !84)
!94 = !DILocation(line: 36, column: 10, scope: !84)
!95 = !DILocation(line: 37, column: 3, scope: !79)
!96 = !DILocation(line: 37, column: 3, scope: !84)
!97 = !DILocation(line: 33, column: 45, scope: !79)
!98 = distinct !{!98, !81, !99, !100}
!99 = !DILocation(line: 37, column: 3, scope: !75)
!100 = !{!"llvm.loop.name", !"VITIS_LOOP_33_1"}
!101 = !DILocation(line: 39, column: 3, scope: !55)
!102 = !DILocalVariable(name: "max_dist", scope: !55, file: !8, line: 39, type: !4)
!103 = !DILocation(line: 39, column: 7, scope: !55)
!104 = !DILocation(line: 40, column: 3, scope: !55)
!105 = !DILocalVariable(name: "max_dist_id", scope: !55, file: !8, line: 40, type: !4)
!106 = !DILocation(line: 40, column: 7, scope: !55)
!107 = !DILocation(line: 43, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !55, file: !8, line: 43, column: 18)
!109 = !DILocalVariable(name: "k", scope: !108, file: !8, line: 43, type: !4)
!110 = !DILocation(line: 43, column: 28, scope: !108)
!111 = !DILocation(line: 43, column: 35, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !8, line: 43, column: 18)
!113 = !DILocation(line: 43, column: 37, scope: !112)
!114 = !DILocation(line: 43, column: 18, scope: !108)
!115 = !DILocation(line: 43, column: 18, scope: !112)
!116 = !DILocation(line: 45, column: 10, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !8, line: 45, column: 10)
!118 = distinct !DILexicalBlock(scope: !112, file: !8, line: 44, column: 3)
!119 = !DILocation(line: 45, column: 16, scope: !117)
!120 = !DILocation(line: 45, column: 21, scope: !117)
!121 = !DILocation(line: 45, column: 19, scope: !117)
!122 = !DILocation(line: 45, column: 10, scope: !118)
!123 = !DILocation(line: 47, column: 18, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !8, line: 46, column: 5)
!125 = !DILocation(line: 47, column: 24, scope: !124)
!126 = !DILocation(line: 47, column: 16, scope: !124)
!127 = !DILocation(line: 48, column: 21, scope: !124)
!128 = !DILocation(line: 48, column: 19, scope: !124)
!129 = !DILocation(line: 49, column: 5, scope: !124)
!130 = !DILocation(line: 50, column: 3, scope: !118)
!131 = !DILocation(line: 43, column: 42, scope: !112)
!132 = distinct !{!132, !114, !133, !134}
!133 = !DILocation(line: 50, column: 3, scope: !108)
!134 = !{!"llvm.loop.name", !"FIND_MAX_DIST"}
!135 = !DILocation(line: 53, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !55, file: !8, line: 53, column: 8)
!137 = !DILocation(line: 53, column: 15, scope: !136)
!138 = !DILocation(line: 53, column: 13, scope: !136)
!139 = !DILocation(line: 53, column: 8, scope: !55)
!140 = !DILocation(line: 55, column: 26, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !8, line: 54, column: 3)
!142 = !DILocation(line: 55, column: 5, scope: !141)
!143 = !DILocation(line: 55, column: 11, scope: !141)
!144 = !DILocation(line: 55, column: 24, scope: !141)
!145 = !DILocation(line: 56, column: 27, scope: !141)
!146 = !DILocation(line: 56, column: 5, scope: !141)
!147 = !DILocation(line: 56, column: 12, scope: !141)
!148 = !DILocation(line: 56, column: 25, scope: !141)
!149 = !DILocation(line: 57, column: 3, scope: !141)
!150 = !DILocation(line: 60, column: 1, scope: !55)
!151 = distinct !DISubprogram(name: "knn_vote", linkageName: "_Z8knn_votePi", scope: !8, file: !8, line: 62, type: !152, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!152 = !DISubroutineType(types: !153)
!153 = !{!154, !60}
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !23, line: 18, baseType: !155)
!155 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!156 = !DILocalVariable(name: "labels", arg: 1, scope: !151, file: !8, line: 62, type: !60)
!157 = !DILocation(line: 62, column: 24, scope: !151)
!158 = !DILocation(line: 64, column: 3, scope: !151)
!159 = !DILocalVariable(name: "max_vote", scope: !151, file: !8, line: 64, type: !4)
!160 = !DILocation(line: 64, column: 7, scope: !151)
!161 = !DILocation(line: 65, column: 3, scope: !151)
!162 = !DILocalVariable(name: "max_label", scope: !151, file: !8, line: 65, type: !154)
!163 = !DILocation(line: 65, column: 13, scope: !151)
!164 = !DILocation(line: 67, column: 3, scope: !151)
!165 = !DILocalVariable(name: "votes", scope: !151, file: !8, line: 67, type: !166)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !167)
!167 = !{!168}
!168 = !DISubrange(count: 10)
!169 = !DILocation(line: 67, column: 7, scope: !151)
!170 = !DILocation(line: 69, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !151, file: !8, line: 69, column: 20)
!172 = !DILocalVariable(name: "i", scope: !171, file: !8, line: 69, type: !4)
!173 = !DILocation(line: 69, column: 29, scope: !171)
!174 = !DILocation(line: 69, column: 36, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !8, line: 69, column: 20)
!176 = !DILocation(line: 69, column: 38, scope: !175)
!177 = !DILocation(line: 69, column: 20, scope: !171)
!178 = !DILocation(line: 69, column: 20, scope: !175)
!179 = !DILocation(line: 70, column: 11, scope: !175)
!180 = !DILocation(line: 70, column: 18, scope: !175)
!181 = !DILocation(line: 70, column: 5, scope: !175)
!182 = !DILocation(line: 70, column: 22, scope: !175)
!183 = !DILocation(line: 69, column: 45, scope: !175)
!184 = distinct !{!184, !177, !185, !186}
!185 = !DILocation(line: 70, column: 22, scope: !171)
!186 = !{!"llvm.loop.name", !"VITIS_LOOP_69_1"}
!187 = !DILocation(line: 72, column: 25, scope: !188)
!188 = distinct !DILexicalBlock(scope: !151, file: !8, line: 72, column: 20)
!189 = !DILocalVariable(name: "i", scope: !188, file: !8, line: 72, type: !4)
!190 = !DILocation(line: 72, column: 29, scope: !188)
!191 = !DILocation(line: 72, column: 36, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !8, line: 72, column: 20)
!193 = !DILocation(line: 72, column: 38, scope: !192)
!194 = !DILocation(line: 72, column: 20, scope: !188)
!195 = !DILocation(line: 72, column: 20, scope: !192)
!196 = !DILocation(line: 74, column: 15, scope: !197)
!197 = distinct !DILexicalBlock(scope: !198, file: !8, line: 74, column: 9)
!198 = distinct !DILexicalBlock(scope: !192, file: !8, line: 73, column: 3)
!199 = !DILocation(line: 74, column: 9, scope: !197)
!200 = !DILocation(line: 74, column: 20, scope: !197)
!201 = !DILocation(line: 74, column: 18, scope: !197)
!202 = !DILocation(line: 74, column: 9, scope: !198)
!203 = !DILocation(line: 76, column: 24, scope: !204)
!204 = distinct !DILexicalBlock(scope: !197, file: !8, line: 75, column: 5)
!205 = !DILocation(line: 76, column: 18, scope: !204)
!206 = !DILocation(line: 76, column: 16, scope: !204)
!207 = !DILocation(line: 77, column: 19, scope: !204)
!208 = !DILocation(line: 77, column: 17, scope: !204)
!209 = !DILocation(line: 78, column: 5, scope: !204)
!210 = !DILocation(line: 79, column: 3, scope: !198)
!211 = !DILocation(line: 72, column: 46, scope: !192)
!212 = distinct !{!212, !194, !213, !214}
!213 = !DILocation(line: 79, column: 3, scope: !188)
!214 = !{!"llvm.loop.name", !"VITIS_LOOP_72_2"}
!215 = !DILocation(line: 81, column: 10, scope: !151)
!216 = !DILocation(line: 82, column: 1, scope: !151)
!217 = !DILocation(line: 81, column: 3, scope: !151)
!218 = distinct !DISubprogram(name: "DigitRec", linkageName: "_Z8DigitRecPKyS0_PKhPhii", scope: !8, file: !8, line: 85, type: !219, isLocal: false, isDefinition: true, scopeLine: 92, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !58, !58, !221, !223, !4, !4}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !154)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!224 = !{!225}
!225 = !{!"fpga.top", !"user", !226}
!226 = !DILocation(line: 85, column: 16, scope: !218)
!227 = !DILocalVariable(name: "training_set", arg: 1, scope: !218, file: !8, line: 86, type: !58)
!228 = !DILocation(line: 86, column: 20, scope: !218)
!229 = !DILocalVariable(name: "test_set", arg: 2, scope: !218, file: !8, line: 87, type: !58)
!230 = !DILocation(line: 87, column: 20, scope: !218)
!231 = !DILocalVariable(name: "training_labels", arg: 3, scope: !218, file: !8, line: 88, type: !221)
!232 = !DILocation(line: 88, column: 20, scope: !218)
!233 = !DILocalVariable(name: "results", arg: 4, scope: !218, file: !8, line: 89, type: !223)
!234 = !DILocation(line: 89, column: 14, scope: !218)
!235 = !DILocalVariable(name: "num_test", arg: 5, scope: !218, file: !8, line: 90, type: !4)
!236 = !DILocation(line: 90, column: 7, scope: !218)
!237 = !DILocalVariable(name: "num_training", arg: 6, scope: !218, file: !8, line: 91, type: !4)
!238 = !DILocation(line: 91, column: 7, scope: !218)
!239 = !DILocation(line: 94, column: 3, scope: !218)
!240 = !DILocalVariable(name: "dists", scope: !218, file: !8, line: 94, type: !241)
!241 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !242)
!242 = !{!243}
!243 = !DISubrange(count: 3)
!244 = !DILocation(line: 94, column: 7, scope: !218)
!245 = !DILocation(line: 95, column: 3, scope: !218)
!246 = !DILocalVariable(name: "labels", scope: !218, file: !8, line: 95, type: !241)
!247 = !DILocation(line: 95, column: 7, scope: !218)
!248 = !DILocation(line: 98, column: 19, scope: !249)
!249 = distinct !DILexicalBlock(scope: !218, file: !8, line: 98, column: 14)
!250 = !DILocalVariable(name: "t", scope: !249, file: !8, line: 98, type: !4)
!251 = !DILocation(line: 98, column: 23, scope: !249)
!252 = !DILocation(line: 98, column: 30, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !8, line: 98, column: 14)
!254 = !DILocation(line: 98, column: 34, scope: !253)
!255 = !DILocation(line: 98, column: 32, scope: !253)
!256 = !DILocation(line: 98, column: 14, scope: !249)
!257 = !DILocation(line: 98, column: 14, scope: !253)
!258 = !DILocation(line: 99, column: 3, scope: !253)
!259 = !DILocation(line: 101, column: 24, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !8, line: 101, column: 18)
!261 = distinct !DILexicalBlock(scope: !253, file: !8, line: 99, column: 3)
!262 = !DILocalVariable(name: "i", scope: !260, file: !8, line: 101, type: !4)
!263 = !DILocation(line: 101, column: 28, scope: !260)
!264 = !DILocation(line: 101, column: 35, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !8, line: 101, column: 18)
!266 = !DILocation(line: 101, column: 37, scope: !265)
!267 = !DILocation(line: 101, column: 18, scope: !260)
!268 = !DILocation(line: 101, column: 18, scope: !265)
!269 = !DILocation(line: 104, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !265, file: !8, line: 102, column: 5)
!271 = !DILocation(line: 104, column: 7, scope: !270)
!272 = !DILocation(line: 104, column: 16, scope: !270)
!273 = !DILocation(line: 105, column: 14, scope: !270)
!274 = !DILocation(line: 105, column: 7, scope: !270)
!275 = !DILocation(line: 105, column: 17, scope: !270)
!276 = !DILocation(line: 106, column: 5, scope: !270)
!277 = !DILocation(line: 101, column: 42, scope: !265)
!278 = distinct !{!278, !267, !279, !280}
!279 = !DILocation(line: 106, column: 5, scope: !260)
!280 = !{!"llvm.loop.name", !"SET_KNN_SET"}
!281 = !DILocation(line: 109, column: 27, scope: !282)
!282 = distinct !DILexicalBlock(scope: !261, file: !8, line: 109, column: 21)
!283 = !DILocalVariable(name: "i", scope: !282, file: !8, line: 109, type: !4)
!284 = !DILocation(line: 109, column: 31, scope: !282)
!285 = !DILocation(line: 109, column: 38, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !8, line: 109, column: 21)
!287 = !DILocation(line: 109, column: 42, scope: !286)
!288 = !DILocation(line: 109, column: 40, scope: !286)
!289 = !DILocation(line: 109, column: 21, scope: !282)
!290 = !DILocation(line: 109, column: 21, scope: !286)
!291 = !DILocation(line: 110, column: 19, scope: !286)
!292 = !DILocation(line: 110, column: 32, scope: !286)
!293 = !DILocation(line: 110, column: 34, scope: !286)
!294 = !DILocation(line: 110, column: 41, scope: !286)
!295 = !DILocation(line: 110, column: 50, scope: !286)
!296 = !DILocation(line: 110, column: 52, scope: !286)
!297 = !DILocation(line: 110, column: 58, scope: !286)
!298 = !DILocation(line: 110, column: 65, scope: !286)
!299 = !DILocation(line: 110, column: 78, scope: !286)
!300 = !DILocation(line: 110, column: 94, scope: !286)
!301 = !DILocation(line: 110, column: 7, scope: !286)
!302 = !DILocation(line: 109, column: 56, scope: !286)
!303 = distinct !{!303, !289, !304, !305}
!304 = !DILocation(line: 110, column: 96, scope: !282)
!305 = !{!"llvm.loop.name", !"TRAINING_LOOP"}
!306 = !DILocation(line: 113, column: 5, scope: !261)
!307 = !DILocalVariable(name: "max_vote", scope: !261, file: !8, line: 113, type: !154)
!308 = !DILocation(line: 113, column: 15, scope: !261)
!309 = !DILocation(line: 113, column: 35, scope: !261)
!310 = !DILocation(line: 113, column: 26, scope: !261)
!311 = !DILocation(line: 114, column: 18, scope: !261)
!312 = !DILocation(line: 114, column: 5, scope: !261)
!313 = !DILocation(line: 114, column: 13, scope: !261)
!314 = !DILocation(line: 114, column: 16, scope: !261)
!315 = !DILocation(line: 115, column: 3, scope: !253)
!316 = !DILocation(line: 115, column: 3, scope: !261)
!317 = !DILocation(line: 98, column: 44, scope: !253)
!318 = distinct !{!318, !256, !319, !320}
!319 = !DILocation(line: 115, column: 3, scope: !249)
!320 = !{!"llvm.loop.name", !"TEST_LOOP"}
!321 = !DILocation(line: 116, column: 1, scope: !218)
