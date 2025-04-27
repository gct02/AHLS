#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <unordered_map>
#include <unordered_set>

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/LoopUtils.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

using namespace llvm;

static cl::opt<std::string> outputFile(
    "out", 
    cl::desc("Filepath to write the module's metadata"), 
    cl::value_desc("filepath")
);

namespace {

struct EntityMetadata {
    std::string functionName;
    std::string entityName;
    std::unordered_map<std::string, uint32_t> metadataDict;

    EntityMetadata(const std::string& entityName = "",
                   const std::string& functionName = "")
        : functionName(functionName), entityName(entityName) {}

    void set(const std::string& key, uint32_t value) {
        metadataDict[key] = value;
    }

    Optional<uint32_t> get(const std::string& key) const {
        auto it = metadataDict.find(key);
        if (it != metadataDict.end()) {
            return it->second;
        }
        return Optional<uint32_t>();
    }
};

struct RegionMetadata : public EntityMetadata {
    std::unordered_set<uint32_t> subRegions;

    RegionMetadata(const std::string& entityName = "",
                   const std::string& functionName = "")
        : EntityMetadata(entityName, functionName) {}

    void addSubRegion(uint32_t subRegionID) {
        subRegions.insert(subRegionID);
    }
};

struct ArrayMetadata : public EntityMetadata {
    std::vector<uint32_t> dimensions;

    ArrayMetadata(const std::string& entityName = "",
                  const std::string& functionName = "")
        : EntityMetadata(entityName, functionName) {}

    void addDimension(uint32_t dimSize) {
        dimensions.push_back(dimSize);
    }
};

struct ExtractMetadataPass : public ModulePass {
    static char ID;
    ExtractMetadataPass() : ModulePass(ID) {}

    std::unordered_map<std::string, std::vector<EntityMetadata>> metadataDict;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        extractMetadataFromGlobals(M);
        extractMetadataFromRegions(M);
        extractMetadataFromParams(M);
        extractMetadataFromInstrs(M);

        if (outputFile.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        writeMetadataToFile(M);
        
        return false; // Module is not modified
    }

    void writeMetadataToFile(Module& M) {
        std::ofstream out(outputFile);
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return;
        }

        out << "{\n  metadata: {\n";
        for (const auto& item : metadataDict) {
            const std::string& type = item.first;
            const std::vector<EntityMetadata>& metadata = item.second;

            out << "    \"" << type << "\": [\n";
            for (const EntityMetadata& md : metadata) {
                out << "      {\n";
                out << "        \"name\": \"" << md.entityName << "\",\n";
                out << "        \"functionName\": \"" << md.functionName << "\",\n";
                for (const auto& mdEntry : md.metadataDict) {
                    out << "        \"" << mdEntry.first << "\": " 
                        << mdEntry.second << ",\n";
                }
                if (type == "region") {
                    const RegionMetadata& regionMD = static_cast<const RegionMetadata&>(md);
                    out << "        \"subRegions\": [";
                    for (const auto& subRegionID : regionMD.subRegions) {
                        out << subRegionID << ",";
                    }
                    out.seekp(-1, std::ios_base::end);
                    out << "]\n";
                } else if (type == "array" || type == "globalArray" || 
                           type == "arrayPort") {
                    out << "        \"isArray\": \"" << 1 << "\",\n";
                    const ArrayMetadata& arrayMD = static_cast<const ArrayMetadata&>(md);
                    out << "        \"dimensions\": [";
                    for (const auto& dimSize : arrayMD.dimensions) {
                        out << dimSize << ",";
                    }
                    out.seekp(-1, std::ios_base::end);
                    out << "]\n";
                }
                out << "      },\n";
            }
            out.seekp(-2, std::ios_base::end);
            out << "\n    ],\n";
        }
        out.seekp(-2, std::ios_base::end);
        out << "\n  }\n";

        out << "  functions: [\n";
        uint32_t idx = 0;
        for (Function& F : M) {
            std::string functionName = F.hasName() ? F.getName().str() : "function_" + std::to_string(idx++);
            out << "    \"" << functionName << "\",\n";
            idx++;
        }
        out.seekp(-2, std::ios_base::end);
        out << "\n  ]\n";
        out << "}\n";

        out.close();
    }

