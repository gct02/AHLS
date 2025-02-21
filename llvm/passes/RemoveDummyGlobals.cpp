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

#include <iostream>
#include <string>
#include <vector>
#include <utility>

using namespace llvm;

namespace {

struct RemoveDummyGlobals : public ModulePass {
    static char ID;
    RemoveDummyGlobals() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "rm-dummy-globals"

        std::vector<GlobalVariable*> dummyGlobals;

        for (GlobalVariable& GV : M.getGlobalList()) {
            // Check if the global variable is a parameter
            // that was extracted from a function by the 
            // ´prep-gnn´ pass
            MDNode* isParam = GV.getMetadata("param");
            if (isParam) {
                dummyGlobals.push_back(&GV);
            }
        }

        for (GlobalVariable* GV : dummyGlobals) {
            GV->eraseFromParent();
        }

        return true;
    }

}; // struct RemoveDummyGlobals

}  // anonymous namespace

char RemoveDummyGlobals::ID = 0;
static RegisterPass<RemoveDummyGlobals> X(
    "rm-dummy-globals", 
    "Remove the globals values created to represent function parameters", 
    false, false
);