#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Analysis/IVDescriptors.h"
#include "llvm/Analysis/LoopAccessAnalysis.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"
#include "llvm/Analysis/XILINXInterfaceAnalysis.h"
#include "llvm/IR/XILINXFPGAIntrinsicInst.h"

#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace llvm;

namespace {

struct HLSIRPrepForGNN : ModulePass {
    static char ID;
    HLSIRPrepForGNN() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "prep-gnn"

        implementPartSelect(M);
        implementPartSet(M);

        removeDbgIntrinsics(M);
        removeLifetimeIntrinsics(M);
        removeSpecIntrinsics(M);

        setIDMetadata(M);
        extractParamsAsGlobals(M);
        setIDMetadataToGlobals(M);

        return true;
    }

    uint64_t getArgAttributeValue(const Argument *arg, StringRef attrName) {
        AttributeList attrs = arg->getParent()->getAttributes();
        auto argIdx = arg->getArgNo();
        const auto &attr = attrs.getParamAttr(argIdx, attrName);
        auto attrStr = attr.getValueAsString();
        if (attrStr.empty())
            return 0;

        unsigned size;
        if (to_integer(attrStr, size))
            return size;

        return 0;
    }

    uint64_t getDecayedDimSize(const Argument *arg) {
        return getArgAttributeValue(arg, "fpga.decayed.dim.hint");
    }