    void extractMetadataFromGlobals(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* type = G.getType();
            std::string name = G.getName().str();

            uint32_t id = (uint32_t)cast<ConstantInt>(
                dyn_cast<ConstantAsMetadata>(G.getMetadata("id")->getOperand(0))->getValue()
            )->getZExtValue();

            if (isArrayType(type)) {
                ArrayMetadata md = getArrayMetadata(type, name);
                md.set("id", id);
                metadataDict["globalArray"].push_back(md);
            } else {
                EntityMetadata md(name, "");
                md.set("id", id);
                md.set("bitwidth", type->getPrimitiveSizeInBits());
                md.set("type", type->getTypeID());
                metadataDict["globalVariable"].push_back(md);
            }
        }
    }

    void extractMetadataFromRegions(Module& M) {
        struct StackFrame {
            Loop* loop;
            uint32_t parentID;
        };

        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            uint32_t functionID = (uint32_t)cast<ConstantInt>(
                dyn_cast<ConstantAsMetadata>(F.getMetadata("id")->getOperand(0))->getValue()
            )->getZExtValue();

            std::string functionName = F.hasName() ? F.getName().str() 
                                       : "_function_" + std::to_string(functionID);

            RegionMetadata md(functionName, functionName);
            md.set("id", functionID);
            md.set("isLoop", 0);
            md.set("tripCount", 1);
            metadataDict["region"].push_back(md);
            
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<StackFrame> loopStack;
                    loopStack.push({L, functionID});

                    while (!loopStack.empty()) {
                        StackFrame frame = loopStack.top();
                        loopStack.pop();

                        Loop* currLoop = frame.loop;
                        uint32_t parentID = frame.parentID;

                        std::string loopLabel;
                        if (auto* preheader = currLoop->getLoopPreheader()) {
                            loopLabel = preheader->getName().str();
                        } else {
                            loopLabel = currLoop->getHeader()->getName().str();
                        }

                        uint32_t loopID = (uint32_t)cast<ConstantInt>(
                            dyn_cast<ConstantAsMetadata>(L->getLoopID())->getValue()
                        )->getZExtValue();

                        RegionMetadata md(loopLabel, functionName);

                        md.set("id", loopID);
                        md.set("isLoop", 1);
                        md.set("tripCount", getEstimatedLoopTripCount(currLoop, &SE));

                        addSubRegion(parentID, loopID);
                        metadataDict["region"].push_back(md);

                        for (Loop* subLoop : currLoop->getSubLoops()) {
                            loopStack.push({subLoop, loopID});
                        }
                    }
                }
            }
        }
    }

    void extractMetadataFromParams(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            uint32_t functionID = (uint32_t)cast<ConstantInt>(
                dyn_cast<ConstantAsMetadata>(F.getMetadata("id")->getOperand(0))->getValue()
            )->getZExtValue();

            std::string functionName = F.hasName() ? F.getName().str() : "";
            for (Argument& A : F.args()) {
                Type* type = A.getType();
                std::string paramName = A.getName().str();

                bool isDecayed = false;
                if (type->isPointerTy()) {
                    uint32_t decayedDimSize = getDecayedDimSize(&A);
                    if (decayedDimSize > 0) {
                        isDecayed = true;
                        type = ArrayType::get(type->getPointerElementType(), decayedDimSize);
                        ArrayMetadata md = getArrayMetadata(type, paramName, functionName);
                        md.set("functionID", functionID);
                        metadataDict["arrayPort"].push_back(md);
                    }
                }
                if (!isDecayed) {
                    EntityMetadata md(paramName, functionName);
                    md.set("bitwidth", type->getPrimitiveSizeInBits());
                    md.set("type", type->getTypeID());
                    md.set("functionID", functionID);
                    metadataDict["port"].push_back(md);
                }
            }
        }
    }

    void extractMetadataFromInstrs(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            std::string functionName = F.hasName() ? F.getName().str() : "";

            uint32_t functionID = (uint32_t)cast<ConstantInt>(
                dyn_cast<ConstantAsMetadata>(F.getMetadata("id")->getOperand(0))->getValue()
            )->getZExtValue();

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    uint32_t instrID = (uint32_t)cast<ConstantInt>(
                        dyn_cast<ConstantAsMetadata>(I.getMetadata("id")->getOperand(0))->getValue()
                    )->getZExtValue();

                    EntityMetadata md = getInstructionMetadata(I, functionName);
                    md.set("id", instrID);
                    md.set("functionID", functionID);
                    metadataDict["instruction"].push_back(md);

                    if (!I.getType()->isVoidTy()) {
                        Type* type = I.getType();
                        if (I.getOpcode() == Instruction::Alloca) {
                            type = I.getType()->getPointerElementType();
                        }
                        std::string instrName = I.hasName() ? I.getName().str() : "";

                        if (isArrayType(type)) {
                            ArrayMetadata arrayMD = getArrayMetadata(type, instrName, functionName);
                            arrayMD.set("id", instrID);
                            arrayMD.set("functionID", functionID);
                            metadataDict["array"].push_back(arrayMD);
                        } else {
                            EntityMetadata valMD(instrName, functionName);
                            valMD.set("id", instrID);
                            valMD.set("bitwidth", type->getPrimitiveSizeInBits());
                            valMD.set("type", type->getTypeID());
                            valMD.set("functionID", functionID);
                            metadataDict["variable"].push_back(valMD);
                        }
                    }
                }
            }
        }
    }

    uint32_t getArgumentAttributeValue(const Argument* arg, StringRef attrName) {
        AttributeList attrs = arg->getParent()->getAttributes();
        const auto& attr = attrs.getParamAttr(arg->getArgNo(), attrName);
        auto attrStr = attr.getValueAsString();
        if (!attrStr.empty()) {
            uint32_t size;
            if (to_integer(attrStr, size)) {
                return size;
            }
        }
        return 0;
    }

    EntityMetadata getInstructionMetadata(Instruction& I, std::string functionName) {
        std::string name = I.hasName() ? I.getName().str() : "";
        EntityMetadata md(name, functionName);
        md.set("bitwidth", I.getType()->getPrimitiveSizeInBits());
        md.set("type", I.getType()->getTypeID());
        md.set("opcode", I.getOpcode());
        return md;
    }
    
    uint32_t getDecayedDimSize(const Argument *arg) {
        return getArgumentAttributeValue(arg, "fpga.decayed.dim.hint");
    }

    void addSubRegion(uint32_t parentID, uint32_t subRegionID) {
        for (auto& md : metadataDict["region"]) {
            if (auto* regionMd = dyn_cast<RegionMetadata>(&md)) {
                if (regionMd->get("id").getValue() == parentID) {
                    regionMd->addSubRegion(subRegionID);
                }
            }
        }
    }

    uint32_t getEstimatedLoopTripCount(Loop* L, ScalarEvolution* SE) {
        uint32_t tripCount = 0;
        if (BasicBlock* exitingBlock = getExitingBlock(L, SE)) {
            tripCount = SE->getSmallConstantTripCount(L, exitingBlock);
            if (tripCount > 0) return tripCount;
        }
        Optional<LoopTripCountMDInfo> tripCountInfo = getLoopTripCount(L);
        if (tripCountInfo.hasValue()) {
            tripCount = (uint32_t)tripCountInfo->getMax();
            if (tripCount > 0) return tripCount;
        }
        Optional<uint32_t> estimatedTripCount = getLoopEstimatedTripCount(L);
        if (estimatedTripCount.hasValue()) {
            tripCount = estimatedTripCount.getValue();
        }
        return std::max(tripCount, 1u);
    }

    ArrayMetadata getArrayMetadata(Type* arrayType, std::string arrayName, 
                                   std::string functionName = "") {
        ArrayMetadata md(arrayName, functionName);

        Type* baseType = getArrayBaseType(arrayType);
        md.set("baseType", baseType->getTypeID());
        md.set("baseTypeBitwidth", baseType->getPrimitiveSizeInBits());

        uint32_t numDims = getArrayNumDims(arrayType);
        md.set("numDims", numDims);
        for (uint32_t i = 1; i <= numDims; i++) {
            md.addDimension(getArrayDimSize(arrayType, i));
        }
        md.set("totalSize", getArrayTotalSize(arrayType));

        return md;
    }

    Type* getArrayBaseType(Type* arrayType) {
        while (arrayType->isArrayTy()) {
            arrayType = arrayType->getArrayElementType();
        }
        return arrayType;
    }
    
    uint32_t getArrayNumDims(Type* arrayType) {
        uint32_t numDims = 0;
        while (arrayType->isArrayTy()) {
            numDims++;
            arrayType = arrayType->getArrayElementType();
        }
        return numDims;
    }
    
    uint32_t getArrayTotalSize(Type* arrayType) {
        uint32_t totalSize = 1;
        while (arrayType->isArrayTy()) {
            totalSize *= arrayType->getArrayNumElements();
            arrayType = arrayType->getArrayElementType();
        }
        return totalSize;
    }
    
    uint32_t getArrayDimSize(Type* arrayType, uint32_t dim) {
        for (uint32_t i = 1; i < dim; i++) {
            arrayType = arrayType->getArrayElementType();
        }
        return arrayType->getArrayNumElements();
    }

    bool isArrayType(Type* type) {
        while (type->isPointerTy()) {
            type = type->getPointerElementType();
        }
        return type->isArrayTy();
    }
}; // struct ExtractMetadataPass

} // anonymous namespace

char ExtractMetadataPass::ID = 0;
static RegisterPass<ExtractMetadataPass> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);