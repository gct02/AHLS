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
    "out", 
    cl::desc("Path to the file to write the array metadata to"),
    cl::value_desc("filepath")
);

namespace {

struct ArrayMetadata {
    std::string Name;
    std::string FunctionName;
    std::map<std::string, uint32_t> Attributes;
    std::vector<uint32_t> Dimensions;
    std::vector<std::pair<std::string, uint32_t>> Stores;

    ArrayMetadata(const std::string& Name,
                  const std::string& FunctionName = "",
                  const std::map<std::string, uint32_t>& Attributes = {},
                  const std::vector<uint32_t>& Dimensions = {})
        : Name(Name), FunctionName(FunctionName), Attributes(Attributes),
          Dimensions(Dimensions) {}

    Optional<uint32_t> getAttribute(const std::string& Key) const {
        auto It = Attributes.find(Key);
        if (It != Attributes.end()) return It->second;
        return Optional<uint32_t>();
    }

    void setAttribute(const std::string& Key, uint32_t Value) {
        Attributes[Key] = Value;
    }

    void addDimension(uint32_t DimSize) {
        Dimensions.push_back(DimSize);
    }

    void addStore(const std::string& FunctionName, uint32_t StoreIndex) {
        Stores.emplace_back(FunctionName, StoreIndex);
    }
};

struct ExtractArrayMetadataPass : public ModulePass {
    static char ID;
    ExtractArrayMetadataPass() : ModulePass(ID) {}

    std::vector<ArrayMetadata*> ModuleArrayMetadata;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-array-md"

        if (OutputFilePath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        extractArrayMetadata(M);
        serializeArrayMetadataToJson(M);

        return false; // Module is not modified
    }

    void serializeArrayMetadataToJson(Module& M) {
        std::ofstream OFS(OutputFilePath);
        if (!OFS.is_open()) {
            errs() << "Error opening file: " << OutputFilePath << "\n";
            return;
        }

        OFS << "{\n  \"ArrayMetadata\": [\n";

        bool FirstEntry = true;
        for (const auto* It : ModuleArrayMetadata) {
            if (!FirstEntry)
                OFS << ",\n";
            FirstEntry = false;

            OFS << "    {\n";
            OFS << "      \"Name\": \"" << It->Name << "\",\n";
            OFS << "      \"FunctionName\": \"" << It->FunctionName << "\"";

            for (const auto& MDItem : It->Attributes) {
                OFS << ",\n";
                OFS << "      \"" << MDItem.first << "\": " << MDItem.second;
            }

            OFS << ",\n";
            OFS << "      \"Dimensions\": [";
            for (size_t i = 0; i < It->Dimensions.size(); ++i) {
                if (i > 0) OFS << ", ";
                OFS << It->Dimensions[i];
            }
            OFS << "],\n";

            OFS << "      \"Stores\": [";
            for (size_t i = 0; i < It->Stores.size(); ++i) {
                if (i > 0) OFS << ", ";
                OFS << "{ \"FunctionName\": \"" << It->Stores[i].first
                    << "\", \"StoreIndex\": " << It->Stores[i].second << " }";
            }
            OFS << "]\n";

            OFS << "    }";
        }

        OFS << "\n  ]\n";
        OFS << "}\n";
    }

    void extractArrayMetadata(Module& M) {
        extractGlobalArrayMetadata(M);
        extractLocalArrayMetadata(M);
    }

    void extractGlobalArrayMetadata(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            if (Ty->isPointerTy()) {
                Ty = Ty->getPointerElementType();
            }
            if (!Ty->isArrayTy()) continue;

            std::string Name = G.getName().str();
            std::string FunctionName = "";
            uint32_t IsInternalConst = 0;

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
            ArrayMetadata* MD = getArrayMetadata(Ty, Name, FunctionName);
            MD->setAttribute("IsInternalConst", IsInternalConst);
            MD->setAttribute("IsGlobal", 1);
            fetchArrayUses(MD, &G);
            ModuleArrayMetadata.push_back(MD);
        }
    }

    void extractLocalArrayMetadata(Module& M) {
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
                            ArrayMetadata* MD = getArrayMetadata(Ty, Name, FunctionName);
                            fetchArrayUses(MD, AI);
                            ModuleArrayMetadata.push_back(MD);
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
                    ArrayMetadata* MD = getArrayMetadata(Ty, Name, FunctionName);
                    MD->setAttribute("IsParam", 1);
                    fetchArrayUses(MD, &A);
                    ModuleArrayMetadata.push_back(MD);
                }
            }
        }
    }

    void fetchArrayUses(ArrayMetadata* MD, Value* ArrayVal) {
        for (auto& U : ArrayVal->uses()) {
            if (auto* I = dyn_cast<Instruction>(U.getUser())) {
                // If the instruction is a GEPOperator, use its users
                if (auto* GEP = dyn_cast<GEPOperator>(I)) {
                    for (auto Use : GEP->users()) {
                        if (auto* Inst = dyn_cast<Instruction>(Use)) {
                            std::string FunctionName = "";
                            if (auto* F = Inst->getFunction()) {
                                if (F->hasName()) {
                                    FunctionName = F->getName().str();
                                }
                            }
                            if (FunctionName.empty()) continue;
                            Optional<uint32_t> StoreIdx = getStoreIndex(*Inst);
                            if (StoreIdx.hasValue()) {
                                MD->addStore(FunctionName, StoreIdx.getValue());
                            }
                        }
                    }
                } else {
                    std::string FunctionName = "";
                    if (auto* F = I->getFunction()) {
                        if (F->hasName()) {
                            FunctionName = F->getName().str();
                        }
                    }
                    if (FunctionName.empty()) continue;
                    Optional<uint32_t> StoreIdx = getStoreIndex(*I);
                    if (StoreIdx.hasValue()) {
                        MD->addStore(FunctionName, StoreIdx.getValue());
                    }
                }
            }
        }
    }

    ArrayMetadata* getArrayMetadata(Type* ArrayTy, std::string ArrayName, 
                                    std::string FunctionName = "") {
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
        MD->setAttribute("BaseType", BaseTy->getTypeID());
        MD->setAttribute("BaseBitwidth", BaseTy->getPrimitiveSizeInBits());
        MD->setAttribute("NumDimensions", MD->Dimensions.size());
        MD->setAttribute("TotalSize", TotalSize);
        return MD;
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

};
// End struct ExtractArrayMetadataPass

}
// End namespace

char ExtractArrayMetadataPass::ID = 0;
static RegisterPass<ExtractArrayMetadataPass> X(
    "extract-array-md", 
    "Extract array metadata from the module",
    false /* Only looks at CFG */,
    false /* Analysis Pass */
);