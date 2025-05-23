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
    "out-usage",
    cl::desc("Path to the file to write the global array usage information to"), 
    cl::value_desc("filepath")
);

namespace {

struct InstructionInfo {
    std::string Name;
    std::string FunctionName;
    
    InstructionInfo(const std::string& Name, 
                    const std::string& FunctionName)
        : Name(Name), FunctionName(FunctionName) {}
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
                const std::string& FunctionName) {
        Uses.emplace_back(Name, FunctionName);
    }
};

struct ExtractGlobalArrayUsesPass : public ModulePass {
    static char ID;
    ExtractGlobalArrayUsesPass() : ModulePass(ID) {}

   std::vector<GlobalArrayUsageInfo*> GlobalArrayUsageInfoList;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-global-array-uses"

        if (OutputPath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
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
                    std::string InstName = I->hasName() ? I->getName().str() : "";

                    std::string FunctionName = "";
                    if (auto* F = I->getFunction()) {
                        FunctionName = F->hasName() ? F->getName().str() : "";
                    }
                    Info->addUse(InstName, FunctionName);
                }
            }
            GlobalArrayUsageInfoList.push_back(Info);
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
        for (const auto* Info : GlobalArrayUsageInfoList) {
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
                OFStream << "          \"FunctionName\": \"" << ArrayUse.FunctionName << "\"\n";
                OFStream << "        }"; // Close Use object braces
            }

            OFStream << "\n      ]"; // Close Uses array braces
            OFStream << "\n    }"; // Close GlobalArrayUsageInfo object braces
        }
        OFStream << "\n  ]"; // Close GlobalArrayUsageInfo array braces
        OFStream << "\n}"; // Close JSON object braces

        OFStream.close();
    }

    ~ExtractGlobalArrayUsesPass() override {
        for (auto* Info : GlobalArrayUsageInfoList) {
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