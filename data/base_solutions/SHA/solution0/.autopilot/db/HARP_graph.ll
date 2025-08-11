; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@sha_info_data = common global [16 x i32] zeroinitializer, align 4, !id.1 !0, !id !0
@sha_info_digest = common global [5 x i32] zeroinitializer, align 4, !id !1, !id.2 !1
@sha_info_count_lo = common global i32 0, align 4, !id !2, !id.3 !2
@sha_info_count_hi = common global i32 0, align 4, !id !3, !id.4 !3
@local_indata = common global [2 x [8192 x i8]] zeroinitializer, align 1, !id !4, !id.5 !4

; Function Attrs: noinline nounwind
define void @local_memset(i32* %s, i32 %c, i32 %n, i32 %e) #0 !fpga.function.pragma !9 !id !0 {
entry:
  %div = sdiv i32 %n, 4, !id !11, !id.7 !11
  br label %local_memset_label0, !id !12, !id.9 !12

local_memset_label0:                              ; preds = %entry
  %0 = sub i32 -1, %e, !id !13, !id.10 !13
  %1 = icmp sgt i32 %0, -1, !id !14, !id.11 !14
  %smax = select i1 %1, i32 %0, i32 -1, !id !15, !id.12 !15
  %2 = add i32 %e, %smax, !id !16, !id.13 !16
  %3 = add i32 %2, 1, !id !17, !id.14 !17
  %4 = zext i32 %3 to i64, !id !18, !id.15 !18
  br label %while.cond, !id !19, !id.16 !19

while.cond:                                       ; preds = %while.body, %local_memset_label0
  %e.addr.0 = phi i32 [ %e, %local_memset_label0 ], [ %dec, %while.body ], !id !20, !id.17 !20
  %dec = add nsw i32 %e.addr.0, -1, !id !21, !id.20 !21
  %cmp = icmp sgt i32 %e.addr.0, 0, !id !22, !id.22 !22
  br i1 %cmp, label %while.body, label %while.end, !id !23, !id.23 !23

while.body:                                       ; preds = %while.cond
  br label %while.cond, !llvm.loop !24, !id !25, !id.25 !25

while.end:                                        ; preds = %while.cond
  %scevgep = getelementptr i32, i32* %s, i64 %4, !id !26, !id.26 !26
  br label %local_memset_label1, !id !27, !id.27 !27

local_memset_label1:                              ; preds = %while.end
  br label %while.cond1, !id !28, !id.28 !28

while.cond1:                                      ; preds = %while.body4, %local_memset_label1
  %p.1 = phi i32* [ %scevgep, %local_memset_label1 ], [ %incdec.ptr5, %while.body4 ], !id !29, !id.29 !29
  %m.0 = phi i32 [ %div, %local_memset_label1 ], [ %dec2, %while.body4 ], !id !30, !id.30 !30
  %dec2 = add nsw i32 %m.0, -1, !id !31, !id.33 !31
  %cmp3 = icmp sgt i32 %m.0, 0, !id !32, !id.35 !32
  br i1 %cmp3, label %while.body4, label %while.end6, !id !33, !id.36 !33

while.body4:                                      ; preds = %while.cond1
  %incdec.ptr5 = getelementptr inbounds i32, i32* %p.1, i32 1, !id !34, !id.37 !34
  store i32 %c, i32* %p.1, align 4, !id !35, !id.39 !35
  br label %while.cond1, !llvm.loop !36, !id !37, !id.40 !37

while.end6:                                       ; preds = %while.cond1
  ret void, !id !38, !id.41 !38
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: noinline nounwind
define void @local_memcpy(i32* %s1, i8* %s2, i32 %n) #0 !fpga.function.pragma !9 !id !3 {
entry:
  %div = sdiv i32 %n, 4, !id !39, !id.47 !39
  br label %local_memcpy_label3, !id !40, !id.49 !40

local_memcpy_label3:                              ; preds = %entry
  br label %while.cond, !id !41, !id.50 !41

while.cond:                                       ; preds = %while.body, %local_memcpy_label3
  %p1.0 = phi i32* [ %s1, %local_memcpy_label3 ], [ %incdec.ptr15, %while.body ], !id !42, !id.51 !42
  %p2.0 = phi i8* [ %s2, %local_memcpy_label3 ], [ %incdec.ptr10, %while.body ], !id !43, !id.52 !43
  %m.0 = phi i32 [ %div, %local_memcpy_label3 ], [ %dec, %while.body ], !id !44, !id.53 !44
  %dec = add nsw i32 %m.0, -1, !id !45, !id.57 !45
  %cmp = icmp sgt i32 %m.0, 0, !id !46, !id.59 !46
  br i1 %cmp, label %while.body, label %while.end, !id !47, !id.60 !47

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %p2.0, i32 1, !id !48, !id.62 !48
  %0 = load i8, i8* %p2.0, align 1, !id !49, !id.64 !49
  %conv = zext i8 %0 to i32, !id !50, !id.65 !50
  %and = and i32 255, %conv, !id !51, !id.66 !51
  %or = or i32 0, %and, !id !52, !id.67 !52
  %incdec.ptr1 = getelementptr inbounds i8, i8* %incdec.ptr, i32 1, !id !53, !id.69 !53
  %1 = load i8, i8* %incdec.ptr, align 1, !id !54, !id.71 !54
  %conv2 = zext i8 %1 to i32, !id !55, !id.72 !55
  %and3 = and i32 255, %conv2, !id !56, !id.73 !56
  %shl = shl i32 %and3, 8, !id !57, !id.74 !57
  %or4 = or i32 %or, %shl, !id !58, !id.75 !58
  %incdec.ptr5 = getelementptr inbounds i8, i8* %incdec.ptr1, i32 1, !id !59, !id.77 !59
  %2 = load i8, i8* %incdec.ptr1, align 1, !id !60, !id.79 !60
  %conv6 = zext i8 %2 to i32, !id !61, !id.80 !61
  %and7 = and i32 255, %conv6, !id !62, !id.81 !62
  %shl8 = shl i32 %and7, 16, !id !63, !id.82 !63
  %or9 = or i32 %or4, %shl8, !id !64, !id.83 !64
  %incdec.ptr10 = getelementptr inbounds i8, i8* %incdec.ptr5, i32 1, !id !65, !id.85 !65
  %3 = load i8, i8* %incdec.ptr5, align 1, !id !66, !id.87 !66
  %conv11 = zext i8 %3 to i32, !id !67, !id.88 !67
  %and12 = and i32 255, %conv11, !id !68, !id.89 !68
  %shl13 = shl i32 %and12, 24, !id !69, !id.90 !69
  %or14 = or i32 %or9, %shl13, !id !70, !id.91 !70
  store i32 %or14, i32* %p1.0, align 4, !id !71, !id.93 !71
  %incdec.ptr15 = getelementptr inbounds i32, i32* %p1.0, i32 1, !id !72, !id.94 !72
  br label %while.cond, !llvm.loop !73, !id !74, !id.96 !74

