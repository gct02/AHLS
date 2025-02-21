#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"

#include <string>
#include <vector>
#include <cstdint>

using namespace llvm;

namespace {

struct RenameValues : ModulePass {
    static char ID;
    RenameValues() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "rename-vals"

        for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
            Function* F = &*FI;
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                    Instruction* I = &*II;
                    if (!I->getType()->isVoidTy()) {
                        if (MDNode* opIDMDNode = I->getMetadata("opID")) {
                            uint32_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDMDNode->getOperand(0))->getValue())->getZExtValue();
                            std::string newName = "op." + std::to_string(opID);
                            I->setName(newName);
                        }
                    }
                }
            }
        }

        for (GlobalVariable& GV : M.getGlobalList()) {
            // Check if the global variable is a parameter
            // that was extracted from a function by the 
            // ´prep-gnn´ pass
            MDNode* isParam = GV.getMetadata("param");
            if (isParam) {
                continue;
            }
            if (MDNode* globalIDMDNode = GV.getMetadata("globalID")) {
                uint32_t globalID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(globalIDMDNode->getOperand(0))->getValue())->getZExtValue();
                std::string newName = "global." + std::to_string(globalID);
                GV.setName(newName);
            }
        }

        return true;
    }
}; // struct RenameValues

}  // anonymous namespace

char RenameValues::ID = 0;
static RegisterPass<RenameValues> X(
    "rename-vals", 
    "Rename all variables in the module to op.<opID> if local or global.<globalID> if global. This pass should be used after `update-md`.", 
    false, false
);