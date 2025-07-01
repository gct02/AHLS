#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <utility>
#include <vector>
#include <stack>

#include "llvm/ADT/StringExtras.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
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
    "out-loop-md", 
    cl::desc("Path to the file to write the loop metadata to"),
    cl::value_desc("filepath")
);

namespace {

struct LoopMetadata {
    std::string Name;
    std::string FunctionName;
    std::map<std::string, uint32_t> Attributes;

    LoopMetadata(const std::string& Name,
                 const std::string& FunctionName = "",
                 const std::map<std::string, uint32_t>& Attributes = {})
        : Name(Name), FunctionName(FunctionName), Attributes(Attributes) {}

    Optional<uint32_t> getAttribute(const std::string& Key) const {
        auto It = Attributes.find(Key);
        if (It != Attributes.end()) return It->second;
        return Optional<uint32_t>();
    }

    void setAttribute(const std::string& Key, uint32_t Value) {
        Attributes[Key] = Value;
    }
};

struct ExtractLoopMetadataPass : public ModulePass {
    static char ID;
    ExtractLoopMetadataPass() : ModulePass(ID) {}

    std::vector<LoopMetadata*> ModuleLoopMetadata;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "extract-loop-md"

        if (OutputFilePath.empty()) {
            errs() << "Output file not specified.\n";
            return false;
        }
        extractLoopMetadata(M);
        serializeLoopMetadataToJson(M);

        return false; // Module is not modified
    }

    void serializeLoopMetadataToJson(Module& M) {
        std::ofstream OFS(OutputFilePath);
        if (!OFS.is_open()) {
            errs() << "Error opening file: " << OutputFilePath << "\n";
            return;
        }

        OFS << "{\n  \"LoopMetadata\": [\n";

        bool FirstEntry = true;
        for (const auto* It : ModuleLoopMetadata) {
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
            OFS << ",\n    }";
        }
        OFS << "\n  ]\n";
        OFS << "}\n";
    }

    void extractLoopMetadata(Module& M) {
        for (Function& F : M) {
            if (F.isDeclaration() || F.isIntrinsic()) {
                continue;
            }
            std::string FunctionName = F.hasName() ? F.getName().str() : "";

            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();

            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    std::stack<Loop*> LoopStack;
                    LoopStack.push(L);

                    while (!LoopStack.empty()) {
                        Loop* CurrentLoop = LoopStack.top();
                        LoopStack.pop();

                        std::string LoopName = getLoopName(CurrentLoop);

                        LoopMetadata* LM = new LoopMetadata(LoopName, FunctionName);
                        LM->setAttribute("Depth", CurrentLoop->getLoopDepth());
                        ModuleLoopMetadata.push_back(LM);

                        for (Loop* SubLoop : CurrentLoop->getSubLoops()) {
                            LoopStack.push(SubLoop);
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

    void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.setPreservesAll();
        AU.addRequired<LoopInfoWrapperPass>();
    }

};
// End struct ExtractLoopMetadataPass

}
// End namespace

char ExtractLoopMetadataPass::ID = 0;
static RegisterPass<ExtractLoopMetadataPass> X(
    "extract-loop-md", 
    "Extract loop metadata from the module",
    false /* Only looks at CFG */,
    false /* Analysis Pass */
);