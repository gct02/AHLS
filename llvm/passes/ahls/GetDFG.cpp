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

static cl::opt<std::string> outputFileName("dfg-file", cl::desc("Specify output filename for writing the DFG"), cl::value_desc("filename"));

namespace {

struct GetDFGPass : public ModulePass {
    static char ID;
    GetDFGPass() : ModulePass(ID) {}

    /*
    File structure:
    <num_nodes>
    <node_id_1>,<opcode_1>,<bitwidth_1>,<array_partition_1>,<loop_merge_1>,<pipeline_1>,<unroll_1>
    <node_id_2>,<opcode_2>,<bitwidth_2>,<array_partition_2>,<loop_merge_2>,<pipeline_2>,<unroll_2>
    ...
    <num_edges>
    <node_id_11>,<node_id_12>
    <node_id_21>,<node_id_22>
    ...
    */
    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "get-dfg"

        LLVMContext& ctx = M.getContext();

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

        int numNodes = 0, numEdges = 0;
        std::vector<std::vector<int>> nodeFeatures;
        std::vector<std::pair<int, int>> edges;

        for(Function& F : M) {
            for(BasicBlock& BB : F) {
                for(Instruction& I : BB) {
                    if (MDNode* opIDNode = I.getMetadata("opID")) {
                        numNodes++;

                        uint64_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
                        uint8_t opCode = I.getOpcode();
                        uint32_t bitwidth = I.getType()->getScalarSizeInBits();

                        std::vector<int> features({(int)opID,(int)opCode,(int)bitwidth,0,0,0,0,0,0,0,0,0});

                        MDTuple* arrayPartitionMDTuple = dyn_cast<MDTuple>(I.getMetadata("array_partition"));
                        MDTuple* loopMergeMDTuple = dyn_cast<MDTuple>(I.getMetadata("loop_merge"));
                        MDTuple* pipelineMDTuple = dyn_cast<MDTuple>(I.getMetadata("pipeline"));
                        MDTuple* unrollMDTuple = dyn_cast<MDTuple>(I.getMetadata("unroll"));

                        if (unrollMDTuple) {
                            features[3] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(0))->getValue())->getZExtValue();
                            features[4] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(1))->getValue())->getZExtValue();
                        }

                        if (arrayPartitionMDTuple) {
                            features[5] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(0))->getValue())->getZExtValue();
                            features[6] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(1))->getValue())->getZExtValue();
                            features[7] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(2))->getValue())->getZExtValue();
                            features[8] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(3))->getValue())->getZExtValue();
                        }

                        if (pipelineMDTuple) {
                            features[9] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(0))->getValue())->getZExtValue();
                            features[10] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(1))->getValue())->getZExtValue();
                        }

                        if (loopMergeMDTuple) {
                            features[11] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopMergeMDTuple->getOperand(0))->getValue())->getZExtValue();
                        }

                        nodeFeatures.push_back(features);

                        for (Use& U : I.uses()) {
                            if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                    numEdges++;
                                    uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                    edges.push_back(std::make_pair(opID, otherOpID));
                                }
                            }
                        }
                    }
                }
            }
        }

        outputFile << numNodes << "\n";
        for (int i = 0; i < numNodes; i++) {
            outputFile << nodeFeatures[i][0] << "," << nodeFeatures[i][1] << "," << nodeFeatures[i][2] << "," << nodeFeatures[i][3] << "," << nodeFeatures[i][4] << "," 
                       << nodeFeatures[i][5] << "," << nodeFeatures[i][6] << "," << nodeFeatures[i][7] << "," << nodeFeatures[i][8] << "," << nodeFeatures[i][9] << "," 
                       << nodeFeatures[i][10] << "," << nodeFeatures[i][11] << "\n";
        }

        outputFile << numEdges << "\n";
        for (int i = 0; i < numEdges; i++) {
            outputFile << edges[i].first << "," << edges[i].second << "\n";
        }

        outputFile.close();
        return true;
    }
};

}

char GetDFGPass::ID = 0;
static RegisterPass<GetDFGPass> X("get-dfg", "Get the module's DFG node features and edges", false, false);