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
struct RemoveFIFOIntrinsics : ModulePass
{
    static char ID;
    RemoveFIFOIntrinsics() : ModulePass(ID) {}

    bool runOnModule(Module& M) override
    {
        #define DEBUG_TYPE "remove-fifo"

        LLVMContext& ctx = M.getContext();

        // Remove 'llvm.fpga.fifo.pop.*' intrinsics and all of its uses from the module
        std::vector<Function*> popIntrinsics;
        for (auto& F : M) {
            if (F.getName().startswith("llvm.fpga.fifo.pop.")) {
                popIntrinsics.push_back(&F);
            }
        }
        for (Function* popIntrinsic : popIntrinsics) {
            for (auto it = popIntrinsic->use_begin(); it != popIntrinsic->use_end(); ) {
                Use& U = *it++;
                User* user = U.getUser();
                if (auto* callInst = dyn_cast<CallInst>(user)) {
                    // First, remove the instruction next to the pop intrinsic call instruction
                    // (which is a store instruction)
                    auto nextInst = callInst->getNextNode();
                    if (auto* storeInst = dyn_cast<StoreInst>(nextInst)) {
                        storeInst->print(errs());
                        storeInst->replaceAllUsesWith(UndefValue::get(storeInst->getType()));
                        storeInst->eraseFromParent();
                    }
                    // Then, remove the pop intrinsic call instruction
                    callInst->print(errs());
                    callInst->replaceAllUsesWith(UndefValue::get(callInst->getType()));
                    callInst->eraseFromParent();
                }
            }
            popIntrinsic->eraseFromParent();
        }

        // Remove 'llvm.fpga.fifo.push.*' intrinsics and all of its uses from the module
        std::vector<Function*> pushIntrinsics;
        for (auto& F : M) {
            if (F.getName().startswith("llvm.fpga.fifo.push.")) {
                pushIntrinsics.push_back(&F);
            }
        }
        for (Function* pushIntrinsic : pushIntrinsics) {
            for (auto it = pushIntrinsic->use_begin(); it != pushIntrinsic->use_end(); ) {
                Use& U = *it++;
                User* user = U.getUser();
                if (auto* callInst = dyn_cast<CallInst>(user)) {
                    callInst->print(errs());
                    callInst->replaceAllUsesWith(UndefValue::get(callInst->getType()));
                    callInst->eraseFromParent();
                }
            }
            pushIntrinsic->eraseFromParent();
        }

        /*
        std::vector<Function*> fifoIntrinsics;
        for (auto& F : M) {
            if (F.getName().startswith("llvm.fpga.fifo.")) {
                fifoIntrinsics.push_back(&F);
            }
        }

        for (Function* fifoIntrinsic : fifoIntrinsics) {
            for (auto it = fifoIntrinsic->use_begin(); it != fifoIntrinsic->use_end(); ) {
                Use& U = *it++;
                User* user = U.getUser();
                if (auto* callInst = dyn_cast<CallInst>(user)) {
                    callInst->print(errs());
                    IRBuilder<> builder(callInst);
                    callInst->replaceAllUsesWith(UndefValue::get(callInst->getType()));
                    callInst->eraseFromParent();
                }
            }
            fifoIntrinsic->eraseFromParent();
        }
        */
        
        return true;
    }
};
}

char RemoveFIFOIntrinsics::ID = 0;
static RegisterPass<RemoveFIFOIntrinsics> X("remove-fifo", "Remove all 'llvm.fpga.fifo.*' intrinsics", false, false);
