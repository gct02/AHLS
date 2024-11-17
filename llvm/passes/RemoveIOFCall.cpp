#include "llvm/Analysis/CallGraph.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <string>
#include <cstdint>

using namespace llvm;

namespace {

struct RemoveIOFCall : public ModulePass {
    static char ID;
    RemoveIOFCall() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        bool modified = false; 

        for (Function& F : M) {
            for (BasicBlock& B : F) {
                for (BasicBlock::iterator BIter = B.begin(), BE = B.end(); BIter != BE; ++BIter) { 
                    Instruction& I = *BIter;
                    if (auto* call = dyn_cast<CallInst>(&I)) {
                        Function* calledFunction = call->getCalledFunction();
                        StringRef functionName = calledFunction->getName();
                        if (functionName == "populateInput" || functionName == "populateOutput") {
                            call->eraseFromParent();
                            calledFunction->eraseFromParent();
                            modified = true;
                        }
                    }
                }
            }
        }
        return modified;
    }
}; // struct RemoveIOFCall

}  // anonymous namespace

char RemoveIOFCall::ID = 0;
static RegisterPass<RemoveIOFCall> X("rmiof", "Remove calls to 'populateInput' and 'populateOutput' functions.");