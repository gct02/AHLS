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

        setMetadata(V, "isArray", 1);

        uint32_t numDims = getArrayNumDims(V.getType());
        for (uint32_t i = 1; i <= numDims; i++) {
            uint32_t dimNumElements = getArrayDimNumElements(V.getType(), i);
            setMetadata(V, "numElements." + std::to_string(i), dimNumElements);
        }
        uint32_t numElements = getArrayNumElements(V.getType());

        setMetadata(V, "numDims", numDims);
        setMetadata(V, "numElements", numElements);
    
        // Get element type of the array
        Type* elementType;
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

    std::vector<uint32_t> getFunctionInfo(Function& F) {
        uint32_t numOperands = F.getNumOperands();
        uint32_t numUses = F.getNumUses();
        uint32_t entryCount = F.getEntryCount().getCount();
        uint32_t functionRetType = (uint32_t)F.getReturnType()->getTypeID();
        uint32_t functionRetTypeBitwidth = F.getReturnType()->getPrimitiveSizeInBits();
        uint32_t numInstsInFunction = 0;
        uint32_t numBBsInFunction = 0;
        uint32_t numLoopsInFunction = 0;

        // Get LoopInfo and ScalarEvolution analyses
        LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
        ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

        for (BasicBlock& BB : F) {
            numBBsInFunction++;
            numInstsInFunction += BB.size();
            if (Loop* L = LI.getLoopFor(&BB)) {
                numLoopsInFunction++;
            }
        }

        std::vector<uint32_t> functionInfo = {
            numOperands, numUses, entryCount, functionRetType, functionRetTypeBitwidth,
            numInstsInFunction, numBBsInFunction, numLoopsInFunction
        };

        return functionInfo;
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
            std::vector<uint32_t> functionInfo = getFunctionInfo(F);

            // Get LoopInfo and ScalarEvolution analyses
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (BasicBlock& BB : F) {
                uint32_t bbSize = BB.size();
                uint32_t inLoop = 0;
                uint32_t loopDepth = 0;
                uint64_t tripCountValue = 1;
                if (Loop* L = LI.getLoopFor(&BB)) {
                    // The basic block is a loop
                    inLoop = 1;
                    uint32_t loopDepth = L->getLoopDepth();
                    const SCEV* tripCount = SE.getBackedgeTakenCount(L);
                    if (const SCEVConstant* tripCountConst = dyn_cast<SCEVConstant>(tripCount)) {
                        tripCountValue = tripCountConst->getValue()->getZExtValue();
                    } else {
                        tripCountValue = 0;
                    }
                }
                for (Instruction& I : BB) {
                    DEBUG(dbgs() << "Setting metadata for instruction: " << I << " (opID = " << id << ")\n");
                    setInstructionMetadata(I, id, functionID, bbID, bbSize, inLoop, functionInfo,
                                           loopDepth, (uint32_t)tripCountValue);
                    id++;
                }
                bbID++;
            }
            functionID++;
        }
    }

    bool instructionModifiesMemory(Instruction& I) {
        if (I.mayWriteToMemory()) {
            return true;
        }
        if (I.getOpcode() == Instruction::Call) {
            CallInst* CI = cast<CallInst>(&I);
            return CI->mayWriteToMemory();
        }
        return false;
    }

    bool instructionReadsMemory(Instruction& I) {
        if (I.mayReadFromMemory()) {
            return true;
        }
        if (I.getOpcode() == Instruction::Call) {
            CallInst* CI = cast<CallInst>(&I);
            return CI->mayReadFromMemory();
        }
        return false;
    }

    bool instructionModifiesControlFlow(Instruction& I) {
        return I.isTerminator() || I.getOpcode() == Instruction::Call;
    }

    // Set named metadata for an instruction
    void setInstructionMetadata(Instruction& I, uint32_t opID, uint32_t functionID, uint32_t bbID, 
                                uint32_t bbSize, uint32_t inLoop, std::vector<uint32_t> functionInfo, 
                                uint32_t loopDepth=0, uint32_t tripCount=1) {
        
        
        setMetadata(I, "opID", opID);
        setMetadata(I, "functionID", functionID);
        setMetadata(I, "bbID", bbID);
        setMetadata(I, "opcode", I.getOpcode());
        setMetadata(I, "bitwidth", I.getType()->getPrimitiveSizeInBits());
        setMetadata(I, "valueType", (uint32_t)I.getType()->getTypeID());
        setMetadata(I, "loopDepth", loopDepth);
        setMetadata(I, "tripCount", (uint32_t)tripCount);
        setMetadata(I, "numUses", I.getNumUses());
        setMetadata(I, "numOperands", I.getNumOperands());
        setMetadata(I, "inLoop", inLoop);
        setMetadata(I, "ID." + std::to_string(opID), opID);

        if (instructionModifiesMemory(I)) {
            setMetadata(I, "modifiesMemory", 1);
        } else {
            setMetadata(I, "modifiesMemory", 0);
        }

        if (instructionReadsMemory(I)) {
            setMetadata(I, "readsMemory", 1);
        } else {
            setMetadata(I, "readsMemory", 0);
        }

        if (instructionModifiesControlFlow(I)) {
            setMetadata(I, "modifiesControlFlow", 1);
        } else {
            setMetadata(I, "modifiesControlFlow", 0);
        }

        // Set metadata about the basic block that the instruction belongs to
        // to facilitate recovering this information from the ProGraML graph
        setMetadata(I, "bbSize", bbSize);
        
        // Set metadata about the function that the instruction belongs to
        // to facilitate recovering this information from the ProGraML graph
        setMetadata(I, "numOperandsInFunction", functionInfo[0]);
        setMetadata(I, "numUsesInFunction", functionInfo[1]);
        setMetadata(I, "entryCountInFunction", functionInfo[2]);
        setMetadata(I, "functionRetType", functionInfo[3]);
        setMetadata(I, "functionRetTypeBitwidth", functionInfo[4]);
        setMetadata(I, "numInstsInFunction", functionInfo[3]);
        setMetadata(I, "numBBsInFunction", functionInfo[4]);
        setMetadata(I, "numLoopsInFunction", functionInfo[5]);
    }

    // Set loop-specific metadata for all instructions that reside in a loop
    // void setLoopMetadata(Function& F) {
    //     // Get LoopInfo and ScalarEvolution analyses
    //     LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
    //     ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();
    //     for (BasicBlock& BB : F) {
    //         uint32_t loopDepth = 0;
    //         uint32_t tripCount = 1;
    //         Loop* L = LI.getLoopFor(&BB);
    //         if (L) {
	// 			loopDepth = L->getLoopDepth();
    //             tripCount = getLoopTripCount(L, &SE);
    //         }
    //         for (Instruction& I : BB) {
    //             setMetadata(I, "loopDepth", loopDepth);
    //             setMetadata(I, "tripCount", tripCount);
    //         }
    //     }
    // }

    // uint32_t getLoopTripCount(Loop* L, ScalarEvolution* SE) {
    //     BasicBlock* exitingBlock = getExitingBlock(L, SE);
    //     if (exitingBlock) {
    //         return SE->getSmallConstantTripCount(L, exitingBlock);
    //     }
    //     return 0;
    // }

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