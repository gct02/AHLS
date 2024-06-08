; ModuleID = '../src/digitrec.cpp'
source_filename = "../src/digitrec.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
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

; Function Attrs: noinline nounwind optnone uwtable
define void @_Z10update_knnPKyS0_PiS1_i(i64* %train_inst, i64* %test_inst, i32* %dists, i32* %labels, i32 %label) #0 !dbg !54 {
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
  call void @llvm.dbg.declare(metadata i32* %dist, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 0, i32* %dist, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata i32* %i, metadata !72, metadata !DIExpression()), !dbg !74
  store i32 0, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !76
  %cmp = icmp slt i32 %0, 4, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %diff, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = load i64*, i64** %test_inst.addr, align 8, !dbg !83
  %2 = load i32, i32* %i, align 4, !dbg !84
  %idxprom = sext i32 %2 to i64, !dbg !83
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 %idxprom, !dbg !83
  %3 = load i64, i64* %arrayidx, align 8, !dbg !83
  %4 = load i64*, i64** %train_inst.addr, align 8, !dbg !85
  %5 = load i32, i32* %i, align 4, !dbg !86
  %idxprom1 = sext i32 %5 to i64, !dbg !85
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 %idxprom1, !dbg !85
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !85
  %xor = xor i64 %3, %6, !dbg !87
  store i64 %xor, i64* %diff, align 8, !dbg !82
  %7 = load i64, i64* %diff, align 8, !dbg !88
  %call = call i32 @_Z8popcounty(i64 %7), !dbg !89
  %8 = load i32, i32* %dist, align 4, !dbg !90
  %add = add nsw i32 %8, %call, !dbg !90
  store i32 %add, i32* %dist, align 4, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !92
  %inc = add nsw i32 %9, 1, !dbg !92
  store i32 %inc, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %max_dist, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 0, i32* %max_dist, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %max_dist_id, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 4, i32* %max_dist_id, align 4, !dbg !99
  br label %FIND_MAX_DIST, !dbg !100

FIND_MAX_DIST:                                    ; preds = %for.end
  call void @llvm.dbg.declare(metadata i32* %k, metadata !101, metadata !DIExpression()), !dbg !103
  store i32 0, i32* %k, align 4, !dbg !103
  br label %for.cond3, !dbg !104

for.cond3:                                        ; preds = %for.inc11, %FIND_MAX_DIST
  %10 = load i32, i32* %k, align 4, !dbg !105
  %cmp4 = icmp slt i32 %10, 3, !dbg !107
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !108

for.body5:                                        ; preds = %for.cond3
  %11 = load i32*, i32** %dists.addr, align 8, !dbg !109
  %12 = load i32, i32* %k, align 4, !dbg !112
  %idxprom6 = sext i32 %12 to i64, !dbg !109
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %idxprom6, !dbg !109
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !109
  %14 = load i32, i32* %max_dist, align 4, !dbg !113
  %cmp8 = icmp sgt i32 %13, %14, !dbg !114
  br i1 %cmp8, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %for.body5
  %15 = load i32*, i32** %dists.addr, align 8, !dbg !116
  %16 = load i32, i32* %k, align 4, !dbg !118
  %idxprom9 = sext i32 %16 to i64, !dbg !116
  %arrayidx10 = getelementptr inbounds i32, i32* %15, i64 %idxprom9, !dbg !116
  %17 = load i32, i32* %arrayidx10, align 4, !dbg !116
  store i32 %17, i32* %max_dist, align 4, !dbg !119
  %18 = load i32, i32* %k, align 4, !dbg !120
  store i32 %18, i32* %max_dist_id, align 4, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %for.body5
  br label %for.inc11, !dbg !123

for.inc11:                                        ; preds = %if.end
  %19 = load i32, i32* %k, align 4, !dbg !124
  %inc12 = add nsw i32 %19, 1, !dbg !124
  store i32 %inc12, i32* %k, align 4, !dbg !124
  br label %for.cond3, !dbg !125, !llvm.loop !126

for.end13:                                        ; preds = %for.cond3
  %20 = load i32, i32* %dist, align 4, !dbg !128
  %21 = load i32, i32* %max_dist, align 4, !dbg !130
  %cmp14 = icmp slt i32 %20, %21, !dbg !131
  br i1 %cmp14, label %if.then15, label %if.end20, !dbg !132

