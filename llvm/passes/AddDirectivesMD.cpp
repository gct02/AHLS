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
#include <iostream>
#include <sstream>

using namespace llvm;

static cl::opt<std::string> directivesTclFilePath("tcl", cl::desc("Path to the tcl file containing the directives"), cl::value_desc("filepath"));

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

        while (std::getline(directivesTclFile, line)) {
            DEBUG (errs() << "Directive: " << line << "\n");

            std::vector<std::string> directiveTokens = split(line);

            if (directiveTokens[0] == "set_directive_unroll") {
                // set_directive_unroll -factor N function/loop -> (directiveIndex,0,N)
                // set_directive_unroll function/loop -> (directiveIndex,1,0)
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

                    if (F->getName() != functionName)
                        continue;
                        
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 3> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), complete)), 
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("unroll", MDTuple::get(ctx, unrollMD));
                            }
                            break;
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_pipeline") {
                // set_directive_pipeline -II N function[/loop] -> (directiveIndex,0,N)
                // set_directive_pipeline function[/loop] -> (directiveIndex,1,0)
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

                    if (F->getName() != functionName)
                        continue;

                    if (slashPos == std::string::npos) {
                        DEBUG(errs() << "Found function " << F->getName() << "\n");

                        SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), // 1 for function
                                                                ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), IINotSpecified)),
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

                                SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), // 0 for loop
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), IINotSpecified)),
                                                                        ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};

                                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                    Instruction* I = &*II;
                                    I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                                }
                                break;
                            }
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_array_partition") {
                // set_directive_array_partition -type T -dim N -factor M location variable -> (directiveIndex,T,M,N)
                // set_directive_array_partition [-type complete] -dim N location variable -> (directiveIndex,1,arrayLength,N)
                // set_directive_array_partition [-type complete] location variable -> (directiveIndex,1,arrayLength,0)
                std::string type = "complete";
                uint32_t typeCode, dim = 0, factor = 1;
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

                if (type == "complete") {
                    typeCode = 1;
                } else if (type == "block") {
                    typeCode = 2;
                } else {
                    typeCode = 3;
                }

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

                    SmallVector<Metadata*, 5> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), // 0 for global variable
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), typeCode)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};

                    GV->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));

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

                    		    if (typeCode == 1) {
                        	        factor = arrayLength;
                    		    }

                                SmallVector<Metadata*, 5> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), // 1 for local variable
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), typeCode)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};

                                I->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));

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
                // set_directive_loop_flatten function/loop -> (1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->getName() != functionName)
                        continue;

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 1> loopFlattenMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
                            }
                            break;
                        }
                    }
                    break;
                }
                directiveIndex++;
            } else if (directiveTokens[0] == "set_directive_loop_merge") {
                // set_directive_loop_merge function/loop -> (1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->getName() != functionName)
                        continue;

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex))};

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
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
};

}

char AddDirectivesMD::ID = 0;
static RegisterPass<AddDirectivesMD> X("add-directives-md", "Add information about the directives in the input tcl file to the module's metadata", false, false);
