#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>

#include "HLSDSEUtils.h"

using namespace llvm;

static cl::opt<std::string> outputFile(
    "out-lh",
    cl::desc("Path to the file where the loop hierarchy should be written"),
    cl::value_desc("filepath")
);

namespace {

struct ExtractLoopHierarchy : public ModulePass {
    static char ID;
    ExtractLoopHierarchy() : ModulePass(ID) {}

    std::unordered_map<uint32_t, std::vector<uint32_t>> loopHierarchy;
    std::unordered_map<uint32_t, std::vector<uint32_t>> topLevelLoops; // Function ID -> Loop IDs

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "loop-hierarchy"

        for (Function& F : M) {
            if (F.size() == 0) continue;
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    getLoopHierarchy(L, 0);
                }
            }
        }
        getTopLevelLoops(M);

        std::ofstream out(outputFile);
        if (!out.is_open()) {
            errs() << "Error opening file: " << outputFile << "\n";
            return false;
        }

        out << "Loop hierarchy:\n";
        for (const auto& item : loopHierarchy) {
            uint32_t parentID = item.first;
            if (parentID == 0) continue;
            const auto& children = item.second;
            out << parentID << ": ";
            size_t numChildren = children.size();
            for (size_t i = 0; i < numChildren; i++) {
                out << children[i];
                if (i < numChildren - 1) out << ", ";
            }
            out << "\n";
        }

        out << "\nTop-level loops:\n";
        for (const auto& item : topLevelLoops) {
            uint32_t functionID = item.first;
            const auto& loops = item.second;
            out << functionID << ": ";
            size_t numLoops = loops.size();
            for (size_t i = 0; i < numLoops; i++) {
                out << loops[i];
                if (i < numLoops - 1) out << ", ";
            }
            out << "\n";
        }

        return false;
    }

    void getLoopHierarchy(Loop* L, uint32_t parentID) {
        uint32_t loopID = getIntMetadata(*L->getHeader(), "loopID");
        if (loopID == 0) return;
        loopHierarchy[parentID].push_back(loopID);
        for (Loop* SL : L->getSubLoops()) {
            DEBUG(dbgs() << "Parent: " << (L->getHeader()->hasName() ? L->getHeader()->getName() : "")
                         << ", Child: " << (SL->getHeader()->hasName() ? SL->getHeader()->getName() : "")
                         << "\n");
            getLoopHierarchy(SL, loopID);
        }
    }

    void getTopLevelLoops(Module& M) {
        for (Function& F : M) {
            if (F.size() == 0) continue;
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            for (Loop* L : LI) {
                if (!L->getParentLoop()) {
                    uint32_t functionID = getIntMetadata(F, "functionID");
                    uint32_t loopID = getIntMetadata(*L->getHeader(), "loopID");
                    topLevelLoops[functionID].push_back(loopID);
                }
            }
        }
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct ExtractLoopHierarchy

} // anonymous namespace

char ExtractLoopHierarchy::ID = 0;
static RegisterPass<ExtractLoopHierarchy> X(
    "loop-hierarchy", 
    "Extract information about the loop hierarchy in the module",
    false, false
);