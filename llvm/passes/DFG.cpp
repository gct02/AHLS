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

static cl::opt<std::string> outputFileName("df", cl::desc("Specify output filename for writing the DFG"), cl::value_desc("filename"));

namespace {

struct DFGPass : public ModulePass {
    static char ID;
    DFGPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "dfg"

        LLVMContext& ctx = M.getContext();

        NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opCounter");
        if (counterNamedMDNode->getNumOperands() == 0) {
            errs() << "Error: IR without opID metadata\n";
            return false;
        }
        
        std::ofstream outputFile(outputFileName);
        if (!outputFile.is_open()) {
            errs() << "Error opening file " << outputFileName << "\n";
            return false;
        }

        int numNodes = 0, numEdges = 0;
        std::vector<std::vector<int>> nodes;
        std::vector<std::pair<int, int>> edges;

        for(Module::iterator FIter = M.begin(), FEnd = M.end(); FIter != FEnd; ++FIter) {
            Function* F = &*FIter;
            if (F->isDeclaration() || F->isIntrinsic())
                continue;
            for(Function::iterator BBIter = F->begin(), BBEnd = F->end(); BBIter != BBEnd; ++BBIter) {
                BasicBlock* BB = &*BBIter;
                for(BasicBlock::iterator IIter = BB->begin(), IEnd = BB->end(); IIter != IEnd; ++IIter) {
                    Instruction* I = &*IIter;
                    if (MDNode* opIDNode = I->getMetadata("opID")) {
                        numNodes++;
                        std::vector<int> features(getFeatures(I, opIDNode));
                        nodes.push_back(features);
                        uint64_t opID = features[0];
                        uint8_t opCode = features[1];

                        if (StoreInst* storeInst = dyn_cast<StoreInst>(I)) {
                            Value* storePtr = storeInst->getPointerOperand();
                            for (auto UIter = storePtr->uses().begin(), UEnd = storePtr->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        numEdges++;
                                        uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        } else if (CallInst* callInst = dyn_cast<CallInst>(I)) {
                            Function* calledFunction = callInst->getCalledFunction();
                            if (calledFunction) {
                                for (auto arg = calledFunction->arg_begin(); arg != calledFunction->arg_end(); ++arg) {
                                    if (auto* ci = dyn_cast<ConstantInt>(arg))
                                        continue;
                                    Value* argValue = &*arg;
                                    for (auto UIter = argValue->uses().begin(), UEnd = argValue->uses().end(); UIter != UEnd; ++UIter) {
                                        Use* U = &*UIter;
                                        if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                            if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                                numEdges++;
                                                uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                                edges.push_back(std::make_pair(opID, otherOpID));
                                            }
                                        }
                                    }
                                }
                            }
                        } else if (ReturnInst* returnInst = dyn_cast<ReturnInst>(I)) {
                            Value* returnValue = returnInst->getReturnValue();
                            if (returnValue) {
                                for (auto UIter = returnValue->uses().begin(), UEnd = returnValue->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            numEdges++;
                                            uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } else if (BranchInst* branchInst = dyn_cast<BranchInst>(I)) {
                            if (branchInst->isConditional()) {
                                Value* condition = branchInst->getCondition();
                                for (auto UIter = condition->uses().begin(), UEnd = condition->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            numEdges++;
                                            uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } else if (SwitchInst* switchInst = dyn_cast<SwitchInst>(I)) {
                            Value* condition = switchInst->getCondition();
                            for (auto UIter = condition->uses().begin(), UEnd = condition->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        numEdges++;
                                        uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        } else if (PHINode* phiNode = dyn_cast<PHINode>(I)) {
                            for (unsigned i = 0; i < phiNode->getNumIncomingValues(); i++) {
                                Value* incomingValue = phiNode->getIncomingValue(i);
                                for (auto UIter = incomingValue->uses().begin(), UEnd = incomingValue->uses().end(); UIter != UEnd; ++UIter) {
                                    Use* U = &*UIter;
                                    if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                        if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                            numEdges++;
                                            uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                            edges.push_back(std::make_pair(opID, otherOpID));
                                        }
                                    }
                                }
                            }
                        } else {
                            for (auto UIter = I->uses().begin(), UEnd = I->uses().end(); UIter != UEnd; ++UIter) {
                                Use* U = &*UIter;
                                if (Instruction* op = dyn_cast<Instruction>(U->getUser())) {
                                    if (MDNode* otherOpIDNode = op->getMetadata("opID")) {
                                        numEdges++;
                                        uint64_t otherOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(otherOpIDNode->getOperand(0))->getValue())->getZExtValue();
                                        edges.push_back(std::make_pair(opID, otherOpID));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        outputFile << numNodes << "\n";
        for (int i = 0; i < numNodes; i++) {
            outputFile << nodes[i][0] << "," << nodes[i][1] << "," << nodes[i][2] << "," << nodes[i][3] << "," << nodes[i][4] << "," 
                       << nodes[i][5] << "," << nodes[i][6] << "," << nodes[i][7] << "," << nodes[i][8] << "," << nodes[i][9] << "," 
                       << nodes[i][10] << "," << nodes[i][11] << "\n";
        }

        outputFile << numEdges << "\n";
        for (int i = 0; i < numEdges; i++) {
            outputFile << edges[i].first << "," << edges[i].second << "\n";
        }

        outputFile.close();
        return true;
    }

    std::vector<int> getFeatures(Instruction* I, MDNode* opIDNode) {
        uint64_t opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
        uint8_t opCode = I->getOpcode();
        uint32_t bitwidth = I->getType()->getScalarSizeInBits();
        uint8_t isFp = I->getType()->isFloatingPointTy();
        uint32_t loopDepth = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(I->getMetadata("loopDepth")->getOperand(0))->getValue())->getZExtValue();

        std::vector<int> features({(int)opID,(int)opCode,(int)bitwidth,(int)isFp,(int)loopDepth,0,0,0,0,0,0,0});

        if (MDTuple* unrollMDTuple = dyn_cast<MDTuple>(I->getMetadata("unroll"))) {
            features[5] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(0))->getValue())->getZExtValue();
            features[6] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(unrollMDTuple->getOperand(1))->getValue())->getZExtValue();
        }
        if (MDTuple* arrayPartitionMDTuple = dyn_cast<MDTuple>(I->getMetadata("arrayPartition"))) {
            features[7] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(0))->getValue())->getZExtValue();
            features[8] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(1))->getValue())->getZExtValue();
            features[9] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(arrayPartitionMDTuple->getOperand(2))->getValue())->getZExtValue();
        }
        if (MDTuple* pipelineMDTuple = dyn_cast<MDTuple>(I->getMetadata("pipeline"))) {
            features[9] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(0))->getValue())->getZExtValue();
            features[10] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDTuple->getOperand(1))->getValue())->getZExtValue();
        }
        if (MDTuple* loopMergeMDTuple = dyn_cast<MDTuple>(I->getMetadata("loopMerge"))) {
            features[11] = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(loopMergeMDTuple->getOperand(0))->getValue())->getZExtValue();
        }

        return features;
    }
};

}

char DFGPass::ID = 0;
static RegisterPass<DFGPass> X("dfg", "Build the module's DFG and write its nodes and edges to the output file", false, false);
