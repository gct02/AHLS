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

static cl::opt<std::string> outputFileName("nf", cl::desc("Specify output filename for writing the node features of the module's DFG"), cl::value_desc("filename"));

namespace {

struct GetDFGNodesPass : public ModulePass {
    static char ID;
    GetDFGNodesPass() : ModulePass(ID) {}
    
    bool runOnModule(Module &M) override {
        #define DEBUG_TYPE "get-nodes"

        LLVMContext &ctx = M.getContext();

        NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opCounter");
        if (counterNamedMDNode->getNumOperands() == 0) {
            errs() << "Error: IR without opID metadata\n";
            return false;
        }
        uint64_t numOps = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(counterNamedMDNode->getOperand(0)->getOperand(0))->getValue())->getZExtValue();

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
                        uint8_t opCode = I.getOpcode();
                        uint32_t bitwidth = I.getType()->getScalarSizeInBits();
                        outputFile << opID << "," << (int)opCode << "," << bitwidth << "\n";
                    }
                }
            }
        }
        outputFile.close();

        return true;
    }
};

}

char GetDFGNodesPass::ID = 0;
static RegisterPass<GetDFGNodesPass> X("get-nodes", "Get features (opID, opCode, bitwidth) from the module's DFG nodes", false, false);