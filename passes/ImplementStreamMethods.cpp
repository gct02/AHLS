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
#include "llvm/IR/XILINXHLSIRBuilder.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/Debug.h"
#include "llvm/IRReader/IRReader.h"

#include <string>
#include <vector>
#include <cstdint>
#include <utility>

using namespace llvm;

static cl::opt<std::string> swLLVMIR("swir", cl::desc("IR of the same source code as the module we are transforming, but generated with pure LLVM"), cl::value_desc("filename"));

namespace
{
struct ImplementStreamMethods : ModulePass
{
    static char ID;
    ImplementStreamMethods() : ModulePass(ID) {}

    bool runOnModule(Module& M) override
    {
        #define DEBUG_TYPE "impl-stream"

        LLVMContext& ctx = M.getContext();
        LLVMContext globalCtx;
        SMDiagnostic err;
        std::unique_ptr<Module> swModule = parseIRFile(swLLVMIR, err, globalCtx);

        if (!swModule) {
            errs() << "Failed to load the IR file\n";
            return false;
        }

        Module& swM = *swModule.get();
        
        // Insert all stream_globals functions from the software module into the HLS module
        for (Function& F : swM) {
            if (F.getName().startswith("_ZN3hls14stream_globals")) {
                DEBUG(dbgs() << F.getName().str() << "\n");
                Function* newFunc = Function::Create(F.getFunctionType(), Function::ExternalLinkage, F.getName(), &M);
                newFunc->copyAttributesFrom(&F);
            }
        }

        // Insert all stream_entity functions from the software module into the HLS module
        for (Function& F : swM) {
            if (F.getName().startswith("_ZN3hls13stream_entity")) {
                DEBUG(dbgs() << F.getName().str() << "\n");
                Function* newFunc = Function::Create(F.getFunctionType(), Function::ExternalLinkage, F.getName(), &M);
                newFunc->copyAttributesFrom(&F);
            }
        }
        
        // Replace all stream functions from the HLS module with the correspondent stream function from the software module
        for (Function& F : M) {
            if (F.getName().startswith("_ZN3hls6stream")) {
                DEBUG(dbgs() << F.getName().str() << "\n");
                Function* swF = swM.getFunction(F.getName());
                if (!swF) {
                    // Remove all uses of the stream function
                    for (auto it = F.use_begin(); it != F.use_end(); ) {
                        Use& U = *it++;
                        User* user = U.getUser();
                        if (auto* callInst = dyn_cast<CallInst>(user)) {
                            callInst->eraseFromParent();
                        }
                    }
                    F.eraseFromParent();
                    continue;
                }

                FunctionType* FT = swF->getFunctionType();
                Function* newFunc = Function::Create(FT, Function::ExternalLinkage, swF->getName(), &M);
                newFunc->copyAttributesFrom(swF);

                // Replace calls to the HLS stream function with calls to the software stream function
                for (auto it = F.use_begin(); it != F.use_end(); ) {
                    Use& U = *it++;
                    User* user = U.getUser();
                    if (auto* callInst = dyn_cast<CallInst>(user)) {
                        IRBuilder<> builder(callInst);
                        callInst->print(dbgs());
                        std::vector<Value*> args;
                        for (unsigned i = 0; i < callInst->getNumArgOperands(); i++) {
                            // Cast the argument to the type of the software function
                            Value* arg = callInst->getArgOperand(i);
                            if (arg->getType() != FT->getParamType(i)) {
                                arg = builder.CreateBitCast(arg, FT->getParamType(i));
                            }
                            args.push_back(arg);
                        }
                        CallInst* newCallInst = builder.CreateCall(newFunc, args);
                        callInst->replaceAllUsesWith(newCallInst);
                        callInst->eraseFromParent();
                    }
                }
                F.eraseFromParent();
            }
        }

        return true;
    }
};
} // namespace

char ImplementStreamMethods::ID = 0;
static RegisterPass<ImplementStreamMethods> X("impl-stream", "Implement Stream Methods Pass", false, false);