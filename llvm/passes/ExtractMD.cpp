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
#include <unordered_set>

#include "HLSDSEUtils.h"

using namespace llvm;

static cl::opt<std::string> outputFile(
    "out-md", 
    cl::desc("Path to the file where the module's metadata should be written"), 
    cl::value_desc("filepath")
);

namespace {

using MDValues = std::unordered_map<std::string, uint32_t>;

struct MDCollection {
    std::string functionName;
    std::string entityName;
    MDValues values;

    MDCollection() : functionName(""), entityName("") {}
    MDCollection(const std::string& name) : functionName(""), entityName(name) {}
    MDCollection(const std::string& name, const std::string& funcName) 
        : functionName(funcName), entityName(name) {}
    
    void set(const std::string& key, uint32_t value) {
        values[key] = value;
    }

    uint32_t get(const std::string& key) const {
        return values.at(key);
    }

    bool has(const std::string& key) const {
        return values.find(key) != values.end();
    }

    bool empty() const {
        return values.empty();
    }

    void clear() {
        values.clear();
    }

    void erase(const std::string& key) {
        values.erase(key);
    }

    uint32_t& operator[](const std::string& key) {
        return values[key];
    }
};

using MetadataDict = std::unordered_map<std::string, std::vector<MDCollection>>;

struct ExtractMD : public ModulePass {
    static char ID;
    ExtractMD() : ModulePass(ID) {}

    uint32_t maxLoopID = 0;
    std::unordered_set<uint32_t> loopIDs;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        findMaxLoopID(M);

        MetadataDict md;

        getMetadataFromGlobals(md, M);
        getMetadataFromInstructions(md, M);

        writeMDToFile(md);
        
        return false; // Module is not modified
    }

    void writeMDToFile(const MetadataDict& md) {
        std::ofstream out(outputFile);
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return;
        }

