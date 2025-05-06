#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <unordered_map>
#include <unordered_set>
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

struct AssignIdentifiersPass : public ModulePass {
    static char ID;
    AssignIdentifiersPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "assign-ids"

        setInstructionAndGlobalIDs(M);
        setRegionIDs(M);

        return false; // Module is not modified
    }

    void setRegionIDs(Module& M) {
        struct StackFrame {
            Loop* CurrentLoop;
            uint32_t ParentID;
        };

        LLVMContext& Ctx = M.getContext();
        uint32_t RegionID = 0;

        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            DEBUG(dbgs() << "Function: " << F.getName() << "\n");

            uint32_t FunctionID = RegionID++;
            ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(Ctx), FunctionID);
            F.setMetadata("id", MDNode::get(Ctx, {ConstantAsMetadata::get(CI)}));

            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    DEBUG(dbgs() << "Loop: " << *L << "\n");
                    std::stack<StackFrame> LoopStack;
                    LoopStack.push({L, FunctionID});

                    while (!LoopStack.empty()) {
                        StackFrame Frame = LoopStack.top();
                        LoopStack.pop();

                        Loop* CurrLoop = Frame.CurrentLoop;
                        uint32_t ParentID = Frame.ParentID;

                        ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(M.getContext()), RegionID);
                        MDNode* IDMDNode = MDNode::get(M.getContext(), {NULL, ConstantAsMetadata::get(CI)});
                        IDMDNode->replaceOperandWith(0, IDMDNode);
                        CurrLoop->setLoopID(IDMDNode);

                        for (Loop* SubLoopID : CurrLoop->getSubLoops()) {
                            LoopStack.push({SubLoopID, RegionID});
                        }
                        RegionID++;
                    }
                }
            }
        }
    }

    void setInstructionAndGlobalIDs(Module& M) {
        LLVMContext& Ctx = M.getContext();
        uint32_t ID = 0;
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    DEBUG(dbgs() << "Instruction: " << I << "\n");
                    ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(Ctx), ID);
                    I.setMetadata("id." + std::to_string(ID), MDNode::get(Ctx, {ConstantAsMetadata::get(CI)}));
                    I.setMetadata("id", MDNode::get(Ctx, {ConstantAsMetadata::get(CI)}));
                    ID++;
                }
            }
        }
        for (GlobalObject& G : M.getGlobalList()) {
            DEBUG(dbgs() << "Global: " << G.getName() << "\n");
            ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(Ctx), ID);
            G.setMetadata("id." + std::to_string(ID), MDNode::get(Ctx, {ConstantAsMetadata::get(CI)}));
            G.setMetadata("id", MDNode::get(Ctx, {ConstantAsMetadata::get(CI)}));
            ID++;
        }
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<ScalarEvolutionWrapperPass>();
    }
}; 
// End struct AssignIdentifiersPass

} 
// End namespace

char AssignIdentifiersPass::ID = 0;
static RegisterPass<AssignIdentifiersPass> X(
    "assign-ids", 
    "Assign identifiers to functions, instructions and global objects as metadata",
    false, false
);