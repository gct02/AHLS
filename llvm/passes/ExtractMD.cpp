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
    "out-md", 
    cl::desc("Path to the file where the module's metadata should be written"), 
    cl::value_desc("filepath")
);

namespace {

typedef struct {
    std::string functionName;
    std::string name;
    std::unordered_map<std::string, uint32_t> values;
} Metadata;

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

        for (auto& type_metadata_pair : md) {
            const auto& type = type_metadata_pair.first;
            const auto& metadata = type_metadata_pair.second;

            out << type << ":\n";
            for (const Metadata& m : metadata) {
                out << "  " << m.name << ":\n";
                if (!m.functionName.empty()) {
                    out << "    functionName: " << m.functionName << "\n";
                }
                for (const auto& key_value_pair : m.values) {
                    const auto& key = key_value_pair.first;
                    const auto& value = key_value_pair.second;
                    out << "    " << key << ": " << value << "\n";
                }
            }
        }

        return false; // Module is not modified
    }

    uint32_t MDOperandToInt(MDNode* md, uint32_t index) {
        return cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(md->getOperand(index))->getValue())->getZExtValue();
    }

    uint32_t getMDOperandValue(Value& V, StringRef name, uint32_t index, uint32_t defaultValue=0) {
        MDNode* md = nullptr;
        if (Instruction* I = dyn_cast<Instruction>(&V)) {
            md = I->getMetadata(name);
        } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
            md = G->getMetadata(name);
        } else if (Function* F = dyn_cast<Function>(&V)) {
            md = F->getMetadata(name);
        }
        return md == nullptr ? defaultValue : MDOperandToInt(md, index);
    }

    void getGlobalValuesMD(MetadataDict& md, Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Metadata m;

            // Check if the global variable is a parameter
            // that was extracted from a function by the
            // ´prep-gnn´ pass
            MDNode* isParam = G.getMetadata("param");
            if (isParam) {
                std::string variableName = G.getName().str();
                m.functionName = variableName.substr(0, variableName.find("."));
                m.name = variableName.substr(variableName.find(".") + 1);
            } else {
                m.functionName = "";
                m.name = G.getName().str();
            }

            m.values["ID"] = getMDOperandValue(G, "globalID", 0);
            m.values["bitwidth"] = getMDOperandValue(G, "bitwidth", 0);
            m.values["type"] = getMDOperandValue(G, "type", 0);

            MDNode* isArray = G.getMetadata("isArray");
            if (isArray) {
                m.values["isArray"] = 1;

                uint32_t numDims = getMDOperandValue(G, "numDims", 0);
                m.values["numDims"] = numDims;

                for (uint32_t i = 1; i <= numDims; i++) {
                    m.values["numElements" + std::to_string(i)] = getMDOperandValue(
                        G, "numElements." + std::to_string(i), 0
                    );
                }
                m.values["numElements"] = getMDOperandValue(G, "numElements", 0);
                m.values["elementType"] = getMDOperandValue(G, "elementType", 0);
                m.values["elementBitwidth"] = getMDOperandValue(G, "elementBitwidth", 0);

                if (MDNode* arrayPartitionMD = G.getMetadata("arrayPartition")) {
                    m.values["arrayPartition"] = 1;
                    m.values["arrayPartitionID"] = MDOperandToInt(arrayPartitionMD, 0);
                    m.values["arrayPartitionType"] = MDOperandToInt(arrayPartitionMD, 1);
                    m.values["arrayPartitionDim"] = MDOperandToInt(arrayPartitionMD, 2);
                    m.values["arrayPartitionFactor"] = MDOperandToInt(arrayPartitionMD, 3);
                    m.values["arrayPartitionDimSize"] = MDOperandToInt(arrayPartitionMD, 4);
                    m.values["arrayPartitionNumPartitions"] = MDOperandToInt(arrayPartitionMD, 5);
                }
            }
            md["value"].push_back(m);
        }
    }

    void getInstructionsMD(MetadataDict& md, Module& M) {
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    // Get metadata from the instruction
                    Metadata instMD;

                    // For instructions, the key will be the instruction's opID
                    uint32_t opID = getMDOperandValue(I, "opID", 0);

                    instMD.name = std::to_string(opID);
                    instMD.functionName = F.hasName() ? F.getName().str() : "";

                    instMD.values["ID"] = opID;
                    instMD.values["functionID"] = getMDOperandValue(I, "functionID", 0);
                    instMD.values["bbID"] = getMDOperandValue(I, "bbID", 0);
                    instMD.values["opcode"] = getMDOperandValue(I, "opcode", 0);
                    instMD.values["numOperands"] = getMDOperandValue(I, "numOperands", 0);
                    instMD.values["numUses"] = getMDOperandValue(I, "numUses", 0);
                    instMD.values["retType"] = getMDOperandValue(I, "valueType", 0);
                    instMD.values["bitwidth"] = getMDOperandValue(I, "bitwidth", 0);
                    instMD.values["inLoop"] = getMDOperandValue(I, "inLoop", 0);

                    if (MDNode* loopDepth = I.getMetadata("loopDepth")) {
                        instMD.values["loopDepth"] = MDOperandToInt(loopDepth, 0);
                    }
                    if (MDNode* tripCount = I.getMetadata("tripCount")) {
                        instMD.values["tripCount"] = MDOperandToInt(tripCount, 0);
                    }
                    if (MDNode* pipelineMD = I.getMetadata("pipeline")) {
                        instMD.values["pipeline"] = 1;
                        instMD.values["pipelineID"] = MDOperandToInt(pipelineMD, 0);
                        instMD.values["pipelineII"] = MDOperandToInt(pipelineMD, 1);
                        instMD.values["functionLevel"] = MDOperandToInt(pipelineMD, 2);
                    }
                    if (MDNode* unrollMD = I.getMetadata("unroll")) {
                        instMD.values["unroll"] = 1;
                        instMD.values["unrollID"] = MDOperandToInt(unrollMD, 0);
                        instMD.values["unrollComplete"] = MDOperandToInt(unrollMD, 1);
                        instMD.values["unrollFactor"] = MDOperandToInt(unrollMD, 2);
                    }
                    if (MDNode* loopFlattenMD = I.getMetadata("loopFlatten")) {
                        instMD.values["loopFlatten"] = 1;
                        instMD.values["loopFlattenID"] = MDOperandToInt(loopFlattenMD, 0);
                    }
                    if (MDNode* loopMergeMD = I.getMetadata("loopMerge")) {
                        instMD.values["loopMerge"] = 1;
                        instMD.values["loopMergeID"] = MDOperandToInt(loopMergeMD, 0);
                        instMD.values["functionLevel"] = MDOperandToInt(loopMergeMD, 1);
                    }

                    // Retrieve metadata about the basic block that contains the instruction
                    instMD.values["bbSize"] = getMDOperandValue(BB, "bbSize", 0);
                    
                    // Retrieve metadata about the function that contains the instruction
                    instMD.values["numOperandsInFunction"] = getMDOperandValue(F, "numOperandsInFunction", 0);
                    instMD.values["numUsesInFunction"] = getMDOperandValue(F, "numUsesInFunction", 0);
                    instMD.values["entryCountInFunction"] = getMDOperandValue(F, "entryCountInFunction", 0);
                    instMD.values["functionRetType"] = getMDOperandValue(F, "functionRetType", 0);
                    instMD.values["functionRetTypeBitwidth"] = getMDOperandValue(F, "functionRetTypeBitwidth", 0);
                    instMD.values["numInstsInFunction"] = getMDOperandValue(F, "numInstsInFunction", 0);
                    instMD.values["numBBsInFunction"] = getMDOperandValue(F, "numBBsInFunction", 0);
                    instMD.values["numLoopsInFunction"] = getMDOperandValue(F, "numLoopsInFunction", 0);

                    md["instruction"].push_back(instMD);

                    if (!I.getType()->isVoidTy()) {
                        // Get metadata for the value produced by the instruction
                        Metadata valMD;

                        valMD.name = I.getName().str();
                        valMD.functionName = F.hasName() ? F.getName().str() : "";

                        valMD.values["ID"] = getMDOperandValue(I, "opID", 0);
                        valMD.values["bitwidth"] = getMDOperandValue(I, "bitwidth", 0);
                        valMD.values["type"] = getMDOperandValue(I, "valueType", 0);

                        MDNode* isArray = I.getMetadata("isArray");
                        if (isArray) {
                            valMD.values["isArray"] = 1;

                            uint32_t numDims = getMDOperandValue(I, "numDims", 0);
                            valMD.values["numDims"] = numDims;

                            for (uint32_t i = 1; i <= numDims; i++) {
                                valMD.values["numElements" + std::to_string(i)] = getMDOperandValue(
                                    I, "numElements." + std::to_string(i), 0
                                );
                            }
                            valMD.values["numElements"] = getMDOperandValue(I, "numElements", 0);
                            valMD.values["elementType"] = getMDOperandValue(I, "elementType", 0);
                            valMD.values["elementBitwidth"] = getMDOperandValue(I, "elementBitwidth", 0);

                            if (MDNode* arrayPartition = I.getMetadata("arrayPartition")) {
                                valMD.values["arrayPartition"] = 1;
                                valMD.values["arrayPartitionID"] = MDOperandToInt(arrayPartition, 0);
                                valMD.values["arrayPartitionType"] = MDOperandToInt(arrayPartition, 1);
                                valMD.values["arrayPartitionDim"] = MDOperandToInt(arrayPartition, 2);
                                valMD.values["arrayPartitionFactor"] = MDOperandToInt(arrayPartition, 3);
                                valMD.values["arrayPartitionDimSize"] = MDOperandToInt(arrayPartition, 4);
                                valMD.values["arrayPartitionNumPartitions"] = MDOperandToInt(arrayPartition, 5);
                            }
                        }
                        md["value"].push_back(valMD);
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