if.then15:                                        ; preds = %for.end13
  %22 = load i32, i32* %dist, align 4, !dbg !133
  %23 = load i32*, i32** %dists.addr, align 8, !dbg !135
  %24 = load i32, i32* %max_dist_id, align 4, !dbg !136
  %idxprom16 = sext i32 %24 to i64, !dbg !135
  %arrayidx17 = getelementptr inbounds i32, i32* %23, i64 %idxprom16, !dbg !135
  store i32 %22, i32* %arrayidx17, align 4, !dbg !137
  %25 = load i32, i32* %label.addr, align 4, !dbg !138
  %26 = load i32*, i32** %labels.addr, align 8, !dbg !139
  %27 = load i32, i32* %max_dist_id, align 4, !dbg !140
  %idxprom18 = sext i32 %27 to i64, !dbg !139
  %arrayidx19 = getelementptr inbounds i32, i32* %26, i64 %idxprom18, !dbg !139
  store i32 %25, i32* %arrayidx19, align 4, !dbg !141
  br label %if.end20, !dbg !142

if.end20:                                         ; preds = %if.then15, %for.end13
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone uwtable
define zeroext i8 @_Z8knn_votePi(i32* %labels) #0 !dbg !144 {
entry:
  %labels.addr = alloca i32*, align 8
  %max_vote = alloca i32, align 4
  %max_label = alloca i8, align 1
  %votes = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32* %labels, i32** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %labels.addr, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %max_vote, metadata !151, metadata !DIExpression()), !dbg !152
  store i32 0, i32* %max_vote, align 4, !dbg !152
  call void @llvm.dbg.declare(metadata i8* %max_label, metadata !153, metadata !DIExpression()), !dbg !154
  store i8 0, i8* %max_label, align 1, !dbg !154
  call void @llvm.dbg.declare(metadata [10 x i32]* %votes, metadata !155, metadata !DIExpression()), !dbg !159
  %0 = bitcast [10 x i32]* %votes to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %i, metadata !160, metadata !DIExpression()), !dbg !162
  store i32 0, i32* %i, align 4, !dbg !162
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !164
  %cmp = icmp slt i32 %1, 3, !dbg !166
  br i1 %cmp, label %for.body, label %for.end, !dbg !167

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %labels.addr, align 8, !dbg !168
  %3 = load i32, i32* %i, align 4, !dbg !169
  %idxprom = sext i32 %3 to i64, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !168
  %4 = load i32, i32* %arrayidx, align 4, !dbg !168
  %idxprom1 = sext i32 %4 to i64, !dbg !170
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom1, !dbg !170
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !171
  %inc = add nsw i32 %5, 1, !dbg !171
  store i32 %inc, i32* %arrayidx2, align 4, !dbg !171
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !172
  %inc3 = add nsw i32 %6, 1, !dbg !172
  store i32 %inc3, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !176, metadata !DIExpression()), !dbg !178
  store i32 0, i32* %i4, align 4, !dbg !178
  br label %for.cond5, !dbg !179

for.cond5:                                        ; preds = %for.inc13, %for.end
  %7 = load i32, i32* %i4, align 4, !dbg !180
  %cmp6 = icmp slt i32 %7, 10, !dbg !182
  br i1 %cmp6, label %for.body7, label %for.end15, !dbg !183

for.body7:                                        ; preds = %for.cond5
  %8 = load i32, i32* %i4, align 4, !dbg !184
  %idxprom8 = sext i32 %8 to i64, !dbg !187
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom8, !dbg !187
  %9 = load i32, i32* %arrayidx9, align 4, !dbg !187
  %10 = load i32, i32* %max_vote, align 4, !dbg !188
  %cmp10 = icmp sgt i32 %9, %10, !dbg !189
  br i1 %cmp10, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %for.body7
  %11 = load i32, i32* %i4, align 4, !dbg !191
  %idxprom11 = sext i32 %11 to i64, !dbg !193
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom11, !dbg !193
  %12 = load i32, i32* %arrayidx12, align 4, !dbg !193
  store i32 %12, i32* %max_vote, align 4, !dbg !194
  %13 = load i32, i32* %i4, align 4, !dbg !195
  %conv = trunc i32 %13 to i8, !dbg !195
  store i8 %conv, i8* %max_label, align 1, !dbg !196
  br label %if.end, !dbg !197

