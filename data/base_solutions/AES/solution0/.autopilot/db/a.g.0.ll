; ModuleID = 'data/base_solutions/AES/solution0/.autopilot/db/a.g.0.bc'
source_filename = "data/base_solutions/AES/solution0/.autopilot/db/a.g.0.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@Rcon0 = internal unnamed_addr constant [30 x i32] [i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 27, i32 54, i32 108, i32 216, i32 171, i32 77, i32 154, i32 47, i32 94, i32 188, i32 99, i32 198, i32 151, i32 53, i32 106, i32 212, i32 179, i32 125, i32 250, i32 239, i32 197, i32 145], align 512
@word = internal unnamed_addr global [4 x [120 x i32]] zeroinitializer, align 512
@InversShiftRow_ByteSub.invSbox = internal unnamed_addr constant [16 x [16 x i32]] [[16 x i32] [i32 82, i32 9, i32 106, i32 213, i32 48, i32 54, i32 165, i32 56, i32 191, i32 64, i32 163, i32 158, i32 129, i32 243, i32 215, i32 251], [16 x i32] [i32 124, i32 227, i32 57, i32 130, i32 155, i32 47, i32 255, i32 135, i32 52, i32 142, i32 67, i32 68, i32 196, i32 222, i32 233, i32 203], [16 x i32] [i32 84, i32 123, i32 148, i32 50, i32 166, i32 194, i32 35, i32 61, i32 238, i32 76, i32 149, i32 11, i32 66, i32 250, i32 195, i32 78], [16 x i32] [i32 8, i32 46, i32 161, i32 102, i32 40, i32 217, i32 36, i32 178, i32 118, i32 91, i32 162, i32 73, i32 109, i32 139, i32 209, i32 37], [16 x i32] [i32 114, i32 248, i32 246, i32 100, i32 134, i32 104, i32 152, i32 22, i32 212, i32 164, i32 92, i32 204, i32 93, i32 101, i32 182, i32 146], [16 x i32] [i32 108, i32 112, i32 72, i32 80, i32 253, i32 237, i32 185, i32 218, i32 94, i32 21, i32 70, i32 87, i32 167, i32 141, i32 157, i32 132], [16 x i32] [i32 144, i32 216, i32 171, i32 0, i32 140, i32 188, i32 211, i32 10, i32 247, i32 228, i32 88, i32 5, i32 184, i32 179, i32 69, i32 6], [16 x i32] [i32 208, i32 44, i32 30, i32 143, i32 202, i32 63, i32 15, i32 2, i32 193, i32 175, i32 189, i32 3, i32 1, i32 19, i32 138, i32 107], [16 x i32] [i32 58, i32 145, i32 17, i32 65, i32 79, i32 103, i32 220, i32 234, i32 151, i32 242, i32 207, i32 206, i32 240, i32 180, i32 230, i32 115], [16 x i32] [i32 150, i32 172, i32 116, i32 34, i32 231, i32 173, i32 53, i32 133, i32 226, i32 249, i32 55, i32 232, i32 28, i32 117, i32 223, i32 110], [16 x i32] [i32 71, i32 241, i32 26, i32 113, i32 29, i32 41, i32 197, i32 137, i32 111, i32 183, i32 98, i32 14, i32 170, i32 24, i32 190, i32 27], [16 x i32] [i32 252, i32 86, i32 62, i32 75, i32 198, i32 210, i32 121, i32 32, i32 154, i32 219, i32 192, i32 254, i32 120, i32 205, i32 90, i32 244], [16 x i32] [i32 31, i32 221, i32 168, i32 51, i32 136, i32 7, i32 199, i32 49, i32 177, i32 18, i32 16, i32 89, i32 39, i32 128, i32 236, i32 95], [16 x i32] [i32 96, i32 81, i32 127, i32 169, i32 25, i32 181, i32 74, i32 13, i32 45, i32 229, i32 122, i32 159, i32 147, i32 201, i32 156, i32 239], [16 x i32] [i32 160, i32 224, i32 59, i32 77, i32 174, i32 42, i32 245, i32 176, i32 200, i32 235, i32 187, i32 60, i32 131, i32 83, i32 153, i32 97], [16 x i32] [i32 23, i32 43, i32 4, i32 126, i32 186, i32 119, i32 214, i32 38, i32 225, i32 105, i32 20, i32 99, i32 85, i32 33, i32 12, i32 125]], align 512
@KeySchedule.Sbox = internal unnamed_addr constant [16 x [16 x i32]] [[16 x i32] [i32 99, i32 124, i32 119, i32 123, i32 242, i32 107, i32 111, i32 197, i32 48, i32 1, i32 103, i32 43, i32 254, i32 215, i32 171, i32 118], [16 x i32] [i32 202, i32 130, i32 201, i32 125, i32 250, i32 89, i32 71, i32 240, i32 173, i32 212, i32 162, i32 175, i32 156, i32 164, i32 114, i32 192], [16 x i32] [i32 183, i32 253, i32 147, i32 38, i32 54, i32 63, i32 247, i32 204, i32 52, i32 165, i32 229, i32 241, i32 113, i32 216, i32 49, i32 21], [16 x i32] [i32 4, i32 199, i32 35, i32 195, i32 24, i32 150, i32 5, i32 154, i32 7, i32 18, i32 128, i32 226, i32 235, i32 39, i32 178, i32 117], [16 x i32] [i32 9, i32 131, i32 44, i32 26, i32 27, i32 110, i32 90, i32 160, i32 82, i32 59, i32 214, i32 179, i32 41, i32 227, i32 47, i32 132], [16 x i32] [i32 83, i32 209, i32 0, i32 237, i32 32, i32 252, i32 177, i32 91, i32 106, i32 203, i32 190, i32 57, i32 74, i32 76, i32 88, i32 207], [16 x i32] [i32 208, i32 239, i32 170, i32 251, i32 67, i32 77, i32 51, i32 133, i32 69, i32 249, i32 2, i32 127, i32 80, i32 60, i32 159, i32 168], [16 x i32] [i32 81, i32 163, i32 64, i32 143, i32 146, i32 157, i32 56, i32 245, i32 188, i32 182, i32 218, i32 33, i32 16, i32 255, i32 243, i32 210], [16 x i32] [i32 205, i32 12, i32 19, i32 236, i32 95, i32 151, i32 68, i32 23, i32 196, i32 167, i32 126, i32 61, i32 100, i32 93, i32 25, i32 115], [16 x i32] [i32 96, i32 129, i32 79, i32 220, i32 34, i32 42, i32 144, i32 136, i32 70, i32 238, i32 184, i32 20, i32 222, i32 94, i32 11, i32 219], [16 x i32] [i32 224, i32 50, i32 58, i32 10, i32 73, i32 6, i32 36, i32 92, i32 194, i32 211, i32 172, i32 98, i32 145, i32 149, i32 228, i32 121], [16 x i32] [i32 231, i32 200, i32 55, i32 109, i32 141, i32 213, i32 78, i32 169, i32 108, i32 86, i32 244, i32 234, i32 101, i32 122, i32 174, i32 8], [16 x i32] [i32 186, i32 120, i32 37, i32 46, i32 28, i32 166, i32 180, i32 198, i32 232, i32 221, i32 116, i32 31, i32 75, i32 189, i32 139, i32 138], [16 x i32] [i32 112, i32 62, i32 181, i32 102, i32 72, i32 3, i32 246, i32 14, i32 97, i32 53, i32 87, i32 185, i32 134, i32 193, i32 29, i32 158], [16 x i32] [i32 225, i32 248, i32 152, i32 17, i32 105, i32 217, i32 142, i32 148, i32 155, i32 30, i32 135, i32 233, i32 206, i32 85, i32 40, i32 223], [16 x i32] [i32 140, i32 161, i32 137, i32 13, i32 191, i32 230, i32 66, i32 104, i32 65, i32 153, i32 45, i32 15, i32 176, i32 84, i32 187, i32 22]], align 512
@ByteSub_ShiftRow.Sbox = internal unnamed_addr constant [16 x [16 x i32]] [[16 x i32] [i32 99, i32 124, i32 119, i32 123, i32 242, i32 107, i32 111, i32 197, i32 48, i32 1, i32 103, i32 43, i32 254, i32 215, i32 171, i32 118], [16 x i32] [i32 202, i32 130, i32 201, i32 125, i32 250, i32 89, i32 71, i32 240, i32 173, i32 212, i32 162, i32 175, i32 156, i32 164, i32 114, i32 192], [16 x i32] [i32 183, i32 253, i32 147, i32 38, i32 54, i32 63, i32 247, i32 204, i32 52, i32 165, i32 229, i32 241, i32 113, i32 216, i32 49, i32 21], [16 x i32] [i32 4, i32 199, i32 35, i32 195, i32 24, i32 150, i32 5, i32 154, i32 7, i32 18, i32 128, i32 226, i32 235, i32 39, i32 178, i32 117], [16 x i32] [i32 9, i32 131, i32 44, i32 26, i32 27, i32 110, i32 90, i32 160, i32 82, i32 59, i32 214, i32 179, i32 41, i32 227, i32 47, i32 132], [16 x i32] [i32 83, i32 209, i32 0, i32 237, i32 32, i32 252, i32 177, i32 91, i32 106, i32 203, i32 190, i32 57, i32 74, i32 76, i32 88, i32 207], [16 x i32] [i32 208, i32 239, i32 170, i32 251, i32 67, i32 77, i32 51, i32 133, i32 69, i32 249, i32 2, i32 127, i32 80, i32 60, i32 159, i32 168], [16 x i32] [i32 81, i32 163, i32 64, i32 143, i32 146, i32 157, i32 56, i32 245, i32 188, i32 182, i32 218, i32 33, i32 16, i32 255, i32 243, i32 210], [16 x i32] [i32 205, i32 12, i32 19, i32 236, i32 95, i32 151, i32 68, i32 23, i32 196, i32 167, i32 126, i32 61, i32 100, i32 93, i32 25, i32 115], [16 x i32] [i32 96, i32 129, i32 79, i32 220, i32 34, i32 42, i32 144, i32 136, i32 70, i32 238, i32 184, i32 20, i32 222, i32 94, i32 11, i32 219], [16 x i32] [i32 224, i32 50, i32 58, i32 10, i32 73, i32 6, i32 36, i32 92, i32 194, i32 211, i32 172, i32 98, i32 145, i32 149, i32 228, i32 121], [16 x i32] [i32 231, i32 200, i32 55, i32 109, i32 141, i32 213, i32 78, i32 169, i32 108, i32 86, i32 244, i32 234, i32 101, i32 122, i32 174, i32 8], [16 x i32] [i32 186, i32 120, i32 37, i32 46, i32 28, i32 166, i32 180, i32 198, i32 232, i32 221, i32 116, i32 31, i32 75, i32 189, i32 139, i32 138], [16 x i32] [i32 112, i32 62, i32 181, i32 102, i32 72, i32 3, i32 246, i32 14, i32 97, i32 53, i32 87, i32 185, i32 134, i32 193, i32 29, i32 158], [16 x i32] [i32 225, i32 248, i32 152, i32 17, i32 105, i32 217, i32 142, i32 148, i32 155, i32 30, i32 135, i32 233, i32 206, i32 85, i32 40, i32 223], [16 x i32] [i32 140, i32 161, i32 137, i32 13, i32 191, i32 230, i32 66, i32 104, i32 65, i32 153, i32 45, i32 15, i32 176, i32 84, i32 187, i32 22]], align 512
@0 = private unnamed_addr constant [10 x i8] c"ap_memory\00"
@1 = private unnamed_addr constant [1 x i8] zeroinitializer
@2 = private unnamed_addr constant [9 x i8] c"aes_main\00"
@3 = private unnamed_addr constant [15 x i8] c"encrypt_label1\00"
@4 = private unnamed_addr constant [15 x i8] c"decrypt_label4\00"
@5 = private unnamed_addr constant [19 x i8] c"KeySchedule_label9\00"
@6 = private unnamed_addr constant [19 x i8] c"KeySchedule_label6\00"
@7 = private unnamed_addr constant [19 x i8] c"KeySchedule_label5\00"
@8 = private unnamed_addr constant [19 x i8] c"KeySchedule_label4\00"
@9 = private unnamed_addr constant [19 x i8] c"AddRoundKey_label0\00"
@10 = private unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label3\00"
@11 = private unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label1\00"
@12 = private unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label0\00"
@13 = private unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label2\00"
@14 = private unnamed_addr constant [29 x i8] c"MixColumn_AddRoundKey_label1\00"
@15 = private unnamed_addr constant [29 x i8] c"MixColumn_AddRoundKey_label0\00"

