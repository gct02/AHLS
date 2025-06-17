#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <map>
#include <set>
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
#include "llvm/Support/JSON.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/Debug.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/Local.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

using namespace llvm;

static cl::opt<std::string> OutputFilePath(
    "out", 
    cl::desc("Path to the file to write metadata to"), 
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
    std::string FunctionName;
    std::string Name;
    std::map<std::string, uint32_t> Attributes;

    EntityMetadata(const std::string& Name,
                   const std::string& FunctionName = "",
                   MetadataKind K = MetadataKind::MK_BaseEntity)
        : Kind(K), FunctionName(FunctionName), Name(Name) {}

    void setAttribute(const std::string& Key, uint32_t Value) {
        Attributes[Key] = Value;
    }
    Optional<uint32_t> getAttribute(const std::string& Key) const {
        auto It = Attributes.find(Key);
        if (It != Attributes.end()) return It->second;
        return Optional<uint32_t>();
    }
    MetadataKind getKind() const { return Kind; }
    virtual ~EntityMetadata() = default; 
};

struct RegionMetadata : public EntityMetadata {
    std::set<uint32_t> SubRegions;
    std::set<uint32_t> Instructions;

    RegionMetadata(const std::string& Name,
                   const std::string& FunctionName = "")
        : EntityMetadata(Name, FunctionName, MetadataKind::MK_Region) {}

    void addSubRegion(uint32_t SubRegionID) {
        SubRegions.insert(SubRegionID);
    }
    void addInstruction(uint32_t InstructionID) {
        Instructions.insert(InstructionID);
    }
    static bool classof(const EntityMetadata *E) {
        return E->getKind() == MetadataKind::MK_Region;
    }
};

struct ArrayMetadata : public EntityMetadata {
    std::vector<uint32_t> Dimensions;

    ArrayMetadata(const std::string& Name,
                  const std::string& FunctionName = "")
        : EntityMetadata(Name, FunctionName, MetadataKind::MK_Array) {}

    void addDimension(uint32_t DimSize) {
        Dimensions.push_back(DimSize);
    }
    static bool classof(const EntityMetadata *E) {
        return E->getKind() == MetadataKind::MK_Array;
    }
};

struct ExtractMetadataPass : public ModulePass {
    static char ID;
    ExtractMetadataPass() : ModulePass(ID) {}

    std::map<std::string, std::vector<EntityMetadata*>> ModuleMetadata;
    std::map<uint32_t, RegionMetadata*> RegionIDMap;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        if (OutputFilePath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        const DataLayout &DL = M.getDataLayout();

        extractMetadataFromGlobals(M, DL);
        extractMetadataFromParams(M, DL);
        extractMetadataFromInstrs(M, DL);
        extractMetadataFromRegions(M);

        writeMetadataToFile(M);
        
        return false; // Module is not modified
    }

    void writeMetadataToFile(Module& M) {
        json::Object RootObject;

        for (const auto& It : ModuleMetadata) {
            std::string Key = It.first;
            const std::vector<EntityMetadata*>& MDList = It.second;
            json::Array EntityArray;

            for (const auto* MD : MDList) {
                json::Object EntityObject;

                EntityObject["name"] = MD->Name;
                EntityObject["functionName"] = MD->FunctionName;

                for (const auto& Attr : MD->Attributes) {
                    EntityObject[Attr.first] = static_cast<int64_t>(Attr.second);
                }

                if (const auto* RegionMD = dyn_cast<RegionMetadata>(MD)) {
                    json::Array SubRegionsArray;
                    for (uint32_t SubRegionID : RegionMD->SubRegions) {
                        SubRegionsArray.push_back(static_cast<int64_t>(SubRegionID));
                    }
                    EntityObject["subRegions"] = std::move(SubRegionsArray);

                    json::Array InstructionsArray;
                    for (uint32_t InstrID : RegionMD->Instructions) {
                        InstructionsArray.push_back(static_cast<int64_t>(InstrID));
                    }
                    EntityObject["instructions"] = std::move(InstructionsArray);

                } else if (const auto* ArrayMD = dyn_cast<ArrayMetadata>(MD)) {
                    json::Array DimensionsArray;
                    for (uint32_t DimSize : ArrayMD->Dimensions) {
                        DimensionsArray.push_back(static_cast<int64_t>(DimSize));
                    }
                    EntityObject["dimensions"] = std::move(DimensionsArray);
                }
                EntityArray.push_back(std::move(EntityObject));
            }
            RootObject[Key] = std::move(EntityArray);
        }
        std::string JsonString;
        raw_string_ostream SS(JsonString);
        SS << formatv("{0:2}", json::Value(std::move(RootObject)));
        SS.flush();

        std::ofstream OFS(OutputFilePath.c_str());
        if (!OFS.is_open()) {
            errs() << "Error: Could not open file '" << OutputFilePath.c_str() << "' for writing.\n";
            return;
        }
        OFS << JsonString;
        OFS.close();
    }

