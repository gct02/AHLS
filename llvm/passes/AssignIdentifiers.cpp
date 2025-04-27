#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <unordered_map>
#include <unordered_set>

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

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

using namespace llvm;

namespace {

struct AssignIdentifiersPass : public ModulePass {
    static char ID;
    AssignIdentifiersPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "assign-ids"

        if (M.empty()) return false;

        setFunctionIDs(M);
        setLoopIDs(M);
        setInstructionIDs(M);
        setGlobalIDs(M);

        return true; // Module is modified (instructions and globals renamed)
    }

    void setFunctionIDs(Module& M) {
        LLVMContext& ctx = M.getContext();
        uint32_t id = 0;
        for (Function& F : M) {
            ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(ctx), id++);
            F.setMetadata("id", MDNode::get(ctx, {ConstantAsMetadata::get(CI)}));
        }
    }

    void setInstructionIDs(Module& M) {
        LLVMContext& ctx = M.getContext();
        uint32_t id = 0;
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(ctx), id);
                    I.setMetadata("id." + std::to_string(id), MDNode::get(ctx, {ConstantAsMetadata::get(CI)}));
                    I.setMetadata("id", MDNode::get(ctx, {ConstantAsMetadata::get(CI)}));
                    id++;
                }
            }
        }
    }

    void setGlobalIDs(Module& M) {
        LLVMContext& ctx = M.getContext();
        uint32_t id = 0;
        for (GlobalObject& G : M.getGlobalList()) {
            ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(ctx), id);
            G.setMetadata("id." + std::to_string(id), MDNode::get(ctx, {ConstantAsMetadata::get(CI)}));
            G.setMetadata("id", MDNode::get(ctx, {ConstantAsMetadata::get(CI)}));
            id++;
        }
    }

    void setLoopIDs(Module& M) {
        struct StackFrame {
            Loop* loop;
            uint32_t parentID;
        };

        uint32_t loopID = M.getFunctionList().size() + 1;

        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            uint32_t functionID = (uint32_t)cast<ConstantInt>(
                dyn_cast<ConstantAsMetadata>(F.getMetadata("id")->getOperand(0))->getValue()
            )->getZExtValue();

            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<StackFrame> loopStack;
                    loopStack.push({L, functionID});

                    while (!loopStack.empty()) {
                        StackFrame frame = loopStack.top();
                        loopStack.pop();

                        Loop* currLoop = frame.loop;
                        uint32_t parentID = frame.parentID;

                        ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(M.getContext()), loopID);
                        currLoop->setLoopID(MDNode::get(M.getContext(), {ConstantAsMetadata::get(CI)}));

                        for (Loop* subLoop : currLoop->getSubLoops()) {
                            loopStack.push({subLoop, loopID});
                        }
                        loopID++;
                    }
                }
            }
        }
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<ScalarEvolutionWrapperPass>();
    }

}; // struct AssignIdentifiersPass

} // anonymous namespace

char AssignIdentifiersPass::ID = 0;
static RegisterPass<AssignIdentifiersPass> X(
    "assign-ids", 
    "Assign identifiers to functions, instructions and global objects as metadata",
    false, false
);