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

static cl::opt<std::string> outputFileName("u", cl::desc("Specify output filename for writing the operations of the module and its uses"), cl::value_desc("filename"));

namespace {

struct GetOpUsesPass : public ModulePass {
    static char ID;
    GetOpUsesPass() : ModulePass(ID) {}
    
    bool runOnModule(Module &M) override {
        #define DEBUG_TYPE "get-uses"

        LLVMContext &ctx = M.getContext();

        NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opCounter");
        if (counterNamedMDNode->getNumOperands() == 0) {
            errs() << "Error: IR without opID metadata\n";
            return false;
        }
        uint64_t numOps = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(counterNamedMDNode->getOperand(0)->getOperand(0))->getValue())->getZExtValue();
        std::vector<std::vector<uint64_t>> adjList(numOps, std::vector<uint64_t>());

        for (Function& F : M) {
            // Skip "part_select" and "part_set" functions (implementations of "llvm.legacy.part.*" intrinsics)
            // if (F.getName().startswith("part_select") || F.getName().startswith("part_set"))
            //    continue;
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (MDNode* opIDNode = I.getMetadata("opID")) {
                        uint64_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
                        for (Use& U : I.uses()) {
                            if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                    uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                    adjList[opID - 1].push_back(otherOpID);
                                }
                            }
                        }
                    }
                }
            }
        }

        // Write the adjacency list to the output file.
        std::ofstream outputFile(outputFileName);
        if (!outputFile.is_open()) {
            errs() << "Error opening file " << outputFileName << "\n";
            return false;
        }
        for (uint64_t i = 0; i < numOps; i++) {
            outputFile << i + 1 << ":";
            for (uint64_t j : adjList[i]) {
                outputFile << " " << j;
            }
            outputFile << "\n";
        }

        return true;
    }
};

}

char GetOpUsesPass::ID = 0;
static RegisterPass<GetOpUsesPass> X("get-uses", "Get the usage relationship (uses/is used by) of the operations in the module", false, false);