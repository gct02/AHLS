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
#include <cstdint>
#include <fstream>

using namespace llvm;

static cl::opt<std::string> outputFileName("ef", cl::desc("Specify output filename for writing the edges of the module's DFG"), cl::value_desc("filename"));

namespace {

struct GetDFGEdgesPass : public ModulePass {
    static char ID;
    GetDFGEdgesPass() : ModulePass(ID) {}
    
    bool runOnModule(Module &M) override {
        #define DEBUG_TYPE "get-edges"

        LLVMContext &ctx = M.getContext();

        NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opCounter");
        if (counterNamedMDNode->getNumOperands() == 0) {
            errs() << "Error: IR without opID metadata\n";
            return false;
        }

        std::ofstream outputFile(outputFileName);
        if (!outputFile.is_open()) {
            errs() << "Error opening file " << outputFileName << "\n";
            return false;
        }

        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (MDNode* opIDNode = I.getMetadata("opID")) {
                        uint64_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
                        for (Use& U : I.uses()) {
                            if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                    uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                    outputFile << opID << "," << otherOpID << "\n";
                                }
                            }
                        }
                    }
                }
            }
        }
        outputFile.close();
        return true;
    }
};

}

char GetDFGEdgesPass::ID = 0;
static RegisterPass<GetDFGEdgesPass> X("get-edges", "Get the edges of the module's DFG", false, false);