        for (auto& item : md) {
            const auto& type = item.first;
            const auto& metadata = item.second;

            out << type << ":\n";
            for (const MDCollection& m : metadata) {
                out << "  " << m.entityName << ":\n";
                if (!m.functionName.empty()) {
                    out << "    functionName: " << m.functionName << "\n";
                }
                for (const auto& mdEntry : m.values) {
                    const auto& key = mdEntry.first;
                    const auto& value = mdEntry.second;
                    out << "    " << key << ": " << value << "\n";
                }
            }
        }
    }

    void findMaxLoopID(Module& M) {
        maxLoopID = 0;
        for (Function& F : M) {
            if (F.size() == 0) continue;
            for (BasicBlock& BB : F) {
                if (BB.size() == 0) continue;
                if (MDNode* loopMD = BB.getTerminator()->getMetadata("loopID")) {
                    uint32_t loopID = getIntMDOperand(loopMD, 0);
                    if (loopID > maxLoopID) {
                        maxLoopID = loopID;
                    }
                }
            }
        }
    }

    void getMetadataFromGlobals(MetadataDict& mdDict, Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            MDCollection m;
            m["ID"] = getIntMetadata(G, "globalID");
            m["bitwidth"] = getIntMetadata(G, "bitwidth");
            m["type"] = getIntMetadata(G, "type");

            if (MDNode* isArray = G.getMetadata("isArray")) {
                m["isArray"] = 1;
                uint32_t numDims = getIntMetadata(G, "numDims");
                for (uint32_t i = 1; i <= numDims; i++) {
                    std::string mdName = "numElements." + std::to_string(i);
                    m[mdName] = getIntMetadata(G, mdName);
                }
                m["numDims"] = numDims;
                m["numElements"] = getIntMetadata(G, "numElements");
                m["elementType"] = getIntMetadata(G, "elementType");
                m["elementBitwidth"] = getIntMetadata(G, "elementBitwidth");

                if (MDNode* apmd = G.getMetadata("arrayPartition")) {
                    m["partition"] = 1;
                    m["partitionID"] = getIntMDOperand(apmd, 0);
                    m["partitionType"] = getIntMDOperand(apmd, 1);
                    m["partitionDim"] = getIntMDOperand(apmd, 2);
                    m["partitionFactor"] = getIntMDOperand(apmd, 3);
                }
            }
            // Check if the global variable is an extracted parameter 
            // (see `TransformForCDFGExtraction.cpp`)
            if (MDNode* isParam = G.getMetadata("param")) {
                uint32_t functionID = getIntMetadata(G, "functionID");
                std::string variableName = G.getName().str();
                m.functionName = variableName.substr(0, variableName.find("."));
                m.entityName = variableName.substr(variableName.find(".") + 1) 
                               + "." + std::to_string(functionID);
                mdDict["param"].push_back(m);
            } else {
                m.functionName = "";
                m.entityName = G.getName().str();
                mdDict["value"].push_back(m);
            }
        }
    }

    void getLoopDirectiveMD(MDCollection& loopMD, Instruction& I) {
        if (MDNode* loopFlattenMD = I.getMetadata("loopFlatten")) {
            loopMD["loopFlatten"] = 1;
            loopMD["loopFlattenID"] = getIntMDOperand(loopFlattenMD, 0);
        }
        if (MDNode* loopMergeMD = I.getMetadata("loopMerge")) {
            loopMD["loopMerge"] = 1;
            loopMD["loopMergeID"] = getIntMDOperand(loopMergeMD, 0);
            loopMD["functionLevel"] = getIntMDOperand(loopMergeMD, 1);
        }
        if (MDNode* pipelineMD = I.getMetadata("pipeline")) {
            loopMD["pipeline"] = 1;
            loopMD["pipelineID"] = getIntMDOperand(pipelineMD, 0);
            loopMD["pipelineII"] = getIntMDOperand(pipelineMD, 1);
            loopMD["functionLevel"] = getIntMDOperand(pipelineMD, 2);
        }
        if (MDNode* unrollMD = I.getMetadata("unroll")) {
            loopMD["unroll"] = 1;
            loopMD["unrollID"] = getIntMDOperand(unrollMD, 0);
            loopMD["unrollComplete"] = getIntMDOperand(unrollMD, 1);
            loopMD["unrollFactor"] = getIntMDOperand(unrollMD, 2);
        }
    }

    void getLoopMD(MetadataDict& mdDict, Function& F, BasicBlock& BB) {
        auto* term = BB.getTerminator();
        if (MDNode* loopIDMD = term->getMetadata("loopID")) {
            uint32_t loopID = getIntMDOperand(loopIDMD);
            if (loopID == 0) {
                return;
            }
            if (loopIDs.find(loopID) != loopIDs.end()) {
                return;
            }
            loopIDs.insert(loopID);

            MDCollection loopMD(
                "loop." + std::to_string(loopID),
                F.hasName() ? F.getName().str() : ""
            );
            loopMD["ID"] = loopID;
            loopMD["functionID"] = getIntMetadata(F, "functionID");
            loopMD["depth"] = getIntMetadata(*term, "loopDepth");
            loopMD["tripCount"] = getIntMetadata(*term, "tripCount");

            getLoopDirectiveMD(loopMD, *term);

            mdDict["loop"].push_back(loopMD);
        } else if (term->getMetadata("loopFlatten") != nullptr
                   || term->getMetadata("loopMerge") != nullptr
                   || term->getMetadata("pipeline") != nullptr
                   || term->getMetadata("unroll") != nullptr) {
            // The loop has directives but no loopID
            maxLoopID++;
            MDCollection loopMD(
                "loop." + std::to_string(maxLoopID),
                F.hasName() ? F.getName().str() : ""
            );
            loopMD["ID"] = maxLoopID;
            loopMD["functionID"] = getIntMetadata(F, "functionID");

            // Get LoopInfo and ScalarEvolution analysis results
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            if (Loop* L = LI.getLoopFor(&BB)) {
                const SCEV* btcSCEV = SE.getBackedgeTakenCount(L);
                uint64_t tripCount = 0;
                if (const SCEVConstant* btc = dyn_cast<SCEVConstant>(btcSCEV)) {
                    tripCount = btc->getValue()->getZExtValue();
                }
                uint32_t depth = L->getLoopDepth();
                loopMD["tripCount"] = tripCount;
                loopMD["depth"] = depth;

                BasicBlock* header = L->getHeader();
                setIntMetadata(*header, "loopDepth", depth);
                setIntMetadata(*header, "tripCount", tripCount);

                for (BasicBlock* BB : L->getBlocks()) {
                    for (Instruction& I : *BB) {
                        setIntMetadata(I, "loopID", maxLoopID);
                    }
                }
            } else {
                // This case should not happen in practice
                loopMD["tripCount"] = 0;
                loopMD["depth"] = 0;

                setIntMetadata(BB, "loopDepth", 0);
                setIntMetadata(BB, "tripCount", 0);

                for (Instruction& I : BB) {
                    setIntMetadata(I, "loopID", maxLoopID);
                }
                BasicBlock* exiting = term->getSuccessor(0);
                for (Instruction& I : *exiting) {
                    setIntMetadata(I, "loopID", maxLoopID);
                }
                BasicBlock* latch = term->getSuccessor(0);
                for (Instruction& I : *latch) {
                    setIntMetadata(I, "loopID", maxLoopID);
                }
            }
            getLoopDirectiveMD(loopMD, *term);
            mdDict["loop"].push_back(loopMD);
        }
    }

    void getFunctionMD(MetadataDict& mdDict, Function& F) {
        MDCollection funcMD(F.hasName() ? F.getName().str() : "");

        funcMD["ID"] = getIntMetadata(F, "functionID");
        funcMD["numOperands"] = getIntMetadata(F, "numOperands");
        funcMD["numUses"] = getIntMetadata(F, "numUses");
        funcMD["retType"] = getIntMetadata(F, "retType");
        funcMD["retBitwidth"] = getIntMetadata(F, "retBitwidth");
        funcMD["numInsts"] = getIntMetadata(F, "numInsts");
        funcMD["numBBs"] = getIntMetadata(F, "numBBs");
        funcMD["numLoops"] = getIntMetadata(F, "numLoops");

        if (MDNode* pipelineMD = F.getMetadata("pipeline")) {
            funcMD["pipeline"] = 1;
            funcMD["pipelineID"] = getIntMDOperand(pipelineMD, 0);
            funcMD["pipelineII"] = getIntMDOperand(pipelineMD, 1);
            funcMD["functionLevel"] = getIntMDOperand(pipelineMD, 2);
        }
        if (MDNode* mergeMD = F.getMetadata("loopMerge")) {
            funcMD["merge"] = 1;
            funcMD["mergeID"] = getIntMDOperand(mergeMD, 0);
            funcMD["functionLevel"] = getIntMDOperand(mergeMD, 1);
        }
        mdDict["function"].push_back(funcMD);
    }

    void getInstructionMD(MetadataDict& mdDict, Function& F, Instruction& I) {
        uint32_t opID = getIntMetadata(I, "opID");
        MDCollection instMD(
            std::to_string(opID),
            F.hasName() ? F.getName().str() : ""
        );
        instMD["ID"] = opID;
        instMD["functionID"] = getIntMetadata(I, "functionID");
        instMD["bbID"] = getIntMetadata(I, "bbID");
        if (MDNode* loopIDMD = I.getMetadata("loopID")) {
            instMD["loopID"] = getIntMDOperand(loopIDMD);
        }
        instMD["opcode"] = getIntMetadata(I, "opcode");
        instMD["retType"] = getIntMetadata(I, "valueType");
        instMD["bitwidth"] = getIntMetadata(I, "bitwidth");
        mdDict["instruction"].push_back(instMD);
    }

    void getValueMD(MetadataDict& mdDict, Function& F, Instruction& I) {
        if (!I.getType()->isVoidTy()) {
            // Get metadata for the value produced by the instruction
            uint32_t opID = getIntMetadata(I, "opID");
            MDCollection valMD(
                I.getName().str(),
                F.hasName() ? F.getName().str() : ""
            );
            valMD["ID"] = opID;
            valMD["bitwidth"] = getIntMetadata(I, "bitwidth");
            valMD["type"] = getIntMetadata(I, "valueType");
            
            if (MDNode* isArray = I.getMetadata("isArray")) {
                valMD["isArray"] = 1;
                uint32_t numDims = getIntMetadata(I, "numDims");
                for (uint32_t i = 1; i <= numDims; i++) {
                    std::string mdName = "numElements." + std::to_string(i);
                    valMD[mdName] = getIntMetadata(I, mdName);
                }
                valMD["numDims"] = numDims;
                valMD["numElements"] = getIntMetadata(I, "numElements");
                valMD["elementType"] = getIntMetadata(I, "elementType");
                valMD["elementBitwidth"] = getIntMetadata(I, "elementBitwidth");

                if (MDNode* apmd = I.getMetadata("arrayPartition")) {
                    valMD["partition"] = 1;
                    valMD["partitionID"] = getIntMDOperand(apmd, 0);
                    valMD["partitionType"] = getIntMDOperand(apmd, 1);
                    valMD["partitionDim"] = getIntMDOperand(apmd, 2);
                    valMD["partitionFactor"] = getIntMDOperand(apmd, 3);
                }
            }
            mdDict["value"].push_back(valMD);
        }
    }

    void getMetadataFromInstructions(MetadataDict& mdDict, Module& M) {
        for (Function& F : M) {
            if (F.size() == 0) continue;
            getFunctionMD(mdDict, F);
            for (BasicBlock& BB : F) {
                if (BB.size() == 0) continue;
                getLoopMD(mdDict, F, BB);
                for (Instruction& I : BB) {
                    getInstructionMD(mdDict, F, I);
                    getValueMD(mdDict, F, I);
                }
            }
        }
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct ExtractMD

} // anonymous namespace

char ExtractMD::ID = 0;
static RegisterPass<ExtractMD> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);