if.end:                                           ; preds = %if.then, %for.body7
  br label %for.inc13, !dbg !198

for.inc13:                                        ; preds = %if.end
  %14 = load i32, i32* %i4, align 4, !dbg !199
  %inc14 = add nsw i32 %14, 1, !dbg !199
  store i32 %inc14, i32* %i4, align 4, !dbg !199
  br label %for.cond5, !dbg !200, !llvm.loop !201

for.end15:                                        ; preds = %for.cond5
  %15 = load i8, i8* %max_label, align 1, !dbg !203
  ret i8 %15, !dbg !204
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @_Z8DigitRecPKyS0_Phii(i64* %training_set, i64* %test_set, i8* %results, i32 %num_test, i32 %num_training) #0 !dbg !205 {
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
  %i = alloca i32, align 4
  %i6 = alloca i32, align 4
  %max_vote = alloca i8, align 1
  store i64* %training_set, i64** %training_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %training_set.addr, metadata !209, metadata !DIExpression()), !dbg !210
  store i64* %test_set, i64** %test_set.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %test_set.addr, metadata !211, metadata !DIExpression()), !dbg !212
  store i8* %results, i8** %results.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %results.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store i32 %num_test, i32* %num_test.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_test.addr, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 %num_training, i32* %num_training.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_training.addr, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %CLASS_SIZE, metadata !219, metadata !DIExpression()), !dbg !221
  %0 = load i32, i32* %num_training.addr, align 4, !dbg !222
  %div = sdiv i32 %0, 10, !dbg !223
  store i32 %div, i32* %CLASS_SIZE, align 4, !dbg !221
  call void @llvm.dbg.declare(metadata [3 x i32]* %dists, metadata !224, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata [3 x i32]* %labels, metadata !229, metadata !DIExpression()), !dbg !230
  br label %TEST_LOOP, !dbg !231

TEST_LOOP:                                        ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %t, metadata !232, metadata !DIExpression()), !dbg !234
  store i32 0, i32* %t, align 4, !dbg !234
  br label %for.cond, !dbg !235

for.cond:                                         ; preds = %for.inc23, %TEST_LOOP
  %1 = load i32, i32* %t, align 4, !dbg !236
  %2 = load i32, i32* %num_test.addr, align 4, !dbg !238
  %cmp = icmp slt i32 %1, %2, !dbg !239
  br i1 %cmp, label %for.body, label %for.end25, !dbg !240

for.body:                                         ; preds = %for.cond
  br label %SET_KNN_SET, !dbg !241

SET_KNN_SET:                                      ; preds = %for.body
  call void @llvm.dbg.declare(metadata i32* %i, metadata !242, metadata !DIExpression()), !dbg !245
  store i32 0, i32* %i, align 4, !dbg !245
  br label %for.cond1, !dbg !246

for.cond1:                                        ; preds = %for.inc, %SET_KNN_SET
  %3 = load i32, i32* %i, align 4, !dbg !247
  %cmp2 = icmp slt i32 %3, 3, !dbg !249
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !250

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4, !dbg !251
  %idxprom = sext i32 %4 to i64, !dbg !253
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i64 0, i64 %idxprom, !dbg !253
  store i32 256, i32* %arrayidx, align 4, !dbg !254
  %5 = load i32, i32* %i, align 4, !dbg !255
  %idxprom4 = sext i32 %5 to i64, !dbg !256
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i64 0, i64 %idxprom4, !dbg !256
  store i32 0, i32* %arrayidx5, align 4, !dbg !257
  br label %for.inc, !dbg !258

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %i, align 4, !dbg !259
  %inc = add nsw i32 %6, 1, !dbg !259
  store i32 %inc, i32* %i, align 4, !dbg !259
  br label %for.cond1, !dbg !260, !llvm.loop !261

for.end:                                          ; preds = %for.cond1
  br label %TRAINING_LOOP, !dbg !262

TRAINING_LOOP:                                    ; preds = %for.end
  call void @llvm.dbg.declare(metadata i32* %i6, metadata !263, metadata !DIExpression()), !dbg !265
  store i32 0, i32* %i6, align 4, !dbg !265
  br label %for.cond7, !dbg !266