while.end:                                        ; preds = %while.cond
  ret void, !id !75, !id.97 !75
}

; Function Attrs: noinline nounwind
define void @sha_transform() #0 !fpga.function.pragma !9 !id !76 {
entry:
  %W = alloca [80 x i32], align 4, !id !77, !id.98 !77
  %0 = bitcast [80 x i32]* %W to i8*, !id !78, !id.99 !78
  call void @llvm.lifetime.start.p0i8(i64 320, i8* %0) #5, !id !79, !id.100 !79
  br label %sha_transform_label1, !id !80, !id.102 !80

sha_transform_label1:                             ; preds = %entry
  br label %for.cond, !id !81, !id.104 !81

for.cond:                                         ; preds = %for.inc, %sha_transform_label1
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc ], [ 0, %sha_transform_label1 ], !id !82, !id.105 !82
  %exitcond19 = icmp ne i64 %indvars.iv17, 16, !id !83, !id.107 !83
  br i1 %exitcond19, label %for.body, label %for.end, !id !84, !id.108 !84

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %indvars.iv17, !id !85, !id.109 !85
  %1 = load i32, i32* %arrayidx, align 4, !id !86, !id.110 !86
  %arrayidx2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv17, !id !87, !id.111 !87
  store i32 %1, i32* %arrayidx2, align 4, !id !88, !id.112 !88
  br label %for.inc, !id !89, !id.113 !89

for.inc:                                          ; preds = %for.body
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !id !90, !id.114 !90
  br label %for.cond, !llvm.loop !91, !id !92, !id.116 !92

for.end:                                          ; preds = %for.cond
  br label %sha_transform_label2, !id !93, !id.117 !93

sha_transform_label2:                             ; preds = %for.end
  br label %for.cond3, !id !94, !id.119 !94

for.cond3:                                        ; preds = %for.inc21, %sha_transform_label2
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc21 ], [ 16, %sha_transform_label2 ], !id !95, !id.120 !95
  %exitcond16 = icmp ne i64 %indvars.iv10, 80, !id !96, !id.122 !96
  br i1 %exitcond16, label %for.body5, label %for.end23, !id !97, !id.123 !97

for.body5:                                        ; preds = %for.cond3
  %2 = sub nuw nsw i64 %indvars.iv10, 3, !id !98, !id.124 !98
  %arrayidx7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %2, !id !99, !id.125 !99
  %3 = load i32, i32* %arrayidx7, align 4, !id !100, !id.126 !100
  %4 = sub nuw nsw i64 %indvars.iv10, 8, !id !101, !id.127 !101
  %arrayidx10 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %4, !id !102, !id.128 !102
  %5 = load i32, i32* %arrayidx10, align 4, !id !103, !id.129 !103
  %xor = xor i32 %3, %5, !id !104, !id.130 !104
  %6 = sub nuw nsw i64 %indvars.iv10, 14, !id !105, !id.131 !105
  %arrayidx13 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %6, !id !106, !id.132 !106
  %7 = load i32, i32* %arrayidx13, align 4, !id !107, !id.133 !107
  %xor14 = xor i32 %xor, %7, !id !108, !id.134 !108
  %8 = sub nuw nsw i64 %indvars.iv10, 16, !id !109, !id.135 !109
  %arrayidx17 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %8, !id !110, !id.136 !110
  %9 = load i32, i32* %arrayidx17, align 4, !id !111, !id.137 !111
  %xor18 = xor i32 %xor14, %9, !id !112, !id.138 !112
  %arrayidx20 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv10, !id !113, !id.139 !113
  store i32 %xor18, i32* %arrayidx20, align 4, !id !114, !id.140 !114
  br label %for.inc21, !id !115, !id.141 !115

for.inc21:                                        ; preds = %for.body5
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !id !116, !id.142 !116
  br label %for.cond3, !llvm.loop !117, !id !118, !id.144 !118

for.end23:                                        ; preds = %for.cond3
  %10 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4, !id !119, !id.145 !119
  %11 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !id !120, !id.147 !120
  %12 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4, !id !121, !id.149 !121
  %13 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !id !122, !id.151 !122
  %14 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4, !id !123, !id.153 !123
  br label %sha_transform_label3, !id !124, !id.155 !124

sha_transform_label3:                             ; preds = %for.end23
  br label %for.cond24, !id !125, !id.157 !125

for.cond24:                                       ; preds = %for.inc38, %sha_transform_label3
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc38 ], [ 0, %sha_transform_label3 ], !id !126, !id.158 !126
  %E.0 = phi i32 [ %14, %sha_transform_label3 ], [ %D.0, %for.inc38 ], !id !127, !id.159 !127
  %D.0 = phi i32 [ %13, %sha_transform_label3 ], [ %C.0, %for.inc38 ], !id !128, !id.160 !128
  %C.0 = phi i32 [ %12, %sha_transform_label3 ], [ %or37, %for.inc38 ], !id !129, !id.161 !129
  %B.0 = phi i32 [ %11, %sha_transform_label3 ], [ %A.0, %for.inc38 ], !id !130, !id.162 !130
  %A.0 = phi i32 [ %10, %sha_transform_label3 ], [ %conv34, %for.inc38 ], !id !131, !id.163 !131
  %exitcond9 = icmp ne i64 %indvars.iv7, 20, !id !132, !id.170 !132
  br i1 %exitcond9, label %for.body26, label %for.end40, !id !133, !id.171 !133

