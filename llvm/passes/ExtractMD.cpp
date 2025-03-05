#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
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
} MetadataCollection;

using MetadataDict = std::unordered_map<std::string, std::vector<MetadataCollection>>;

struct ExtractMD : public ModulePass {
    static char ID;
    ExtractMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        MetadataDict md;

        getGlobalValuesMetadata(md, M);
        getInstructionsMD(md, M);

        std::ofstream out(outputFile);
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return false;
        }

        for (auto& item : md) {
            const auto& type = item.first;
            const auto& metadata = item.second;

            out << type << ":\n";
            for (const MetadataCollection& m : metadata) {
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
        return cast<ConstantInt>(
            dyn_cast<ConstantAsMetadata>(
                md->getOperand(index)
            )->getValue()
        )->getZExtValue();
    }

    uint32_t getMDOperandValue(
        Value& V, StringRef name, uint32_t index, 
        uint32_t defaultValue=0
    ) {
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

    void getGlobalValuesMetadata(MetadataDict& md, Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            MetadataCollection m;

            errs() << "Global: " << G.getName() << "\n";

            // Check if the global variable is a parameter
            // that was extracted from a function by the
            // ´prep-gnn´ pass
            MDNode* isParam = G.getMetadata("param");
            if (isParam) {
                uint32_t functionID = getMDOperandValue(G, "functionID", 0);
                std::string variableName = G.getName().str();
                m.functionName = variableName.substr(0, variableName.find("."));
                m.name = variableName.substr(variableName.find(".") + 1) 
                         + "." + std::to_string(functionID);
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
                    std::string mdName = "numElements." + std::to_string(i);
                    m.values[mdName] = getMDOperandValue(G, mdName, 0);
                }
                m.values["numElements"] = getMDOperandValue(G, "numElements", 0);
                m.values["elementType"] = getMDOperandValue(G, "elementType", 0);
                m.values["elementBitwidth"] = getMDOperandValue(G, "elementBitwidth", 0);

                if (MDNode* APMD = G.getMetadata("arrayPartition")) {
                    m.values["arrayPartition"] = 1;
                    m.values["arrayPartitionID"] = MDOperandToInt(APMD, 0);
                    m.values["arrayPartitionType"] = MDOperandToInt(APMD, 1);
                    m.values["arrayPartitionDim"] = MDOperandToInt(APMD, 2);
                    m.values["arrayPartitionFactor"] = MDOperandToInt(APMD, 3);
                    m.values["arrayPartitionDimSize"] = MDOperandToInt(APMD, 4);
                    m.values["arrayPartitionNumPartitions"] = MDOperandToInt(APMD, 5);
                }
            }

            if (isParam) {
                md["param"].push_back(m);
            } else {
                md["value"].push_back(m);
            }
        }
    }

    void getInstructionsMD(MetadataDict& md, Module& M) {
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    // Get metadata from the instruction
                    MetadataCollection instMD;

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
                    instMD.values["modifiesMemory"] = getMDOperandValue(I, "modifiesMemory", 0);
                    instMD.values["readsMemory"] = getMDOperandValue(I, "readsMemory", 0);
                    instMD.values["modifiesControlFlow"] = getMDOperandValue(I, "modifiesControlFlow", 0);

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
                    instMD.values["bbSize"] = getMDOperandValue(I, "bbSize", 0);
                    instMD.values["inLoop"] = getMDOperandValue(I, "inLoop", 0);
                    // Default value is 0 for instructions outside loops
                    instMD.values["loopDepth"] = getMDOperandValue(I, "loopDepth", 0);
                    // Default value is 1 for instructions outside loops
                    instMD.values["tripCount"] = getMDOperandValue(I, "tripCount", 0, 1);

                    // Retrieve metadata about the function that contains the instruction
                    instMD.values["funcNumOperands"] = getMDOperandValue(F, "numOperands", 0);
                    instMD.values["funcNumUses"] = getMDOperandValue(F, "numUses", 0);
                    instMD.values["funcRetType"] = getMDOperandValue(F, "retType", 0);
                    instMD.values["funcRetBitwidth"] = getMDOperandValue(F, "retBitwidth", 0);
                    instMD.values["funcNumInsts"] = getMDOperandValue(F, "numInsts", 0);
                    instMD.values["funcNumBBs"] = getMDOperandValue(F, "numBBs", 0);
                    instMD.values["funcNumLoops"] = getMDOperandValue(F, "numLoops", 0);

                    md["instruction"].push_back(instMD);

                    if (!I.getType()->isVoidTy()) {
                        // Get metadata for the value produced by the instruction
                        MetadataCollection valMD;

                        valMD.name = I.getName().str();
                        valMD.functionName = F.hasName() ? F.getName().str() : "";

                        valMD.values["ID"] = opID;
                        valMD.values["bitwidth"] = getMDOperandValue(I, "bitwidth", 0);
                        valMD.values["type"] = getMDOperandValue(I, "valueType", 0);

                        MDNode* isArray = I.getMetadata("isArray");
                        if (isArray) {
                            valMD.values["isArray"] = 1;

                            uint32_t numDims = getMDOperandValue(I, "numDims", 0);
                            valMD.values["numDims"] = numDims;

                            for (uint32_t i = 1; i <= numDims; i++) {
                                valMD.values["numElements." + std::to_string(i)] = getMDOperandValue(
                                    I, "numElements." + std::to_string(i), 0
                                );
                            }
                            valMD.values["numElements"] = getMDOperandValue(I, "numElements", 0);
                            valMD.values["elementType"] = getMDOperandValue(I, "elementType", 0);
                            valMD.values["elementBitwidth"] = getMDOperandValue(I, "elementBitwidth", 0);

                            if (MDNode* APMD = I.getMetadata("arrayPartition")) {
                                valMD.values["arrayPartition"] = 1;
                                valMD.values["arrayPartitionID"] = MDOperandToInt(APMD, 0);
                                valMD.values["arrayPartitionType"] = MDOperandToInt(APMD, 1);
                                valMD.values["arrayPartitionDim"] = MDOperandToInt(APMD, 2);
                                valMD.values["arrayPartitionFactor"] = MDOperandToInt(APMD, 3);
                                valMD.values["arrayPartitionDimSize"] = MDOperandToInt(APMD, 4);
                                valMD.values["arrayPartitionNumPartitions"] = MDOperandToInt(APMD, 5);
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
static RegisterPass<ExtractMD> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);