    void extractMetadataFromGlobals(Module& M, const DataLayout& DL) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            std::string Name = G.getName().str();
            std::string FunctionName = "";
            uint32_t IsInternalConst = 0;

            Optional<uint32_t> IDOpt = getIDFromMetadata(&G);
            if (!IDOpt.hasValue()) continue;
            uint32_t ID = IDOpt.getValue();

            // Check if the global variable is an internal constant
            // restricted to a function scope
            if (auto* DbgMDNode = G.getMetadata("dbg")) {
                if (auto* DbgVarExpr = dyn_cast<DIGlobalVariableExpression>(DbgMDNode)) {
                    if (auto* DbgVar = DbgVarExpr->getVariable()) {
                        Name = DbgVar->getName().str();
                        if (auto* DbgScope = DbgVar->getScope()) {
                            FunctionName = DbgScope->getName().str();
                            if (!FunctionName.empty()) {
                                IsInternalConst = 1;
                            }
                        }
                    }
                }
            }
            if (IsInternalConst == 0) {
                // If the global variable name has the format <function_name>.<variable_name>,
                // extract the function name from it and check if the function exists
                size_t DotPos = Name.find('.');
                if (DotPos != std::string::npos) {
                    FunctionName = Name.substr(0, DotPos);
                    if (M.getFunction(FunctionName) == nullptr) {
                        FunctionName = "";
                    } else {
                        Name = Name.substr(DotPos + 1);
                        IsInternalConst = 1;
                    }
                }
            }

            uint32_t FunctionID = 0;
            if (!FunctionName.empty()) {
                Function* F = M.getFunction(FunctionName);
                if (!F || F->isIntrinsic() || !F->hasName()) {
                    FunctionName = "";
                } else {
                    FunctionName = F->getName().str();
                    Optional<uint32_t> FunctionIDOpt = searchFunctionID(M, FunctionName);
                    FunctionID = FunctionIDOpt.hasValue() ? FunctionIDOpt.getValue() : 0;
                }
            }

