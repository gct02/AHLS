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
#include "llvm/Support/Debug.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/Local.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"

using namespace llvm;

static cl::opt<std::string> OutputPath(
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

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        if (OutputPath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }

        extractMetadataFromGlobals(M);
        extractMetadataFromRegions(M);
        extractMetadataFromParams(M);
        extractMetadataFromInstrs(M);

        writeMetadataToFile(M);
        
        return false; // Module is not modified
    }

    void writeMetadataToFile(Module& M) {
        std::ofstream OutStream(OutputPath.c_str());
        if (!OutStream.is_open()) {
            errs() << "Error opening file: " << OutputPath << "\n";
            return;
        }

        OutStream << "{\n";
        bool FirstTy = true;
        for (const auto& ModuleMDEntry : ModuleMetadata) {
             if (!FirstTy) OutStream << ",\n";
             FirstTy = false;

            std::string Ty = ModuleMDEntry.first;
            std::vector<EntityMetadata*> MD = ModuleMDEntry.second;

            OutStream << "  \"" << Ty << "\": [\n";
            bool FirstMD = true;
            for (auto* MDEntry : MD) {
                if (!FirstMD) OutStream << ",\n";
                FirstMD = false;

                OutStream << "    {\n";
                OutStream << "      \"name\": \"" << MDEntry->Name << "\",\n";
                OutStream << "      \"functionName\": \"" << MDEntry->FunctionName << "\"";

                for (auto MDAttrEntry : MDEntry->Attributes) {
                    OutStream << ",\n      \"" << MDAttrEntry.first << "\": " << MDAttrEntry.second;
                }

                if (auto* RegionMDEntry = dyn_cast<RegionMetadata>(MDEntry)) {
                    OutStream << ",\n      \"subRegions\": [";
                    bool FirstSub = true;
                    for (auto SubRegionID : RegionMDEntry->SubRegions) {
                         if (!FirstSub) OutStream << ",";
                         FirstSub = false;
                         OutStream << SubRegionID;
                    }
                    OutStream << "]";
                    OutStream << ",\n      \"instructions\": [";
                    bool FirstInstr = true;
                    for (auto InstrID : RegionMDEntry->Instructions) {
                         if (!FirstInstr) OutStream << ",";
                         FirstInstr = false;
                         OutStream << InstrID;
                    }
                    OutStream << "]";
                } else if (auto* ArrayMDEntry = dyn_cast<ArrayMetadata>(MDEntry)) {
                    OutStream << ",\n      \"dimensions\": [";
                    bool FirstDim = true;
                    for (auto DimSize : ArrayMDEntry->Dimensions) {
                         if (!FirstDim) OutStream << ",";
                         FirstDim = false;
                         OutStream << DimSize;
                    }
                    OutStream << "]";
                }
                OutStream << "\n    }"; // Close object braces
            }
             OutStream << "\n  ]"; // Close array
        }
        OutStream << "\n}"; // Close metadata map

        OutStream.close();
    }

    void extractMetadataFromGlobals(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            std::string Name = G.getName().str();
            std::string FunctionName = "";
            uint32_t IsParam = 0;

            Optional<uint32_t> IDOpt = getGlobalID(&G);
            if (!IDOpt.hasValue()) continue;
            uint32_t ID = IDOpt.getValue();

            // Check if the global variable is a function parameter
            if (auto* DbgMDNode = G.getMetadata("dbg")) {
                if (auto* DbgVarExpr = dyn_cast<DIGlobalVariableExpression>(DbgMDNode)) {
                    if (auto* DbgVar = DbgVarExpr->getVariable()) {
                        Name = DbgVar->getName().str();
                        if (auto* DbgScope = DbgVar->getScope()) {
                            FunctionName = DbgScope->getName().str();
                            if (FunctionName.empty() == false) IsParam = 1;
                        }
                    }
                }
            }

            Type* BaseTy = Ty;
            if (Ty->isPointerTy()) {
                BaseTy = Ty->getPointerElementType();
            }
            if (BaseTy->isArrayTy()) {
                ArrayMetadata* MD = getArrayMetadata(BaseTy, Name, FunctionName);
                MD->setAttribute("id", ID);
                MD->setAttribute("isParam", IsParam);
                MD->setAttribute("isGlobal", 1);
                if (IsParam == 1) {
                    Optional<uint32_t> FunctionIDOpt = searchFunctionID(M, FunctionName);
                    if (FunctionIDOpt.hasValue()) {
                        MD->setAttribute("functionId", FunctionIDOpt.getValue());
                    } else {
                        MD->setAttribute("functionId", 0);
                    }
                }
                ModuleMetadata["variable"].push_back(MD);
            } else {
                EntityMetadata* MD = new EntityMetadata(Name, FunctionName);
                MD->setAttribute("id", ID);
                MD->setAttribute("bitwidth", Ty->getPrimitiveSizeInBits());
                MD->setAttribute("type", Ty->getTypeID());
                MD->setAttribute("isParam", IsParam);
                MD->setAttribute("isGlobal", 1);
                if (IsParam == 1) {
                    Optional<uint32_t> FunctionIDOpt = searchFunctionID(M, FunctionName);
                    if (FunctionIDOpt.hasValue()) {
                        MD->setAttribute("functionId", FunctionIDOpt.getValue());
                    } else {
                        MD->setAttribute("functionId", 0);
                    }
                }
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

            Optional<uint32_t> FunctionIDOpt = getFunctionID(&F);
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
                    Optional<uint32_t> InstrIDOpt = getInstructionID(&I);
                    if (!InstrIDOpt.hasValue()) continue;
                    uint32_t InstrID = InstrIDOpt.getValue();
                    FunctionMD->addInstruction(InstrID);
                }
            }
            ModuleMetadata["region"].push_back(FunctionMD);
            
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

                        for (Loop* SubLoop : CurrLoop->getSubLoops()) {
                            LoopStack.push({SubLoop, LoopID});
                        }
                        for (BasicBlock* BB : CurrLoop->getBlocks()) {
                            for (Instruction& I : *BB) {
                                Optional<uint32_t> InstrIDOpt = getInstructionID(&I);
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

    void extractMetadataFromParams(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> FunctionIDOpt = getFunctionID(&F);
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
                    ArrayMetadata* MD = getArrayMetadata(BaseTy, ParamName, FunctionName);
                    MD->setAttribute("functionId", FunctionID);
                    MD->setAttribute("isParam", 1);
                    ModuleMetadata["variable"].push_back(MD);
                } else {
                    EntityMetadata* MD = new EntityMetadata(ParamName, FunctionName);
                    MD->setAttribute("bitwidth", Ty->getPrimitiveSizeInBits());
                    MD->setAttribute("type", Ty->getTypeID());
                    MD->setAttribute("functionId", FunctionID);
                    MD->setAttribute("isParam", 1);
                    ModuleMetadata["variable"].push_back(MD);
                }
            }
        }
    }

    void extractMetadataFromInstrs(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;

            Optional<uint32_t> FunctionIDOpt = getFunctionID(&F);
            if (!FunctionIDOpt.hasValue()) continue;
            uint32_t FunctionID = FunctionIDOpt.getValue();

            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    Optional<uint32_t> InstrIDOpt = getInstructionID(&I);
                    if (!InstrIDOpt.hasValue()) continue;
                    uint32_t InstrID = InstrIDOpt.getValue();

                    std::string InstrName = I.hasName() ? I.getName().str() : I.getOpcodeName();
                    EntityMetadata* InstrMD = new EntityMetadata(InstrName, FunctionName);
                    InstrMD->setAttribute("id", InstrID);
                    InstrMD->setAttribute("functionId", FunctionID);
                    InstrMD->setAttribute("opcode", I.getOpcode());
                    ModuleMetadata["instruction"].push_back(InstrMD);

                    Type* Ty = I.getType();
                    if (!Ty->isVoidTy()) {
                        DEBUG(dbgs() << "Instruction: " << I << "\n");
                        DEBUG(dbgs() << "Instruction type: " << I.getType()->getTypeID() << "\n");
                        Type* BaseTy = Ty;
                        if (BaseTy->isPointerTy()) {
                            BaseTy = BaseTy->getPointerElementType();
                        }
                        if (BaseTy->isArrayTy()) {
                            DEBUG(dbgs() << "Array type found: " << BaseTy->getTypeID() << "\n");
                            ArrayMetadata* ArrayMD = getArrayMetadata(BaseTy, InstrName, FunctionName);
                            ArrayMD->setAttribute("id", InstrID);
                            ArrayMD->setAttribute("functionID", FunctionID);
                            ModuleMetadata["variable"].push_back(ArrayMD);
                        } else {
                            EntityMetadata* ValueMD = new EntityMetadata(InstrName, FunctionName);
                            ValueMD->setAttribute("id", InstrID);
                            ValueMD->setAttribute("bitwidth", Ty->getPrimitiveSizeInBits());
                            ValueMD->setAttribute("type", Ty->getTypeID());
                            ValueMD->setAttribute("functionId", FunctionID);
                            ModuleMetadata["variable"].push_back(ValueMD);
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
                Optional<uint32_t> FunctionIDOpt = getFunctionID(&F);
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
        for (auto* MD : ModuleMetadata["region"]) {
            if (auto* RegionMD = dyn_cast<RegionMetadata>(MD)) {
                Optional<uint32_t> RegionIDOpt = RegionMD->getAttribute("id");
                if (!RegionIDOpt.hasValue()) continue;
                uint32_t RegionID = RegionIDOpt.getValue();
                if (RegionID == ParentID) {
                    RegionMD->addSubRegion(SubRegionID);
                }
            }
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
                                    const std::string& FunctionName = "") {
        if (!ArrayTy->isArrayTy()) {
            errs() << "Error: Type is not an array type.\n";
            return nullptr;
        }
        ArrayMetadata* MD = new ArrayMetadata(ArrayName, FunctionName);

        uint32_t NumDims = 1;
        uint32_t TotalSize = 1;
        Type* BaseTy = ArrayTy;
        do {
            uint32_t DimSize = BaseTy->getArrayNumElements();
            MD->addDimension(DimSize);
            TotalSize *= DimSize;
            NumDims++;
            BaseTy = BaseTy->getArrayElementType();
        } while (BaseTy->isArrayTy());

        MD->setAttribute("isArray", 1);
        MD->setAttribute("baseType", BaseTy->getTypeID());
        MD->setAttribute("baseTypeBitwidth", BaseTy->getPrimitiveSizeInBits());
        MD->setAttribute("numDims", NumDims);
        MD->setAttribute("totalSize", TotalSize);

        return MD;
    }

    Optional<uint32_t> getFunctionID(const Function* F) {
        if (MDNode* IDMDNode = F->getMetadata("id")) {
            if (IDMDNode->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(IDMDNode->getOperand(0))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getLoopID(const Loop* L) {
        if (MDNode* IDMDNode = L->getLoopID()) {
            if (IDMDNode->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(IDMDNode->getOperand(1))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getInstructionID(const Instruction* I) {
        if (MDNode* IDMDNode = I->getMetadata("id")) {
            if (IDMDNode->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(IDMDNode->getOperand(0))) {
                    if (ConstantInt* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                        return (uint32_t)CI->getZExtValue();
                    }
                }
            }
        }
        return Optional<uint32_t>();
    }

    Optional<uint32_t> getGlobalID(const GlobalObject* G) {
        if (MDNode* IDMDNode = G->getMetadata("id")) {
            if (IDMDNode->getNumOperands() > 0) {
                if (ConstantAsMetadata* CAM = dyn_cast<ConstantAsMetadata>(IDMDNode->getOperand(0))) {
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
// End struct ExtractMetadataPass

} 
// End namespace

char ExtractMetadataPass::ID = 0;
static RegisterPass<ExtractMetadataPass> X(
    "extract-md", 
    "Extract metadata from the module", 
    false, false
);
