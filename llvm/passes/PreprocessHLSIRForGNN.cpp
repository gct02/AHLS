#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include <string>
#include <vector>

using namespace llvm;

namespace
{
struct PreprocessHLSIRForGNN : ModulePass
{
    static char ID;
    PreprocessHLSIRForGNN() : ModulePass(ID) {}

    bool runOnModule(Module& M) override
    {
        #define DEBUG_TYPE "preprocess-ir-gnn"

        LLVMContext& ctx = M.getContext();

        // Collect all 'llvm.fpga.legacy.part.select.*' and 'llvm.fpga.legacy.part.set.*' intrinsics
        std::vector<Function*> partSelectIntrinsics, partSetIntrinsics;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName())
                continue;
            
            if (F.getName().startswith("llvm.fpga.legacy.part.select") || F.getName().startswith("llvm.part.select")) {
                partSelectIntrinsics.push_back(&F);
            } else if (F.getName().startswith("llvm.fpga.legacy.part.set") || F.getName().startswith("llvm.part.set")) {
                partSetIntrinsics.push_back(&F);
            }
        }

        // Replace 'llvm.fpga.legacy.part.set.*' and 'llvm.fpga.legacy.part.select.*' intrinsics with their implementation
        implementPartSelect(M, ctx, partSelectIntrinsics);
        implementPartSet(M, ctx, partSetIntrinsics);