            Type* BaseTy = Ty;
            if (Ty->isPointerTy()) {
                BaseTy = Ty->getPointerElementType();
            }
            if (BaseTy->isArrayTy()) {
                ArrayMetadata* MD = getArrayMetadata(BaseTy, Name, DL, FunctionName);
                MD->setAttribute("id", ID);
                MD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                MD->setAttribute("type", Ty->getTypeID());
                MD->setAttribute("isInternalConst", IsInternalConst);
                MD->setAttribute("isGlobal", 1);
                MD->setAttribute("functionId", FunctionID);
                ModuleMetadata["variable"].push_back(MD);
            } else {
                EntityMetadata* MD = new EntityMetadata(Name, FunctionName);
                MD->setAttribute("id", ID);
                MD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                MD->setAttribute("type", Ty->getTypeID());
                MD->setAttribute("isInternalConst", IsInternalConst);
                MD->setAttribute("isGlobal", 1);
                MD->setAttribute("functionId", FunctionID);
                ModuleMetadata["variable"].push_back(MD);
            }
        }
    }

    void extractMetadataFromRegions(Module& M) {
        struct StackFrame {
            Loop* CurrentLoop;
            uint32_t ParentID;
        };

        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> FunctionIDOpt = getIDFromMetadata(&F);
            if (!FunctionIDOpt.hasValue()) continue;
            uint32_t FunctionID = FunctionIDOpt.getValue();

            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            RegionMetadata* FunctionMD = new RegionMetadata(FunctionName, FunctionName);
            FunctionMD->setAttribute("id", FunctionID);
            FunctionMD->setAttribute("isLoop", 0);
            FunctionMD->setAttribute("tripCount", 1);
            FunctionMD->setAttribute("depth", 0);
            
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    Optional<uint32_t> InstrIDOpt = getIDFromMetadata(&I);
                    if (!InstrIDOpt.hasValue()) continue;
                    uint32_t InstrID = InstrIDOpt.getValue();
                    FunctionMD->addInstruction(InstrID);
                }
            }
            ModuleMetadata["region"].push_back(FunctionMD);
            RegionIDMap[FunctionID] = FunctionMD;
            
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<StackFrame> LoopStack;
                    LoopStack.push({L, FunctionID});

                    while (!LoopStack.empty()) {
                        StackFrame Frame = LoopStack.top();
                        LoopStack.pop();

                        Loop* CurrLoop = Frame.CurrentLoop;
                        uint32_t ParentID = Frame.ParentID;

                        std::string LoopName = getLoopName(CurrLoop);

                        Optional<uint32_t> LoopIDOpt = getLoopID(CurrLoop);
                        if (!LoopIDOpt.hasValue()) continue;
                        uint32_t LoopID = LoopIDOpt.getValue();

                        RegionMetadata* LoopMD = new RegionMetadata(LoopName, FunctionName);
                        LoopMD->setAttribute("id", LoopID);
                        LoopMD->setAttribute("isLoop", 1);
                        LoopMD->setAttribute("tripCount", getEstimatedLoopTripCount(CurrLoop, &SE));
                        LoopMD->setAttribute("depth", CurrLoop->getLoopDepth());

                        addSubRegion(ParentID, LoopID);
                        ModuleMetadata["region"].push_back(LoopMD);
                        RegionIDMap[LoopID] = LoopMD;

                        for (Loop* SubLoop : CurrLoop->getSubLoops()) {
                            LoopStack.push({SubLoop, LoopID});
                        }
                        for (BasicBlock* BB : CurrLoop->getBlocks()) {
                            for (Instruction& I : *BB) {
                                Optional<uint32_t> InstrIDOpt = getIDFromMetadata(&I);
                                if (!InstrIDOpt.hasValue()) continue;
                                uint32_t InstrID = InstrIDOpt.getValue();
                                LoopMD->addInstruction(InstrID);
                            }
                        }
                    }
                }
            }
        }
    }

    std::string getLoopName(Loop* L) {
        if (auto* Preheader = L->getLoopPreheader()) {
            return Preheader->getName().str();
        } else {
            return L->getHeader()->getName().str();
        }
    }

    void extractMetadataFromParams(Module& M, const DataLayout& DL) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> FunctionIDOpt = getIDFromMetadata(&F);
            if (!FunctionIDOpt.hasValue()) continue;
            uint32_t FunctionID = FunctionIDOpt.getValue();

            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            for (Argument& A : F.args()) {
                Type* Ty = A.getType();
                Type* BaseTy = Ty;
                std::string ParamName = A.getName().str();

                if (BaseTy->isPointerTy()) {
                    BaseTy = BaseTy->getPointerElementType();
                    uint32_t decayedDimSize = getDecayedDimSize(&A);
                    if (decayedDimSize > 0) {
                        BaseTy = ArrayType::get(BaseTy, decayedDimSize);
                    }
                }
                if (BaseTy->isArrayTy()) {
                    ArrayMetadata* MD = getArrayMetadata(BaseTy, ParamName, DL, FunctionName);
                    MD->setAttribute("id", A.getArgNo());
                    MD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                    MD->setAttribute("type", Ty->getTypeID());
                    MD->setAttribute("functionId", FunctionID);
                    MD->setAttribute("isParam", 1);
                    ModuleMetadata["variable"].push_back(MD);
                } else {
                    EntityMetadata* MD = new EntityMetadata(ParamName, FunctionName);
                    MD->setAttribute("id", A.getArgNo());
                    MD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                    MD->setAttribute("type", Ty->getTypeID());
                    MD->setAttribute("functionId", FunctionID);
                    MD->setAttribute("isParam", 1);
                    ModuleMetadata["variable"].push_back(MD);
                }
            }
        }
    }

    void extractMetadataFromInstrs(Module& M, const DataLayout& DL) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> FunctionIDOpt = getIDFromMetadata(&F);
            if (!FunctionIDOpt.hasValue()) continue;
            uint32_t FunctionID = FunctionIDOpt.getValue();

            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    Optional<uint32_t> InstrIDOpt = getIDFromMetadata(&I);
                    if (!InstrIDOpt.hasValue()) continue;
                    uint32_t InstrID = InstrIDOpt.getValue();

                    std::string Name = I.hasName() ? I.getName().str() : I.getOpcodeName();
                    EntityMetadata* IMD = new EntityMetadata(Name, FunctionName);
                    IMD->setAttribute("id", InstrID);
                    IMD->setAttribute("functionId", FunctionID);
                    IMD->setAttribute("opcode", I.getOpcode());
                    ModuleMetadata["instruction"].push_back(IMD);

                    Type* Ty = nullptr;
                    if (auto *AI = dyn_cast<AllocaInst>(&I)) {
                        Ty = AI->getAllocatedType();
                    } else {
                        Ty = I.getType();
                    }
                    if (!Ty->isVoidTy()) {
                        if (Ty->isArrayTy()) {
                            ArrayMetadata* VMD = getArrayMetadata(Ty, Name, DL, FunctionName);
                            VMD->setAttribute("id", InstrID);
                            VMD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                            VMD->setAttribute("type", Ty->getTypeID());
                            VMD->setAttribute("functionID", FunctionID);
                            ModuleMetadata["variable"].push_back(VMD);
                        } else {
                            EntityMetadata* VMD = new EntityMetadata(Name, FunctionName);
                            VMD->setAttribute("id", InstrID);
                            VMD->setAttribute("bitwidth", DL.getTypeAllocSizeInBits(Ty));
                            VMD->setAttribute("type", Ty->getTypeID());
                            VMD->setAttribute("functionId", FunctionID);
                            ModuleMetadata["variable"].push_back(VMD);
                        }
                    }
                }
            }
        }
    }

    Optional<uint32_t> searchFunctionID(Module& M, const std::string& FunctionName) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            if (F.hasName() && F.getName().str() == FunctionName) {
                Optional<uint32_t> FunctionIDOpt = getIDFromMetadata(&F);
                if (FunctionIDOpt.hasValue()) return FunctionIDOpt;
            }
        }
        return Optional<uint32_t>();
    }

    uint32_t getArgumentAttributeValue(const Argument* Arg, StringRef AttrName) {
        AttributeList Attrs = Arg->getParent()->getAttributes();
        const auto& Attr = Attrs.getParamAttr(Arg->getArgNo(), AttrName);
        auto AttrStr = Attr.getValueAsString();
        if (!AttrStr.empty()) {
            uint32_t AttrValue;
            if (to_integer(AttrStr, AttrValue)) return AttrValue;
        }
        return 0;
    }
    
    uint32_t getDecayedDimSize(const Argument *Arg) {
        return getArgumentAttributeValue(Arg, "fpga.decayed.dim.hint");
    }

    void addSubRegion(uint32_t ParentID, uint32_t SubRegionID) {
        if (RegionIDMap.count(ParentID)) {
            RegionIDMap[ParentID]->addSubRegion(SubRegionID);
        }
    }

    uint32_t getEstimatedLoopTripCount(Loop* L, ScalarEvolution* SE) {
        uint32_t LoopTC = 0;
        if (BasicBlock* ExitingBlock = getExitingBlock(L, SE)) {
            LoopTC = SE->getSmallConstantTripCount(L, ExitingBlock);
            if (LoopTC > 0) return LoopTC;
        }
        Optional<LoopTripCountMDInfo> LoopTCInfo = getLoopTripCount(L);
        if (LoopTCInfo.hasValue()) {
            LoopTC = (uint32_t)LoopTCInfo->getMax();
            if (LoopTC > 0) return LoopTC;
        }
        Optional<uint32_t> EstimatedLoopTC = getLoopEstimatedTripCount(L);
        if (EstimatedLoopTC.hasValue()) {
            LoopTC = EstimatedLoopTC.getValue();
        }
        return std::max(LoopTC, 1u);
    }

    ArrayMetadata* getArrayMetadata(Type* ArrayTy, const std::string& ArrayName, 
                                    const DataLayout& DL, 
                                    const std::string& FunctionName = "") {
        if (!ArrayTy->isArrayTy()) {
            errs() << "Error: Type is not an array type.\n";
            return nullptr;
        }
        ArrayMetadata* MD = new ArrayMetadata(ArrayName, FunctionName);

        uint32_t TotalSize = 1;
        Type* BaseTy = ArrayTy;
        while (BaseTy->isArrayTy()) {
            uint32_t DimSize = BaseTy->getArrayNumElements();
            MD->addDimension(DimSize);
            TotalSize *= DimSize;
            BaseTy = BaseTy->getArrayElementType();
        }

        MD->setAttribute("isArray", 1);
        MD->setAttribute("baseType", BaseTy->getTypeID());
        MD->setAttribute("baseTypeBitwidth", DL.getTypeAllocSizeInBits(BaseTy));
        MD->setAttribute("numDims", MD->Dimensions.size());
        MD->setAttribute("totalSize", TotalSize);

        return MD;
    }

    Optional<uint32_t> extractIDFromMDNode(MDNode* MD, unsigned Idx) {
        if (MD && MD->getNumOperands() > Idx) {
            if (auto* CAM = dyn_cast<ConstantAsMetadata>(MD->getOperand(Idx))) {
                if (auto* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                    return static_cast<uint32_t>(CI->getZExtValue());
                }
            }
        }
        return None;
    }

    Optional<uint32_t> getIDFromMetadata(const Value* V, unsigned Idx = 0) {
        if (const auto* F = dyn_cast<Function>(V)) {
            return extractIDFromMDNode(F->getMetadata("id"), Idx);
        }
        if (const auto* I = dyn_cast<Instruction>(V)) {
            return extractIDFromMDNode(I->getMetadata("id"), Idx);
        }
        if (const auto* G = dyn_cast<GlobalObject>(V)) {
            return extractIDFromMDNode(G->getMetadata("id"), Idx);
        }
        return None;
    }

    Optional<uint32_t> getLoopID(const Loop* L) {
        return extractIDFromMDNode(L->getLoopID(), 1);
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<ScalarEvolutionWrapperPass>();
    }

    ~ExtractMetadataPass() override {
        for (auto& ModuleMDEntry : ModuleMetadata) {
            for (auto* MD : ModuleMDEntry.second) {
                delete MD; // Clean up allocated metadata
            }
        }
        ModuleMetadata.clear();
    }
}; 
// End struct ExtractMetadataPass

} 
// End namespace

char ExtractMetadataPass::ID = 0;
static RegisterPass<ExtractMetadataPass> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);
