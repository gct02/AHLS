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

        uint64_t numNodes = 0, numEdges = 0;
        std::vector<int[12]> nodeFeatures;
        std::vector<std::pair<int, int>> edges;

        for(Function& F : M) {
            for(BasicBlock& BB : F) {
                for(Instruction& I : BB) {
                    if (MDNode* opIDNode = I.getMetadata("opID")) {
                        numNodes++;

                        uint64_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
                        uint8_t opCode = I.getOpcode();
                        uint32_t bitwidth = I.getType()->getScalarSizeInBits();

                        int features[12] = {opID,opCode,bitwidth,0,0,0,0,0,0,0,0,0};

                        MDTuple* arrayPartitionMDTuple = dyn_cast<MDTuple>(I.getMetadata("array_partition"));
                        MDTuple* loopMergeMDTuple = dyn_cast<MDTuple>(I.getMetadata("loop_merge"));
                        MDTuple* pipelineMDTuple = dyn_cast<MDTuple>(I.getMetadata("pipeline"));
                        MDTuple* unrollMDTuple = dyn_cast<MDTuple>(I.getMetadata("unroll"));

                        if (unrollMDTuple) {
                            uint32_t unroll = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t unrollFactor = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(1))->getValue())->getZExtValue();
                            features[3] = unroll;
                            features[4] = unrollFactor;
                        }

                        if (arrayPartitionMDTuple) {
                            uint32_t arrayPartition = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t arrayPartitionType = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(1))->getValue())->getZExtValue();
                            uint32_t arrayPartitionFactor = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(2))->getValue())->getZExtValue();
                            uint32_t arrayPartitionDim = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(3))->getValue())->getZExtValue();
                            features[5] = arrayPartition;
                            features[6] = arrayPartitionType;
                            features[7] = arrayPartitionFactor;
                            features[8] = arrayPartitionDim;
                        }

                        if (pipelineMDTuple) {
                            uint32_t pipeline = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(0))->getValue())->getZExtValue();
                            uint32_t pipelineII = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(1))->getValue())->getZExtValue();
                            features[9] = pipeline;
                            features[10] = pipelineII;
                        }

                        if (loopMergeMDTuple) {
                            uint32_t loopMerge = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopMergeMDTuple->getOperand(0))->getValue())->getZExtValue();
                            features[11] = loopMerge;
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