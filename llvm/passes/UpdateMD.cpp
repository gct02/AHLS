#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/IVDescriptors.h"
#include "llvm/Analysis/LoopAccessAnalysis.h"
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
#include "llvm/Transforms/Utils/LoopUtils.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

#include <iostream>
#include <string>
#include <vector>
#include <stack>

#include "HLSDSEUtils.h"

using namespace llvm;

namespace {

struct UpdateMD : public ModulePass {
    static char ID;
    UpdateMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "update-md"

        setMetadataForFunctions(M);
        setMetadataForLoops(M);
        setMetadataForInstructions(M);
        setMetadataForArrays(M);
        setMetadataForGlobals(M);

        associateInstructionsWithLoops(M);

        return false; // Module is not modified
    }

    void associateInstructionsWithLoops(Module& M) {
        for (Function& F : M) {
            if (F.size() == 0) continue;
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            for (BasicBlock& BB : F) {
                if (Loop* L = LI.getLoopFor(&BB)) {
                    uint32_t loopID = getIntMetadata(*L->getHeader(), "loopID");
                    if (loopID == 0) continue;
                    for (Instruction& I : BB) {
                        setIntMetadata(I, "loopID", loopID);
                    }
                }
            }
        }
    }

    // Set array-specific metadata for all arrays in the module
    void setMetadataForArrays(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            setArrayMetadata(G);
        }
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    setArrayMetadata(I);
                }
            }
        }
    }

    // Set metadata for all global objects in the module
    void setMetadataForGlobals(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getType()->getPointerElementType();
            setIntMetadata(G, "bitwidth", Ty->getPrimitiveSizeInBits());
            setIntMetadata(G, "type", (uint32_t)Ty->getTypeID());
        }
    }

    uint32_t getExactOrMaxTripCount(Loop* L, ScalarEvolution* SE) {
        uint32_t tripCount = 0;
        if (BasicBlock* exitingBlock = getExitingBlock(L, SE)) {
            tripCount = SE->getSmallConstantTripCount(L, exitingBlock);
            if (tripCount > 0) {
                return tripCount;
            }
        }
        Optional<LoopTripCountMDInfo> tripCountInfo = getLoopTripCount(L);
        if (tripCountInfo.hasValue()) {
            tripCount = (uint32_t)tripCountInfo->getMax();
            if (tripCount > 0) {
                return tripCount;
            }
        }
        Optional<uint32_t> estimatedTripCount = getLoopEstimatedTripCount(L);
        return estimatedTripCount.hasValue() ? estimatedTripCount.getValue() : 0;
    }

    void setMetadataForLoops(Module& M) {
        struct StackFrame {
            Loop* loop;
            uint32_t parentID;
        };

        uint32_t currLoopID = 1;
        for (Function& F : M) {
            if (F.size() == 0) continue;

            DEBUG(dbgs() << "Setting metadata for loops in function " 
                         << (F.hasName() ? F.getName() : "") << "\n");

            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();
            uint32_t functionID = getIntMetadata(F, "functionID");

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<StackFrame> loopStack;
                    loopStack.push({L, 0});
                    
                    while (!loopStack.empty()) {
                        StackFrame frame = loopStack.top();
                        loopStack.pop();
                        
                        Loop* currLoop = frame.loop;
                        uint32_t currParentID = frame.parentID;
                        
                        DEBUG(dbgs() << "Setting metadata for loop " 
                                     << (currLoop->getHeader()->hasName() ? currLoop->getHeader()->getName() : "") 
                                     << "\n");
                        uint32_t loopID = currLoopID++;
                        
                        setIntMetadata(*currLoop, "loopID", loopID);
                        setIntMetadata(*currLoop, "parentLoopID", currParentID);
                        setIntMetadata(*currLoop, "functionID", functionID);
                        
                        uint32_t depth = currLoop->getLoopDepth();
                        uint32_t tripCount = getExactOrMaxTripCount(currLoop, &SE);

                        DEBUG(dbgs() << "Loop depth: " << depth << ", trip count: " << tripCount << "\n");
                        
                        setIntMetadata(*currLoop, "depth", depth);
                        setIntMetadata(*currLoop, "tripCount", tripCount);
                        
                        for (auto it = currLoop->getSubLoops().rbegin(); it != currLoop->getSubLoops().rend(); ++it) {
                            loopStack.push({*it, loopID});
                        }
                    }
                }
            }
        }
    }

    void setMetadataForFunctions(Module& M) {
        for (Function& F : M) {
            if (F.size() == 0) continue;
            
            setIntMetadata(F, "numOperands", (uint32_t)F.arg_size());
            setIntMetadata(F, "numUses", F.getNumUses());

            Type* retTy = F.getReturnType();
            setIntMetadata(F, "retType", (uint32_t)retTy->getTypeID());
            setIntMetadata(F, "retBitwidth", retTy->getPrimitiveSizeInBits());

            uint32_t instructions = 0, bbs = 0, loops = 0;
            for (BasicBlock& BB : F) {
                bbs++;
                instructions += BB.size();
            }
            setIntMetadata(F, "numInsts", instructions);
            setIntMetadata(F, "numBBs", bbs);
            setIntMetadata(F, "numLoops", loops);
        }
    }

    void setMetadataForInstructions(Module& M) {
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    setInstructionMetadata(I);
                }
            }
        }
    }

    int setArrayMetadata(Value& V) {
        Type* valueType = V.getType();
        if (!valueType->isArrayTy() && !valueType->isPointerTy()) {
            return -1; // Not an array or pointer
        }
        valueType = getPointedType(valueType);
        if (!valueType->isArrayTy()) {
            return -1; // Not an array
        }
        setIntMetadata(V, "isArray", 1);

        uint32_t dims = getArrayDims(V.getType());
        for (uint32_t i = 1; i <= dims; i++) {
            uint32_t dimSize = getArrayDimSize(V.getType(), i);
            setIntMetadata(V, "numElements." + std::to_string(i), dimSize);
        }
        setIntMetadata(V, "numDims", dims);
        setIntMetadata(V, "numElements", getTotalArrayElements(V.getType()));
    
        Type* innerType = getArrayInnermostType(getPointedType(V.getType()));
        setIntMetadata(V, "elementType", (uint32_t)innerType->getTypeID());
        setIntMetadata(V, "elementBitwidth", innerType->getPrimitiveSizeInBits());
        return 0;
    }

    void setInstructionMetadata(Instruction& I) {
        setIntMetadata(I, "opcode", I.getOpcode());
        setIntMetadata(I, "bitwidth", I.getType()->getPrimitiveSizeInBits());
        setIntMetadata(I, "valueType", (uint32_t)I.getType()->getTypeID());

        uint32_t opID = getIntMetadata(I, "opID", 0);
        setIntMetadata(I, "ID." + std::to_string(opID), opID);
    }

	virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct UpdateMD

} // anonymous namespace

char UpdateMD::ID = 0;
static RegisterPass<UpdateMD> X(
    "update-md", 
    "Update metadata for instructions, functions, basic blocks, and global objects",
    false, false
);