    // Set named metadata for an instruction, global object or function
    void setMetadata(Value& V, StringRef name, uint32_t value) {
        LLVMContext& ctx = V.getContext();
        ConstantInt* valueCI = ConstantInt::get(Type::getInt32Ty(ctx), value);
        MDNode* md = MDNode::get(ctx, {ConstantAsMetadata::get(valueCI)});
        if (Instruction* I = dyn_cast<Instruction>(&V)) {
            I->setMetadata(name, md);
        } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
            G->setMetadata(name, md);
        } else if (Function* F = dyn_cast<Function>(&V)) {
            F->setMetadata(name, md);
        }
    }

    uint32_t MDOperandToInt(MDNode* md, uint32_t index) {
        return cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(md->getOperand(index))->getValue())->getZExtValue();
    }

    uint32_t getMDOperandValue(Value& V, StringRef name, uint32_t index, uint32_t defaultValue=0) {
        MDNode* md = nullptr;
        if (Instruction* I = dyn_cast<Instruction>(&V)) {
            md = I->getMetadata(name);
        } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
            md = G->getMetadata(name);
        } else if (Function* F = dyn_cast<Function>(&V)) {
            md = F->getMetadata(name);
        }
        return md == nullptr ? defaultValue : MDOperandToInt(md, index);
    }

    void setIDMetadata(Module& M) {
        uint32_t opID = 1, bbID = 1, functionID = 1;

        for (Function& F : M) {
            if (!F.hasName() || F.isIntrinsic()) {
                functionID++;
                continue;
            }
            setMetadata(F, "functionID", functionID);
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    setMetadata(I, "opID", opID++);
                    setMetadata(I, "bbID", bbID);
                    setMetadata(I, "functionID", functionID);
                }
                bbID++;
            }
            functionID++;
        }
    }

    void setIDMetadataToGlobals(Module& M) {
        uint32_t globalID = 1;

        for (GlobalObject& G : M.getGlobalList()) {
            setMetadata(G, "globalID", globalID++);
        }
    }

    /*
     * Create a global variable <func>.<arg> for each argument arg
     * of each function func in the module M.
     * Note: If the argument is a decayed array, the global variable
     * will have the same type as the original array if the 
     * "fpga.decayed.dim.hint" attribute is set.
     */
    void extractParamsAsGlobals(Module& M) {
        for (Function& F : M) {
            if (!F.hasName() || F.isIntrinsic()) {
                continue;
            }
            for (Argument& A : F.args()) {
                Type* argTy = A.getType();
                Type* Ty;
                std::string globalName = F.getName().str() + "." + A.getName().str();
                uint64_t decayedDimSize = getDecayedDimSize(&A);

                if (decayedDimSize != 0) {
                    Ty = ArrayType::get(argTy->getPointerElementType(), decayedDimSize);
                } else {
                    Ty = argTy;
                }

                GlobalVariable* GV = new GlobalVariable(
                    M, Ty, true, GlobalValue::ExternalLinkage, nullptr, globalName
                );
                setMetadata(*GV, "param", 1);

                uint32_t functionID = getMDOperandValue(F, "functionID", 0);
                setMetadata(*GV, "functionID", functionID);
            }
        }
    }

    void removeDbgIntrinsics(Module& M) {
        // Collect all 'llvm.dbg.*' intrinsics
        std::vector<Function*> dbgIntrinsics;
        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("llvm.dbg.")) {
                    dbgIntrinsics.push_back(&F);
                }
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
    }

    void removeLifetimeIntrinsics(Module& M) {
        // Collect all 'llvm.lifetime.*' intrinsics
        std::vector<Function*> lifetimeIntrinsics;
        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("llvm.lifetime.")) {
                    lifetimeIntrinsics.push_back(&F);
                }
            }
        }
        // Remove all 'llvm.lifetime.*' intrinsics from the module
        for (Function* F : lifetimeIntrinsics) {
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
    }

    void removeSpecIntrinsics(Module& M) {
        // Collect all '_ssdm_op_Spec.*' and '_ssdm_Spec.*' intrinsics
        std::vector<Function*> ssdmSpecIntrinsics;
        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("_ssdm_op_Spec") ||
                    F.getName().startswith("_ssdm_Spec")) {
                    ssdmSpecIntrinsics.push_back(&F);
                }
            }
        }
        // Remove all '_ssdm_op_Spec.*' and '_ssdm_Spec.*' intrinsics from the module
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
    }

    void implementPartSelect(Module& M) {
        LLVMContext& ctx = M.getContext();

        // Collect all 'llvm.fpga.legacy.part.select.*' intrinsics
        std::vector<Function*> partSelectIntrinsics;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName()) {
                continue;
            }
            if (F.getName().startswith("llvm.fpga.legacy.part.select") ||
                F.getName().startswith("llvm.part.select")) {
                partSelectIntrinsics.push_back(&F);
            }
        }

        // Replace 'llvm.fpga.legacy.part.select.*' intrinsics with their implementation
        int counter = 0;
        for (Function* F : partSelectIntrinsics) {
            std::string newFuncName = "part_select_" + std::to_string(++counter);

            FunctionType* funcType = FunctionType::get(
                F->getReturnType(), 
                {F->getArg(0)->getType(), F->getArg(1)->getType(), F->getArg(2)->getType()}, 
                false
            );
            Function* partSelectFunction = Function::Create(
                funcType, 
                GlobalValue::LinkageTypes::ExternalLinkage, 
                newFuncName, 
                &M
            );
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

    void implementPartSet(Module& M) {
        LLVMContext& ctx = M.getContext();

        // Collect all 'llvm.fpga.legacy.part.set.*' intrinsics
        std::vector<Function*> partSetIntrinsics;
        for (Function& F : M) {
            if (!F.isIntrinsic() || !F.hasName()) {
                continue;
            }
            if (F.getName().startswith("llvm.fpga.legacy.part.set") ||
                F.getName().startswith("llvm.part.set")) {
                partSetIntrinsics.push_back(&F);
            }
        }
        // Replace 'llvm.fpga.legacy.part.set.*' intrinsics with their implementation
        int counter = 0;
        for (Function* F : partSetIntrinsics) {
            std::string newFuncName = "part_set_" + std::to_string(++counter);
            FunctionType* funcType = FunctionType::get(
                F->getReturnType(), 
                {F->getArg(0)->getType(), F->getArg(1)->getType(), F->getArg(2)->getType(), F->getArg(3)->getType()}, 
                false
            );
            Function* partSetFunction = Function::Create(
                funcType, 
                GlobalValue::LinkageTypes::ExternalLinkage, 
                newFuncName, 
                &M
            );
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

    void replaceIntrinsicWithFunction(Module& M, LLVMContext& ctx, Function* intrinsic, 
                                      Function* newFunction) {
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
        intrinsic->eraseFromParent(); // Remove the intrinsic from the module
    }

}; // struct HLSIRPrepForGNN

}  // anonymous namespace

char HLSIRPrepForGNN::ID = 0;
static RegisterPass<HLSIRPrepForGNN> X(
    "prep-gnn", "Preprocess Vitis IR to use it as input to a GNN model", false, false
);