for.body26:                                       ; preds = %for.cond24
  %shl = shl i32 %A.0, 5, !id !134, !id.172 !134
  %shr = lshr i32 %A.0, 27, !id !135, !id.173 !135
  %or = or i32 %shl, %shr, !id !136, !id.174 !136
  %and = and i32 %B.0, %C.0, !id !137, !id.175 !137
  %neg = xor i32 %B.0, -1, !id !138, !id.176 !138
  %and27 = and i32 %neg, %D.0, !id !139, !id.177 !139
  %or28 = or i32 %and, %and27, !id !140, !id.178 !140
  %add = add i32 %or, %or28, !id !141, !id.179 !141
  %add29 = add i32 %add, %E.0, !id !142, !id.180 !142
  %arrayidx31 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv7, !id !143, !id.181 !143
  %15 = load i32, i32* %arrayidx31, align 4, !id !144, !id.182 !144
  %add32 = add i32 %add29, %15, !id !145, !id.183 !145
  %conv = zext i32 %add32 to i64, !id !146, !id.184 !146
  %add33 = add nsw i64 %conv, 1518500249, !id !147, !id.185 !147
  %conv34 = trunc i64 %add33 to i32, !id !148, !id.186 !148
  %shl35 = shl i32 %B.0, 30, !id !149, !id.190 !149
  %shr36 = lshr i32 %B.0, 2, !id !150, !id.191 !150
  %or37 = or i32 %shl35, %shr36, !id !151, !id.192 !151
  br label %for.inc38, !id !152, !id.196 !152

for.inc38:                                        ; preds = %for.body26
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !id !153, !id.197 !153
  br label %for.cond24, !llvm.loop !154, !id !155, !id.199 !155

for.end40:                                        ; preds = %for.cond24
  %E.0.lcssa = phi i32 [ %E.0, %for.cond24 ], !id !156, !id.200 !156
  %D.0.lcssa = phi i32 [ %D.0, %for.cond24 ], !id !157, !id.201 !157
  %C.0.lcssa = phi i32 [ %C.0, %for.cond24 ], !id !158, !id.202 !158
  %B.0.lcssa = phi i32 [ %B.0, %for.cond24 ], !id !159, !id.203 !159
  %A.0.lcssa = phi i32 [ %A.0, %for.cond24 ], !id !160, !id.204 !160
  br label %sha_transform_label4, !id !161, !id.205 !161

sha_transform_label4:                             ; preds = %for.end40
  br label %for.cond41, !id !162, !id.207 !162

for.cond41:                                       ; preds = %for.inc60, %sha_transform_label4
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc60 ], [ 20, %sha_transform_label4 ], !id !163, !id.208 !163
  %E.1 = phi i32 [ %E.0.lcssa, %sha_transform_label4 ], [ %D.1, %for.inc60 ], !id !164, !id.209 !164
  %D.1 = phi i32 [ %D.0.lcssa, %sha_transform_label4 ], [ %C.1, %for.inc60 ], !id !165, !id.210 !165
  %C.1 = phi i32 [ %C.0.lcssa, %sha_transform_label4 ], [ %or59, %for.inc60 ], !id !166, !id.211 !166
  %B.1 = phi i32 [ %B.0.lcssa, %sha_transform_label4 ], [ %A.1, %for.inc60 ], !id !167, !id.212 !167
  %A.1 = phi i32 [ %A.0.lcssa, %sha_transform_label4 ], [ %conv56, %for.inc60 ], !id !168, !id.213 !168
  %exitcond6 = icmp ne i64 %indvars.iv4, 40, !id !169, !id.220 !169
  br i1 %exitcond6, label %for.body43, label %for.end62, !id !170, !id.221 !170

for.body43:                                       ; preds = %for.cond41
  %shl44 = shl i32 %A.1, 5, !id !171, !id.222 !171
  %shr45 = lshr i32 %A.1, 27, !id !172, !id.223 !172
  %or46 = or i32 %shl44, %shr45, !id !173, !id.224 !173
  %xor47 = xor i32 %B.1, %C.1, !id !174, !id.225 !174
  %xor48 = xor i32 %xor47, %D.1, !id !175, !id.226 !175
  %add49 = add i32 %or46, %xor48, !id !176, !id.227 !176
  %add50 = add i32 %add49, %E.1, !id !177, !id.228 !177
  %arrayidx52 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv4, !id !178, !id.229 !178
  %16 = load i32, i32* %arrayidx52, align 4, !id !179, !id.230 !179
  %add53 = add i32 %add50, %16, !id !180, !id.231 !180
  %conv54 = zext i32 %add53 to i64, !id !181, !id.232 !181
  %add55 = add nsw i64 %conv54, 1859775393, !id !182, !id.233 !182
  %conv56 = trunc i64 %add55 to i32, !id !183, !id.234 !183
  %shl57 = shl i32 %B.1, 30, !id !184, !id.238 !184
  %shr58 = lshr i32 %B.1, 2, !id !185, !id.239 !185
  %or59 = or i32 %shl57, %shr58, !id !186, !id.240 !186
  br label %for.inc60, !id !187, !id.244 !187

for.inc60:                                        ; preds = %for.body43
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !id !188, !id.245 !188
  br label %for.cond41, !llvm.loop !189, !id !190, !id.247 !190

for.end62:                                        ; preds = %for.cond41
  %E.1.lcssa = phi i32 [ %E.1, %for.cond41 ], !id !191, !id.248 !191
  %D.1.lcssa = phi i32 [ %D.1, %for.cond41 ], !id !192, !id.249 !192
  %C.1.lcssa = phi i32 [ %C.1, %for.cond41 ], !id !193, !id.250 !193
  %B.1.lcssa = phi i32 [ %B.1, %for.cond41 ], !id !194, !id.251 !194
  %A.1.lcssa = phi i32 [ %A.1, %for.cond41 ], !id !195, !id.252 !195
  br label %sha_transform_label5, !id !196, !id.253 !196

sha_transform_label5:                             ; preds = %for.end62
  br label %for.cond63, !id !197, !id.255 !197

for.cond63:                                       ; preds = %for.inc85, %sha_transform_label5
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc85 ], [ 40, %sha_transform_label5 ], !id !198, !id.256 !198
  %E.2 = phi i32 [ %E.1.lcssa, %sha_transform_label5 ], [ %D.2, %for.inc85 ], !id !199, !id.257 !199
  %D.2 = phi i32 [ %D.1.lcssa, %sha_transform_label5 ], [ %C.2, %for.inc85 ], !id !200, !id.258 !200
  %C.2 = phi i32 [ %C.1.lcssa, %sha_transform_label5 ], [ %or84, %for.inc85 ], !id !201, !id.259 !201
  %B.2 = phi i32 [ %B.1.lcssa, %sha_transform_label5 ], [ %A.2, %for.inc85 ], !id !202, !id.260 !202
  %A.2 = phi i32 [ %A.1.lcssa, %sha_transform_label5 ], [ %conv81, %for.inc85 ], !id !203, !id.261 !203
  %exitcond3 = icmp ne i64 %indvars.iv1, 60, !id !204, !id.268 !204
  br i1 %exitcond3, label %for.body65, label %for.end87, !id !205, !id.269 !205

