#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <utility>
#include <vector>

#include "llvm/IR/Constant.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

static cl::opt<std::string> OutputPath(
    "out-usage",
    cl::desc("Path to the file to write the global array usage information to"), 
    cl::value_desc("filepath")
);

namespace {

struct InstructionInfo {
    std::string Name;
    std::string FunctionName;
    int32_t Idx;
    
    InstructionInfo(const std::string& Name, 
                    const std::string& FunctionName,
                    int32_t Idx = -1)
        : Name(Name), FunctionName(FunctionName), Idx(Idx) {}
};

struct GlobalArrayUsageInfo {
    std::string Name;
    std::vector<InstructionInfo> Uses;

    GlobalArrayUsageInfo(const std::string& Name)
        : Name(Name) {}

    void addUse(const InstructionInfo& Use) {
        Uses.push_back(Use);
    }

    void addUse(const std::string& Name, 
                const std::string& FunctionName,
                int32_t Idx = -1) {
        Uses.emplace_back(Name, FunctionName, Idx);
    }
};

struct ExtractGlobalArrayUsesPass : public ModulePass {
    static char ID;
    ExtractGlobalArrayUsesPass() : ModulePass(ID) {}

   std::vector<GlobalArrayUsageInfo*> ArrayUsageInfoList;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-global-array-uses"

        if (OutputPath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        assignIndicesToStores(M);
        extractGlobalArrayUsageInfo(M);
        serializeGlobalArrayUsageInfo(M);
        
        return false; // Module is not modified
    }

    void extractGlobalArrayUsageInfo(Module& M) {
        for (GlobalObject& G : M.getGlobalList()) {
            Type* Ty = G.getValueType();
            if (Ty->isPointerTy()) {
                Ty = Ty->getPointerElementType();
            }
            if (!Ty->isArrayTy()) continue;

            std::string Name = G.getName().str();

            // Check if the global object represents a function parameter
            // First, check if it has a debug info node
            if (auto* DbgMDNode = G.getMetadata("dbg")) 
                if (auto* DIVarExpr = dyn_cast<DIGlobalVariableExpression>(DbgMDNode)) 
                    if (auto* DIVar = DIVarExpr->getVariable()) 
                        if (DIVar->isLocalToUnit()) 
                            if (auto* DIS = DIVar->getScope()) 
                                if (!DIS->getName().str().empty()) continue;

            // If no debug info, check if its name has the format <function>.<param>
            size_t DotPos = Name.find('.');
            if (DotPos != std::string::npos) continue;
            
            GlobalArrayUsageInfo* Info = new GlobalArrayUsageInfo(Name);

            // Check if the global object has any uses
            for (auto& U : G.uses()) {
                if (auto* I = dyn_cast<Instruction>(U.getUser())) {
                    // If the instruction is a GEPOperator, use its users
                    if (auto* GEP = dyn_cast<GEPOperator>(I)) {
                        for (auto Use : GEP->users()) {
                            if (auto* Inst = dyn_cast<Instruction>(Use)) {
                                std::string InstName = Inst->hasName() ? Inst->getName().str() : "";
                                std::string FunctionName = "";
                                if (auto* F = Inst->getFunction()) {
                                    FunctionName = F->hasName() ? F->getName().str() : "";
                                }
                                int32_t Idx = -1;
                                if (auto* SI = dyn_cast<StoreInst>(Inst)) {
                                    Idx = getStoreIndex(*SI);
                                }
                                Info->addUse(InstName, FunctionName, Idx);
                            }
                        }
                    } else {
                        std::string InstName = I->hasName() ? I->getName().str() : "";
                        std::string FunctionName = "";
                        if (auto* F = I->getFunction()) {
                            FunctionName = F->hasName() ? F->getName().str() : "";
                        }
                        int32_t Idx = -1;
                        if (auto* SI = dyn_cast<StoreInst>(I)) {
                            Idx = getStoreIndex(*SI);
                        }
                        Info->addUse(InstName, FunctionName, Idx);
                    }
                }
            }
            ArrayUsageInfoList.push_back(Info);
        }
    }

    void serializeGlobalArrayUsageInfo(Module& M) {
        std::ofstream OFStream(OutputPath.c_str());
        if (!OFStream.is_open()) {
            errs() << "Error opening file: " << OutputPath << "\n";
            return;
        }

        OFStream << "{\n  \"GlobalArrayUsageInfo\": [\n";
        bool FirstEntry = true;
        for (const auto* Info : ArrayUsageInfoList) {
            if (!FirstEntry) OFStream << ",\n";
            FirstEntry = false;

            OFStream << "    {\n";
            OFStream << "      \"Name\": \"" << Info->Name << "\",\n";
            OFStream << "      \"Uses\": [";
            bool FirstUse = true;
            for (auto ArrayUse : Info->Uses) {
                if (!FirstUse) OFStream << ",";
                FirstUse = false;
                OFStream << "\n        {\n";
                OFStream << "          \"Name\": \"" << ArrayUse.Name << "\",\n";
                OFStream << "          \"FunctionName\": \"" << ArrayUse.FunctionName << "\",\n";
                OFStream << "          \"StoreIdx\": " << ArrayUse.Idx << "\n";
                OFStream << "        }"; // Close Use object braces
            }

            OFStream << "\n      ]"; // Close Uses array braces
            OFStream << "\n    }"; // Close GlobalArrayUsageInfo object braces
        }
        OFStream << "\n  ]"; // Close GlobalArrayUsageInfo array braces
        OFStream << "\n}"; // Close JSON object braces

        OFStream.close();
    }

    void assignIndicesToStores(Module& M) {
        for (Function& F : M) {
            int32_t Idx = 0;
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (auto* SI = dyn_cast<StoreInst>(&I)) {
                        setStoreIndex(I, Idx);
                        ++Idx;
                    }
                }
            }
        }
    }

    void setStoreIndex(Instruction& I, uint32_t Idx) {
        LLVMContext& Ctx = I.getContext();
        ConstantInt* CI = ConstantInt::get(Type::getInt32Ty(Ctx), Idx);
        MDNode* MD = MDNode::get(Ctx, {ConstantAsMetadata::get(CI)});
        I.setMetadata("storeIdx", MD);
    }

    int32_t getStoreIndex(const Instruction& I) const {
        if (auto* MD = I.getMetadata("storeIdx")) {
            if (auto* CAM = dyn_cast<ConstantAsMetadata>(MD->getOperand(0))) {
                if (auto* CI = dyn_cast<ConstantInt>(CAM->getValue())) {
                    return CI->getSExtValue();
                }
            }
        }
        return -1; // No index found
    }

    ~ExtractGlobalArrayUsesPass() override {
        for (auto* Info : ArrayUsageInfoList) {
            delete Info;
        }
    }
}; 
// End struct ExtractArrayInfoPass

} 
// End namespace

char ExtractGlobalArrayUsesPass::ID = 0;
static RegisterPass<ExtractGlobalArrayUsesPass> X(
    "extract-global-array-uses", 
    "Extract information about global array usage",
    false, false
);