; Function Attrs: nounwind
define i32 @aes_main([32 x i32]* noalias %statemt, [32 x i32]* noalias %key) #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecTopModule([9 x i8]* @2), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @0, i32 0, i32 0, [1 x i8]* @1, i32 -1, i32 0, [1 x i8]* @1, [1 x i8]* @1, [1 x i8]* @1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @1, [1 x i8]* @1, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([32 x i32]* %statemt), !map !5
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %key, [10 x i8]* @0, i32 0, i32 0, [1 x i8]* @1, i32 -1, i32 0, [1 x i8]* @1, [1 x i8]* @1, [1 x i8]* @1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @1, [1 x i8]* @1, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([32 x i32]* %key), !map !5
  call fastcc void @encrypt([32 x i32]* %statemt, [32 x i32]* %key)
  call fastcc void @decrypt([32 x i32]* %statemt, [32 x i32]* %key)
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal fastcc void @encrypt([32 x i32]* noalias nocapture %statemt, [32 x i32]* noalias nocapture %key) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  call fastcc void @KeySchedule([32 x i32]* %key)
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i32 0)
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %i.01 = phi i32 [ 1, %entry ], [ %inc, %for.inc.split ]
  %exitcond1 = icmp ne i32 %i.01, 10
  br i1 %exitcond1, label %for.inc.split, label %for.end, !llvm.loop !6

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @3)
  call fastcc void @ByteSub_ShiftRow([32 x i32]* %statemt)
  call fastcc void @MixColumn_AddRoundKey([32 x i32]* %statemt, i32 %i.01)
  %inc = add nuw nsw i32 %i.01, 1
  br label %for.inc, !llvm.loop !6

for.end:                                          ; preds = %for.inc
  call fastcc void @ByteSub_ShiftRow([32 x i32]* %statemt)
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i32 10)
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @decrypt([32 x i32]* noalias nocapture %statemt, [32 x i32]* noalias nocapture %key) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  call fastcc void @KeySchedule([32 x i32]* %key)
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i32 10)
  call fastcc void @InversShiftRow_ByteSub([32 x i32]* %statemt)
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %i.01 = phi i32 [ 9, %entry ], [ %dec, %for.inc.split ]
  %cmp1 = icmp sge i32 %i.01, 1
  br i1 %cmp1, label %for.inc.split, label %for.end, !llvm.loop !22

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @4)
  call fastcc void @AddRoundKey_InversMixColumn([32 x i32]* %statemt, i32 %i.01)
  call fastcc void @InversShiftRow_ByteSub([32 x i32]* %statemt)
  %dec = add nsw i32 %i.01, -1
  br label %for.inc, !llvm.loop !22

for.end:                                          ; preds = %for.inc
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i32 0)
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @KeySchedule([32 x i32]* noalias nocapture %key) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %temp = alloca [4 x i32], align 512
  br label %KeySchedule_label5

KeySchedule_label5:                               ; preds = %for.inc16, %entry
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.inc16 ], [ 0, %entry ]
  %exitcond384 = icmp ne i64 %indvars.iv35, 4
  br i1 %exitcond384, label %KeySchedule_label5.split, label %KeySchedule_label6, !llvm.loop !29

KeySchedule_label5.split:                         ; preds = %KeySchedule_label5
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @8)
  %0 = mul nuw nsw i64 %indvars.iv35, 4
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %KeySchedule_label5.split
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc.split ], [ 0, %KeySchedule_label5.split ]
  %exitcond343 = icmp ne i64 %indvars.iv31, 4
  br i1 %exitcond343, label %for.inc.split, label %for.inc16, !llvm.loop !39

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @7)
  call void (...) @_ssdm_SpecLoopFlatten(i64 1, [1 x i8]* @1), !fpga.pragma.source !4
  %1 = add nuw nsw i64 %indvars.iv31, %0
  %2 = getelementptr [32 x i32], [32 x i32]* %key, i64 0, i64 %1
  %3 = load i32, i32* %2, align 4
  %arrayidx1520 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 %indvars.iv31, i64 %indvars.iv35
  store i32 %3, i32* %arrayidx1520, align 4
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  br label %for.inc, !llvm.loop !39