for.body65:                                       ; preds = %for.cond63
  %shl66 = shl i32 %A.2, 5, !id !206, !id.270 !206
  %shr67 = lshr i32 %A.2, 27, !id !207, !id.271 !207
  %or68 = or i32 %shl66, %shr67, !id !208, !id.272 !208
  %and69 = and i32 %B.2, %C.2, !id !209, !id.273 !209
  %and70 = and i32 %B.2, %D.2, !id !210, !id.274 !210
  %or71 = or i32 %and69, %and70, !id !211, !id.275 !211
  %and72 = and i32 %C.2, %D.2, !id !212, !id.276 !212
  %or73 = or i32 %or71, %and72, !id !213, !id.277 !213
  %add74 = add i32 %or68, %or73, !id !214, !id.278 !214
  %add75 = add i32 %add74, %E.2, !id !215, !id.279 !215
  %arrayidx77 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv1, !id !216, !id.280 !216
  %17 = load i32, i32* %arrayidx77, align 4, !id !217, !id.281 !217
  %add78 = add i32 %add75, %17, !id !218, !id.282 !218
  %conv79 = zext i32 %add78 to i64, !id !219, !id.283 !219
  %add80 = add nsw i64 %conv79, 2400959708, !id !220, !id.284 !220
  %conv81 = trunc i64 %add80 to i32, !id !221, !id.285 !221
  %shl82 = shl i32 %B.2, 30, !id !222, !id.289 !222
  %shr83 = lshr i32 %B.2, 2, !id !223, !id.290 !223
  %or84 = or i32 %shl82, %shr83, !id !224, !id.291 !224
  br label %for.inc85, !id !225, !id.295 !225

for.inc85:                                        ; preds = %for.body65
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !226, !id.296 !226
  br label %for.cond63, !llvm.loop !227, !id !228, !id.298 !228

for.end87:                                        ; preds = %for.cond63
  %E.2.lcssa = phi i32 [ %E.2, %for.cond63 ], !id !229, !id.299 !229
  %D.2.lcssa = phi i32 [ %D.2, %for.cond63 ], !id !230, !id.300 !230
  %C.2.lcssa = phi i32 [ %C.2, %for.cond63 ], !id !231, !id.301 !231
  %B.2.lcssa = phi i32 [ %B.2, %for.cond63 ], !id !232, !id.302 !232
  %A.2.lcssa = phi i32 [ %A.2, %for.cond63 ], !id !233, !id.303 !233
  br label %sha_transform_label6, !id !234, !id.304 !234

sha_transform_label6:                             ; preds = %for.end87
  br label %for.cond88, !id !235, !id.306 !235

for.cond88:                                       ; preds = %for.inc107, %sha_transform_label6
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc107 ], [ 60, %sha_transform_label6 ], !id !236, !id.307 !236
  %E.3 = phi i32 [ %E.2.lcssa, %sha_transform_label6 ], [ %D.3, %for.inc107 ], !id !237, !id.308 !237
  %D.3 = phi i32 [ %D.2.lcssa, %sha_transform_label6 ], [ %C.3, %for.inc107 ], !id !238, !id.309 !238
  %C.3 = phi i32 [ %C.2.lcssa, %sha_transform_label6 ], [ %or106, %for.inc107 ], !id !239, !id.310 !239
  %B.3 = phi i32 [ %B.2.lcssa, %sha_transform_label6 ], [ %A.3, %for.inc107 ], !id !240, !id.311 !240
  %A.3 = phi i32 [ %A.2.lcssa, %sha_transform_label6 ], [ %conv103, %for.inc107 ], !id !241, !id.312 !241
  %exitcond = icmp ne i64 %indvars.iv, 80, !id !242, !id.319 !242
  br i1 %exitcond, label %for.body90, label %for.end109, !id !243, !id.320 !243

for.body90:                                       ; preds = %for.cond88
  %shl91 = shl i32 %A.3, 5, !id !244, !id.321 !244
  %shr92 = lshr i32 %A.3, 27, !id !245, !id.322 !245
  %or93 = or i32 %shl91, %shr92, !id !246, !id.323 !246
  %xor94 = xor i32 %B.3, %C.3, !id !247, !id.324 !247
  %xor95 = xor i32 %xor94, %D.3, !id !248, !id.325 !248
  %add96 = add i32 %or93, %xor95, !id !249, !id.326 !249
  %add97 = add i32 %add96, %E.3, !id !250, !id.327 !250
  %arrayidx99 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv, !id !251, !id.328 !251
  %18 = load i32, i32* %arrayidx99, align 4, !id !252, !id.329 !252
  %add100 = add i32 %add97, %18, !id !253, !id.330 !253
  %conv101 = zext i32 %add100 to i64, !id !254, !id.331 !254
  %add102 = add nsw i64 %conv101, 3395469782, !id !255, !id.332 !255
  %conv103 = trunc i64 %add102 to i32, !id !256, !id.333 !256
  %shl104 = shl i32 %B.3, 30, !id !257, !id.337 !257
  %shr105 = lshr i32 %B.3, 2, !id !258, !id.338 !258
  %or106 = or i32 %shl104, %shr105, !id !259, !id.339 !259
  br label %for.inc107, !id !260, !id.343 !260

for.inc107:                                       ; preds = %for.body90
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !261, !id.344 !261
  br label %for.cond88, !llvm.loop !262, !id !263, !id.346 !263

