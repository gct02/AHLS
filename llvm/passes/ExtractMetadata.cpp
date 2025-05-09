#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stack>
#include <set>
#include <map>
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
    MK_Loop,
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
        : Name(Name), FunctionName(FunctionName), Kind(K) {}

    void setAttribute(const std::string& Key, uint32_t Value) {
        Attributes[Key] = Value;
    }
    Optional<uint32_t> getAttribute(const std::string& Key) const {
        auto It = Attributes.find(Key);
        if (It != Attributes.end()) {
            return It->second;
        }
        return Optional<uint32_t>();
    }
    MetadataKind getKind() const { return Kind; }
    virtual ~EntityMetadata() = default;
};

struct LoopMetadata : public EntityMetadata {
    std::set<std::string> SubLoops;
    std::set<std::string> BasicBlocks;

    LoopMetadata(const std::string& Name,
                 const std::string& FunctionName = "")
        : EntityMetadata(Name, FunctionName, MetadataKind::MK_Loop) {}

    void addSubLoop(const std::string& SubLoopID) {
        SubLoops.insert(SubLoopID);
    }
    void addBasicBlock(const std::string& BasicBlockID) {
        BasicBlocks.insert(BasicBlockID);
    }
    static bool classof(const EntityMetadata *E) {
        return E->getKind() == MetadataKind::MK_Loop;
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

    std::map<std::string, std::vector<EntityMetadata*>> ModuleMD;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        if (OutputPath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        DEBUG(errs() << "Extracting array metadata...\n");
        extractModuleArrayInfo(M);
        DEBUG(errs() << "Extracting loop metadata...\n");
        extractModuleLoopInfo(M);

        DEBUG(errs() << "Writing metadata to file...\n");
        writeMetadataToFile(M);
        
        return false; // Module is not modified
    }

    void extractModuleArrayInfo(Module& M) {
        DEBUG(errs() << "Extracting metadata from global arrays...\n");
        extractModuleGlobalArrayInfo(M);
        DEBUG(errs() << "Extracting metadata from local arrays...\n");
        extractModuleLocalArrayInfo(M);
    }

    void extractModuleLoopInfo(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<Loop*> LoopStack;
                    LoopStack.push(L);
                    do {
                        Loop* CurrLoop = LoopStack.top();
                        LoopStack.pop();

                        std::string LoopName = getLoopName(CurrLoop);
                        DEBUG(errs() << "Loop name: " << LoopName << "\n");
                        LoopMetadata* MD = new LoopMetadata(LoopName, FunctionName);
                        MD->setAttribute("TripCount", getEstimatedLoopTripCount(CurrLoop, &SE));
                        MD->setAttribute("LoopDepth", CurrLoop->getLoopDepth());
                        if (!L->getParentLoop()) {
                            MD->setAttribute("IsOuterMost", 1);
                        } else {
                            MD->setAttribute("IsOuterMost", 0);
                        }
                        ModuleMD["Loop"].push_back(MD);

                        for (Loop* SL : CurrLoop->getSubLoops()) {
                            std::string SubLoopName = getLoopName(SL);
                            MD->addSubLoop(SubLoopName);
                            LoopStack.push(SL);
                        }
                        for (BasicBlock* BB : CurrLoop->getBlocks()) {
                            if (!BB->hasName()) continue;
                            MD->addBasicBlock(BB->getName().str());
                        }
                    } while (!LoopStack.empty());
                }
            }
        }
    }

    void extractModuleGlobalArrayInfo(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* GlobalTy = G.getValueType();
            std::string GlobalName = G.getName().str();
            std::string FunctionName = "";
            uint32_t IsParam = 0;
            DEBUG(errs() << "Global name: " << GlobalName << "\n");

            // Check if the global object represents a function parameter
            if (auto* DbgMDNode = G.getMetadata("dbg")) {
                if (auto* DIVarExpr = dyn_cast<DIGlobalVariableExpression>(DbgMDNode)) {
                    if (auto* DIVar = DIVarExpr->getVariable()) {
                        if (DIVar->isLocalToUnit()) {
                            if (auto* DIS = DIVar->getScope()) {
                                FunctionName = DIS->getName().str();
                                GlobalName = DIVar->getName().str();
                                IsParam = 1;
                            }
                        }
                    }
                }
            }
            if (GlobalTy->isPointerTy()) {
                GlobalTy = GlobalTy->getPointerElementType();
            }
            if (GlobalTy->isArrayTy()) {
                DEBUG(errs() << GlobalName << " is a global array\n");
                ArrayMetadata* MD = getArrayMetadata(GlobalTy, GlobalName, FunctionName);
                MD->setAttribute("IsParam", IsParam);
                MD->setAttribute("IsGlobal", 1);
                ModuleMD["Array"].push_back(MD);
            }
        }
    }

    void extractModuleLocalArrayInfo(Module& M) {
        // Arrays allocated in the function body
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            std::string FunctionName = F.hasName() ? F.getName().str() : "";
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (AllocaInst* AI = dyn_cast<AllocaInst>(&I)) {
                        Type* Ty = AI->getAllocatedType();
                        if (Ty->isPointerTy()) {
                            Ty = Ty->getPointerElementType();
                        }
                        if (Ty->isArrayTy()) {
                            std::string Name = I.hasName() ? I.getName().str() : "";
                            DEBUG(errs() << "Local array name: " << Name << "\n");
                            ArrayMetadata* MD = getArrayMetadata(Ty, Name, FunctionName);
                            ModuleMD["Array"].push_back(MD);
                        }
                    }
                }
            }
        }

        // Arrays passed as function parameters
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0) continue;
            std::string FunctionName = F.hasName() ? F.getName().str() : "";
            for (Argument& A : F.args()) {
                Type* Ty = A.getType();
                if (Ty->isPointerTy()) {
                    uint32_t DecayedDimSize = getDecayedDimSize(&A);
                    if (DecayedDimSize > 0) {
                        Ty = ArrayType::get(Ty->getPointerElementType(), DecayedDimSize);
                    } else {
                        Ty = Ty->getPointerElementType();
                    }
                }
                if (Ty->isArrayTy()) {
                    std::string Name = A.getName().str();
                    ArrayMetadata* MD = getArrayMetadata(Ty, Name, FunctionName);
                    MD->setAttribute("IsParam", 1);
                    ModuleMD["Array"].push_back(MD);
                }
            }
        }
    }

    std::string getLoopName(Loop* L) {
        if (auto* PreHeader = L->getLoopPreheader()) {
            return PreHeader->getName().str();
        } else {
            return L->getHeader()->getName().str();
        }
    }

    void writeMetadataToFile(Module& M) {
        std::ofstream OF(OutputPath.c_str());
        if (!OF.is_open()) {
            errs() << "Error opening file: " << OutputPath << "\n";
            return;
        }

        OF << "{\n";
        bool FirstEntry = true;
        for (const auto& MDEntry : ModuleMD) {
             if (!FirstEntry) OF << ",\n";
             FirstEntry = false;

            std::string EntryType = MDEntry.first;
            std::vector<EntityMetadata*> MDList = MDEntry.second;

            OF << "  \"" << EntryType << "\": [\n";
            bool FirstMD = true;
            for (auto* MD : MDList) {
                if (!FirstMD) OF << ",\n";
                FirstMD = false;

                OF << "    {\n";
                OF << "      \"Name\": \"" << MD->Name << "\",\n";
                OF << "      \"FunctionName\": \"" << MD->FunctionName << "\"";

                for (auto MDItem : MD->Attributes) {
                    OF << ",\n      \"" << MDItem.first << "\": " << MDItem.second;
                }

                if (auto* LoopMD = dyn_cast<LoopMetadata>(MD)) {
                    OF << ",\n      \"SubLoops\": [";
                    bool FirstSL = true;
                    for (auto SLName : LoopMD->SubLoops) {
                         if (!FirstSL) OF << ",";
                         FirstSL = false;
                         OF << "\"" << SLName << "\"";
                    }
                    OF << "]";
                    OF << ",\n      \"BasicBlocks\": [";
                    bool FirstBB = true;
                    for (auto BBName : LoopMD->BasicBlocks) {
                         if (!FirstBB) OF << ",";
                         FirstBB = false;
                         OF << "\"" << BBName << "\"";
                    }
                    OF << "]";
                } else if (auto* ArrayMD = dyn_cast<ArrayMetadata>(MD)) {
                    OF << ",\n      \"Dimensions\": [";
                    bool FirstDim = true;
                    for (auto DimSize : ArrayMD->Dimensions) {
                         if (!FirstDim) OF << ",";
                         FirstDim = false;
                         OF << DimSize;
                    }
                    OF << "]";
                }
                OF << "\n    }"; // Close object braces
            }
             OF << "\n  ]"; // Close array
        }
        OF << "\n}"; // Close metadata map

        OF.close();
    }

    uint32_t getDecayedDimSize(const Argument *Arg) {
        return getArgumentAttributeValue(Arg, "fpga.decayed.dim.hint");
    }

    uint32_t getArgumentAttributeValue(const Argument* Arg, StringRef AttrName) {
        AttributeList Attrs = Arg->getParent()->getAttributes();
        const auto& Attr = Attrs.getParamAttr(Arg->getArgNo(), AttrName);
        auto AttrStr = Attr.getValueAsString();
        if (!AttrStr.empty()) {
            uint32_t AttrVal;
            if (to_integer(AttrStr, AttrVal)) {
                return AttrVal;
            }
        }
        return 0;
    }

    uint32_t getEstimatedLoopTripCount(Loop* L, ScalarEvolution* SE) {
        uint32_t LoopTC = 0;
        if (BasicBlock* ExitingBlock = getExitingBlock(L, SE)) {
            LoopTC = SE->getSmallConstantTripCount(L, ExitingBlock);
            if (LoopTC > 0) return LoopTC;
        }
        Optional<LoopTripCountMDInfo> LoopTCMDInfo = getLoopTripCount(L);
        if (LoopTCMDInfo.hasValue()) {
            LoopTC = (uint32_t)LoopTCMDInfo->getMax();
            if (LoopTC > 0) return LoopTC;
        }
        Optional<uint32_t> EstimatedLoopTC = getLoopEstimatedTripCount(L);
        if (EstimatedLoopTC.hasValue()) {
            LoopTC = EstimatedLoopTC.getValue();
        }
        return std::max(LoopTC, 1u);
    }

    ArrayMetadata* getArrayMetadata(Type* ArrayTy, std::string ArrayName, 
                                    std::string FunctionName = "") {
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

        MD->setAttribute("BaseType", BaseTy->getTypeID());
        MD->setAttribute("BaseBitwidth", BaseTy->getPrimitiveSizeInBits());
        MD->setAttribute("NumDims", NumDims);
        MD->setAttribute("TotalSize", TotalSize);
        return MD;
    }

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
        AU.addRequired<ScalarEvolutionWrapperPass>();
    }

    ~ExtractMetadataPass() override {
        for (auto& MDEntry : ModuleMD) {
            for (EntityMetadata* MD : MDEntry.second) {
                if (MD != nullptr) delete MD;
            }
        }
        ModuleMD.clear();
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