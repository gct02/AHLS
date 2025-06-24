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

    ArrayAccessInfo(const std::string& Name,
                    const std::string& FunctionName)
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
            OFS << "      \"FunctionName\": \"" << It->FunctionName << "\"";

            OFS << "      \"Stores\": [";
            for (size_t i = 0; i < It->Stores.size(); ++i) {
                if (i > 0) OFS << ", ";
                OFS << "{ \"FunctionName\": \"" << It->Stores[i].first
                    << "\", \"StoreInstIndex\": " << It->Stores[i].second << " }";
            }
            OFS << "]\n";

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
                            ArrayAccessInfo* AccessInfo = new ArrayAccessInfo(Name, FunctionName);
                            collectArrayUses(AccessInfo, AI);
                            ModuleArrayAccessInfo.push_back(AccessInfo);
                        }
                    }
                }
            }
        }
        // Arrays parameters
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
                    ArrayAccessInfo* AccessInfo = new ArrayAccessInfo(Name, FunctionName);
                    collectArrayUses(AccessInfo, &A);
                    ModuleArrayAccessInfo.push_back(AccessInfo);
                }
            }
        }
    }

    void collectArrayUses(ArrayAccessInfo* AccessInfo, Value* ArrayVal) {
        for (auto& U : ArrayVal->uses()) {
            if (auto* I = dyn_cast<Instruction>(U.getUser())) {
                // If the instruction is a GEPOperator, we need to check its users
                // to find the actual load/store instructions that use the array.
                if (auto* GEP = dyn_cast<GEPOperator>(I)) {
                    for (auto Use : GEP->users()) {
                        if (auto* Inst = dyn_cast<Instruction>(Use)) {
                            getArrayUseMetadata(AccessInfo, Inst);
                        }
                    }
                } else {
                    getArrayUseMetadata(AccessInfo, I);
                }
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
        Optional<uint32_t> StoreIdx = getStoreIndex(*Instr);
        if (StoreIdx.hasValue()) {
            AccessInfo->addStore(FunctionName, StoreIdx.getValue());
        } else {
            std::string LoadInstName = Instr->hasName() ? Instr->getName().str() : "";
            AccessInfo->addLoad(FunctionName, LoadInstName);
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