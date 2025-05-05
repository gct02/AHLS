#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <utility>

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/LoopUtils.h"

using namespace llvm;

namespace {

struct ClearIntrinsicsPass : public ModulePass {
    static char ID;
    ClearIntrinsicsPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "clear-intrinsics"

        removeLifetimeIntrinsics(M);
        removeSpecIntrinsics(M);

        // Implement part select and part set (Vitis HLS) intrinsics
        implementPartSelect(M);
        implementPartSet(M);

        return true;
    }

    void removeLifetimeIntrinsics(Module& M) {
        // Collect and remove all 'llvm.lifetime.*' 
        // intrinsics from the module
        std::vector<Function*> IntrinsicDefs;
        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("llvm.lifetime.")) {
                    IntrinsicDefs.push_back(&F);
                }
            }
        }
        for (Function* F : IntrinsicDefs) {
            if (!F->use_empty()) {
                for (auto it = F->use_begin(); it != F->use_end(); ) {
                    Use& U = *it++;
                    User* Usr = U.getUser();
                    if (auto* CI = dyn_cast<CallInst>(Usr)) {
                        CI->eraseFromParent();
                    }
                }
            }
            F->eraseFromParent();
        }
    }

    void removeSpecIntrinsics(Module& M) {
        // Collect and remove all '_ssdm_op_Spec.*' and '_ssdm_Spec.*' 
        // intrinsics from the module
        std::vector<Function*> IntrinsicDefs;
        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("_ssdm_op_Spec") ||
                    F.getName().startswith("_ssdm_Spec")) {
                    IntrinsicDefs.push_back(&F);
                }
            }
        }
        for (Function* F : IntrinsicDefs) {
            if (!F->use_empty()) {
                for (auto it = F->use_begin(); it != F->use_end(); ) {
                    Use& U = *it++;
                    User* Usr = U.getUser();
                    if (auto* CI = dyn_cast<CallInst>(Usr)) {
                        CI->eraseFromParent();
                    }
                }
            }
            F->eraseFromParent();
        }
    }

    void implementPartSelect(Module& M) {
        LLVMContext& Ctx = M.getContext();

        // Collect all 'llvm.fpga.legacy.part.select.*' intrinsics
        std::vector<Function*> InstrinsicDecls;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName()) {
                continue;
            }
            if (F.getName().startswith("llvm.fpga.legacy.part.select") ||
                F.getName().startswith("llvm.part.select")) {
                InstrinsicDecls.push_back(&F);
            }
        }
        // Replace 'llvm.fpga.legacy.part.select.*' intrinsics
        // with their implementation
        int Counter = 0;
        for (Function* F : InstrinsicDecls) {
            std::string FunctionName = "part_select_" + std::to_string(++Counter);
            Type* RetTy = F->getReturnType();
            ArrayRef<Type*> ArgTy = {F->getArg(0)->getType(), 
                                     F->getArg(1)->getType(), 
                                     F->getArg(2)->getType()};
            FunctionType* FunctionTy = FunctionType::get(RetTy, ArgTy, false);
            Function* PartSelectFunction = Function::Create(
                FunctionTy, GlobalValue::LinkageTypes::ExternalLinkage, 
                FunctionName, &M
            );
            PartSelectFunction->setCallingConv(CallingConv::C);
            PartSelectFunction->setDoesNotThrow();
            PartSelectFunction->setDoesNotAccessMemory();

            Value *Val = PartSelectFunction->getArg(0);
            Value *LoBit = PartSelectFunction->getArg(1);
            Value *HiBit = PartSelectFunction->getArg(2);

            Type* ValTy = Val->getType();
            uint64_t ValBw = M.getDataLayout().getTypeAllocSize(ValTy);

            BasicBlock* EntryBlock = BasicBlock::Create(Ctx, "entry", PartSelectFunction);
            IRBuilder<> Builder(EntryBlock);
            Builder.SetInsertPoint(EntryBlock);

            // Implement the intrinsic
            Value *LoBitExt = Builder.CreateZExtOrTrunc(LoBit, ValTy);
            Value *HiBitExt = Builder.CreateZExtOrTrunc(HiBit, ValTy);
            Value *ShiftedVal = Builder.CreateLShr(Val, LoBitExt);
            Value *BitsRetain = Builder.CreateSub(HiBitExt, LoBitExt);
            Value *BitsShift = Builder.CreateSub(ConstantInt::get(BitsRetain->getType(), ValBw), BitsRetain);
            Value *Mask = Builder.CreateLShr(ConstantInt::getAllOnesValue(BitsShift->getType()), BitsShift);
            Value *MaskPart = Builder.CreateBitCast(Mask, ValTy);
            Value *PartSelect = Builder.CreateAnd(ShiftedVal, MaskPart);
            Builder.CreateRet(PartSelect);

            replaceIntrinsicWithFunction(M, Ctx, F, PartSelectFunction);
        }
    }

    void implementPartSet(Module& M) {
        LLVMContext& Ctx = M.getContext();
    
        // Collect all 'llvm.fpga.legacy.part.set.*' intrinsics
        std::vector<Function*> IntrinsicDecls;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName()) {
                continue;
            }
            if (F.getName().startswith("llvm.fpga.legacy.part.set") ||
                F.getName().startswith("llvm.part.set")) {
                IntrinsicDecls.push_back(&F);
            }
        }
    
        // Replace 'llvm.fpga.legacy.part.set.*' intrinsics with their implementation
        int Counter = 0;
        for (Function* F : IntrinsicDecls) {
            std::string FunctionName = "part_set_" + std::to_string(++Counter);
            Type* RetTy = F->getReturnType();
            ArrayRef<Type*> ArgTy = {F->getArg(0)->getType(),
                                     F->getArg(1)->getType(),
                                     F->getArg(2)->getType(),
                                     F->getArg(3)->getType()};
            FunctionType* FunctionTy = FunctionType::get(RetTy, ArgTy, false);
            Function* PartSetFunction = Function::Create(
                FunctionTy, GlobalValue::LinkageTypes::ExternalLinkage,
                FunctionName, &M
            );
            PartSetFunction->setCallingConv(CallingConv::C);
            PartSetFunction->setDoesNotThrow();
            PartSetFunction->setDoesNotAccessMemory();
    
            Value* Val = PartSetFunction->getArg(0);
            Value* Repl = PartSetFunction->getArg(1);
            Value* LoBit = PartSetFunction->getArg(2);
            Value* HiBit = PartSetFunction->getArg(3);
    
            Type* ValTy = Val->getType();
            Type* ReplTy = Repl->getType();
            uint64_t ValBw = M.getDataLayout().getTypeAllocSize(ValTy);
            uint64_t ReplBw = M.getDataLayout().getTypeAllocSize(ReplTy);
    
            BasicBlock* EntryBlock = BasicBlock::Create(Ctx, "entry", PartSetFunction);
            IRBuilder<> Builder(EntryBlock);
            Builder.SetInsertPoint(EntryBlock);
    
            Value* LoBitExt = Builder.CreateZExtOrTrunc(LoBit, ValTy);
            Value* HiBitExt = Builder.CreateZExtOrTrunc(HiBit, ValTy);
            Value* ReplExt = Builder.CreateZExtOrTrunc(Repl, ValTy);
            Value* MaskHi = Builder.CreateLShr(ConstantInt::getAllOnesValue(ValTy), HiBitExt);
            Value* MaskLo = Builder.CreateShl(ConstantInt::getAllOnesValue(ValTy), LoBitExt);
            Value* ReplMask = Builder.CreateAnd(MaskHi, MaskLo);
            Value* ReplMasked = Builder.CreateAnd(ReplExt, ReplMask);
            Value* ValMasked = Builder.CreateAnd(Val, Builder.CreateNot(ReplMask));
            Value* PartSet = Builder.CreateOr(ValMasked, ReplMasked);
            Builder.CreateRet(PartSet);
    
            replaceIntrinsicWithFunction(M, Ctx, F, PartSetFunction);
        }
    }    

    void replaceIntrinsicWithFunction(Module& M, LLVMContext& Ctx, 
                                      Function* IntrinsicDecl, Function* NewFunction) {
        // Replace uses of the intrinsic with calls to the new function
        for (auto It = IntrinsicDecl->use_begin(); It != IntrinsicDecl->use_end(); ) {
            Use& U = *It++;
            User* Usr = U.getUser();
            if (auto* CI = dyn_cast<CallInst>(Usr)) {
                IRBuilder<> Builder(CI);
                std::vector<Value*> Args;
                for (unsigned i = 0; i < CI->getNumArgOperands(); i++) {
                    Args.push_back(CI->getArgOperand(i));
                }
                CallInst* PartSelectCall = Builder.CreateCall(NewFunction, Args);
                CI->replaceAllUsesWith(PartSelectCall);
                CI->eraseFromParent();
            }
        }
        IntrinsicDecl->eraseFromParent();
    }
}; 
// End struct ClearIntrinsicsPass

} 
// End namespace

char ClearIntrinsicsPass::ID = 0;
static RegisterPass<ClearIntrinsicsPass> X(
    "clear-intrinsics", 
    "Clear LLVM intrinsics",
    false, false
);