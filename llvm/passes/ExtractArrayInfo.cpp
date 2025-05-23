#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <utility>
#include <vector>

#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"


using namespace llvm;

static cl::opt<std::string> OutputPath(
    "out", 
    cl::desc("Path to the file to write the array information to"), 
    cl::value_desc("filepath")
);

namespace {

struct ArrayInfo {
    std::string Name;
    std::string FunctionName;
    std::vector<uint32_t> Dimensions;
    std::map<std::string, uint32_t> Attributes;

    ArrayInfo(const std::string& Name, 
              const std::string& FunctionName = "")
        : Name(Name), FunctionName(FunctionName) {}

    void setAttribute(const std::string& Key, uint32_t Value) {
        Attributes[Key] = Value;
    }
    Optional<uint32_t> getAttribute(const std::string& Key) const {
        auto It = Attributes.find(Key);
        if (It != Attributes.end()) return It->second;
        return Optional<uint32_t>();
    }

    void addDimension(uint32_t DimSize) {
        Dimensions.push_back(DimSize);
    }
};

struct ExtractArrayInfoPass : public ModulePass {
    static char ID;
    ExtractArrayInfoPass() : ModulePass(ID) {}

   std::vector<ArrayInfo*> ArrayInfoList;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-md"

        if (OutputPath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        extractModuleArrayInfo(M);
        writeArrayInfoToFile(M);
        
        return false; // Module is not modified
    }

    void extractModuleArrayInfo(Module& M) {
        extractModuleGlobalArrayInfo(M);
        extractModuleLocalArrayInfo(M);
    }

    void extractModuleGlobalArrayInfo(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            if (Ty->isPointerTy()) {
                Ty = Ty->getPointerElementType();
            }
            if (!Ty->isArrayTy()) continue;

            std::string GlobalName = G.getName().str();
            std::string FunctionName = "";
            uint32_t IsParam = 0;

            // Check if the global object represents a function parameter
            // First, check if it has a debug info node
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
            // If no debug info, check if its name has the format <function>.<param>
            if (IsParam == 0) {
                size_t DotPos = GlobalName.find('.');
                if (DotPos != std::string::npos) {
                    FunctionName = GlobalName.substr(0, DotPos);
                    GlobalName = GlobalName.substr(DotPos + 1);
                    IsParam = 1;
                }
            }
            ArrayInfo* Info = getArrayInfo(Ty, GlobalName, FunctionName);
            Info->setAttribute("IsParam", IsParam);
            Info->setAttribute("IsGlobal", 1);
            ArrayInfoList.push_back(Info);
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
                            ArrayInfo* Info = getArrayInfo(Ty, Name, FunctionName);
                            ArrayInfoList.push_back(Info);
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
                    ArrayInfo* Info = getArrayInfo(Ty, Name, FunctionName);
                    Info->setAttribute("IsParam", 1);
                    ArrayInfoList.push_back(Info);
                }
            }
        }
    }

    void writeArrayInfoToFile(Module& M) {
        std::ofstream OFStream(OutputPath.c_str());
        if (!OFStream.is_open()) {
            errs() << "Error opening file: " << OutputPath << "\n";
            return;
        }

        OFStream << "{\n  \"ArrayInfo\": [\n";
        bool FirstEntry = true;
        for (const auto* Info : ArrayInfoList) {
            if (!FirstEntry) OFStream << ",\n";
            FirstEntry = false;

            OFStream << "    {\n";
            OFStream << "      \"Name\": \"" << Info->Name << "\",\n";
            OFStream << "      \"FunctionName\": \"" << Info->FunctionName << "\"";
            for (auto MDItem : Info->Attributes) {
                OFStream << ",\n      \"" << MDItem.first << "\": " << MDItem.second;
            }

            OFStream << ",\n      \"Dimensions\": [";
            bool FirstDim = true;
            for (auto DimSize : Info->Dimensions) {
                if (!FirstDim) OFStream << ",";
                FirstDim = false;
                OFStream << DimSize;
            }
            OFStream << "]"; 
            OFStream << "\n    }"; // Close ArrayInfo object braces
        }
        OFStream << "\n  ]"; // Close ArrayInfo array braces

        OFStream << "\n}"; // Close JSON object braces

        OFStream.close();
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

    ArrayInfo* getArrayInfo(Type* ArrayTy, std::string ArrayName, 
                            std::string FunctionName = "") {
        if (!ArrayTy->isArrayTy()) {
            errs() << "Error: Type is not an array type.\n";
            return nullptr;
        }
        ArrayInfo* Info = new ArrayInfo(ArrayName, FunctionName);

        uint32_t NumDims = 0;
        uint32_t TotalSize = 1;
        Type* BaseTy = ArrayTy;
        do {
            uint32_t DimSize = BaseTy->getArrayNumElements();
            Info->addDimension(DimSize);
            TotalSize *= DimSize;
            NumDims++;
            BaseTy = BaseTy->getArrayElementType();
        } while (BaseTy->isArrayTy());

        Info->setAttribute("BaseType", BaseTy->getTypeID());
        Info->setAttribute("BaseBitwidth", BaseTy->getPrimitiveSizeInBits());
        Info->setAttribute("NumDimensions", NumDims);
        Info->setAttribute("TotalSize", TotalSize);
        return Info;
    }

    ~ExtractArrayInfoPass() override {
        for (auto* Info : ArrayInfoList) {
            delete Info;
        }
    }
}; 
// End struct ExtractArrayInfoPass

} 
// End namespace

char ExtractArrayInfoPass::ID = 0;
static RegisterPass<ExtractArrayInfoPass> X(
    "extract-array-info", 
    "Extract information about arrays in the module",
    false, false
);