for.inc16:                                        ; preds = %for.inc
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  br label %KeySchedule_label5, !llvm.loop !29

KeySchedule_label6:                               ; preds = %KeySchedule_label5
  %arrayidx39 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 0
  %arrayidx52 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 1
  %arrayidx65 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 2
  %arrayidx78 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 3
  br label %KeySchedule_label7

KeySchedule_label7:                               ; preds = %for.inc136, %KeySchedule_label6
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc136 ], [ 4, %KeySchedule_label6 ]
  %exitcond302 = icmp ne i64 %indvars.iv25, 44
  br i1 %exitcond302, label %KeySchedule_label7.split, label %cleanup, !llvm.loop !54

KeySchedule_label7.split:                         ; preds = %KeySchedule_label7
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 40, i64 40, i64 40), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @6)
  call void (...) @_ssdm_SpecLoopFlatten(i64 1, [1 x i8]* @1), !fpga.pragma.source !4
  %4 = trunc i64 %indvars.iv25 to i32
  %rem.urem = urem i32 %4, 4
  %cmp24 = icmp eq i32 %rem.urem, 0
  %5 = sub nuw nsw i64 %indvars.iv25, 1
  %arrayidx268 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 1, i64 %5
  %arrayidx4211 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 2, i64 %5
  %arrayidx5514 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 3, i64 %5
  %arrayidx6817 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 0, i64 %5
  %6 = load i32, i32* %arrayidx268, align 4
  %7 = load i32, i32* %arrayidx4211, align 4
  %8 = load i32, i32* %arrayidx5514, align 4
  %9 = load i32, i32* %arrayidx6817, align 4
  br i1 %cmp24, label %if.then, label %if.else

if.then:                                          ; preds = %KeySchedule_label7.split
  %div = sdiv i32 %6, 16
  %idxprom27 = sext i32 %div to i64
  %rem32 = srem i32 %6, 16
  %idxprom33 = sext i32 %rem32 to i64
  %arrayidx3410 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @KeySchedule.Sbox, i64 0, i64 %idxprom27, i64 %idxprom33
  %10 = load i32, i32* %arrayidx3410, align 4
  %div35.udiv = udiv i32 %4, 4
  %sub36 = sub nsw i32 %div35.udiv, 1
  %idxprom37 = sext i32 %sub36 to i64
  %arrayidx38 = getelementptr inbounds [30 x i32], [30 x i32]* @Rcon0, i64 0, i64 %idxprom37
  %11 = load i32, i32* %arrayidx38, align 4
  %xor = xor i32 %10, %11
  store i32 %xor, i32* %arrayidx39, align 512
  %div43 = sdiv i32 %7, 16
  %idxprom44 = sext i32 %div43 to i64
  %rem49 = srem i32 %7, 16
  %idxprom50 = sext i32 %rem49 to i64
  %arrayidx5113 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @KeySchedule.Sbox, i64 0, i64 %idxprom44, i64 %idxprom50
  %12 = load i32, i32* %arrayidx5113, align 4
  store i32 %12, i32* %arrayidx52, align 4
  %div56 = sdiv i32 %8, 16
  %idxprom57 = sext i32 %div56 to i64
  %rem62 = srem i32 %8, 16
  %idxprom63 = sext i32 %rem62 to i64
  %arrayidx6416 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @KeySchedule.Sbox, i64 0, i64 %idxprom57, i64 %idxprom63
  %13 = load i32, i32* %arrayidx6416, align 4
  store i32 %13, i32* %arrayidx65, align 8
  %div69 = sdiv i32 %9, 16
  %idxprom70 = sext i32 %div69 to i64
  %rem75 = srem i32 %9, 16
  %idxprom76 = sext i32 %rem75 to i64
  %arrayidx7719 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @KeySchedule.Sbox, i64 0, i64 %idxprom70, i64 %idxprom76
  %14 = load i32, i32* %arrayidx7719, align 4
  store i32 %14, i32* %arrayidx78, align 4
  br label %KeySchedule_label9

if.else:                                          ; preds = %KeySchedule_label7.split
  store i32 %9, i32* %arrayidx39, align 512
  store i32 %6, i32* %arrayidx52, align 4
  store i32 %7, i32* %arrayidx65, align 8
  store i32 %8, i32* %arrayidx78, align 4
  br label %KeySchedule_label9

KeySchedule_label9:                               ; preds = %if.else, %if.then
  %15 = sub nuw nsw i64 %indvars.iv25, 4
  br label %for.inc133

for.inc133:                                       ; preds = %for.inc133.split, %KeySchedule_label9
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc133.split ], [ 0, %KeySchedule_label9 ]
  %exitcond1 = icmp ne i64 %indvars.iv, 4
  br i1 %exitcond1, label %for.inc133.split, label %for.inc136, !llvm.loop !62

for.inc133.split:                                 ; preds = %for.inc133
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @5)
  call void (...) @_ssdm_SpecLoopFlatten(i64 1, [1 x i8]* @1), !fpga.pragma.source !4
  %arrayidx1255 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 %indvars.iv, i64 %15
  %16 = load i32, i32* %arrayidx1255, align 4
  %arrayidx127 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %indvars.iv
  %17 = load i32, i32* %arrayidx127, align 4
  %xor128 = xor i32 %16, %17
  %arrayidx1326 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 %indvars.iv, i64 %indvars.iv25
  store i32 %xor128, i32* %arrayidx1326, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc133, !llvm.loop !62

for.inc136:                                       ; preds = %for.inc133
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  br label %KeySchedule_label7, !llvm.loop !54

cleanup:                                          ; preds = %KeySchedule_label7
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @AddRoundKey([32 x i32]* noalias nocapture %statemt, i32 %n) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %mul = mul nsw i32 4, %n
  %0 = sext i32 %mul to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.split ], [ 0, %entry ]
  %exitcond1 = icmp ne i64 %indvars.iv, 4
  br i1 %exitcond1, label %for.inc.split, label %for.end, !llvm.loop !76

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @9)
  %1 = add nuw nsw i64 %indvars.iv, %0
  %arrayidx1 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 0, i64 %1
  %2 = load i32, i32* %arrayidx1, align 4
  %3 = mul nuw nsw i64 %indvars.iv, 4
  %4 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %3
  %5 = load i32, i32* %4, align 4
  %xor = xor i32 %5, %2
  store i32 %xor, i32* %4, align 4
  %arrayidx92 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 1, i64 %1
  %6 = load i32, i32* %arrayidx92, align 4
  %7 = add nuw nsw i64 1, %3
  %8 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %xor14 = xor i32 %9, %6
  store i32 %xor14, i32* %8, align 4
  %arrayidx183 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 2, i64 %1
  %10 = load i32, i32* %arrayidx183, align 4
  %11 = add nuw nsw i64 2, %3
  %12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %xor23 = xor i32 %13, %10
  store i32 %xor23, i32* %12, align 4
  %arrayidx274 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 3, i64 %1
  %14 = load i32, i32* %arrayidx274, align 4
  %15 = add nuw nsw i64 3, %3
  %16 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %xor32 = xor i32 %17, %14
  store i32 %xor32, i32* %16, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc, !llvm.loop !76

