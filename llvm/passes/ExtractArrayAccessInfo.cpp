#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <utility>
#include <vector>

#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

static cl::opt<std::string> OutputFilePath(
    "out-access-info", 
    cl::desc("Path to the file to write the array access info to"),
    cl::value_desc("filepath")
);

namespace {

struct ArrayAccessInfo {
    std::string Name;
    std::string FunctionName;
    std::vector<std::pair<std::string, std::string>> Loads;
    std::vector<std::pair<std::string, uint32_t>> Stores;

    ArrayAccessInfo(const std::string& Name, const std::string& FunctionName)
          : Name(Name), FunctionName(FunctionName) {}

    void addLoad(const std::string& FunctionName, const std::string& LoadInstName) {
        Loads.emplace_back(FunctionName, LoadInstName);
    }

    void addStore(const std::string& FunctionName, uint32_t StoreInstIndex) {
        Stores.emplace_back(FunctionName, StoreInstIndex);
    }
};

struct ExtractArrayAccessInfoPass : public ModulePass {
    static char ID;
    ExtractArrayAccessInfoPass() : ModulePass(ID) {}

    std::vector<ArrayAccessInfo*> ModuleArrayAccessInfo;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-array-access-info"

        if (OutputFilePath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        assignIndicesToStores(M);
        extractArrayAccessInfo(M);
        serializeArrayMetadataToJson(M);

        return false; // Module is not modified
    }

    void serializeArrayMetadataToJson(Module& M) {
        std::ofstream OFS(OutputFilePath);
        if (!OFS.is_open()) {
            errs() << "Error opening file: " << OutputFilePath << "\n";
            return;
        }

        OFS << "{\n  \"ArrayAccessInfo\": [\n";

        bool FirstEntry = true;
        for (const auto* It : ModuleArrayAccessInfo) {
            if (!FirstEntry)
                OFS << ",\n";
            FirstEntry = false;

            OFS << "    {\n";
            OFS << "      \"Name\": \"" << It->Name << "\",\n";
            OFS << "      \"FunctionName\": \"" << It->FunctionName << "\",\n";

            OFS << "      \"Stores\": [";
            for (size_t i = 0; i < It->Stores.size(); ++i) {
                if (i > 0) OFS << ", ";
                OFS << "{ \"FunctionName\": \"" << It->Stores[i].first
                    << "\", \"StoreInstIndex\": " << It->Stores[i].second << " }";
            }
            OFS << "],\n";

            OFS << "      \"Loads\": [";
            for (size_t i = 0; i < It->Loads.size(); ++i) {
                if (i > 0) OFS << ", ";
                OFS << "{ \"FunctionName\": \"" << It->Loads[i].first
                    << "\", \"LoadInstName\": \"" << It->Loads[i].second << "\" }";
            }
            OFS << "]\n";

            OFS << "    }";
        }

        OFS << "\n  ]\n";
        OFS << "}\n";
    }

    void extractArrayAccessInfo(Module& M) {
        extractGlobalArrayAccessInfo(M);
        extractLocalArrayAccessInfo(M);
    }

    void extractGlobalArrayAccessInfo(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            if (Ty->isPointerTy()) {
                Ty = Ty->getPointerElementType();
            }
            if (!Ty->isArrayTy()) continue;

            std::string Name = G.getName().str();
            std::string FunctionName = "";

            // Check if the global variable is an internal constant
            // restricted to a function scope
            if (auto* DbgMDNode = G.getMetadata("dbg")) {
                if (auto* DbgVarExpr = dyn_cast<DIGlobalVariableExpression>(DbgMDNode)) {
                    if (auto* DbgVar = DbgVarExpr->getVariable()) {
                        Name = DbgVar->getName().str();
                        if (auto* DbgScope = DbgVar->getScope()) {
                            FunctionName = DbgScope->getName().str();
                        }
                    }
                }
            }
            if (FunctionName.empty()) {
                size_t DotPos = Name.find('.');
                if (DotPos != std::string::npos) {
                    FunctionName = Name.substr(0, DotPos);
                    if (M.getFunction(FunctionName) == nullptr) {
                        FunctionName = "";
                    } else {
                        Name = Name.substr(DotPos + 1);
                    }
                }
            }
            ArrayAccessInfo* AccessInfo = new ArrayAccessInfo(Name, FunctionName);
            collectArrayUses(AccessInfo, &G);
            ModuleArrayAccessInfo.push_back(AccessInfo);
        }
    }

