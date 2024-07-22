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

                        MDTuple* arrayPartitionMDTuple = dyn_cast<MDTuple>(I.getMetadata("array_partition"));
                        MDTuple* loopMergeMDTuple = dyn_cast<MDTuple>(I.getMetadata("loop_merge"));
                        MDTuple* pipelineMDTuple = dyn_cast<MDTuple>(I.getMetadata("pipeline"));
                        MDTuple* unrollMDTuple = dyn_cast<MDTuple>(I.getMetadata("unroll"));

                        outputFile << opID << "," << (int)opCode << "," << bitwidth;

                        if (unrollMDTuple) {
                            uint32_t unroll = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t unrollFactor = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(1))->getValue())->getZExtValue();
                            outputFile << "," << unroll << "," << unrollFactor;
                        } else {
                            outputFile << ",0,0";
                        }

                        if (arrayPartitionMDTuple) {
                            uint32_t arrayPartition = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t arrayPartitionType = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(1))->getValue())->getZExtValue();
                            uint32_t arrayPartitionFactor = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(2))->getValue())->getZExtValue();
                            uint32_t arrayPartitionDim = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(3))->getValue())->getZExtValue();
                            outputFile << "," << arrayPartition << "," << arrayPartitionType << "," << arrayPartitionFactor << "," << arrayPartitionDim;
                        } else {
                            outputFile << ",0,0,0,0";
                        }

                        if (pipelineMDTuple) {
                            uint32_t pipeline = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t pipelineII = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(1))->getValue())->getZExtValue();
                            outputFile << "," << pipeline << "," << pipelineII;
                        } else {
                            outputFile << ",0,0";
                        }

                        if (loopMergeMDTuple) {
                            uint32_t loopMerge = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopMergeMDTuple->getOperand(0))->getValue())->getZExtValue();
                            outputFile << "," << loopMerge;
                        } else {
                            outputFile << ",0";
                        }
                        
                        outputFile << "\n";
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
static RegisterPass<GetDFGNodesPass> X("get-nodes", "Get operations metadata as features for the DFG nodes", false, false);