for.end:                                          ; preds = %for.inc
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @InversShiftRow_ByteSub([32 x i32]* noalias nocapture %statemt) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %0 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 13
  %1 = load i32, i32* %0, align 4
  %shr = ashr i32 %1, 4
  %idxprom = sext i32 %shr to i64
  %and = and i32 %1, 15
  %idxprom3 = sext i32 %and to i64
  %arrayidx458 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom, i64 %idxprom3
  %2 = load i32, i32* %arrayidx458, align 4
  %3 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 9
  %4 = load i32, i32* %3, align 4
  %shr6 = ashr i32 %4, 4
  %idxprom7 = sext i32 %shr6 to i64
  %and10 = and i32 %4, 15
  %idxprom11 = sext i32 %and10 to i64
  %arrayidx1259 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom7, i64 %idxprom11
  %5 = load i32, i32* %arrayidx1259, align 4
  store i32 %5, i32* %0, align 4
  %6 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 5
  %7 = load i32, i32* %6, align 4
  %shr15 = ashr i32 %7, 4
  %idxprom16 = sext i32 %shr15 to i64
  %and19 = and i32 %7, 15
  %idxprom20 = sext i32 %and19 to i64
  %arrayidx2160 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom16, i64 %idxprom20
  %8 = load i32, i32* %arrayidx2160, align 4
  store i32 %8, i32* %3, align 4
  %9 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 1
  %10 = load i32, i32* %9, align 4
  %shr24 = ashr i32 %10, 4
  %idxprom25 = sext i32 %shr24 to i64
  %and28 = and i32 %10, 15
  %idxprom29 = sext i32 %and28 to i64
  %arrayidx3061 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom25, i64 %idxprom29
  %11 = load i32, i32* %arrayidx3061, align 4
  store i32 %11, i32* %6, align 4
  store i32 %2, i32* %9, align 4
  %12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 14
  %13 = load i32, i32* %12, align 4
  %shr34 = ashr i32 %13, 4
  %idxprom35 = sext i32 %shr34 to i64
  %and38 = and i32 %13, 15
  %idxprom39 = sext i32 %and38 to i64
  %arrayidx4062 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom35, i64 %idxprom39
  %14 = load i32, i32* %arrayidx4062, align 4
  %15 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 6
  %16 = load i32, i32* %15, align 4
  %shr42 = ashr i32 %16, 4
  %idxprom43 = sext i32 %shr42 to i64
  %and46 = and i32 %16, 15
  %idxprom47 = sext i32 %and46 to i64
  %arrayidx4863 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom43, i64 %idxprom47
  %17 = load i32, i32* %arrayidx4863, align 4
  store i32 %17, i32* %12, align 4
  store i32 %14, i32* %15, align 4
  %18 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 2
  %19 = load i32, i32* %18, align 4
  %shr52 = ashr i32 %19, 4
  %idxprom53 = sext i32 %shr52 to i64
  %and56 = and i32 %19, 15
  %idxprom57 = sext i32 %and56 to i64
  %arrayidx5864 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom53, i64 %idxprom57
  %20 = load i32, i32* %arrayidx5864, align 4
  %21 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 10
  %22 = load i32, i32* %21, align 4
  %shr60 = ashr i32 %22, 4
  %idxprom61 = sext i32 %shr60 to i64
  %and64 = and i32 %22, 15
  %idxprom65 = sext i32 %and64 to i64
  %arrayidx6665 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom61, i64 %idxprom65
  %23 = load i32, i32* %arrayidx6665, align 4
  store i32 %23, i32* %18, align 4
  store i32 %20, i32* %21, align 4
  %24 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 15
  %25 = load i32, i32* %24, align 4
  %shr70 = ashr i32 %25, 4
  %idxprom71 = sext i32 %shr70 to i64
  %and74 = and i32 %25, 15
  %idxprom75 = sext i32 %and74 to i64
  %arrayidx7666 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom71, i64 %idxprom75
  %26 = load i32, i32* %arrayidx7666, align 4
  %27 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 3
  %28 = load i32, i32* %27, align 4
  %shr78 = ashr i32 %28, 4
  %idxprom79 = sext i32 %shr78 to i64
  %and82 = and i32 %28, 15
  %idxprom83 = sext i32 %and82 to i64
  %arrayidx8467 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom79, i64 %idxprom83
  %29 = load i32, i32* %arrayidx8467, align 4
  store i32 %29, i32* %24, align 4
  %30 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 7
  %31 = load i32, i32* %30, align 4
  %shr87 = ashr i32 %31, 4
  %idxprom88 = sext i32 %shr87 to i64
  %and91 = and i32 %31, 15
  %idxprom92 = sext i32 %and91 to i64
  %arrayidx9368 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom88, i64 %idxprom92
  %32 = load i32, i32* %arrayidx9368, align 4
  store i32 %32, i32* %27, align 4
  %33 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 11
  %34 = load i32, i32* %33, align 4
  %shr96 = ashr i32 %34, 4
  %idxprom97 = sext i32 %shr96 to i64
  %and100 = and i32 %34, 15
  %idxprom101 = sext i32 %and100 to i64
  %arrayidx10269 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom97, i64 %idxprom101
  %35 = load i32, i32* %arrayidx10269, align 4
  store i32 %35, i32* %30, align 4
  store i32 %26, i32* %33, align 4
  %36 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 0
  %37 = load i32, i32* %36, align 4
  %shr106 = ashr i32 %37, 4
  %idxprom107 = sext i32 %shr106 to i64
  %and110 = and i32 %37, 15
  %idxprom111 = sext i32 %and110 to i64
  %arrayidx11270 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom107, i64 %idxprom111
  %38 = load i32, i32* %arrayidx11270, align 4
  store i32 %38, i32* %36, align 4
  %39 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 4
  %40 = load i32, i32* %39, align 4
  %shr115 = ashr i32 %40, 4
  %idxprom116 = sext i32 %shr115 to i64
  %and119 = and i32 %40, 15
  %idxprom120 = sext i32 %and119 to i64
  %arrayidx12171 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom116, i64 %idxprom120
  %41 = load i32, i32* %arrayidx12171, align 4
  store i32 %41, i32* %39, align 4
  %42 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 8
  %43 = load i32, i32* %42, align 4
  %shr124 = ashr i32 %43, 4
  %idxprom125 = sext i32 %shr124 to i64
  %and128 = and i32 %43, 15
  %idxprom129 = sext i32 %and128 to i64
  %arrayidx13072 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom125, i64 %idxprom129
  %44 = load i32, i32* %arrayidx13072, align 4
  store i32 %44, i32* %42, align 4
  %45 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 12
  %46 = load i32, i32* %45, align 4
  %shr133 = ashr i32 %46, 4
  %idxprom134 = sext i32 %shr133 to i64
  %and137 = and i32 %46, 15
  %idxprom138 = sext i32 %and137 to i64
  %arrayidx13973 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @InversShiftRow_ByteSub.invSbox, i64 0, i64 %idxprom134, i64 %idxprom138
  %47 = load i32, i32* %arrayidx13973, align 4
  store i32 %47, i32* %45, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @AddRoundKey_InversMixColumn([32 x i32]* noalias nocapture %statemt, i32 %n) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %ret = alloca [32 x i32], align 512
  %mul = mul nsw i32 4, %n
  %0 = sext i32 %mul to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc.split ], [ 0, %entry ]
  %exitcond354 = icmp ne i64 %indvars.iv28, 4
  br i1 %exitcond354, label %for.inc.split, label %AddRoundKey_InversMixColumn_label0, !llvm.loop !84

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @13)
  %1 = add nuw nsw i64 %indvars.iv28, %0
  %arrayidx1 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 0, i64 %1
  %2 = load i32, i32* %arrayidx1, align 4
  %3 = mul nuw nsw i64 %indvars.iv28, 4
  %4 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %3
  %5 = load i32, i32* %4, align 4
  %xor = xor i32 %5, %2
  store i32 %xor, i32* %4, align 4
  %arrayidx72 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 1, i64 %1
  %6 = load i32, i32* %arrayidx72, align 4
  %7 = add nuw nsw i64 1, %3
  %8 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %xor12 = xor i32 %9, %6
  store i32 %xor12, i32* %8, align 4
  %arrayidx163 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 2, i64 %1
  %10 = load i32, i32* %arrayidx163, align 4
  %11 = add nuw nsw i64 2, %3
  %12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %xor21 = xor i32 %13, %10
  store i32 %xor21, i32* %12, align 4
  %arrayidx254 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 3, i64 %1
  %14 = load i32, i32* %arrayidx254, align 4
  %15 = add nuw nsw i64 3, %3
  %16 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %xor30 = xor i32 %17, %14
  store i32 %xor30, i32* %16, align 4
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  br label %for.inc, !llvm.loop !84