for.end109:                                       ; preds = %for.cond88
  %E.3.lcssa = phi i32 [ %E.3, %for.cond88 ], !id !264, !id.347 !264
  %D.3.lcssa = phi i32 [ %D.3, %for.cond88 ], !id !265, !id.348 !265
  %C.3.lcssa = phi i32 [ %C.3, %for.cond88 ], !id !266, !id.349 !266
  %B.3.lcssa = phi i32 [ %B.3, %for.cond88 ], !id !267, !id.350 !267
  %A.3.lcssa = phi i32 [ %A.3, %for.cond88 ], !id !268, !id.351 !268
  %19 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4, !id !269, !id.352 !269
  %add110 = add i32 %19, %A.3.lcssa, !id !270, !id.353 !270
  store i32 %add110, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4, !id !271, !id.354 !271
  %20 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !id !272, !id.355 !272
  %add111 = add i32 %20, %B.3.lcssa, !id !273, !id.356 !273
  store i32 %add111, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !id !274, !id.357 !274
  %21 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4, !id !275, !id.358 !275
  %add112 = add i32 %21, %C.3.lcssa, !id !276, !id.359 !276
  store i32 %add112, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4, !id !277, !id.360 !277
  %22 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !id !278, !id.361 !278
  %add113 = add i32 %22, %D.3.lcssa, !id !279, !id.362 !279
  store i32 %add113, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !id !280, !id.363 !280
  %23 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4, !id !281, !id.364 !281
  %add114 = add i32 %23, %E.3.lcssa, !id !282, !id.365 !282
  store i32 %add114, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4, !id !283, !id.366 !283
  %24 = bitcast [80 x i32]* %W to i8*, !id !284, !id.367 !284
  call void @llvm.lifetime.end.p0i8(i64 320, i8* %24) #5, !id !285, !id.368 !285
  ret void, !id !286, !id.369 !286
}

; Function Attrs: nounwind
define void @sha_init() #3 !id !16 {
entry:
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4, !id !287, !id.370 !287
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !id !288, !id.371 !288
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4, !id !289, !id.372 !289
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !id !290, !id.373 !290
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4, !id !291, !id.374 !291
  store i32 0, i32* @sha_info_count_lo, align 4, !id !292, !id.375 !292
  store i32 0, i32* @sha_info_count_hi, align 4, !id !293, !id.376 !293
  ret void, !id !294, !id.377 !294
}

; Function Attrs: noinline nounwind
define void @sha_update(i8* %buffer, i32 %count) #0 !fpga.function.pragma !9 !id !17 {
entry:
  %0 = load i32, i32* @sha_info_count_lo, align 4, !id !295, !id.380 !295
  %shl = shl i32 %count, 3, !id !296, !id.381 !296
  %add = add i32 %0, %shl, !id !297, !id.382 !297
  %1 = load i32, i32* @sha_info_count_lo, align 4, !id !298, !id.383 !298
  %cmp = icmp ult i32 %add, %1, !id !299, !id.384 !299
  br i1 %cmp, label %if.then, label %if.end, !id !300, !id.385 !300

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @sha_info_count_hi, align 4, !id !301, !id.386 !301
  %inc = add i32 %2, 1, !id !302, !id.387 !302
  store i32 %inc, i32* @sha_info_count_hi, align 4, !id !303, !id.388 !303
  br label %if.end, !id !304, !id.389 !304

if.end:                                           ; preds = %if.then, %entry
  %shl1 = shl i32 %count, 3, !id !305, !id.390 !305
  %3 = load i32, i32* @sha_info_count_lo, align 4, !id !306, !id.391 !306
  %add2 = add i32 %3, %shl1, !id !307, !id.392 !307
  store i32 %add2, i32* @sha_info_count_lo, align 4, !id !308, !id.393 !308
  %shr = lshr i32 %count, 29, !id !309, !id.394 !309
  %4 = load i32, i32* @sha_info_count_hi, align 4, !id !310, !id.395 !310
  %add3 = add i32 %4, %shr, !id !311, !id.396 !311
  store i32 %add3, i32* @sha_info_count_hi, align 4, !id !312, !id.397 !312
  br label %sha_update_label4, !id !313, !id.398 !313

sha_update_label4:                                ; preds = %if.end
  %5 = sub i32 -1, %count, !id !314, !id.399 !314
  %6 = icmp sgt i32 %5, -64, !id !315, !id.400 !315
  %smax = select i1 %6, i32 %5, i32 -64, !id !316, !id.401 !316
  %7 = add i32 %count, %smax, !id !317, !id.402 !317
  %8 = add i32 %7, 64, !id !318, !id.403 !318
  %9 = lshr i32 %8, 6, !id !319, !id.404 !319
  %10 = shl i32 %9, 6, !id !320, !id.405 !320
  %11 = zext i32 %9 to i64, !id !321, !id.406 !321
  %12 = shl i64 %11, 6, !id !322, !id.407 !322
  br label %while.cond, !id !323, !id.408 !323

while.cond:                                       ; preds = %while.body, %sha_update_label4
  %count.addr.0 = phi i32 [ %count, %sha_update_label4 ], [ %sub, %while.body ], !id !324, !id.409 !324
  %buffer.addr.0 = phi i8* [ %buffer, %sha_update_label4 ], [ %add.ptr, %while.body ], !id !325, !id.410 !325
  %cmp4 = icmp sge i32 %count.addr.0, 64, !id !326, !id.413 !326
  br i1 %cmp4, label %while.body, label %while.end, !id !327, !id.414 !327

while.body:                                       ; preds = %while.cond
  call void @local_memcpy(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i8* %buffer.addr.0, i32 64), !id !328, !id.415 !328
  call void @sha_transform(), !id !329, !id.416 !329
  %add.ptr = getelementptr inbounds i8, i8* %buffer.addr.0, i64 64, !id !330, !id.417 !330
  %sub = sub nsw i32 %count.addr.0, 64, !id !331, !id.419 !331
  br label %while.cond, !llvm.loop !332, !id !333, !id.421 !333

while.end:                                        ; preds = %while.cond
  %13 = sub i32 %count, %10, !id !334, !id.422 !334
  %scevgep = getelementptr i8, i8* %buffer, i64 %12, !id !335, !id.423 !335
  call void @local_memcpy(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i8* %scevgep, i32 %13), !id !336, !id.424 !336
  ret void, !id !337, !id.425 !337
}

