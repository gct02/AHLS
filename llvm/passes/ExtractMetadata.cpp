#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <utility>

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/Local.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

using namespace llvm;

static cl::opt<std::string> outputFile(
    "out", 
    cl::desc("Filepath to write the module's metadata"), 
    cl::value_desc("filepath")
);

namespace {

enum class MetadataKind {
    MK_BaseEntity,
    MK_Region,
    MK_Array
};

struct EntityMetadata {
    MetadataKind Kind;
    std::string functionName;
    std::string entityName;
    std::unordered_map<std::string, uint32_t> metadataDict;

    EntityMetadata(MetadataKind K = MetadataKind::MK_BaseEntity, 
                   const std::string& entityName = "",
                   const std::string& functionName = "")
        : Kind(K), functionName(functionName), entityName(entityName) {}

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

    MetadataKind getKind() const { return Kind; }

    virtual ~EntityMetadata() = default; 
};

struct RegionMetadata : public EntityMetadata {
    std::unordered_set<uint32_t> subRegions;
    std::unordered_set<uint32_t> instructions;

    RegionMetadata(const std::string& entityName = "",
                   const std::string& functionName = "")
        : EntityMetadata(MetadataKind::MK_Region, entityName, functionName) {}

    void addSubRegion(uint32_t subRegionID) {
        subRegions.insert(subRegionID);
    }

    void addInstruction(uint32_t instructionID) {
        instructions.insert(instructionID);
    }

    static bool classof(const EntityMetadata *E) {
        return E->getKind() == MetadataKind::MK_Region;
    }
};

struct ArrayMetadata : public EntityMetadata {
    std::vector<uint32_t> dimensions;

    ArrayMetadata(const std::string& entityName = "",
                  const std::string& functionName = "")
        : EntityMetadata(MetadataKind::MK_Array, entityName, functionName) {}

    void addDimension(uint32_t dimSize) {
        dimensions.push_back(dimSize);
    }

    static bool classof(const EntityMetadata *E) {
        return E->getKind() == MetadataKind::MK_Array;
    }
};

struct ExtractMetadataPass : public ModulePass {
    static char ID;
    ExtractMetadataPass() : ModulePass(ID) {}

    std::unordered_map<std::string, std::vector<EntityMetadata*> > metadataDict;

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
        std::ofstream out(outputFile.c_str());
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return;
        }

        out << "{\n";
        bool firstType = true;
        for (const auto& item : metadataDict) {
             if (!firstType) out << ",\n";
             firstType = false;

            std::string type = item.first;
            std::vector<EntityMetadata*> metadata = item.second;

            out << "  \"" << type << "\": [\n";
            bool firstMd = true;
            for (auto* md : metadata) {
                if (!firstMd) out << ",\n";
                firstMd = false;

                out << "    {\n";
                out << "      \"name\": \"" << md->entityName << "\",\n";
                out << "      \"functionName\": \"" << md->functionName << "\"";

                for (auto mdEntry : md->metadataDict) {
                    out << ",\n      \"" << mdEntry.first << "\": " << mdEntry.second;
                }

                if (auto* regionMD = dyn_cast<RegionMetadata>(md)) {
                    out << ",\n      \"subRegions\": [";
                    bool firstSub = true;
                    for (auto subRegionID : regionMD->subRegions) {
                         if (!firstSub) out << ",";
                         firstSub = false;
                         out << subRegionID;
                    }
                    out << "]";
                    out << ",\n      \"instructions\": [";
                    bool firstInstr = true;
                    for (auto instrID : regionMD->instructions) {
                         if (!firstInstr) out << ",";
                         firstInstr = false;
                         out << instrID;
                    }
                    out << "]";
                } else if (auto* arrayMD = dyn_cast<ArrayMetadata>(md)) {
                    out << ",\n      \"dimensions\": [";
                    bool firstDim = true;
                    for (auto dimSize : arrayMD->dimensions) {
                         if (!firstDim) out << ",";
                         firstDim = false;
                         out << dimSize;
                    }
                    out << "]";
                }
                out << "\n    }"; // Close object braces
            }
             out << "\n  ]"; // Close array
        }
        out << "\n}"; // Close metadata map