AddRoundKey_InversMixColumn_label0:               ; preds = %for.inc
  br label %AddRoundKey_InversMixColumn_label1

AddRoundKey_InversMixColumn_label1:               ; preds = %for.inc193, %AddRoundKey_InversMixColumn_label0
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.inc193 ], [ 0, %AddRoundKey_InversMixColumn_label0 ]
  %exitcond273 = icmp ne i64 %indvars.iv24, 4
  br i1 %exitcond273, label %AddRoundKey_InversMixColumn_label1.split, label %AddRoundKey_InversMixColumn_label3, !llvm.loop !90

AddRoundKey_InversMixColumn_label1.split:         ; preds = %AddRoundKey_InversMixColumn_label1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @12)
  %18 = mul nuw nsw i64 %indvars.iv24, 4
  %19 = trunc i64 %18 to i32
  br label %for.body36

for.body36:                                       ; preds = %for.body36.split, %AddRoundKey_InversMixColumn_label1.split
  %indvars.iv18 = phi i64 [ 0, %AddRoundKey_InversMixColumn_label1.split ], [ %indvars.iv.next19, %for.body36.split ]
  %exitcond232 = icmp ne i64 %indvars.iv18, 4
  br i1 %exitcond232, label %for.body36.split, label %for.inc193, !llvm.loop !94

for.body36.split:                                 ; preds = %for.body36
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @11)
  call void (...) @_ssdm_SpecLoopFlatten(i64 1, [1 x i8]* @1), !fpga.pragma.source !4
  %20 = add nuw nsw i64 %indvars.iv18, %18
  %21 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %shl = shl i32 %22, 1
  %shr = ashr i32 %shl, 8
  %cmp41 = icmp eq i32 %shr, 1
  %xor42 = xor i32 %shl, 283
  %spec.select = select i1 %cmp41, i32 %xor42, i32 %shl
  %xor47 = xor i32 %spec.select, %22
  %shl48 = shl i32 %xor47, 1
  %shr49 = ashr i32 %shl48, 8
  %cmp50 = icmp eq i32 %shr49, 1
  %xor52 = xor i32 %shl48, 283
  %x.1 = select i1 %cmp50, i32 %xor52, i32 %shl48
  %xor58 = xor i32 %x.1, %22
  %shl59 = shl i32 %xor58, 1
  %shr60 = ashr i32 %shl59, 8
  %cmp61 = icmp eq i32 %shr60, 1
  %xor63 = xor i32 %shl59, 283
  %spec.select9 = select i1 %cmp61, i32 %xor63, i32 %shl59
  %arrayidx68 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %20
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %23 = icmp eq i64 %indvars.iv.next19, 4
  %24 = trunc i64 %indvars.iv.next19 to i32
  %iv.rem = select i1 %23, i32 0, i32 %24
  %add71 = add nsw i32 %iv.rem, %19
  %idxprom72 = sext i32 %add71 to i64
  %25 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %idxprom72
  %26 = load i32, i32* %25, align 4
  %shl74 = shl i32 %26, 1
  %shr75 = ashr i32 %shl74, 8
  %cmp76 = icmp eq i32 %shr75, 1
  %xor78 = xor i32 %shl74, 283
  %x.3 = select i1 %cmp76, i32 %xor78, i32 %shl74
  %shl80 = shl i32 %x.3, 1
  %shr81 = ashr i32 %shl80, 8
  %cmp82 = icmp eq i32 %shr81, 1
  %xor84 = xor i32 %shl80, 283
  %spec.select10 = select i1 %cmp82, i32 %xor84, i32 %shl80
  %xor92 = xor i32 %spec.select10, %26
  %shl93 = shl i32 %xor92, 1
  %shr94 = ashr i32 %shl93, 8
  %cmp95 = icmp eq i32 %shr94, 1
  %xor97 = xor i32 %shl93, 283
  %x.5 = select i1 %cmp95, i32 %xor97, i32 %shl93
  %27 = add nuw nsw i64 %indvars.iv18, 2
  %28 = trunc i64 %27 to i32
  %rem112.urem = urem i32 %28, 4
  %add114 = add nsw i32 %rem112.urem, %19
  %idxprom115 = sext i32 %add114 to i64
  %29 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %idxprom115
  %30 = load i32, i32* %29, align 4
  %shl117 = shl i32 %30, 1
  %shr118 = ashr i32 %shl117, 8
  %cmp119 = icmp eq i32 %shr118, 1
  %xor121 = xor i32 %shl117, 283
  %spec.select11 = select i1 %cmp119, i32 %xor121, i32 %shl117
  %xor129 = xor i32 %spec.select11, %30
  %shl130 = shl i32 %xor129, 1
  %shr131 = ashr i32 %shl130, 8
  %cmp132 = icmp eq i32 %shr131, 1
  %xor134 = xor i32 %shl130, 283
  %x.7 = select i1 %cmp132, i32 %xor134, i32 %shl130
  %shl136 = shl i32 %x.7, 1
  %shr137 = ashr i32 %shl136, 8
  %cmp138 = icmp eq i32 %shr137, 1
  %xor140 = xor i32 %shl136, 283
  %spec.select12 = select i1 %cmp138, i32 %xor140, i32 %shl136
  %31 = add nuw nsw i64 %indvars.iv18, 3
  %32 = trunc i64 %31 to i32
  %rem155.urem = urem i32 %32, 4
  %add157 = add nsw i32 %rem155.urem, %19
  %idxprom158 = sext i32 %add157 to i64
  %33 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %idxprom158
  %34 = load i32, i32* %33, align 4
  %shl160 = shl i32 %34, 1
  %shr161 = ashr i32 %shl160, 8
  %cmp162 = icmp eq i32 %shr161, 1
  %xor164 = xor i32 %shl160, 283
  %x.9 = select i1 %cmp162, i32 %xor164, i32 %shl160
  %shl166 = shl i32 %x.9, 1
  %shr167 = ashr i32 %shl166, 8
  %cmp168 = icmp eq i32 %shr167, 1
  %xor170 = xor i32 %shl166, 283
  %spec.select13 = select i1 %cmp168, i32 %xor170, i32 %shl166
  %shl172 = shl i32 %spec.select13, 1
  %shr173 = ashr i32 %shl172, 8
  %cmp174 = icmp eq i32 %shr173, 1
  %xor176 = xor i32 %shl172, 283
  %x.11 = select i1 %cmp174, i32 %xor176, i32 %shl172
  %thr.xor18 = xor i32 %spec.select9, %spec.select12
  %thr.xor19 = xor i32 %26, %30
  %thr.xor20 = xor i32 %34, %x.5
  %thr.xor21 = xor i32 %thr.xor18, %thr.xor19
  %thr.xor22 = xor i32 %x.11, %thr.xor20
  %thr.xor23 = xor i32 %thr.xor21, %thr.xor22
  store i32 %thr.xor23, i32* %arrayidx68, align 4
  br label %for.body36, !llvm.loop !94

for.inc193:                                       ; preds = %for.body36
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br label %AddRoundKey_InversMixColumn_label1, !llvm.loop !90

AddRoundKey_InversMixColumn_label3:               ; preds = %AddRoundKey_InversMixColumn_label1
  br label %for.inc229

for.inc229:                                       ; preds = %for.inc229.split, %AddRoundKey_InversMixColumn_label3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc229.split ], [ 0, %AddRoundKey_InversMixColumn_label3 ]
  %exitcond1 = icmp ne i64 %indvars.iv, 4
  br i1 %exitcond1, label %for.inc229.split, label %for.end231, !llvm.loop !108

for.inc229.split:                                 ; preds = %for.inc229
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @10)
  %35 = mul nuw nsw i64 %indvars.iv, 4
  %arrayidx201 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %35
  %36 = load i32, i32* %arrayidx201, align 16
  %37 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %35
  store i32 %36, i32* %37, align 4
  %38 = add nuw nsw i64 1, %35
  %arrayidx208 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %38
  %39 = load i32, i32* %arrayidx208, align 4
  %40 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %38
  store i32 %39, i32* %40, align 4
  %41 = add nuw nsw i64 2, %35
  %arrayidx216 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %41
  %42 = load i32, i32* %arrayidx216, align 8
  %43 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %41
  store i32 %42, i32* %43, align 4
  %44 = add nuw nsw i64 3, %35
  %arrayidx224 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %44
  %45 = load i32, i32* %arrayidx224, align 4
  %46 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %44
  store i32 %45, i32* %46, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc229, !llvm.loop !108