for.cond7:                                        ; preds = %for.inc17, %TRAINING_LOOP
  %7 = load i32, i32* %i6, align 4, !dbg !267
  %8 = load i32, i32* %num_training.addr, align 4, !dbg !269
  %cmp8 = icmp slt i32 %7, %8, !dbg !270
  br i1 %cmp8, label %for.body9, label %for.end19, !dbg !271

for.body9:                                        ; preds = %for.cond7
  %9 = load i64*, i64** %training_set.addr, align 8, !dbg !272
  %10 = load i32, i32* %i6, align 4, !dbg !273
  %mul = mul nsw i32 %10, 4, !dbg !274
  %idxprom10 = sext i32 %mul to i64, !dbg !272
  %arrayidx11 = getelementptr inbounds i64, i64* %9, i64 %idxprom10, !dbg !272
  %11 = load i64*, i64** %test_set.addr, align 8, !dbg !275
  %12 = load i32, i32* %t, align 4, !dbg !276
  %mul12 = mul nsw i32 %12, 4, !dbg !277
  %idxprom13 = sext i32 %mul12 to i64, !dbg !275
  %arrayidx14 = getelementptr inbounds i64, i64* %11, i64 %idxprom13, !dbg !275
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i32 0, i32 0, !dbg !278
  %arraydecay15 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !279
  %13 = load i32, i32* %i6, align 4, !dbg !280
  %14 = load i32, i32* %CLASS_SIZE, align 4, !dbg !281
  %div16 = sdiv i32 %13, %14, !dbg !282
  call void @_Z10update_knnPKyS0_PiS1_i(i64* %arrayidx11, i64* %arrayidx14, i32* %arraydecay, i32* %arraydecay15, i32 %div16), !dbg !283
  br label %for.inc17, !dbg !283

for.inc17:                                        ; preds = %for.body9
  %15 = load i32, i32* %i6, align 4, !dbg !284
  %inc18 = add nsw i32 %15, 1, !dbg !284
  store i32 %inc18, i32* %i6, align 4, !dbg !284
  br label %for.cond7, !dbg !285, !llvm.loop !286

for.end19:                                        ; preds = %for.cond7
  call void @llvm.dbg.declare(metadata i8* %max_vote, metadata !288, metadata !DIExpression()), !dbg !289
  %arraydecay20 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0, !dbg !290
  %call = call zeroext i8 @_Z8knn_votePi(i32* %arraydecay20), !dbg !291
  store i8 %call, i8* %max_vote, align 1, !dbg !289
  %16 = load i8, i8* %max_vote, align 1, !dbg !292
  %17 = load i8*, i8** %results.addr, align 8, !dbg !293
  %18 = load i32, i32* %t, align 4, !dbg !294
  %idxprom21 = sext i32 %18 to i64, !dbg !293
  %arrayidx22 = getelementptr inbounds i8, i8* %17, i64 %idxprom21, !dbg !293
  store i8 %16, i8* %arrayidx22, align 1, !dbg !295
  br label %for.inc23, !dbg !296

for.inc23:                                        ; preds = %for.end19
  %19 = load i32, i32* %t, align 4, !dbg !297
  %inc24 = add nsw i32 %19, 1, !dbg !297
  store i32 %inc24, i32* %t, align 4, !dbg !297
  br label %for.cond, !dbg !298, !llvm.loop !299

