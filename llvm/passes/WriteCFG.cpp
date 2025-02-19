#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/IR/CFG.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include <string>
#include <vector>
#include <cstdint>
#include <fstream>
#include <unordered_map>
#include <utility>

using namespace llvm;

static cl::opt<std::string> outputFileName(
    "out-cfg", 
    cl::desc("Specify the file where the DFG should be written"), 
    cl::value_desc("filename")
);

namespace {

struct WriteCFG : public ModulePass {
    static char ID;
    WriteCFG() : ModulePass(ID) {}

    std::vector<std::pair<int, int>> edges;
    std::unordered_map<BasicBlock*, int> bbIDMap;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "write-cfg"

        std::ofstream outputFile(outputFileName);
        if (!outputFile.is_open()) {
            errs() << "Error opening file " << outputFileName << "\n";
            return false;
        }

        associateIDToBBs(M);
        makeEdges(M);
        writeCFG(outputFile);

        return false; // Module is not modified
    }

    void writeCFG(std::ofstream& outputFile) {
        int numEdges = edges.size();
        outputFile << numEdges << "\n";
        for (const auto& edge : edges) {
            outputFile << edge.first << "," << edge.second << "\n";
        }
    }

    void makeEdges(Module& M) {
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (BasicBlock* pred : predecessors(&BB)) {
                    edges.push_back(std::make_pair(bbIDMap[pred], bbIDMap[&BB]));
                }
            }
        }
    }

    void associateIDToBBs(Module& M) {
        uint32_t bbID = 1;
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                bbIDMap[&BB] = bbID;
                bbID++;
            }
        }
    }

}; // struct WriteCFG

}  // anonymous namespace

char WriteCFG::ID = 0;
static RegisterPass<WriteCFG> X(
    "write-cfg", "Write the CFG to a file", false, false
);