; Function Attrs: nounwind
define void @sha_final() #3 !id !19 {
entry:
  %0 = load i32, i32* @sha_info_count_lo, align 4, !id !338, !id.426 !338
  %1 = load i32, i32* @sha_info_count_hi, align 4, !id !339, !id.428 !339
  %shr = lshr i32 %0, 3, !id !340, !id.430 !340
  %and = and i32 %shr, 63, !id !341, !id.431 !341
  %inc = add nsw i32 %and, 1, !id !342, !id.433 !342
  %idxprom = sext i32 %and to i64, !id !343, !id.435 !343
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idxprom, !id !344, !id.436 !344
  store i32 128, i32* %arrayidx, align 4, !id !345, !id.437 !345
  %cmp = icmp sgt i32 %inc, 56, !id !346, !id.438 !346
  br i1 %cmp, label %if.then, label %if.else, !id !347, !id.439 !347

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 64, %inc, !id !348, !id.440 !348
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 %sub, i32 %inc), !id !349, !id.441 !349
  call void @sha_transform(), !id !350, !id.442 !350
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 56, i32 0), !id !351, !id.443 !351
  br label %if.end, !id !352, !id.444 !352

if.else:                                          ; preds = %entry
  %sub1 = sub nsw i32 56, %inc, !id !353, !id.445 !353
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 %sub1, i32 %inc), !id !354, !id.446 !354
  br label %if.end, !id !355, !id.447 !355

if.end:                                           ; preds = %if.else, %if.then
  store i32 %1, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 4, !id !356, !id.448 !356
  store i32 %0, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4, !id !357, !id.449 !357
  call void @sha_transform(), !id !358, !id.450 !358
  ret void, !id !359, !id.451 !359
}

; Function Attrs: nounwind
define void @sha_stream([8192 x i8]* "fpga.decayed.dim.hint"="2" %indata, i32* "fpga.decayed.dim.hint"="2" %in_i, i32* "fpga.decayed.dim.hint"="5" %outdata) #4 !fpga.function.pragma !360 !id !20 {
entry:
  br label %sha_stream_label1, !id !362, !id.455 !362

sha_stream_label1:                                ; preds = %entry
  br label %for.cond, !id !363, !id.457 !363

for.cond:                                         ; preds = %for.inc10, %sha_stream_label1
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc10 ], [ 0, %sha_stream_label1 ], !id !364, !id.458 !364
  %exitcond9 = icmp ne i64 %indvars.iv7, 2, !id !365, !id.460 !365
  br i1 %exitcond9, label %for.body, label %for.end12, !id !366, !id.461 !366

for.body:                                         ; preds = %for.cond
  br label %VITIS_LOOP_207_1, !id !367, !id.462 !367

VITIS_LOOP_207_1:                                 ; preds = %for.body
  br label %for.cond1, !id !368, !id.464 !368

for.cond1:                                        ; preds = %for.inc, %VITIS_LOOP_207_1
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc ], [ 0, %VITIS_LOOP_207_1 ], !id !369, !id.465 !369
  %exitcond6 = icmp ne i64 %indvars.iv4, 8192, !id !370, !id.467 !370
  br i1 %exitcond6, label %for.body3, label %for.end, !id !371, !id.468 !371

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds [8192 x i8], [8192 x i8]* %indata, i64 %indvars.iv7, !id !372, !id.469 !372
  %arrayidx5 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx, i64 0, i64 %indvars.iv4, !id !373, !id.470 !373
  %0 = load i8, i8* %arrayidx5, align 1, !id !374, !id.471 !374
  %arrayidx7 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %indvars.iv7, !id !375, !id.472 !375
  %arrayidx9 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx7, i64 0, i64 %indvars.iv4, !id !376, !id.473 !376
  store i8 %0, i8* %arrayidx9, align 1, !id !377, !id.474 !377
  br label %for.inc, !id !378, !id.475 !378

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !id !379, !id.476 !379
  br label %for.cond1, !llvm.loop !380, !id !381, !id.478 !381

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !id !382, !id.479 !382

for.inc10:                                        ; preds = %for.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !id !383, !id.480 !383
  br label %for.cond, !llvm.loop !384, !id !385, !id.482 !385

for.end12:                                        ; preds = %for.cond
  call void @sha_init(), !id !386, !id.483 !386
  br label %sha_stream_label0, !id !387, !id.484 !387

sha_stream_label0:                                ; preds = %for.end12
  br label %for.cond13, !id !388, !id.486 !388

for.cond13:                                       ; preds = %for.inc21, %sha_stream_label0
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc21 ], [ 0, %sha_stream_label0 ], !id !389, !id.487 !389
  %exitcond3 = icmp ne i64 %indvars.iv1, 2, !id !390, !id.489 !390
  br i1 %exitcond3, label %for.body15, label %for.end23, !id !391, !id.490 !391

for.body15:                                       ; preds = %for.cond13
  %arrayidx17 = getelementptr inbounds i32, i32* %in_i, i64 %indvars.iv1, !id !392, !id.491 !392
  %1 = load i32, i32* %arrayidx17, align 4, !id !393, !id.492 !393
  %arrayidx19 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %indvars.iv1, !id !394, !id.494 !394
  %arrayidx20 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx19, i64 0, i64 0, !id !395, !id.495 !395
  call void @sha_update(i8* %arrayidx20, i32 %1), !id !396, !id.497 !396
  br label %for.inc21, !id !397, !id.498 !397

for.inc21:                                        ; preds = %for.body15
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !398, !id.499 !398
  br label %for.cond13, !llvm.loop !399, !id !400, !id.501 !400

for.end23:                                        ; preds = %for.cond13
  call void @sha_final(), !id !401, !id.502 !401
  br label %sha_stream_label2, !id !402, !id.503 !402

sha_stream_label2:                                ; preds = %for.end23
  br label %for.cond24, !id !403, !id.505 !403

for.cond24:                                       ; preds = %for.inc31, %sha_stream_label2
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc31 ], [ 0, %sha_stream_label2 ], !id !404, !id.506 !404
  %exitcond = icmp ne i64 %indvars.iv, 5, !id !405, !id.508 !405
  br i1 %exitcond, label %for.body26, label %for.end33, !id !406, !id.509 !406

for.body26:                                       ; preds = %for.cond24
  %arrayidx28 = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %indvars.iv, !id !407, !id.510 !407
  %2 = load i32, i32* %arrayidx28, align 4, !id !408, !id.511 !408
  %arrayidx30 = getelementptr inbounds i32, i32* %outdata, i64 %indvars.iv, !id !409, !id.512 !409
  store i32 %2, i32* %arrayidx30, align 4, !id !410, !id.513 !410
  br label %for.inc31, !id !411, !id.514 !411

for.inc31:                                        ; preds = %for.body26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !412, !id.515 !412
  br label %for.cond24, !llvm.loop !413, !id !414, !id.517 !414