for.end25:                                        ; preds = %for.cond
  ret void, !dbg !301
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3)
!1 = !DIFile(filename: "../src/digitrec.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!2 = !{}
!3 = !{!4, !8, !10}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 6148914691236517205, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "m1", scope: !0, file: !1, line: 12, type: !6, isLocal: true, isDefinition: true)
!6 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!7 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression(DW_OP_constu, 3689348814741910323, DW_OP_stack_value))
!9 = distinct !DIGlobalVariable(name: "m2", scope: !0, file: !1, line: 13, type: !6, isLocal: true, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_stack_value))
!11 = distinct !DIGlobalVariable(name: "m4", scope: !0, file: !1, line: 14, type: !6, isLocal: true, isDefinition: true)
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{!"clang version 7.0.0 "}
!17 = distinct !DISubprogram(name: "popcount", linkageName: "_Z8popcounty", scope: !1, file: !1, line: 18, type: !18, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "DigitType", file: !22, line: 17, baseType: !7)
!22 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!23 = !DILocalVariable(name: "x", arg: 1, scope: !17, file: !1, line: 18, type: !21)
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
!54 = distinct !DISubprogram(name: "update_knn", linkageName: "_Z10update_knnPKyS0_PiS1_i", scope: !1, file: !1, line: 29, type: !55, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !57, !57, !59, !59, !20}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!60 = !DILocalVariable(name: "train_inst", arg: 1, scope: !54, file: !1, line: 29, type: !57)
!61 = !DILocation(line: 29, column: 35, scope: !54)
!62 = !DILocalVariable(name: "test_inst", arg: 2, scope: !54, file: !1, line: 29, type: !57)
!63 = !DILocation(line: 29, column: 64, scope: !54)
!64 = !DILocalVariable(name: "dists", arg: 3, scope: !54, file: !1, line: 29, type: !59)
!65 = !DILocation(line: 29, column: 79, scope: !54)
!66 = !DILocalVariable(name: "labels", arg: 4, scope: !54, file: !1, line: 29, type: !59)
!67 = !DILocation(line: 29, column: 99, scope: !54)
!68 = !DILocalVariable(name: "label", arg: 5, scope: !54, file: !1, line: 29, type: !20)
!69 = !DILocation(line: 29, column: 120, scope: !54)
!70 = !DILocalVariable(name: "dist", scope: !54, file: !1, line: 31, type: !20)
!71 = !DILocation(line: 31, column: 7, scope: !54)
!72 = !DILocalVariable(name: "i", scope: !73, file: !1, line: 33, type: !20)
!73 = distinct !DILexicalBlock(scope: !54, file: !1, line: 33, column: 3)
!74 = !DILocation(line: 33, column: 12, scope: !73)
!75 = !DILocation(line: 33, column: 8, scope: !73)
!76 = !DILocation(line: 33, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !1, line: 33, column: 3)
!78 = !DILocation(line: 33, column: 21, scope: !77)
!79 = !DILocation(line: 33, column: 3, scope: !73)
!80 = !DILocalVariable(name: "diff", scope: !81, file: !1, line: 35, type: !21)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 34, column: 3)
!82 = !DILocation(line: 35, column: 15, scope: !81)
!83 = !DILocation(line: 35, column: 22, scope: !81)
!84 = !DILocation(line: 35, column: 32, scope: !81)
!85 = !DILocation(line: 35, column: 37, scope: !81)
!86 = !DILocation(line: 35, column: 48, scope: !81)
!87 = !DILocation(line: 35, column: 35, scope: !81)
!88 = !DILocation(line: 36, column: 22, scope: !81)
!89 = !DILocation(line: 36, column: 13, scope: !81)
!90 = !DILocation(line: 36, column: 10, scope: !81)
!91 = !DILocation(line: 37, column: 3, scope: !81)
!92 = !DILocation(line: 33, column: 38, scope: !77)
!93 = !DILocation(line: 33, column: 3, scope: !77)
!94 = distinct !{!94, !79, !95}
!95 = !DILocation(line: 37, column: 3, scope: !73)
!96 = !DILocalVariable(name: "max_dist", scope: !54, file: !1, line: 39, type: !20)
!97 = !DILocation(line: 39, column: 7, scope: !54)
!98 = !DILocalVariable(name: "max_dist_id", scope: !54, file: !1, line: 40, type: !20)
!99 = !DILocation(line: 40, column: 7, scope: !54)
!100 = !DILocation(line: 40, column: 3, scope: !54)
!101 = !DILocalVariable(name: "k", scope: !102, file: !1, line: 43, type: !20)
!102 = distinct !DILexicalBlock(scope: !54, file: !1, line: 43, column: 18)
!103 = !DILocation(line: 43, column: 28, scope: !102)
!104 = !DILocation(line: 43, column: 24, scope: !102)
!105 = !DILocation(line: 43, column: 35, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 43, column: 18)
!107 = !DILocation(line: 43, column: 37, scope: !106)
!108 = !DILocation(line: 43, column: 18, scope: !102)
!109 = !DILocation(line: 45, column: 10, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 45, column: 10)
!111 = distinct !DILexicalBlock(scope: !106, file: !1, line: 44, column: 3)
!112 = !DILocation(line: 45, column: 16, scope: !110)
!113 = !DILocation(line: 45, column: 21, scope: !110)
!114 = !DILocation(line: 45, column: 19, scope: !110)
!115 = !DILocation(line: 45, column: 10, scope: !111)
!116 = !DILocation(line: 47, column: 18, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !1, line: 46, column: 5)
!118 = !DILocation(line: 47, column: 24, scope: !117)
!119 = !DILocation(line: 47, column: 16, scope: !117)
!120 = !DILocation(line: 48, column: 21, scope: !117)
!121 = !DILocation(line: 48, column: 19, scope: !117)
!122 = !DILocation(line: 49, column: 5, scope: !117)
!123 = !DILocation(line: 50, column: 3, scope: !111)
!124 = !DILocation(line: 43, column: 48, scope: !106)
!125 = !DILocation(line: 43, column: 18, scope: !106)
!126 = distinct !{!126, !108, !127}
!127 = !DILocation(line: 50, column: 3, scope: !102)
!128 = !DILocation(line: 53, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !54, file: !1, line: 53, column: 8)
!130 = !DILocation(line: 53, column: 15, scope: !129)
!131 = !DILocation(line: 53, column: 13, scope: !129)
!132 = !DILocation(line: 53, column: 8, scope: !54)
!133 = !DILocation(line: 55, column: 26, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !1, line: 54, column: 3)
!135 = !DILocation(line: 55, column: 5, scope: !134)
!136 = !DILocation(line: 55, column: 11, scope: !134)
!137 = !DILocation(line: 55, column: 24, scope: !134)
!138 = !DILocation(line: 56, column: 27, scope: !134)
!139 = !DILocation(line: 56, column: 5, scope: !134)
!140 = !DILocation(line: 56, column: 12, scope: !134)
!141 = !DILocation(line: 56, column: 25, scope: !134)
!142 = !DILocation(line: 57, column: 3, scope: !134)
!143 = !DILocation(line: 59, column: 3, scope: !54)
!144 = distinct !DISubprogram(name: "knn_vote", linkageName: "_Z8knn_votePi", scope: !1, file: !1, line: 62, type: !145, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!145 = !DISubroutineType(types: !146)
!146 = !{!147, !59}
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !22, line: 18, baseType: !148)
!148 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!149 = !DILocalVariable(name: "labels", arg: 1, scope: !144, file: !1, line: 62, type: !59)
!150 = !DILocation(line: 62, column: 24, scope: !144)
!151 = !DILocalVariable(name: "max_vote", scope: !144, file: !1, line: 64, type: !20)
!152 = !DILocation(line: 64, column: 7, scope: !144)
!153 = !DILocalVariable(name: "max_label", scope: !144, file: !1, line: 65, type: !147)
!154 = !DILocation(line: 65, column: 13, scope: !144)
!155 = !DILocalVariable(name: "votes", scope: !144, file: !1, line: 67, type: !156)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 10)
!159 = !DILocation(line: 67, column: 7, scope: !144)
!160 = !DILocalVariable(name: "i", scope: !161, file: !1, line: 69, type: !20)
!161 = distinct !DILexicalBlock(scope: !144, file: !1, line: 69, column: 3)
!162 = !DILocation(line: 69, column: 12, scope: !161)
!163 = !DILocation(line: 69, column: 8, scope: !161)
!164 = !DILocation(line: 69, column: 19, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !1, line: 69, column: 3)
!166 = !DILocation(line: 69, column: 21, scope: !165)
!167 = !DILocation(line: 69, column: 3, scope: !161)
!168 = !DILocation(line: 70, column: 11, scope: !165)
!169 = !DILocation(line: 70, column: 18, scope: !165)
!170 = !DILocation(line: 70, column: 5, scope: !165)
!171 = !DILocation(line: 70, column: 22, scope: !165)
!172 = !DILocation(line: 69, column: 34, scope: !165)
!173 = !DILocation(line: 69, column: 3, scope: !165)
!174 = distinct !{!174, !167, !175}
!175 = !DILocation(line: 70, column: 22, scope: !161)
!176 = !DILocalVariable(name: "i", scope: !177, file: !1, line: 72, type: !20)
!177 = distinct !DILexicalBlock(scope: !144, file: !1, line: 72, column: 3)
!178 = !DILocation(line: 72, column: 12, scope: !177)
!179 = !DILocation(line: 72, column: 8, scope: !177)
!180 = !DILocation(line: 72, column: 19, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !1, line: 72, column: 3)
!182 = !DILocation(line: 72, column: 21, scope: !181)
!183 = !DILocation(line: 72, column: 3, scope: !177)
!184 = !DILocation(line: 74, column: 15, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !1, line: 74, column: 9)
!186 = distinct !DILexicalBlock(scope: !181, file: !1, line: 73, column: 3)
!187 = !DILocation(line: 74, column: 9, scope: !185)
!188 = !DILocation(line: 74, column: 20, scope: !185)
!189 = !DILocation(line: 74, column: 18, scope: !185)
!190 = !DILocation(line: 74, column: 9, scope: !186)
!191 = !DILocation(line: 76, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !185, file: !1, line: 75, column: 5)
!193 = !DILocation(line: 76, column: 18, scope: !192)
!194 = !DILocation(line: 76, column: 16, scope: !192)
!195 = !DILocation(line: 77, column: 19, scope: !192)
!196 = !DILocation(line: 77, column: 17, scope: !192)
!197 = !DILocation(line: 78, column: 5, scope: !192)
!198 = !DILocation(line: 79, column: 3, scope: !186)
!199 = !DILocation(line: 72, column: 29, scope: !181)
!200 = !DILocation(line: 72, column: 3, scope: !181)
!201 = distinct !{!201, !183, !202}
!202 = !DILocation(line: 79, column: 3, scope: !177)
!203 = !DILocation(line: 81, column: 10, scope: !144)
!204 = !DILocation(line: 81, column: 3, scope: !144)
!205 = distinct !DISubprogram(name: "DigitRec", linkageName: "_Z8DigitRecPKyS0_Phii", scope: !1, file: !1, line: 85, type: !206, isLocal: false, isDefinition: true, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !57, !57, !208, !20, !20}
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!209 = !DILocalVariable(name: "training_set", arg: 1, scope: !205, file: !1, line: 86, type: !57)
!210 = !DILocation(line: 86, column: 20, scope: !205)
!211 = !DILocalVariable(name: "test_set", arg: 2, scope: !205, file: !1, line: 87, type: !57)
!212 = !DILocation(line: 87, column: 20, scope: !205)
!213 = !DILocalVariable(name: "results", arg: 3, scope: !205, file: !1, line: 88, type: !208)
!214 = !DILocation(line: 88, column: 14, scope: !205)
!215 = !DILocalVariable(name: "num_test", arg: 4, scope: !205, file: !1, line: 89, type: !20)
!216 = !DILocation(line: 89, column: 7, scope: !205)
!217 = !DILocalVariable(name: "num_training", arg: 5, scope: !205, file: !1, line: 90, type: !20)
!218 = !DILocation(line: 90, column: 7, scope: !205)
!219 = !DILocalVariable(name: "CLASS_SIZE", scope: !205, file: !1, line: 92, type: !220)
!220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!221 = !DILocation(line: 92, column: 13, scope: !205)
!222 = !DILocation(line: 92, column: 26, scope: !205)
!223 = !DILocation(line: 92, column: 39, scope: !205)
!224 = !DILocalVariable(name: "dists", scope: !205, file: !1, line: 95, type: !225)
!225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 96, elements: !226)
!226 = !{!227}
!227 = !DISubrange(count: 3)
!228 = !DILocation(line: 95, column: 7, scope: !205)
!229 = !DILocalVariable(name: "labels", scope: !205, file: !1, line: 96, type: !225)
!230 = !DILocation(line: 96, column: 7, scope: !205)
!231 = !DILocation(line: 96, column: 3, scope: !205)
!232 = !DILocalVariable(name: "t", scope: !233, file: !1, line: 99, type: !20)
!233 = distinct !DILexicalBlock(scope: !205, file: !1, line: 99, column: 14)
!234 = !DILocation(line: 99, column: 23, scope: !233)
!235 = !DILocation(line: 99, column: 19, scope: !233)
!236 = !DILocation(line: 99, column: 30, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !1, line: 99, column: 14)
!238 = !DILocation(line: 99, column: 34, scope: !237)
!239 = !DILocation(line: 99, column: 32, scope: !237)
!240 = !DILocation(line: 99, column: 14, scope: !233)
!241 = !DILocation(line: 100, column: 3, scope: !237)
!242 = !DILocalVariable(name: "i", scope: !243, file: !1, line: 102, type: !20)
!243 = distinct !DILexicalBlock(scope: !244, file: !1, line: 102, column: 18)
!244 = distinct !DILexicalBlock(scope: !237, file: !1, line: 100, column: 3)
!245 = !DILocation(line: 102, column: 28, scope: !243)
!246 = !DILocation(line: 102, column: 24, scope: !243)
!247 = !DILocation(line: 102, column: 35, scope: !248)
!248 = distinct !DILexicalBlock(scope: !243, file: !1, line: 102, column: 18)
!249 = !DILocation(line: 102, column: 37, scope: !248)
!250 = !DILocation(line: 102, column: 18, scope: !243)
!251 = !DILocation(line: 105, column: 13, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !1, line: 103, column: 5)
!253 = !DILocation(line: 105, column: 7, scope: !252)
!254 = !DILocation(line: 105, column: 16, scope: !252)
!255 = !DILocation(line: 106, column: 14, scope: !252)
!256 = !DILocation(line: 106, column: 7, scope: !252)
!257 = !DILocation(line: 106, column: 17, scope: !252)
!258 = !DILocation(line: 107, column: 5, scope: !252)
!259 = !DILocation(line: 102, column: 48, scope: !248)
!260 = !DILocation(line: 102, column: 18, scope: !248)
!261 = distinct !{!261, !250, !262}
!262 = !DILocation(line: 107, column: 5, scope: !243)
!263 = !DILocalVariable(name: "i", scope: !264, file: !1, line: 110, type: !20)
!264 = distinct !DILexicalBlock(scope: !244, file: !1, line: 110, column: 21)
!265 = !DILocation(line: 110, column: 31, scope: !264)
!266 = !DILocation(line: 110, column: 27, scope: !264)
!267 = !DILocation(line: 110, column: 38, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !1, line: 110, column: 21)
!269 = !DILocation(line: 110, column: 42, scope: !268)
!270 = !DILocation(line: 110, column: 40, scope: !268)
!271 = !DILocation(line: 110, column: 21, scope: !264)
!272 = !DILocation(line: 111, column: 19, scope: !268)
!273 = !DILocation(line: 111, column: 32, scope: !268)
!274 = !DILocation(line: 111, column: 34, scope: !268)
!275 = !DILocation(line: 111, column: 51, scope: !268)
!276 = !DILocation(line: 111, column: 60, scope: !268)
!277 = !DILocation(line: 111, column: 62, scope: !268)
!278 = !DILocation(line: 111, column: 78, scope: !268)
!279 = !DILocation(line: 111, column: 85, scope: !268)
!280 = !DILocation(line: 111, column: 93, scope: !268)
!281 = !DILocation(line: 111, column: 97, scope: !268)
!282 = !DILocation(line: 111, column: 95, scope: !268)
!283 = !DILocation(line: 111, column: 7, scope: !268)
!284 = !DILocation(line: 110, column: 56, scope: !268)
!285 = !DILocation(line: 110, column: 21, scope: !268)
!286 = distinct !{!286, !271, !287}
!287 = !DILocation(line: 111, column: 107, scope: !264)
!288 = !DILocalVariable(name: "max_vote", scope: !244, file: !1, line: 114, type: !147)
!289 = !DILocation(line: 114, column: 15, scope: !244)
!290 = !DILocation(line: 114, column: 35, scope: !244)
!291 = !DILocation(line: 114, column: 26, scope: !244)
!292 = !DILocation(line: 115, column: 18, scope: !244)
!293 = !DILocation(line: 115, column: 5, scope: !244)
!294 = !DILocation(line: 115, column: 13, scope: !244)
!295 = !DILocation(line: 115, column: 16, scope: !244)
!296 = !DILocation(line: 116, column: 3, scope: !244)
!297 = !DILocation(line: 99, column: 44, scope: !237)
!298 = !DILocation(line: 99, column: 14, scope: !237)
!299 = distinct !{!299, !240, !300}
!300 = !DILocation(line: 116, column: 3, scope: !233)
!301 = !DILocation(line: 117, column: 1, scope: !205)
