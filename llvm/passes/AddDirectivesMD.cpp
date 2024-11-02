#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/ADT/SmallVector.h"
#include <utility>
#include <unordered_map>
#include <string>
#include <vector>
#include <cstdint>
#include <sstream>
#include <fstream>

using namespace llvm;

static cl::opt<std::string> directivesTclFilePath("tcl", cl::desc("Path to the tcl file containing the HLS directives"), cl::value_desc("filepath"));

namespace {

struct AddDirectivesMD : public ModulePass {
    static char ID;
    AddDirectivesMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "add-directives-md"

        LLVMContext& ctx = M.getContext();

        std::ifstream directivesTclFile(directivesTclFilePath);
        if (!directivesTclFile.is_open()) {
            errs() << "Error opening file " << directivesTclFilePath << "\n";
            return false;
        }

        uint32_t directiveIndex = 1;
        std::string line;
        uint32_t arrayID = 1;

        while (std::getline(directivesTclFile, line)) {
            DEBUG (errs() << "Directive: " << line << "\n");

            std::vector<std::string> directiveTokens = split(line);

            if (directiveTokens[0] == "set_directive_unroll") {
                // set_directive_unroll -factor N function/loop -> (directiveIndex,1,0,N)
                // set_directive_unroll function/loop -> (directiveIndex,1,1,tripCount)
                uint32_t factor = 0;
                uint32_t complete = 1;
                std::string location;

                size_t numTokens = directiveTokens.size();

                for (int i = 1; i < numTokens; i++) {
                    if (directiveTokens[i].at(0) != '-') {
                        location = directiveTokens[i];
                    } else {
                        if (directiveTokens[i] == "-factor") {
                            complete = 0;
                            factor = std::atoi(directiveTokens[i + 1].c_str());
                            i++;
                        }
                    }
                }

                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0)
                        continue;

                    if (F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                        
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            if (complete == 1) {
                                Instruction* firstInstruction = &*BB->getFirstInsertionPt();
                                if (MDNode* tripCountMDNode = firstInstruction->getMetadata("tripCount")) {
                                    int tripCount = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(tripCountMDNode->getOperand(0))->getValue())->getZExtValue();
                                    // In 'UpdateMD.cpp', the trip count is set as the first operand of the 'tripCount' metadata node
                                    // It will be 1 if the instruction is not part of a loop and -1 if trip count is not specified
                                    if (tripCount > 1) {
                                        factor = tripCount;
                                    }
                                }
                            }

                            SmallVector<Metadata*, 4> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), complete)), 
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("unroll", MDTuple::get(ctx, unrollMD));
                            }

                            BasicBlock* loopHeader = BB->getSingleSuccessor();
                            if (loopHeader) {
                                Loop* L = LI.getLoopFor(loopHeader);
                                if (L) {
                                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                                    for (BasicBlock* loopBlock : loopBlocks) {
                                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                            Instruction* I = &*II;
                                            I->setMetadata("unroll", MDTuple::get(ctx, unrollMD));
                                        }
                                    }
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_pipeline") {
                // set_directive_pipeline -II N function -> (directiveIndex,1,1,N)
                // set_directive_pipeline function/loop -> (directiveIndex,1,0,achievedII)
                uint32_t pipelineII = 0;
                uint32_t IINotSpecified = 1;
                std::string location;

                size_t numTokens = directiveTokens.size();

                for (int i = 1; i < numTokens; i++) {
                    if (directiveTokens[i].at(0) != '-') {
                        location = directiveTokens[i];
                    } else {
                        if (directiveTokens[i] == "-II" || directiveTokens[i] == "-ii") {
                            IINotSpecified = 0;
                            pipelineII = std::atoi(directiveTokens[i + 1].c_str());
                            i++;
                        }
                    }
                }

                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0)
                        continue;
                    
                    if (F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    if (slashPos == std::string::npos) {
                        DEBUG(errs() << "Found function " << F->getName() << "\n");

                        Instruction *firstInst = &*F->getEntryBlock().getFirstInsertionPt();
                        if (IINotSpecified) {
                            if (MDNode* pipelineMDNode = firstInst->getMetadata("pipeline")) {
                                int achievedII = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDNode->getOperand(0))->getValue())->getZExtValue();
                                if (achievedII != 0) {
                                    pipelineII = achievedII;
                                }
                            }
                        }

                        SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                                ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), // 1 for function
                                                                ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};

                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                            }
                        }
                    } else {
                        std::string loopName = location.substr(slashPos + 1);

                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;

                            if (BB->hasName() && BB->getName() == loopName) {
                                DEBUG(errs() << "Found loop " << BB->getName() << "\n");

                                Instruction* firstInst = &*BB->getFirstInsertionPt();

                                if (IINotSpecified) {
                                    if (MDNode* pipelineMDNode = firstInst->getMetadata("pipeline")) {
                                        int achievedII = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(pipelineMDNode->getOperand(0))->getValue())->getZExtValue();
                                        if (achievedII != 0) {
                                            pipelineII = achievedII;
                                        }
                                    }
                                }

                                SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), // 0 for loop
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};

                                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                    Instruction* I = &*II;
                                    I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                                }

                                BasicBlock* loopHeader = BB->getSingleSuccessor();
                                if (loopHeader) {
                                    Loop *L = LI.getLoopFor(loopHeader);
                                    if (L) {
                                        ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                                        for (BasicBlock* loopBlock : loopBlocks) {
                                            for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                                Instruction* I = &*II;
                                                I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                                            }
                                        }
                                    }
                                }
                                break;
                            }
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_array_partition") {
                // set_directive_array_partition -type T -dim N -factor M location local_variable -> (directiveIndex,1,1,T,M,N)
                // set_directive_array_partition [-type complete] -dim N location global_variable -> (directiveIndex,1,0,1,arrayLength,N)
                // set_directive_array_partition [-type complete] location local_variable -> (directiveIndex,1,1,1,arrayLength,0)
                std::string type = "complete";
                uint32_t typeCode, dim = 0, factor = 0;
                size_t numTokens = directiveTokens.size();

                std::string variable;
                std::string location;
                bool locationFound = false;

                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) != '-') {
                        if (!locationFound) {
                            location = directiveTokens[i];
                            locationFound = true;
                        } else {
                            variable = directiveTokens[i];
                        }
                    } else {
                        if (directiveTokens[i] == "-type") {
                            type = directiveTokens[i + 1];
                            i++;
                        } else if (directiveTokens[i] == "-dim") {
                            dim = std::atoi(directiveTokens[i + 1].c_str());
                            i++;
                        }
                    }
                }

                if (type == "complete")
                    typeCode = 1;
                else if (type == "block") 
                    typeCode = 2;
                else
                    typeCode = 3;

                if (GlobalVariable* GV = M.getGlobalVariable(variable)) {
                    // Array to be partitioned is a global variable
                    DEBUG(errs() << "Found global array " << variable << "\n");

                    Type* arrayType = GV->getType();
                    if (arrayType->isPointerTy()) {
                        arrayType = arrayType->getPointerElementType();
                    }

                    DEBUG(errs() << "Array type: " << *arrayType << "\n");

                    size_t arrayLength = arrayType->getArrayNumElements();

                    DEBUG(errs() << "Array length: " << arrayLength << "\n");

                    if (typeCode == 1) {
                        factor = arrayLength;
                    }

                    SmallVector<Metadata*, 6> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), // 0 for global variable
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), typeCode)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};

                    GV->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
                    arrayID++;

                    for (Use& U : GV->uses()) {
                        if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                            op->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
                        }
                    }
                } else {
                    // Array to be partitioned is a local variable
                    std::string functionName = location.substr(0, location.find_first_of('/'));
                    bool found = false;

                    for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                        Function* F = &*FI;

                        if (F->getName() != functionName)
                            continue;

                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                
                                if (I->getName() != variable)
                                    continue;

                                DEBUG(errs() << "Found local array " << variable << "\n");

                               	Type* arrayType = I->getType();
                   		        if (arrayType->isPointerTy()) {
                        	        arrayType = arrayType->getPointerElementType();
                    		    }
                    		
                                DEBUG(errs() << "Array type: " << *arrayType << "\n");

                                size_t arrayLength = arrayType->getArrayNumElements();

                    		    DEBUG(errs() << "Array length: " << arrayLength << "\n");

                    		    if (typeCode == 1) 
                        	        factor = arrayLength;

                                SmallVector<Metadata*, 6> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), // 1 for local variable
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), typeCode)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};

                                I->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
                                arrayID++;

                                for (Use& U : I->uses()) {
                                    if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                        op->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
                                    }
                                }
                                found = true;
                                break;
                            }
                            if (found) break;
                        }
                        break;
                    }
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_loop_flatten") {
                // set_directive_loop_flatten function/loop -> (directiveIndex,1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0)
                        continue;

                    if (F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 2> loopFlattenMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                       ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
                            }

                            BasicBlock* loopHeader = BB->getSingleSuccessor();
                            if (loopHeader) {
                                Loop *L = LI.getLoopFor(loopHeader);
                                if (L) {
                                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                                    for (BasicBlock* loopBlock : loopBlocks) {
                                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                            Instruction* I = &*II;
                                            I->setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
                                        }
                                    }
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_loop_merge") {
                // set_directive_loop_merge function/loop -> (directiveIndex,1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0)
                        continue;

                    if (F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 2> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                     ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
                            }

                            BasicBlock* loopHeader = BB->getSingleSuccessor();
                            if (loopHeader) {
                                Loop *L = LI.getLoopFor(loopHeader);
                                if (L) {
                                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                                    for (BasicBlock* loopBlock : loopBlocks) {
                                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                            Instruction* I = &*II;
                                            I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
                                        }
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
                directiveIndex++;
            }
        }
        return true;
    }

    std::vector<std::string> split(const std::string& str) {
        std::vector<std::string> result;
        std::istringstream iss(str);
        std::string token;

        // Use getline to extract substrings separated by spaces
        while (std::getline(iss, token, ' ')) {
            if (!token.empty()) {  // Avoid adding empty strings caused by multiple spaces
                result.push_back(token);
            }
        }

        return result;
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
    }
};

}

char AddDirectivesMD::ID = 0;
static RegisterPass<AddDirectivesMD> X("add-directives-md", "Include metadata about HLS directives", false, false);