for.end231:                                       ; preds = %for.inc229
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @ByteSub_ShiftRow([32 x i32]* noalias nocapture %statemt) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %0 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 1
  %1 = load i32, i32* %0, align 4
  %shr = ashr i32 %1, 4
  %idxprom = sext i32 %shr to i64
  %and = and i32 %1, 15
  %idxprom3 = sext i32 %and to i64
  %arrayidx458 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom, i64 %idxprom3
  %2 = load i32, i32* %arrayidx458, align 4
  %3 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 5
  %4 = load i32, i32* %3, align 4
  %shr6 = ashr i32 %4, 4
  %idxprom7 = sext i32 %shr6 to i64
  %and10 = and i32 %4, 15
  %idxprom11 = sext i32 %and10 to i64
  %arrayidx1259 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom7, i64 %idxprom11
  %5 = load i32, i32* %arrayidx1259, align 4
  store i32 %5, i32* %0, align 4
  %6 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 9
  %7 = load i32, i32* %6, align 4
  %shr15 = ashr i32 %7, 4
  %idxprom16 = sext i32 %shr15 to i64
  %and19 = and i32 %7, 15
  %idxprom20 = sext i32 %and19 to i64
  %arrayidx2160 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom16, i64 %idxprom20
  %8 = load i32, i32* %arrayidx2160, align 4
  store i32 %8, i32* %3, align 4
  %9 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 13
  %10 = load i32, i32* %9, align 4
  %shr24 = ashr i32 %10, 4
  %idxprom25 = sext i32 %shr24 to i64
  %and28 = and i32 %10, 15
  %idxprom29 = sext i32 %and28 to i64
  %arrayidx3061 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom25, i64 %idxprom29
  %11 = load i32, i32* %arrayidx3061, align 4
  store i32 %11, i32* %6, align 4
  store i32 %2, i32* %9, align 4
  %12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 2
  %13 = load i32, i32* %12, align 4
  %shr34 = ashr i32 %13, 4
  %idxprom35 = sext i32 %shr34 to i64
  %and38 = and i32 %13, 15
  %idxprom39 = sext i32 %and38 to i64
  %arrayidx4062 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom35, i64 %idxprom39
  %14 = load i32, i32* %arrayidx4062, align 4
  %15 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 10
  %16 = load i32, i32* %15, align 4
  %shr42 = ashr i32 %16, 4
  %idxprom43 = sext i32 %shr42 to i64
  %and46 = and i32 %16, 15
  %idxprom47 = sext i32 %and46 to i64
  %arrayidx4863 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom43, i64 %idxprom47
  %17 = load i32, i32* %arrayidx4863, align 4
  store i32 %17, i32* %12, align 4
  store i32 %14, i32* %15, align 4
  %18 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 6
  %19 = load i32, i32* %18, align 4
  %shr52 = ashr i32 %19, 4
  %idxprom53 = sext i32 %shr52 to i64
  %and56 = and i32 %19, 15
  %idxprom57 = sext i32 %and56 to i64
  %arrayidx5864 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom53, i64 %idxprom57
  %20 = load i32, i32* %arrayidx5864, align 4
  %21 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 14
  %22 = load i32, i32* %21, align 4
  %shr60 = ashr i32 %22, 4
  %idxprom61 = sext i32 %shr60 to i64
  %and64 = and i32 %22, 15
  %idxprom65 = sext i32 %and64 to i64
  %arrayidx6665 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom61, i64 %idxprom65
  %23 = load i32, i32* %arrayidx6665, align 4
  store i32 %23, i32* %18, align 4
  store i32 %20, i32* %21, align 4
  %24 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 3
  %25 = load i32, i32* %24, align 4
  %shr70 = ashr i32 %25, 4
  %idxprom71 = sext i32 %shr70 to i64
  %and74 = and i32 %25, 15
  %idxprom75 = sext i32 %and74 to i64
  %arrayidx7666 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom71, i64 %idxprom75
  %26 = load i32, i32* %arrayidx7666, align 4
  %27 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 15
  %28 = load i32, i32* %27, align 4
  %shr78 = ashr i32 %28, 4
  %idxprom79 = sext i32 %shr78 to i64
  %and82 = and i32 %28, 15
  %idxprom83 = sext i32 %and82 to i64
  %arrayidx8467 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom79, i64 %idxprom83
  %29 = load i32, i32* %arrayidx8467, align 4
  store i32 %29, i32* %24, align 4
  %30 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 11
  %31 = load i32, i32* %30, align 4
  %shr87 = ashr i32 %31, 4
  %idxprom88 = sext i32 %shr87 to i64
  %and91 = and i32 %31, 15
  %idxprom92 = sext i32 %and91 to i64
  %arrayidx9368 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom88, i64 %idxprom92
  %32 = load i32, i32* %arrayidx9368, align 4
  store i32 %32, i32* %27, align 4
  %33 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 7
  %34 = load i32, i32* %33, align 4
  %shr96 = ashr i32 %34, 4
  %idxprom97 = sext i32 %shr96 to i64
  %and100 = and i32 %34, 15
  %idxprom101 = sext i32 %and100 to i64
  %arrayidx10269 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom97, i64 %idxprom101
  %35 = load i32, i32* %arrayidx10269, align 4
  store i32 %35, i32* %30, align 4
  store i32 %26, i32* %33, align 4
  %36 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 0
  %37 = load i32, i32* %36, align 4
  %shr106 = ashr i32 %37, 4
  %idxprom107 = sext i32 %shr106 to i64
  %and110 = and i32 %37, 15
  %idxprom111 = sext i32 %and110 to i64
  %arrayidx11270 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom107, i64 %idxprom111
  %38 = load i32, i32* %arrayidx11270, align 4
  store i32 %38, i32* %36, align 4
  %39 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 4
  %40 = load i32, i32* %39, align 4
  %shr115 = ashr i32 %40, 4
  %idxprom116 = sext i32 %shr115 to i64
  %and119 = and i32 %40, 15
  %idxprom120 = sext i32 %and119 to i64
  %arrayidx12171 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom116, i64 %idxprom120
  %41 = load i32, i32* %arrayidx12171, align 4
  store i32 %41, i32* %39, align 4
  %42 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 8
  %43 = load i32, i32* %42, align 4
  %shr124 = ashr i32 %43, 4
  %idxprom125 = sext i32 %shr124 to i64
  %and128 = and i32 %43, 15
  %idxprom129 = sext i32 %and128 to i64
  %arrayidx13072 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom125, i64 %idxprom129
  %44 = load i32, i32* %arrayidx13072, align 4
  store i32 %44, i32* %42, align 4
  %45 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 12
  %46 = load i32, i32* %45, align 4
  %shr133 = ashr i32 %46, 4
  %idxprom134 = sext i32 %shr133 to i64
  %and137 = and i32 %46, 15
  %idxprom138 = sext i32 %and137 to i64
  %arrayidx13973 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @ByteSub_ShiftRow.Sbox, i64 0, i64 %idxprom134, i64 %idxprom138
  %47 = load i32, i32* %arrayidx13973, align 4
  store i32 %47, i32* %45, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @MixColumn_AddRoundKey([32 x i32]* noalias nocapture %statemt, i32 %n) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %ret = alloca [32 x i32], align 512
  %mul38 = mul nsw i32 4, %n
  %0 = sext i32 %mul38 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc ]
  %exitcond182 = icmp ne i64 %indvars.iv11, 4
  br i1 %exitcond182, label %for.body.split, label %MixColumn_AddRoundKey_label1, !llvm.loop !112

