#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <utility>

using namespace llvm;

static cl::opt<std::string> outputFile(
    "md", 
    cl::desc("Path to the file where the module's metadata should be written"), 
    cl::value_desc("filepath")
);

namespace {

struct Metadata {
    std::string name;
    std::unordered_map<std::string, uint32_t> values;
};

using MetadataDict = std::unordered_map<std::string, std::vector<Metadata>>;

struct ExtractMD : public ModulePass {
    static char ID;
    ExtractMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        MetadataDict md;

        getGlobalValuesMD(md, M);
        getInstructionsMD(md, M);

        std::ofstream out(outputFile);
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return false;
        }

        for (auto& [type, metadata] : md) {
            out << type << ":\n";
            for (Metadata& m : metadata) {
                out << "  " << m.name << ":\n";
                for (auto& [key, value] : m.values) {
                    out << "    " << key << ": " << value << "\n";
                }
            }
        }

        return false; // Module is not modified
    }

    void getGlobalValuesMD(MetadataDict& md, Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Metadata m;

            m.name = G.getName().str();
            m.values["globalID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("globalID")->getOperand(0))->getValue())->getZExtValue();
            m.values["bitwidth"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("bitwidth")->getOperand(0))->getValue())->getZExtValue();
            m.values["type"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("type")->getOperand(0))->getValue())->getZExtValue();

            MDNode* isArray = G.getMetadata("isArray");
            if (isArray) {
                m.values["numDims"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("numDims")->getOperand(0))->getValue())->getZExtValue();
                m.values["numElements"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("numElements")->getOperand(0))->getValue())->getZExtValue();
                m.values["elementType"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("elementType")->getOperand(0))->getValue())->getZExtValue();
                m.values["elementBitwidth"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(G.getMetadata("elementBitwidth")->getOperand(0))->getValue())->getZExtValue();

                MDNode* isTopLevelParam = G.getMetadata("top");
                if (isTopLevelParam) {
                    m.values["top"] = 1;
                    m.name = G.getName().str().substr(G.getName().str().find(".") + 1);
                    md["top_level_array"].push_back(m);
                } else {
                    md["global_array"].push_back(m);
                }
            } else {
                md["global_variable"].push_back(m);
            }
        }
    }

    void getInstructionsMD(MetadataDict& md, Module& M) {
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    // Get metadata for the instruction
                    Metadata instMD;
                    instMD.name = I.getName().str();
                    instMD.values["opID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("opID")->getOperand(0))->getValue())->getZExtValue();
                    instMD.values["functionID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("functionID")->getOperand(0))->getValue())->getZExtValue();
                    instMD.values["bbID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("bbID")->getOperand(0))->getValue())->getZExtValue();
                    instMD.values["opcode"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("opcode")->getOperand(0))->getValue())->getZExtValue();

                    if (MDNode* loopDepth = I.getMetadata("loopDepth")) {
                        instMD.values["loopDepth"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopDepth->getOperand(0))->getValue())->getZExtValue();
                    }
                    if (MDNode* tripCount = I.getMetadata("tripCount")) {
                        instMD.values["tripCount"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(tripCount->getOperand(0))->getValue())->getZExtValue();
                    }
                    if (MDNode* pipelineMD = I.getMetadata("pipeline")) {
                        instMD.values["pipeline"] = 1;
                        instMD.values["pipelineID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMD->getOperand(0))->getValue())->getZExtValue();
                        instMD.values["pipelineII"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMD->getOperand(1))->getValue())->getZExtValue();
                    }
                    if (MDNode* unrollMD = I.getMetadata("unroll")) {
                        instMD.values["unroll"] = 1;
                        instMD.values["unrollID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMD->getOperand(0))->getValue())->getZExtValue();
                        instMD.values["unrollComplete"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMD->getOperand(1))->getValue())->getZExtValue();
                        instMD.values["unrollFactor"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMD->getOperand(2))->getValue())->getZExtValue();
                    }
                    if (MDNode* loopFlattenMD = I.getMetadata("loopFlatten")) {
                        instMD.values["loopFlatten"] = 1;
                        instMD.values["loopFlattenID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopFlattenMD->getOperand(0))->getValue())->getZExtValue();
                    }
                    if (MDNode* loopMergeMD = I.getMetadata("loopMerge")) {
                        instMD.values["loopMerge"] = 1;
                        instMD.values["loopMergeID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopMergeMD->getOperand(0))->getValue())->getZExtValue();
                    }

                    md["instruction"].push_back(instMD);

                    // Get metadata for the value produced by the instruction
                    Metadata valMD;

                    valMD.name = I.getName().str();
                    valMD.values["opID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("opID")->getOperand(0))->getValue())->getZExtValue();
                    valMD.values["bitwidth"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("bitwidth")->getOperand(0))->getValue())->getZExtValue();
                    valMD.values["valueType"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("valueType")->getOperand(0))->getValue())->getZExtValue();

                    MDNode* isArray = I.getMetadata("isArray");
                    if (isArray) {
                        valMD.values["numDims"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("numDims")->getOperand(0))->getValue())->getZExtValue();
                        valMD.values["numElements"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("numElements")->getOperand(0))->getValue())->getZExtValue();
                        valMD.values["elementType"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("elementType")->getOperand(0))->getValue())->getZExtValue();
                        valMD.values["elementBitwidth"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I.getMetadata("elementBitwidth")->getOperand(0))->getValue())->getZExtValue();
                        if (MDNode* arrayPartition = I.getMetadata("arrayPartition")) {
                            valMD.values["arrayPartition"] = 1;
                            valMD.values["arrayPartitionID"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(0))->getValue())->getZExtValue();
                            valMD.values["arrayPartitionDim"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(1))->getValue())->getZExtValue();
                            valMD.values["arrayPartitionType"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(2))->getValue())->getZExtValue();
                            valMD.values["arrayPartitionFactor"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(3))->getValue())->getZExtValue();
                            valMD.values["arrayPartitionDimSize"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(4))->getValue())->getZExtValue();
                            valMD.values["arrayPartitionNumPartitions"] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartition->getOperand(5))->getValue())->getZExtValue();
                        }
                        md["local_array"].push_back(valMD);
                    } else {
                        md["local_variable"].push_back(valMD);
                    }
                }
            }
        }
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
    }

}; // struct ExtractMD

}  // anonymous namespace

char ExtractMD::ID = 0;
static RegisterPass<ExtractMD> X("extract-md", "Extract metadata from the module", false, false);