    void extractLocalArrayAccessInfo(Module& M) {
        for (Function& F : M) {
            if (F.isIntrinsic() || F.size() == 0 || !F.hasName()) continue;
            std::string FunctionName = F.getName().str();

            // Arrays allocated in the function body
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (!I.hasName()) continue;
                    if (AllocaInst* AI = dyn_cast<AllocaInst>(&I)) {
                        Type* Ty = AI->getAllocatedType();
                        if (Ty->isPointerTy()) Ty = Ty->getPointerElementType();
                        if (Ty->isArrayTy()) {
                            std::string Name = I.getName().str();
                            ArrayAccessInfo* AccessInfo = new ArrayAccessInfo(Name, FunctionName);
                            collectArrayUses(AccessInfo, AI);
                            ModuleArrayAccessInfo.push_back(AccessInfo);
                        }
                    }
                }
            }
            // Array parameters
            for (Argument& A : F.args()) {
                Type* Ty = A.getType();
                if (Ty->isArrayTy() || 
                    (Ty->isPointerTy() && Ty->getPointerElementType()->isArrayTy()) || 
                    getDecayedDimSize(&A) > 0) {
                    ArrayAccessInfo* AccessInfo = new ArrayAccessInfo(A.getName().str(), FunctionName);
                    collectArrayUses(AccessInfo, &A);
                    ModuleArrayAccessInfo.push_back(AccessInfo);
                }
            }
        }
    }

    void collectArrayUses(ArrayAccessInfo* AccessInfo, Value* ArrayVal) {
        for (auto& U : ArrayVal->uses()) {
            if (auto* I = dyn_cast<Instruction>(U.getUser())) {
                if (auto* GEP = dyn_cast<GEPOperator>(I)) {
                    // If the instruction is a GEPOperator, we need to check its users
                    // to find the actual load/store instructions that uses the array.
                    for (auto Use : GEP->users()) {
                        if (auto* Inst = dyn_cast<Instruction>(Use)) {
                            getArrayUseMetadata(AccessInfo, Inst);
                        }
                    }
                }
                getArrayUseMetadata(AccessInfo, I);
            }
        }
    }

    void getArrayUseMetadata(ArrayAccessInfo* AccessInfo, Instruction* Instr) {
        std::string FunctionName = "";
        if (auto* F = Instr->getFunction()) {
            if (F->hasName()) {
                FunctionName = F->getName().str();
            }
        }
        if (FunctionName.empty()) return;

        if (auto* SI = dyn_cast<StoreInst>(Instr)) {
            Optional<uint32_t> StoreIdx = getStoreIndex(*Instr);
            if (!StoreIdx.hasValue()) return;
            AccessInfo->addStore(FunctionName, StoreIdx.getValue());
        } else {
            std::string InstName = Instr->hasName() ? Instr->getName().str() : "";
            if (InstName.empty()) return;
            AccessInfo->addLoad(FunctionName, InstName);
        }
    }

    void assignIndicesToStores(Module& M) {
        LLVMContext& Ctx = M.getContext();
        for (Function& F : M) {
            uint32_t Idx = 0;
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (auto* SI = dyn_cast<StoreInst>(&I)) {
                        ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(Ctx), Idx++);
                        MDNode* MD = MDNode::get(Ctx, {ConstantAsMetadata::get(CI)});
                        SI->setMetadata("storeIdx", MD);
                    }
                }
            }
        }
    }

    Optional<uint32_t> getStoreIndex(const Instruction& I) const {
        if (auto* MD = I.getMetadata("storeIdx")) {
            if (auto* CAM = dyn_cast<ConstantAsMetadata>(MD->getOperand(0))) {
                if (auto* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                    return CI->getSExtValue();
                }
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

};
// End struct ExtractArrayAccessInfoPass

}
// End namespace

char ExtractArrayAccessInfoPass::ID = 0;
static RegisterPass<ExtractArrayAccessInfoPass> X(
    "extract-array-access-info",
    "Extracts array access information from the module",
    false /* Only looks at CFG */,
    false /* Analysis Pass */
);