for.body.split:                                   ; preds = %for.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([29 x i8]* @15)
  %1 = mul nuw nsw i64 %indvars.iv11, 4
  %2 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %1
  %3 = load i32, i32* %2, align 4
  %shl = shl i32 %3, 1
  %arrayidx3 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %1
  store i32 %shl, i32* %arrayidx3, align 16
  %shr = ashr i32 %shl, 8
  %cmp7 = icmp eq i32 %shr, 1
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body.split
  %xor = xor i32 %shl, 283
  store i32 %xor, i32* %arrayidx3, align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body.split
  %4 = add nuw nsw i64 1, %1
  %5 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %4
  %6 = load i32, i32* %5, align 4
  %shl14 = shl i32 %6, 1
  %xor15 = xor i32 %6, %shl14
  %shr16 = ashr i32 %xor15, 8
  %cmp17 = icmp eq i32 %shr16, 1
  %7 = load i32, i32* %arrayidx3, align 16
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end
  %xor19 = xor i32 %xor15, 283
  %xor23 = xor i32 %7, %xor19
  store i32 %xor23, i32* %arrayidx3, align 16
  br label %if.end28

if.else:                                          ; preds = %if.end
  %xor27 = xor i32 %7, %xor15
  store i32 %xor27, i32* %arrayidx3, align 16
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then18
  %8 = add nuw nsw i64 2, %1
  %9 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %8
  %10 = load i32, i32* %9, align 4
  %11 = add nuw nsw i64 3, %1
  %12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %14 = add nuw nsw i64 %indvars.iv11, %0
  %arrayidx411 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 0, i64 %14
  %15 = load i32, i32* %arrayidx411, align 4
  %16 = load i32, i32* %arrayidx3, align 16
  %thr.xor20 = xor i32 %16, %13
  %thr.xor21 = xor i32 %15, %10
  %thr.xor22 = xor i32 %thr.xor20, %thr.xor21
  store i32 %thr.xor22, i32* %arrayidx3, align 16
  %arrayidx55 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %4
  store i32 %shl14, i32* %arrayidx55, align 4
  %shr60 = ashr i32 %shl14, 8
  %cmp61 = icmp eq i32 %shr60, 1
  br i1 %cmp61, label %if.then62, label %if.end68

if.then62:                                        ; preds = %if.end28
  %xor67 = xor i32 %shl14, 283
  store i32 %xor67, i32* %arrayidx55, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then62, %if.end28
  %shl73 = shl i32 %10, 1
  %xor74 = xor i32 %10, %shl73
  %shr75 = ashr i32 %xor74, 8
  %cmp76 = icmp eq i32 %shr75, 1
  %17 = load i32, i32* %arrayidx55, align 4
  br i1 %cmp76, label %if.then77, label %if.else84

if.then77:                                        ; preds = %if.end68
  %xor78 = xor i32 %xor74, 283
  %xor83 = xor i32 %17, %xor78
  store i32 %xor83, i32* %arrayidx55, align 4
  br label %if.end90

if.else84:                                        ; preds = %if.end68
  %xor89 = xor i32 %17, %xor74
  store i32 %xor89, i32* %arrayidx55, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.else84, %if.then77
  %arrayidx1022 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 1, i64 %14
  %18 = load i32, i32* %arrayidx1022, align 4
  %19 = load i32, i32* %arrayidx55, align 4
  %thr.xor = xor i32 %19, %3
  %thr.xor23 = xor i32 %18, %13
  %thr.xor24 = xor i32 %thr.xor, %thr.xor23
  store i32 %thr.xor24, i32* %arrayidx55, align 4
  %arrayidx117 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %8
  store i32 %shl73, i32* %arrayidx117, align 8
  %shr122 = ashr i32 %shl73, 8
  %cmp123 = icmp eq i32 %shr122, 1
  br i1 %cmp123, label %if.then124, label %if.end130

if.then124:                                       ; preds = %if.end90
  %xor129 = xor i32 %shl73, 283
  store i32 %xor129, i32* %arrayidx117, align 8
  br label %if.end130

if.end130:                                        ; preds = %if.then124, %if.end90
  %shl135 = shl i32 %13, 1
  %xor136 = xor i32 %13, %shl135
  %shr137 = ashr i32 %xor136, 8
  %cmp138 = icmp eq i32 %shr137, 1
  %20 = load i32, i32* %arrayidx117, align 8
  br i1 %cmp138, label %if.then139, label %if.else146

if.then139:                                       ; preds = %if.end130
  %xor140 = xor i32 %xor136, 283
  %xor145 = xor i32 %20, %xor140
  store i32 %xor145, i32* %arrayidx117, align 8
  br label %if.end152

if.else146:                                       ; preds = %if.end130
  %xor151 = xor i32 %20, %xor136
  store i32 %xor151, i32* %arrayidx117, align 8
  br label %if.end152

if.end152:                                        ; preds = %if.else146, %if.then139
  %arrayidx1643 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 2, i64 %14
  %21 = load i32, i32* %arrayidx1643, align 4
  %22 = load i32, i32* %arrayidx117, align 8
  %thr.xor25 = xor i32 %22, %6
  %thr.xor26 = xor i32 %21, %3
  %thr.xor27 = xor i32 %thr.xor25, %thr.xor26
  store i32 %thr.xor27, i32* %arrayidx117, align 8
  %arrayidx179 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %11
  store i32 %shl135, i32* %arrayidx179, align 4
  %shr184 = ashr i32 %shl135, 8
  %cmp185 = icmp eq i32 %shr184, 1
  br i1 %cmp185, label %if.then186, label %if.end192

if.then186:                                       ; preds = %if.end152
  %xor191 = xor i32 %shl135, 283
  store i32 %xor191, i32* %arrayidx179, align 4
  br label %if.end192

if.end192:                                        ; preds = %if.then186, %if.end152
  %xor197 = xor i32 %3, %shl
  %shr198 = ashr i32 %xor197, 8
  %cmp199 = icmp eq i32 %shr198, 1
  %23 = load i32, i32* %arrayidx179, align 4
  br i1 %cmp199, label %if.then200, label %if.else207

if.then200:                                       ; preds = %if.end192
  %xor201 = xor i32 %xor197, 283
  %xor206 = xor i32 %23, %xor201
  store i32 %xor206, i32* %arrayidx179, align 4
  br label %for.inc

if.else207:                                       ; preds = %if.end192
  %xor212 = xor i32 %23, %xor197
  store i32 %xor212, i32* %arrayidx179, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.else207, %if.then200
  %arrayidx2264 = getelementptr inbounds [4 x [120 x i32]], [4 x [120 x i32]]* @word, i64 0, i64 3, i64 %14
  %24 = load i32, i32* %arrayidx2264, align 4
  %25 = load i32, i32* %arrayidx179, align 4
  %thr.xor28 = xor i32 %25, %10
  %thr.xor29 = xor i32 %24, %6
  %thr.xor30 = xor i32 %thr.xor28, %thr.xor29
  store i32 %thr.xor30, i32* %arrayidx179, align 4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %for.body, !llvm.loop !112

MixColumn_AddRoundKey_label1:                     ; preds = %for.body
  br label %for.inc266

for.inc266:                                       ; preds = %for.inc266.split, %MixColumn_AddRoundKey_label1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc266.split ], [ 0, %MixColumn_AddRoundKey_label1 ]
  %exitcond1 = icmp ne i64 %indvars.iv, 4
  br i1 %exitcond1, label %for.inc266.split, label %for.end268, !llvm.loop !118

for.inc266.split:                                 ; preds = %for.inc266
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !21
  call void (...) @_ssdm_op_SpecLoopName([29 x i8]* @14)
  %26 = mul nuw nsw i64 %indvars.iv, 4
  %arrayidx238 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %26
  %27 = load i32, i32* %arrayidx238, align 16
  %28 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %26
  store i32 %27, i32* %28, align 4
  %29 = add nuw nsw i64 1, %26
  %arrayidx245 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %29
  %30 = load i32, i32* %arrayidx245, align 4
  %31 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %29
  store i32 %30, i32* %31, align 4
  %32 = add nuw nsw i64 2, %26
  %arrayidx253 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %32
  %33 = load i32, i32* %arrayidx253, align 8
  %34 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %32
  store i32 %33, i32* %34, align 4
  %35 = add nuw nsw i64 3, %26
  %arrayidx261 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %35
  %36 = load i32, i32* %arrayidx261, align 4
  %37 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %35
  store i32 %36, i32* %37, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc266, !llvm.loop !118

for.end268:                                       ; preds = %for.inc266
  ret void
}

; Function Attrs: nounwind
declare void @_ssdm_op_SpecInterface(...) #0

