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
#include <cstdint>
#include <utility>

using namespace llvm;

namespace
{
struct RemoveHintScopeIntrinsics : ModulePass
{
    static char ID;
    RemoveHintScopeIntrinsics() : ModulePass(ID) {}

    bool runOnModule(Module& M) override
    {
        #define DEBUG_TYPE "remove-hint-scope"

        LLVMContext& ctx = M.getContext();

        // Remove all uses of the 'llvm.hint.scope.exit' intrinsic
        Function* hintScopeExit = M.getFunction("llvm.hint.scope.exit");
        if (!hintScopeExit)
            return false;

        for (auto it = hintScopeExit->use_begin(); it != hintScopeExit->use_end(); ) {
            Use& U = *it++;
            User* user = U.getUser();
            if (auto* callInst = dyn_cast<CallInst>(user)) {
                callInst->print(errs());
                IRBuilder<> builder(callInst);
                callInst->replaceAllUsesWith(UndefValue::get(callInst->getType()));
                callInst->eraseFromParent();
            }
        }
        hintScopeExit->eraseFromParent();

        // Remove all uses of the 'llvm.hint.scope.entry' intrinsic
        Function* hintScopeEntry = M.getFunction("llvm.hint.scope.entry");
        for (auto it = hintScopeEntry->use_begin(); it != hintScopeEntry->use_end(); ) {
            Use& U = *it++;
            User* user = U.getUser();
            if (auto* callInst = dyn_cast<CallInst>(user)) {
                callInst->print(errs());
                IRBuilder<> builder(callInst);
                callInst->replaceAllUsesWith(UndefValue::get(callInst->getType()));
                callInst->eraseFromParent();
            }
        }
        hintScopeEntry->eraseFromParent();
        
        return true;
    }
};
} // namespace

char RemoveHintScopeIntrinsics::ID = 0;
static RegisterPass<RemoveHintScopeIntrinsics> X("remove-hint-scope", "Remove llvm.hint.scope.enter and llvm.hint.scope.exit intrinsics", false, false);