        out.close();
    }

    void extractMetadataFromGlobals(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* type = G.getValueType();
            std::string name = G.getName().str();
            std::string functionName = "";
            uint32_t isParam = 0;

            Optional<uint32_t> idOpt = getGlobalID(&G);
            if (!idOpt.hasValue()) continue;
            uint32_t id = idOpt.getValue();

            // Check if the global variable is a function parameter
            if (auto* dbgVarExpr = dyn_cast<DIGlobalVariableExpression>(G.getMetadata("dbg"))) {
                if (auto* dbgVar = dbgVarExpr->getVariable()) {
                    name = dbgVar->getName().str();
                    if (auto* func = dbgVar->getScope()) {
                        functionName = func->getName().str();
                        if (functionName.empty() == false) isParam = 1;
                    }
                }
            }

            if (isArrayType(type)) {
                ArrayMetadata* md = getArrayMetadata(type, name, functionName);
                md->set("id", id);
                md->set("isParam", isParam);
                md->set("isGlobal", 1);
                metadataDict["variable"].push_back(md);
            } else {
                EntityMetadata* md = new EntityMetadata(MetadataKind::MK_BaseEntity,
                                                        name, functionName);
                md->set("id", id);
                md->set("bitwidth", type->getPrimitiveSizeInBits());
                md->set("type", type->getTypeID());
                md->set("isParam", isParam);
                md->set("isGlobal", 1);
                metadataDict["variable"].push_back(md);
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

            Optional<uint32_t> functionIdOpt = getFunctionID(&F);
            if (!functionIdOpt.hasValue()) continue;
            uint32_t functionID = functionIdOpt.getValue();

            std::string functionName = F.hasName() ? F.getName().str() 
                                       : "function." + std::to_string(functionID);

            RegionMetadata* functionMD = new RegionMetadata(functionName, functionName);
            functionMD->set("id", functionID);
            functionMD->set("isLoop", 0);
            functionMD->set("tripCount", 1);
            metadataDict["region"].push_back(functionMD);
            
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

                        Optional<uint32_t> loopIDOpt = getLoopID(currLoop);
                        if (!loopIDOpt.hasValue()) continue;
                        uint32_t loopID = loopIDOpt.getValue();

                        RegionMetadata* loopMD = new RegionMetadata(loopLabel, functionName);
                        loopMD->set("id", loopID);
                        loopMD->set("isLoop", 1);
                        loopMD->set("tripCount", getEstimatedLoopTripCount(currLoop, &SE));

                        addSubRegion(parentID, loopID);
                        metadataDict["region"].push_back(loopMD);

                        for (Loop* subLoop : currLoop->getSubLoops()) {
                            loopStack.push({subLoop, loopID});
                        }

                        for (BasicBlock* BB : currLoop->getBlocks()) {
                            for (Instruction& I : *BB) {
                                Optional<uint32_t> instrIdOpt = getInstructionID(&I);
                                if (!instrIdOpt.hasValue()) continue;
                                uint32_t instrID = instrIdOpt.getValue();

                                loopMD->addInstruction(instrID);
                            }
                        }
                    }
                }
            }

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    Optional<uint32_t> instrIdOpt = getInstructionID(&I);
                    if (!instrIdOpt.hasValue()) continue;
                    uint32_t instrID = instrIdOpt.getValue();

                    functionMD->addInstruction(instrID);
                }
            }
        }
    }

    void extractMetadataFromParams(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> functionIdOpt = getFunctionID(&F);
            if (!functionIdOpt.hasValue()) continue;
            uint32_t functionID = functionIdOpt.getValue();

            std::string functionName = F.hasName() ? F.getName().str() 
                                       : "function." + std::to_string(functionID);

            for (Argument& A : F.args()) {
                Type* type = A.getType();
                std::string paramName = A.getName().str();

                bool isDecayed = false;
                if (type->isPointerTy()) {
                    uint32_t decayedDimSize = getDecayedDimSize(&A);
                    if (decayedDimSize > 0) {
                        isDecayed = true;
                        type = ArrayType::get(type->getPointerElementType(), decayedDimSize);
                        ArrayMetadata* md = getArrayMetadata(type, paramName, functionName);
                        md->set("functionID", functionID);
                        md->set("isParam", 1);
                        metadataDict["port"].push_back(md);
                    }
                }
                if (!isDecayed) {
                    EntityMetadata* md = new EntityMetadata(MetadataKind::MK_BaseEntity, 
                                                            paramName, functionName);
                    md->set("bitwidth", type->getPrimitiveSizeInBits());
                    md->set("type", type->getTypeID());
                    md->set("functionID", functionID);
                    md->set("isParam", 1);
                    metadataDict["port"].push_back(md);
                }
            }
        }
    }

    void extractMetadataFromInstrs(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> functionIdOpt = getFunctionID(&F);
            if (!functionIdOpt.hasValue()) continue;
            uint32_t functionID = functionIdOpt.getValue();

            std::string functionName = F.hasName() ? F.getName().str() 
                                       : "function." + std::to_string(functionID);

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    Optional<uint32_t> instrIdOpt = getInstructionID(&I);
                    if (!instrIdOpt.hasValue()) continue;
                    uint32_t instrID = instrIdOpt.getValue();

                    std::string instrName = I.hasName() ? I.getName().str() 
                                            : (std::string(I.getOpcodeName()) + "." 
                                               + std::to_string(instrID));

                    EntityMetadata* functionMD = getInstructionMetadata(I, instrName, functionName);
                    functionMD->set("id", instrID);
                    functionMD->set("functionID", functionID);
                    metadataDict["instruction"].push_back(functionMD);

                    if (!I.getType()->isVoidTy()) {
                        DEBUG(dbgs() << "Instruction: " << I << "\n");
                        DEBUG(dbgs() << "Instruction type: " << I.getType()->getTypeID() << "\n");
                        Type* type = I.getType();
                        if (isArrayType(type)) {
                            DEBUG(dbgs() << "Array type found: " << type->getTypeID() << "\n");
                            while (type->isPointerTy()) {
                                type = type->getPointerElementType();
                            }
                            ArrayMetadata* arrayMD = getArrayMetadata(type, instrName, functionName);
                            arrayMD->set("id", instrID);
                            arrayMD->set("functionID", functionID);
                            metadataDict["variable"].push_back(arrayMD);
                        } else {
                            EntityMetadata* valMD = new EntityMetadata(MetadataKind::MK_BaseEntity,
                                                                       instrName, functionName);
                            valMD->set("id", instrID);
                            valMD->set("bitwidth", type->getPrimitiveSizeInBits());
                            valMD->set("type", type->getTypeID());
                            valMD->set("functionID", functionID);
                            metadataDict["variable"].push_back(valMD);
                        }
                    }
                }
            }
        }
    }

    uint32_t getArgumentAttributeValue(const Argument* Arg, StringRef AttrName) {
        AttributeList Attrs = Arg->getParent()->getAttributes();
        const auto& Attr = Attrs.getParamAttr(Arg->getArgNo(), AttrName);
        auto AttrStr = Attr.getValueAsString();
        if (!AttrStr.empty()) {
            uint32_t size;
            if (to_integer(AttrStr, size)) {
                return size;
            }
        }
        return 0;
    }

    EntityMetadata* getInstructionMetadata(Instruction& I, std::string instrName, std::string functionName) {
        EntityMetadata* md = new EntityMetadata(MetadataKind::MK_BaseEntity, instrName, functionName);
        md->set("bitwidth", I.getType()->getPrimitiveSizeInBits());
        md->set("type", I.getType()->getTypeID());
        md->set("opcode", I.getOpcode());
        return md;
    }
    
    uint32_t getDecayedDimSize(const Argument *Arg) {
        return getArgumentAttributeValue(Arg, "fpga.decayed.dim.hint");
    }

    void addSubRegion(uint32_t parentID, uint32_t subRegionID) {
        for (auto* md : metadataDict["region"]) {
            if (auto* regionMd = dyn_cast<RegionMetadata>(md)) {
                Optional<uint32_t> regionIDOpt = regionMd->get("id");
                if (!regionIDOpt.hasValue()) continue;
                uint32_t regionID = regionIDOpt.getValue();
                if (regionID == parentID) {
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

    ArrayMetadata* getArrayMetadata(Type* arrayType, std::string arrayName, 
                                    std::string functionName = "") {
        ArrayMetadata* md = new ArrayMetadata(arrayName, functionName);

        Type* baseType = getArrayBaseType(arrayType);
        md->set("isArray", 1);
        md->set("baseType", baseType->getTypeID());
        md->set("baseTypeBitwidth", baseType->getPrimitiveSizeInBits());

        uint32_t numDims = getArrayNumDims(arrayType);
        md->set("numDims", numDims);
        for (uint32_t i = 1; i <= numDims; i++) {
            md->addDimension(getArrayDimSize(arrayType, i));
        }
        md->set("totalSize", getArrayTotalSize(arrayType));

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
        if (type->isArrayTy()) {
            return true;
        }
        while (type->isPointerTy()) {
            type = type->getPointerElementType();
        }
        return type->isArrayTy();
    }

    Optional<uint32_t> getFunctionID(const Function* F) {
        if (MDNode* idMD = F->getMetadata("id")) {
            if (idMD->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(idMD->getOperand(0))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getLoopID(const Loop* L) {
        if (MDNode* idMD = L->getLoopID()) {
            if (idMD->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(idMD->getOperand(1))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getInstructionID(const Instruction* I) {
        if (MDNode* idMD = I->getMetadata("id")) {
            if (idMD->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(idMD->getOperand(0))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getGlobalID(const GlobalObject* G) {
        if (MDNode* idMD = G->getMetadata("id")) {
            if (idMD->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(idMD->getOperand(0))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<ScalarEvolutionWrapperPass>();
    }

    // ~ExtractMetadataPass() override {
    //     for (auto& item : metadataDict) {
    //         for (auto* md : item.second) {
    //             delete md;
    //         }
    //     }
    // }
}; 
// --- End Struct ExtractMetadataPass ---

} 
// --- End Namespace ---

char ExtractMetadataPass::ID = 0;
static RegisterPass<ExtractMetadataPass> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);
