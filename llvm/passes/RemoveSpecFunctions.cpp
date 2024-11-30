#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include <string>
#include <vector>

using namespace llvm;

namespace {

struct RemoveSpecFunctions : ModulePass {
    static char ID;
    RemoveSpecFunctions() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "rmspec"
        LLVMContext& ctx = M.getContext();
        bool changed = false;
        std::vector<Function*> ssdmSpecIntrinsics;

        for (Function& F : M) {
            if (F.isIntrinsic() && F.hasName()) {
                if (F.getName().startswith("_ssdm_op_Spec") || F.getName().startswith("_ssdm_Spec")) {
                    ssdmSpecIntrinsics.push_back(&F);
                }
            }
        }

        for (Function* F : ssdmSpecIntrinsics) {
            if (!F->use_empty()) {
                changed = true;
                for (auto it = F->use_begin(); it != F->use_end(); ) {
                    Use& U = *it++;
                    User* user = U.getUser();
                    if (auto* callInst = dyn_cast<CallInst>(user)) {
                        callInst->eraseFromParent();
                    }
                }
            }
            F->eraseFromParent();
        }

        return changed;
    }
}; // struct RemoveSpecFunctions

}  // anonymous namespace

char RemoveSpecFunctions::ID = 0;
static RegisterPass<RemoveSpecFunctions> X("rmspec", "Remove all '_ssdm_op_Spec.*' functions from the module.", false, false);