        // Collect all 'llvm.dbg.*' intrinsics
        std::vector<Function*> dbgIntrinsics;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName())
                continue;
            
            if (F.getName().startswith("llvm.dbg.")) {
                dbgIntrinsics.push_back(&F);
            }
        }

        // Remove all 'llvm.dbg.*' intrinsics from the module
        for (Function* F : dbgIntrinsics) {
            if (!F->use_empty()) {
                for (auto it = F->use_begin(); it != F->use_end(); ) {
                    Use& U = *it++;
                    User* user = U.getUser();
                    if (auto* callInst = dyn_cast<CallInst>(user)) {
                        callInst->eraseFromParent();
                    }
                }
            }
            F->eraseFromParent();
        }

        // Collect all '_ssdm_op_Spec.*' functions from the module
        std::vector<Function*> ssdmSpecIntrinsics;
        for (Function& F : M) {
            if (!F.hasName())
                continue;
            
            if (F.getName().startswith("_ssdm_op_Spec")) {
                ssdmSpecIntrinsics.push_back(&F);
            }
        }

        // Remove all '_ssdm_op_Spec.*' functions from the module
        for (Function* F : ssdmSpecIntrinsics) {
            if (!F->use_empty()) {
                for (auto it = F->use_begin(); it != F->use_end(); ) {
                    Use& U = *it++;
                    User* user = U.getUser();
                    if (auto* callInst = dyn_cast<CallInst>(user)) {
                        callInst->eraseFromParent();
                    }
                }
            }
            F->eraseFromParent();
        }

        // Remove all unused global variables from the module
        for (auto it = M.global_begin(); it != M.global_end(); ) {
            GlobalVariable& GV = *it++;
            if (GV.use_empty()) {
                GV.eraseFromParent();
            }
        }

        return true;
    }

    void implementPartSelect(Module& M, LLVMContext& ctx, std::vector<Function*> partSelectIntrinsics) {
        // Replace 'llvm.fpga.legacy.part.select.*' intrinsics with their implementation
        int partSelectCounter = 0;
        for (Function* F : partSelectIntrinsics) {
            std::string newFuncName = "part_select_" + std::to_string(partSelectCounter++);

            FunctionType* funcType = FunctionType::get(F->getReturnType(), {F->getArg(0)->getType(), F->getArg(1)->getType(), F->getArg(2)->getType()}, false);
            Function* partSelectFunction = Function::Create(funcType, GlobalValue::LinkageTypes::ExternalLinkage, newFuncName, &M);
            partSelectFunction->setCallingConv(CallingConv::C);
            partSelectFunction->setDoesNotThrow();
            partSelectFunction->setDoesNotAccessMemory();

            Value *val = partSelectFunction->getArg(0);
            Value *loBit = partSelectFunction->getArg(1);
            Value *hiBit = partSelectFunction->getArg(2);

            Type* valType = val->getType();
            uint64_t valBitwidth = M.getDataLayout().getTypeAllocSize(valType);

            BasicBlock* entry = BasicBlock::Create(ctx, "entry", partSelectFunction);
            IRBuilder<> builder(entry);
            builder.SetInsertPoint(entry);

            // Implement the intrinsic
            Value *loBitExt = builder.CreateZExtOrTrunc(loBit, valType);
            Value *hiBitExt = builder.CreateZExtOrTrunc(hiBit, valType);
            Value *shiftedValue = builder.CreateLShr(val, loBitExt);
            Value *bitsRetain = builder.CreateSub(hiBitExt, loBitExt);
            Value *bitsShift = builder.CreateSub(ConstantInt::get(bitsRetain->getType(), valBitwidth), bitsRetain);
            Value *mask = builder.CreateLShr(ConstantInt::getAllOnesValue(bitsShift->getType()), bitsShift);
            Value *maskPart = builder.CreateBitCast(mask, valType);
            Value *partSelect = builder.CreateAnd(shiftedValue, maskPart);
            builder.CreateRet(partSelect);

            replaceIntrinsicWithFunction(M, ctx, F, partSelectFunction);
        }
    }

    void implementPartSet(Module& M, LLVMContext& ctx, std::vector<Function*> partSetIntrinsics) {
        // Replace 'llvm.fpga.legacy.part.set.*' intrinsics with their implementation
        int partSetCounter = 0;
        for (Function* F : partSetIntrinsics) {
            std::string newFuncName = "part_set_" + std::to_string(partSetCounter++);
            FunctionType* funcType = FunctionType::get(F->getReturnType(), {F->getArg(0)->getType(), F->getArg(1)->getType(), F->getArg(2)->getType(), F->getArg(3)->getType()}, false);
            Function* partSetFunction = Function::Create(funcType, GlobalValue::LinkageTypes::ExternalLinkage, newFuncName, &M);
            partSetFunction->setCallingConv(CallingConv::C);
            partSetFunction->setDoesNotThrow();
            partSetFunction->setDoesNotAccessMemory();

            Value* val = partSetFunction->getArg(0);
            Value* repl = partSetFunction->getArg(1);
            Value* loBit = partSetFunction->getArg(2);
            Value* hiBit = partSetFunction->getArg(3);

            Type* valType = val->getType();
            Type* replType = repl->getType();
            uint64_t valBitwidth = M.getDataLayout().getTypeAllocSize(valType);
            uint64_t replBitwidth = M.getDataLayout().getTypeAllocSize(replType);

            BasicBlock* entry = BasicBlock::Create(ctx, "entry", partSetFunction);
            IRBuilder<> builder(entry);
            builder.SetInsertPoint(entry);

            Value* loBitExt = builder.CreateZExtOrTrunc(loBit, valType);
            Value* hiBitExt = builder.CreateZExtOrTrunc(hiBit, valType);
            Value* replExt = builder.CreateZExtOrTrunc(repl, valType);
            Value* replMaskHi = builder.CreateLShr(ConstantInt::getAllOnesValue(valType), hiBitExt);
            Value* replMaskLo = builder.CreateShl(ConstantInt::getAllOnesValue(valType), loBitExt);
            Value* replMask = builder.CreateAnd(replMaskHi, replMaskLo);
            Value* replPartSet = builder.CreateAnd(replExt, replMask);
            Value* valMask = builder.CreateNot(replMask);
            Value* valMasked = builder.CreateAnd(val, valMask);
            Value* partSet = builder.CreateOr(valMasked, replPartSet);
            builder.CreateRet(partSet);

            replaceIntrinsicWithFunction(M, ctx, F, partSetFunction);
        }
    }

    void replaceIntrinsicWithFunction(Module& M, LLVMContext& ctx, Function* intrinsic, Function* newFunction) {
        // Replace uses of the intrinsic with calls to the new function
        for (auto it = intrinsic->use_begin(); it != intrinsic->use_end(); ) {
            Use& U = *it++;
            User* user = U.getUser();
            if (auto* callInst = dyn_cast<CallInst>(user)) {
                IRBuilder<> builder(callInst);
                std::vector<Value*> args;
                for (unsigned i = 0; i < callInst->getNumArgOperands(); i++) {
                    args.push_back(callInst->getArgOperand(i));
                }
                CallInst* partSelectCall = builder.CreateCall(newFunction, args);
                callInst->replaceAllUsesWith(partSelectCall);
                callInst->eraseFromParent();
            }
        }
        // Remove the intrinsic from the module
        intrinsic->eraseFromParent();
    }
};
} // namespace

char PreprocessHLSIRForGNN::ID = 0;
static RegisterPass<PreprocessHLSIRForGNN> X("preprocess-ir-gnn", "Preprocess Vitis IR to use it as input to a GNN model (GAT or HAN)", false, false);