for.end33:                                        ; preds = %for.cond24
  ret void, !id !415, !id.518 !415
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="sha_stream" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!5}
!llvm.module.flags = !{!6, !7, !8}

!0 = !{i32 1}
!1 = !{i32 2}
!2 = !{i32 3}
!3 = !{i32 4}
!4 = !{i32 5}
!5 = !{!"clang version 7.0.0 "}
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!10}
!10 = !{!"fpga.inline", !"user"}
!11 = !{i32 7}
!12 = !{i32 9}
!13 = !{i32 10}
!14 = !{i32 11}
!15 = !{i32 12}
!16 = !{i32 13}
!17 = !{i32 14}
!18 = !{i32 15}
!19 = !{i32 16}
!20 = !{i32 17}
!21 = !{i32 20}
!22 = !{i32 22}
!23 = !{i32 23}
!24 = distinct !{!24, i32 3}
!25 = !{i32 25}
!26 = !{i32 26}
!27 = !{i32 27}
!28 = !{i32 28}
!29 = !{i32 29}
!30 = !{i32 30}
!31 = !{i32 33}
!32 = !{i32 35}
!33 = !{i32 36}
!34 = !{i32 37}
!35 = !{i32 39}
!36 = distinct !{!36, i32 2}
!37 = !{i32 40}
!38 = !{i32 41}
!39 = !{i32 47}
!40 = !{i32 49}
!41 = !{i32 50}
!42 = !{i32 51}
!43 = !{i32 52}
!44 = !{i32 53}
!45 = !{i32 57}
!46 = !{i32 59}
!47 = !{i32 60}
!48 = !{i32 62}
!49 = !{i32 64}
!50 = !{i32 65}
!51 = !{i32 66}
!52 = !{i32 67}
!53 = !{i32 69}
!54 = !{i32 71}
!55 = !{i32 72}
!56 = !{i32 73}
!57 = !{i32 74}
!58 = !{i32 75}
!59 = !{i32 77}
!60 = !{i32 79}
!61 = !{i32 80}
!62 = !{i32 81}
!63 = !{i32 82}
!64 = !{i32 83}
!65 = !{i32 85}
!66 = !{i32 87}
!67 = !{i32 88}
!68 = !{i32 89}
!69 = !{i32 90}
!70 = !{i32 91}
!71 = !{i32 93}
!72 = !{i32 94}
!73 = distinct !{!73, i32 5}
!74 = !{i32 96}
!75 = !{i32 97}
!76 = !{i32 6}
!77 = !{i32 98}
!78 = !{i32 99}
!79 = !{i32 100}
!80 = !{i32 102}
!81 = !{i32 104}
!82 = !{i32 105}
!83 = !{i32 107}
!84 = !{i32 108}
!85 = !{i32 109}
!86 = !{i32 110}
!87 = !{i32 111}
!88 = !{i32 112}
!89 = !{i32 113}
!90 = !{i32 114}
!91 = distinct !{!91, i32 12}
!92 = !{i32 116}
!93 = !{i32 117}
!94 = !{i32 119}
!95 = !{i32 120}
!96 = !{i32 122}
!97 = !{i32 123}
!98 = !{i32 124}
!99 = !{i32 125}
!100 = !{i32 126}
!101 = !{i32 127}
!102 = !{i32 128}
!103 = !{i32 129}
!104 = !{i32 130}
!105 = !{i32 131}
!106 = !{i32 132}
!107 = !{i32 133}
!108 = !{i32 134}
!109 = !{i32 135}
!110 = !{i32 136}
!111 = !{i32 137}
!112 = !{i32 138}
!113 = !{i32 139}
!114 = !{i32 140}
!115 = !{i32 141}
!116 = !{i32 142}
!117 = distinct !{!117, i32 11}
!118 = !{i32 144}
!119 = !{i32 145}
!120 = !{i32 147}
!121 = !{i32 149}
!122 = !{i32 151}
!123 = !{i32 153}
!124 = !{i32 155}
!125 = !{i32 157}
!126 = !{i32 158}
!127 = !{i32 159}
!128 = !{i32 160}
!129 = !{i32 161}
!130 = !{i32 162}
!131 = !{i32 163}
!132 = !{i32 170}
!133 = !{i32 171}
!134 = !{i32 172}
!135 = !{i32 173}
!136 = !{i32 174}
!137 = !{i32 175}
!138 = !{i32 176}
!139 = !{i32 177}
!140 = !{i32 178}
!141 = !{i32 179}
!142 = !{i32 180}
!143 = !{i32 181}
!144 = !{i32 182}
!145 = !{i32 183}
!146 = !{i32 184}
!147 = !{i32 185}
!148 = !{i32 186}
!149 = !{i32 190}
!150 = !{i32 191}
!151 = !{i32 192}
!152 = !{i32 196}
!153 = !{i32 197}
!154 = distinct !{!154, i32 10}
!155 = !{i32 199}
!156 = !{i32 200}
!157 = !{i32 201}
!158 = !{i32 202}
!159 = !{i32 203}
!160 = !{i32 204}
!161 = !{i32 205}
!162 = !{i32 207}
!163 = !{i32 208}
!164 = !{i32 209}
!165 = !{i32 210}
!166 = !{i32 211}
!167 = !{i32 212}
!168 = !{i32 213}
!169 = !{i32 220}
!170 = !{i32 221}
!171 = !{i32 222}
!172 = !{i32 223}
!173 = !{i32 224}
!174 = !{i32 225}
!175 = !{i32 226}
!176 = !{i32 227}
!177 = !{i32 228}
!178 = !{i32 229}
!179 = !{i32 230}
!180 = !{i32 231}
!181 = !{i32 232}
!182 = !{i32 233}
!183 = !{i32 234}
!184 = !{i32 238}
!185 = !{i32 239}
!186 = !{i32 240}
!187 = !{i32 244}
!188 = !{i32 245}
!189 = distinct !{!189, i32 9}
!190 = !{i32 247}
!191 = !{i32 248}
!192 = !{i32 249}
!193 = !{i32 250}
!194 = !{i32 251}
!195 = !{i32 252}
!196 = !{i32 253}
!197 = !{i32 255}
!198 = !{i32 256}
!199 = !{i32 257}
!200 = !{i32 258}
!201 = !{i32 259}
!202 = !{i32 260}
!203 = !{i32 261}
!204 = !{i32 268}
!205 = !{i32 269}
!206 = !{i32 270}
!207 = !{i32 271}
!208 = !{i32 272}
!209 = !{i32 273}
!210 = !{i32 274}
!211 = !{i32 275}
!212 = !{i32 276}
!213 = !{i32 277}
!214 = !{i32 278}
!215 = !{i32 279}
!216 = !{i32 280}
!217 = !{i32 281}
!218 = !{i32 282}
!219 = !{i32 283}
!220 = !{i32 284}
!221 = !{i32 285}
!222 = !{i32 289}
!223 = !{i32 290}
!224 = !{i32 291}
!225 = !{i32 295}
!226 = !{i32 296}
!227 = distinct !{!227, i32 8}
!228 = !{i32 298}
!229 = !{i32 299}
!230 = !{i32 300}
!231 = !{i32 301}
!232 = !{i32 302}
!233 = !{i32 303}
!234 = !{i32 304}
!235 = !{i32 306}
!236 = !{i32 307}
!237 = !{i32 308}
!238 = !{i32 309}
!239 = !{i32 310}
!240 = !{i32 311}
!241 = !{i32 312}
!242 = !{i32 319}
!243 = !{i32 320}
!244 = !{i32 321}
!245 = !{i32 322}
!246 = !{i32 323}
!247 = !{i32 324}
!248 = !{i32 325}
!249 = !{i32 326}
!250 = !{i32 327}
!251 = !{i32 328}
!252 = !{i32 329}
!253 = !{i32 330}
!254 = !{i32 331}
!255 = !{i32 332}
!256 = !{i32 333}
!257 = !{i32 337}
!258 = !{i32 338}
!259 = !{i32 339}
!260 = !{i32 343}
!261 = !{i32 344}
!262 = distinct !{!262, i32 7}
!263 = !{i32 346}
!264 = !{i32 347}
!265 = !{i32 348}
!266 = !{i32 349}
!267 = !{i32 350}
!268 = !{i32 351}
!269 = !{i32 352}
!270 = !{i32 353}
!271 = !{i32 354}
!272 = !{i32 355}
!273 = !{i32 356}
!274 = !{i32 357}
!275 = !{i32 358}
!276 = !{i32 359}
!277 = !{i32 360}
!278 = !{i32 361}
!279 = !{i32 362}
!280 = !{i32 363}
!281 = !{i32 364}
!282 = !{i32 365}
!283 = !{i32 366}
!284 = !{i32 367}
!285 = !{i32 368}
!286 = !{i32 369}
!287 = !{i32 370}
!288 = !{i32 371}
!289 = !{i32 372}
!290 = !{i32 373}
!291 = !{i32 374}
!292 = !{i32 375}
!293 = !{i32 376}
!294 = !{i32 377}
!295 = !{i32 380}
!296 = !{i32 381}
!297 = !{i32 382}
!298 = !{i32 383}
!299 = !{i32 384}
!300 = !{i32 385}
!301 = !{i32 386}
!302 = !{i32 387}
!303 = !{i32 388}
!304 = !{i32 389}
!305 = !{i32 390}
!306 = !{i32 391}
!307 = !{i32 392}
!308 = !{i32 393}
!309 = !{i32 394}
!310 = !{i32 395}
!311 = !{i32 396}
!312 = !{i32 397}
!313 = !{i32 398}
!314 = !{i32 399}
!315 = !{i32 400}
!316 = !{i32 401}
!317 = !{i32 402}
!318 = !{i32 403}
!319 = !{i32 404}
!320 = !{i32 405}
!321 = !{i32 406}
!322 = !{i32 407}
!323 = !{i32 408}
!324 = !{i32 409}
!325 = !{i32 410}
!326 = !{i32 413}
!327 = !{i32 414}
!328 = !{i32 415}
!329 = !{i32 416}
!330 = !{i32 417}
!331 = !{i32 419}
!332 = distinct !{!332, i32 15}
!333 = !{i32 421}
!334 = !{i32 422}
!335 = !{i32 423}
!336 = !{i32 424}
!337 = !{i32 425}
!338 = !{i32 426}
!339 = !{i32 428}
!340 = !{i32 430}
!341 = !{i32 431}
!342 = !{i32 433}
!343 = !{i32 435}
!344 = !{i32 436}
!345 = !{i32 437}
!346 = !{i32 438}
!347 = !{i32 439}
!348 = !{i32 440}
!349 = !{i32 441}
!350 = !{i32 442}
!351 = !{i32 443}
!352 = !{i32 444}
!353 = !{i32 445}
!354 = !{i32 446}
!355 = !{i32 447}
!356 = !{i32 448}
!357 = !{i32 449}
!358 = !{i32 450}
!359 = !{i32 451}
!360 = !{!361}
!361 = !{!"fpga.static.pipeline", !"user"}
!362 = !{i32 455}
!363 = !{i32 457}
!364 = !{i32 458}
!365 = !{i32 460}
!366 = !{i32 461}
!367 = !{i32 462}
!368 = !{i32 464}
!369 = !{i32 465}
!370 = !{i32 467}
!371 = !{i32 468}
!372 = !{i32 469}
!373 = !{i32 470}
!374 = !{i32 471}
!375 = !{i32 472}
!376 = !{i32 473}
!377 = !{i32 474}
!378 = !{i32 475}
!379 = !{i32 476}
!380 = distinct !{!380, i32 21}
!381 = !{i32 478}
!382 = !{i32 479}
!383 = !{i32 480}
!384 = distinct !{!384, i32 20}
!385 = !{i32 482}
!386 = !{i32 483}
!387 = !{i32 484}
!388 = !{i32 486}
!389 = !{i32 487}
!390 = !{i32 489}
!391 = !{i32 490}
!392 = !{i32 491}
!393 = !{i32 492}
!394 = !{i32 494}
!395 = !{i32 495}
!396 = !{i32 497}
!397 = !{i32 498}
!398 = !{i32 499}
!399 = distinct !{!399, i32 19}
!400 = !{i32 501}
!401 = !{i32 502}
!402 = !{i32 503}
!403 = !{i32 505}
!404 = !{i32 506}
!405 = !{i32 508}
!406 = !{i32 509}
!407 = !{i32 510}
!408 = !{i32 511}
!409 = !{i32 512}
!410 = !{i32 513}
!411 = !{i32 514}
!412 = !{i32 515}
!413 = distinct !{!413, i32 18}
!414 = !{i32 517}
!415 = !{i32 518}
