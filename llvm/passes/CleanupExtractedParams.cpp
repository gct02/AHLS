#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <vector>

using namespace llvm;

namespace {

struct CleanupExtractedParams : public ModulePass {
    static char ID;
    CleanupExtractedParams() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "cleanup-extracted-params"

        std::vector<GlobalVariable*> extractedParams;
        for (GlobalVariable& GV : M.getGlobalList()) {
            if (GV.getMetadata("param")) {
                extractedParams.push_back(&GV);
            }
        }
        for (GlobalVariable* GV : extractedParams) {
            GV->eraseFromParent();
        }
        return true;
    }
}; // struct CleanupExtractedParams

} // anonymous namespace

char CleanupExtractedParams::ID = 0;
static RegisterPass<CleanupExtractedParams> X(
    "cleanup-extracted-params",
    "Remove the global values created to represent function parameters (see `TransformForCDFGExtraction.cpp`.)", 
    false, false
);