; Function Attrs: nounwind
declare void @_ssdm_op_SpecBitsMap(...) #0

; Function Attrs: nounwind
declare void @_ssdm_op_SpecPipeline(...) #0

; Function Attrs: nounwind
declare void @_ssdm_op_SpecTopModule(...) #0

; Function Attrs: nounwind
declare void @_ssdm_InlineSelf(...) #0

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopTripCount(...) #0

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopName(...) #0

; Function Attrs: nounwind
declare void @_ssdm_SpecLoopFlatten(...) #0

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind }
attributes #1 = { noinline nounwind }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{!"user"}
!5 = !{!1}
!6 = distinct !{!6, !7, !19, !20}
!7 = !{i32 114, i32 5, !8, null}
!8 = !{i32 786443, !9, i32 110, i32 5, !11, i32 0}
!9 = !{i32 786443, !10, !11}
!10 = !{i32 786478, i32 0, !11, !"encrypt", !"encrypt", null, !11, i32 66, !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, [32 x i32]*)* @encrypt, null, null, !17, i32 66}
!11 = !{i32 786473, !"data/benchmarks/aes/aes_enc.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!12 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !13, i32 0, i32 0}
!13 = !{!14, !15, !15, !14}
!14 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!15 = !{i32 786447, null, !"", !16, i32 0, i64 64, i64 0, i32 0, i32 0, !14}
!16 = !{i32 786473, !"<unknown>", null, null}
!17 = !{!18}
!18 = !{i32 0}
!19 = !{!"llvm.loop.name", !"encrypt_label1"}
!20 = !{!"llvm.loop.tripcount", i32 9, i32 9, i32 9, !"infer-from-design"}
!21 = !{!"infer-from-design"}
!22 = distinct !{!22, !23, !28, !20}
!23 = !{i32 120, i32 5, !24, null}
!24 = !{i32 786443, !25, i32 116, i32 5, !27, i32 0}
!25 = !{i32 786443, !26, !27}
!26 = !{i32 786478, i32 0, !27, !"decrypt", !"decrypt", null, !27, i32 66, !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, [32 x i32]*)* @decrypt, null, null, !17, i32 66}
!27 = !{i32 786473, !"data/benchmarks/aes/aes_dec.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!28 = !{!"llvm.loop.name", !"decrypt_label4"}
!29 = distinct !{!29, !30, !37, !38}
!30 = !{i32 561, i32 5, !31, null}
!31 = !{i32 786443, !32, i32 554, i32 5, !34, i32 0}
!32 = !{i32 786443, !33, !34}
!33 = !{i32 786478, i32 0, !34, !"KeySchedule", !"KeySchedule", null, !34, i32 480, !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*)* @KeySchedule, null, null, !17, i32 480}
!34 = !{i32 786473, !"data/benchmarks/aes/aes_key.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!35 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !36, i32 0, i32 0}
!36 = !{!14, !14, !15}
!37 = !{!"llvm.loop.name", !"KeySchedule_label4"}
!38 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"infer-from-design"}
!39 = distinct !{!39, !40, !46, !47, !51}
!40 = !{i32 560, i32 9, !41, null}
!41 = !{i32 786443, !42, i32 557, i32 9, !34, i32 0}
!42 = !{i32 786443, !43, !34}
!43 = !{i32 786443, !44, i32 554, i32 30, !34, i32 0}
!44 = !{i32 786443, !45, i32 554, i32 5, !34, i32 0}
!45 = !{i32 786443, !31, !34}
!46 = !{!"llvm.loop.name", !"KeySchedule_label5"}
!47 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !48}
!48 = !{i32 26, i32 9, !49, null}
!49 = !{i32 786443, !41, !50}
!50 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/aes.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!51 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !52}
!52 = !{i32 558, i32 9, !53, null}
!53 = !{i32 786443, !41, !34}
!54 = distinct !{!54, !55, !57, !58, !61}
!55 = !{i32 596, i32 5, !56, null}
!56 = !{i32 786443, !32, i32 565, i32 5, !34, i32 0}
!57 = !{!"llvm.loop.name", !"KeySchedule_label6"}
!58 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !59}
!59 = !{i32 28, i32 9, !60, null}
!60 = !{i32 786443, !56, !50}
!61 = !{!"llvm.loop.tripcount", i32 40, i32 40, i32 40, !"infer-from-design"}
!62 = distinct !{!62, !63, !69, !70, !73}
!63 = !{i32 595, i32 9, !64, null}
!64 = !{i32 786443, !65, i32 592, i32 9, !34, i32 0}
!65 = !{i32 786443, !66, !34}
!66 = !{i32 786443, !67, i32 565, i32 49, !34, i32 0}
!67 = !{i32 786443, !68, i32 565, i32 5, !34, i32 0}
!68 = !{i32 786443, !56, !34}
!69 = !{!"llvm.loop.name", !"KeySchedule_label9"}
!70 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !71}
!71 = !{i32 30, i32 9, !72, null}
!72 = !{i32 786443, !64, !50}
!73 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !74}
!74 = !{i32 593, i32 9, !75, null}
!75 = !{i32 786443, !64, !34}
!76 = distinct !{!76, !77, !83, !38}
!77 = !{i32 475, i32 5, !78, null}
!78 = !{i32 786443, !79, i32 469, i32 5, !34, i32 0}
!79 = !{i32 786443, !80, !34}
!80 = !{i32 786478, i32 0, !34, !"AddRoundKey", !"AddRoundKey", null, !34, i32 447, !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i32)* @AddRoundKey, null, null, !17, i32 447}
!81 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !82, i32 0, i32 0}
!82 = !{!14, !15, !14, !14}
!83 = !{!"llvm.loop.name", !"AddRoundKey_label0"}
!84 = distinct !{!84, !85, !89, !38}
!85 = !{i32 386, i32 5, !86, null}
!86 = !{i32 786443, !87, i32 380, i32 5, !34, i32 0}
!87 = !{i32 786443, !88, !34}
!88 = !{i32 786478, i32 0, !34, !"AddRoundKey_InversMixColumn", !"AddRoundKey_InversMixColumn", null, !34, i32 375, !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i32)* @AddRoundKey_InversMixColumn, null, null, !17, i32 375}
!89 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label2"}
!90 = distinct !{!90, !91, !93, !38}
!91 = !{i32 433, i32 5, !92, null}
!92 = !{i32 786443, !87, i32 389, i32 5, !34, i32 0}
!93 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label0"}
!94 = distinct !{!94, !95, !101, !102, !105}
!95 = !{i32 432, i32 9, !96, null}
!96 = !{i32 786443, !97, i32 392, i32 9, !34, i32 0}
!97 = !{i32 786443, !98, !34}
!98 = !{i32 786443, !99, i32 389, i32 30, !34, i32 0}
!99 = !{i32 786443, !100, i32 389, i32 5, !34, i32 0}
!100 = !{i32 786443, !92, !34}
!101 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label1"}
!102 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !103}
!103 = !{i32 25, i32 9, !104, null}
!104 = !{i32 786443, !96, !50}
!105 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !106}
!106 = !{i32 393, i32 9, !107, null}
!107 = !{i32 786443, !96, !34}
!108 = distinct !{!108, !109, !111, !38}
!109 = !{i32 442, i32 5, !110, null}
!110 = !{i32 786443, !87, i32 436, i32 5, !34, i32 0}
!111 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label3"}
!112 = distinct !{!112, !113, !117, !38}
!113 = !{i32 361, i32 5, !114, null}
!114 = !{i32 786443, !115, i32 324, i32 5, !34, i32 0}
!115 = !{i32 786443, !116, !34}
!116 = !{i32 786478, i32 0, !34, !"MixColumn_AddRoundKey", !"MixColumn_AddRoundKey", null, !34, i32 319, !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i32)* @MixColumn_AddRoundKey, null, null, !17, i32 319}
!117 = !{!"llvm.loop.name", !"MixColumn_AddRoundKey_label0"}
!118 = distinct !{!118, !119, !121, !38}
!119 = !{i32 370, i32 5, !120, null}
!120 = !{i32 786443, !115, i32 364, i32 5, !34, i32 0}
!121 = !{!"llvm.loop.name", !"MixColumn_AddRoundKey_label1"}
