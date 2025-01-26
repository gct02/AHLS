#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
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

struct UpdateMD : public ModulePass {
    static char ID;
    UpdateMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "update-md"

        setMetadataForInstructions(M);
        setMetadataForArrays(M);
        setMetadataForGlobals(M);

        return false; // Module is not modified
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

    uint32_t getArrayNumDims(Type* arrayType) {
        uint32_t numDims = 0;
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        while (arrayType->isArrayTy()) {
            numDims++;
            arrayType = arrayType->getArrayElementType();
        }
        return numDims;
    }

    uint32_t getArrayNumElements(Type* arrayType) {
        uint32_t numElements = 1;
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        while (arrayType->isArrayTy()) {
            numElements *= arrayType->getArrayNumElements();
            arrayType = arrayType->getArrayElementType();
        }
        return numElements;
    }

    uint32_t getArrayDimNumElements(Type* arrayType, uint32_t dim) {
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        for (size_t i = 1; i < dim; i++) {
            arrayType = arrayType->getArrayElementType();
        }
        return arrayType->getArrayNumElements();
    }

    int setArrayMD(Value& V) {
        Type* valueType = V.getType();
        if (!valueType->isArrayTy() && !valueType->isPointerTy()) {
            return -1; // Not an array or pointer
        }

        while (valueType->isPointerTy()) {
            valueType = valueType->getPointerElementType();
        }
        if (!valueType->isArrayTy()) {
            return -1; // Not an array
        }
        uint32_t numDims = getArrayNumDims(V.getType());
        uint32_t numElements = getArrayNumElements(V.getType());

        setMetadata(V, "isArray", 1);
        setMetadata(V, "numDims", numDims);
        setMetadata(V, "numElements", numElements);
    
        // Get element type of the array
        Type* elementType = V.getType()->getPointerElementType();
        while (elementType->isArrayTy()) {
            elementType = elementType->getArrayElementType();
        }
        setMetadata(V, "elementType", (uint32_t)elementType->getTypeID());
        setMetadata(V, "elementBitwidth", elementType->getPrimitiveSizeInBits());

        return 0;
    }

    // Set array-specific metadata for all arrays in the module
    void setMetadataForArrays(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            setArrayMD(G);
        }
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    setArrayMD(I);
                }
            }
        }
    }

    // Set named metadata for all global objects in the module
    void setMetadataForGlobals(Module& M) {
        int id = 1;
        for (GlobalObject& G : M.getGlobalList()) {
            DEBUG(dbgs() << "Setting metadata for global: " << G << " (globalID = " << id << ")\n");
            setMetadata(G, "globalID", id);
            setMetadata(G, "bitwidth", G.getType()->getPointerElementType()->getPrimitiveSizeInBits());
            setMetadata(G, "type", (uint32_t)G.getType()->getPointerElementType()->getTypeID());
            id++;
        }
    }

    // Set named metadata for all instructions in the module
    void setMetadataForInstructions(Module& M) {
        int id = 1;
        uint32_t functionID = 1, bbID = 1;

        for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
            Function& F = *FI;
            if (F.size() == 0) {
                continue;
            }
            // Get LoopInfo and ScalarEvolution analyses
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();
            for (BasicBlock& BB : F) {
                uint32_t loopDepth = 0;
                uint64_t tripCountValue = 0;
                if (Loop* L = LI.getLoopFor(&BB)) {
                    // The basic block is inside a loop
                    uint32_t loopDepth = L->getLoopDepth();
                    const SCEV* tripCount = SE.getBackedgeTakenCount(L);
                    if (const SCEVConstant* tripCountConst = dyn_cast<SCEVConstant>(tripCount)) {
                        tripCountValue = tripCountConst->getValue()->getZExtValue();
                    }
                }
                for (Instruction& I : BB) {
                    DEBUG(dbgs() << "Setting metadata for instruction: " << I << " (opID = " << id << ")\n");
                    setInstructionMetadata(I, id, functionID, bbID, loopDepth, tripCountValue);
                    id++;
                }
                bbID++;
            }
            functionID++;
        }
    }

    // Set named metadata for an instruction
    void setInstructionMetadata(Instruction& I, uint32_t opID, uint32_t functionID, uint32_t bbID,
                                uint32_t loopDepth=-1, uint64_t tripCount=-1) {
        setMetadata(I, "opID", opID);
        setMetadata(I, "functionID", functionID);
        setMetadata(I, "bbID", bbID);
        setMetadata(I, "opcode", I.getOpcode());
        setMetadata(I, "bitwidth", I.getType()->getPrimitiveSizeInBits());
        setMetadata(I, "valueType", (uint32_t)I.getType()->getTypeID());
        if (loopDepth != -1) {
            setMetadata(I, "loopDepth", loopDepth);
        }
        if (tripCount != -1) {
            setMetadata(I, "tripCount", tripCount);
        }
        setMetadata(I, "ID." + std::to_string(opID), opID);
    }

    // Set loop-specific metadata for all instructions that reside in a loop
    void setLoopMetadata(Function& F) {
        // Get LoopInfo and ScalarEvolution analyses
        LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
        ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

        for (BasicBlock& BB : F) {
            uint32_t loopDepth = 0;
            uint32_t tripCount = 0;
            Loop* L = LI.getLoopFor(&BB);
            if (L) {
				loopDepth = L->getLoopDepth();
                tripCount = getLoopTripCount(L, &SE);
            }
            for (Instruction& I : BB) {
                setMetadata(I, "loopDepth", loopDepth);
                setMetadata(I, "tripCount", tripCount);
            }
        }
    }

    uint32_t getLoopTripCount(Loop* L, ScalarEvolution* SE) {
        BasicBlock* exitingBlock = getExitingBlock(L, SE);
        if (exitingBlock) {
            return SE->getSmallConstantTripCount(L, exitingBlock);
        }
        return 0;
    }

	virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct UpdateMD

}  // anonymous namespace

char UpdateMD::ID = 0;
static RegisterPass<UpdateMD> X(
    "update-md", "Update metadata for instructions and global objects", false, false
);