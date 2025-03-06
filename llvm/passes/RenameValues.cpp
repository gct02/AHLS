#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"

#include <string>

#include "HLSDSEUtils.h"

using namespace llvm;

namespace {

struct RenameValues : ModulePass {
    static char ID;
    RenameValues() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "rename-vals"

        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (I.getType()->isVoidTy()) continue;
                    if (MDNode* idMD = I.getMetadata("opID")) {
                        uint32_t id = getIntMDOperand(idMD);
                        I.setName("op." + std::to_string(id));
                    }
                }
            }
        }

        for (GlobalVariable& GV : M.getGlobalList()) {
            // Check if the global variable is an extracted parameter 
            // (see `TransformForCDFGExtraction.cpp`)
            if (MDNode* isParam = GV.getMetadata("param")) continue;
            if (MDNode* idMD = GV.getMetadata("globalID")) {
                uint32_t id = getIntMDOperand(idMD);
                GV.setName("global." + std::to_string(id));
            }
        }

        return true;
    }
}; // struct RenameValues

} // anonymous namespace

char RenameValues::ID = 0;
static RegisterPass<RenameValues> X(
    "rename-vals", 
    "Rename instructions to op.<ID> and global variables to global.<ID> if global (note: this pass should be used after `update-md`.)", 
    false, false
);