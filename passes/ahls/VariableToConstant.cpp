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
#include <vector>
#include <list>
#include <cstdint>

using namespace llvm;

static cl::opt<std::string> opToPrune("opid", cl::desc("Specify the ID of the operation to be pruned."), cl::value_desc("operationID"));
static cl::opt<std::string> opValue("const", cl::desc("Specify the constant value to replace the operation."), cl::value_desc("operationValue"));

namespace {

struct V2CPass : public ModulePass {
    static char ID;
    V2CPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "v2c"

        LLVMContext& ctx = M.getContext();

        uint64_t opToPruneID = std::stoull(opToPrune);
        double opValDouble = std::stod(opValue);

        bool modified = false;

        for (Module::iterator MIter = M.begin(), ME = M.end(); MIter != ME; ++MIter) {
            Function &F = *MIter;
            for (Function::iterator FIter = F.begin(), FE = F.end(); FIter != FE; ++FIter) {
                BasicBlock &BB = *FIter;
                for (BasicBlock::iterator BBIter = BB.begin(), BBE = BB.end(); BBIter != BBE; ++BBIter) { 
                    Instruction& I = *BBIter;
                    if (auto opID = I.getMetadata("opID")) {
                        uint64_t opIDVal = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opID->getOperand(0))->getValue())->getZExtValue();
                        if (opIDVal == opToPruneID) {
                            DEBUG(dbgs() << "Found operation with ID " << opIDVal << "\n");
                            if (I.getType()->isFloatingPointTy()) {
                                ReplaceInstWithValue(BB.getInstList(), BBIter, ConstantFP::get(I.getType(), opValDouble));
                                modified = true;
                            } else if (I.getType()->isIntegerTy()) {
                                ReplaceInstWithValue(BB.getInstList(), BBIter, ConstantInt::get(I.getType(), opValDouble));
                                modified = true;
                            }
                            DEBUG(dbgs() << "Replaced operation with constant value " << opValDouble << "\n");
                            break;
                        }
                    }
                }
            }
        }
        return modified;
    }
};

}

char V2CPass::ID = 0;
static RegisterPass<V2CPass> X("v2c", "Replace the result of an operation with a constant value", false, false);