#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/NoFolder.h"
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

using namespace llvm;

static cl::opt<std::string> outputFileName("out", cl::desc("Specify the file where the DFG should be written"), cl::value_desc("filename"));

namespace {

struct ModuleDFGBuilder : public ModulePass {
    static char ID;
    ModuleDFGBuilder() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "mod-dfg"

        LLVMContext& ctx = M.getContext();
        
        std::ofstream outputFile(outputFileName);
        if (!outputFile.is_open()) {
            errs() << "Error opening file " << outputFileName << "\n";
            return false;
        }
        std::vector<std::vector<int>> nodes;
        std::vector<std::pair<int, int>> edges;

        for(Module::iterator FIter = M.begin(), FEnd = M.end(); FIter != FEnd; ++FIter) {
            Function* F = &*FIter;
            if (F->isDeclaration() || F->isIntrinsic()) {
                continue;
            }
            for(Function::iterator BBIter = F->begin(), BBEnd = F->end(); BBIter != BBEnd; ++BBIter) {
                BasicBlock* BB = &*BBIter;
                for(BasicBlock::iterator IIter = BB->begin(), IEnd = BB->end(); IIter != IEnd; ++IIter) {
                    Instruction* I = &*IIter;
                    if (MDNode* opIDNode = I->getMetadata("opID")) {
                        std::vector<int> features(getFeatures(I));
                        nodes.push_back(features);
                        int opID = features[0];

                        if (StoreInst* storeInst = dyn_cast<StoreInst>(I)) {
                            Value* storePtr = storeInst->getPointerOperand();
                            for (auto UIter = storePtr->uses().begin(), UEnd = storePtr->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        }
                        else if (CallInst* callInst = dyn_cast<CallInst>(I)) {
                            Function* calledFunction = callInst->getCalledFunction();
                            if (calledFunction) {
                                for (auto arg = calledFunction->arg_begin(); arg != calledFunction->arg_end(); ++arg) {
                                    if (auto* ci = dyn_cast<ConstantInt>(arg)) continue;
                                    Value* argValue = &*arg;
                                    for (auto UIter = argValue->uses().begin(), UEnd = argValue->uses().end(); UIter != UEnd; ++UIter) {
                                        Use* U = &*UIter;
                                        if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                            if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                                int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                                edges.push_back(std::make_pair(opID, otherOpID));
                                            }
                                        }
                                    }
                                }
                            }
                        } 
                        else if (ReturnInst* returnInst = dyn_cast<ReturnInst>(I)) {
                            Value* returnValue = returnInst->getReturnValue();
                            if (returnValue) {
                                for (auto UIter = returnValue->uses().begin(), UEnd = returnValue->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } 
                        else if (BranchInst* branchInst = dyn_cast<BranchInst>(I)) {
                            if (branchInst->isConditional()) {
                                Value* condition = branchInst->getCondition();
                                for (auto UIter = condition->uses().begin(), UEnd = condition->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } 
                        else if (SwitchInst* switchInst = dyn_cast<SwitchInst>(I)) {
                            Value* condition = switchInst->getCondition();
                            for (auto UIter = condition->uses().begin(), UEnd = condition->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        } 
                        else if (PHINode* phiNode = dyn_cast<PHINode>(I)) {
                            for (unsigned i = 0; i < phiNode->getNumIncomingValues(); i++) {
                                Value* incomingValue = phiNode->getIncomingValue(i);
                                for (auto UIter = incomingValue->uses().begin(), UEnd = incomingValue->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } 
                        else {
                            for (auto UIter = I->uses().begin(), UEnd = I->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        int otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        writeDFG(outputFile, nodes, edges);
        return true;
    }

    void writeDFG(std::ofstream& outputFile, std::vector<std::vector<int>>& nodes, std::vector<std::pair<int, int>>& edges) {
        int numNodes = nodes.size();
        outputFile << numNodes << "\n";
        for (int i = 0; i < numNodes; i++) {
            outputFile << nodes[i][0];
            for (int j = 1; j < nodes[i].size(); j++) {
                outputFile << "," << nodes[i][j];
            }
            outputFile << "\n";
        }
        int numEdges = edges.size();
        outputFile << numEdges << "\n";
        for (int i = 0; i < numEdges; i++) {
            outputFile << edges[i].first << "," << edges[i].second << "\n";
        }
    }

    std::vector<int> getFeatures(Instruction* I) {
        int opID = (int)cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("opID")->getOperand(0))->getValue())->getZExtValue();
        int functionID = (int)cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("functionID")->getOperand(0))->getValue())->getZExtValue();
        int bbID = (int)cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("bbID")->getOperand(0))->getValue())->getZExtValue();
        int opCode = I->getOpcode();
        int bitwidth = I->getType()->getScalarSizeInBits();
        int valueType = (int)I->getType()->getTypeID();
        int loopDepth = (int)cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("loopDepth")->getOperand(0))->getValue())->getZExtValue();
        int tripCount = (int)cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("tripCount")->getOperand(0))->getValue())->getZExtValue();

        int loopPipelineOn = 0, loopPipelineII = 0;
        if (MDTuple* loopPipelineMDTuple = dyn_cast<MDTuple>(I->getMetadata("loopPipeline"))) {
            loopPipelineOn = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopPipelineMDTuple->getOperand(0))->getValue())->getZExtValue();
            loopPipelineII = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopPipelineMDTuple->getOperand(1))->getValue())->getZExtValue();
        }
        
        std::vector<int> features({opID, functionID, bbID, opCode, bitwidth, valueType, loopDepth, tripCount, loopPipelineOn, loopPipelineII});
        return features;
    }
}; // struct ModuleDFGBuilder

}  // anonymous namespace

char ModuleDFGBuilder::ID = 0;
static RegisterPass<ModuleDFGBuilder> X("mod-dfg", "Build a module-level DFG", false, false);
