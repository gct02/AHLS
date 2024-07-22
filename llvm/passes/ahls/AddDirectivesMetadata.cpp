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

static cl::opt<std::string> directivesTclFilePath("tcl", cl::desc("Path to the tcl file containing the directives"), cl::value_desc("filepath"));

namespace {

struct AddDirectivesMetadataPass : public ModulePass {
    static char ID;
    AddDirectivesMetadataPass() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "add-directives-md"

        LLVMContext& ctx = M.getContext();

        std::ifstream directivesTclFile(directivesTclFilePath);
        if (!directivesTclFile.is_open()) {
            errs() << "Error opening file " << directivesTclFilePath << "\n";
            return false;
        }

        std::string line;
        while (std::getline(directivesTclFile, line)) {
            std::vector<std::string> directiveTokens = split(line);
            DEBUG (errs() << "Directive: " << line << "\n");
            // Print tokens for debugging
            for (std::string token : directiveTokens) {
                DEBUG(errs() << token << "; ");
            }
            DEBUG(errs() << "\n");
            if (directiveTokens[0] == "set_directive_unroll") {
                // set_directive_unroll -factor N function/loop -> (1,N)
                // set_directive_unroll function/loop -> (1,0)
                DEBUG(errs() << "Unroll directive\n");
                uint32_t factor = 0;
                std::string location;
                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        if (directiveTokens[i] == "-factor") {
                            factor = std::atoi(directiveTokens[i + 1].c_str());
                        }
                        i++;
                    } else {
                        location = directiveTokens[i];
                    }
                }
                std::string functionName = location.substr(0, location.find_first_of('/'));
                std::string loopName = location.substr(location.find_first_of('/') + 1);
                DEBUG(errs() << "Function: " << functionName << "\n");
                DEBUG(errs() << "Loop: " << loopName << "\n");
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        DEBUG(errs() << BI->getName() << "\n");
                        BasicBlock* BB = &*BI;
                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");
                            SmallVector<Metadata*, 2> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), 
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor))};
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                MDTuple* unrollMDTuple = MDTuple::get(ctx, unrollMD);
                                I->setMetadata("unroll", unrollMDTuple);
                            }
                            break;
                        }
                    }
                    break;
                }
            } else if (directiveTokens[0] == "set_directive_pipeline") {
                // set_directive_pipeline -II N function[/loop] -> (1,N)
                // set_directive_pipeline function[/loop] -> (1,0)
                DEBUG(errs() << "Pipeline directive\n");
                uint32_t pipelineII = 0;
                std::string location;
                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        if (directiveTokens[i] == "-II") {
                            pipelineII = std::atoi(directiveTokens[i + 1].c_str());
                        }
                        i++;
                    } else {
                        location = directiveTokens[i];
                    }
                }
                std::string functionName = location.substr(0, location.find_first_of('/'));
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    SmallVector<Metadata*, 2> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                            ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};
                    if (location.find_first_of('/') == std::string::npos) {
                        DEBUG(errs() << "Function pipeline" << F->getName() << "\n");
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                MDTuple* pipelineMDTuple = MDTuple::get(ctx, pipelineMD);
                                I->setMetadata("pipeline", pipelineMDTuple);
                            }
                        }
                    } else {
                        std::string loopName = location.substr(location.find_first_of('/') + 1);
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            if (BB->hasName() && BB->getName() == loopName) {
                                DEBUG(errs() << "Loop pipeline" << BB->getName() << "\n");
                                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                    Instruction* I = &*II;
                                    MDTuple* pipelineMDTuple = MDTuple::get(ctx, pipelineMD);
                                    I->setMetadata("pipeline", pipelineMDTuple);
                                }
                            }
                        }
                    }
                    break;
                }
            } else if (directiveTokens[0] == "set_directive_loop_merge") {
                // set_directive_loop_merge function/loop -> (1)
                DEBUG(errs() << "Loop merge directive\n");
                std::string location;
                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        i++;
                    } else {
                        location = directiveTokens[i];
                    }
                }
                std::string functionName = location.substr(0, location.find_first_of('/'));
                std::string loopName = location.substr(location.find_first_of('/') + 1);
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;
                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");
                            SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))};
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                MDTuple* loopMergeMDTuple = MDTuple::get(ctx, loopMergeMD);
                                I->setMetadata("loop_merge", loopMergeMDTuple);
                            }
                            break;
                        }
                    }
                    break;
                }
            } else if (directiveTokens[0] == "set_directive_array_partition") {
                // set_directive_array_partition -type T -dim N -factor M location variable -> (1,T,N,M)
                // set_directive_array_partition [-type "complete"] location variable -> (1,1,0,0)
                DEBUG(errs() << "Array partition directive\n");
                uint32_t type = 1, dim = 0, factor = 0;
                std::string location, variable;
                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        if (directiveTokens[i] == "-type") {
                            std::string typeStr = directiveTokens[i + 1];
                            if (typeStr == "block") {
                                type = 2;
                            } else if (typeStr == "cyclic") {
                                type = 3;
                            }
                        } else if (directiveTokens[i] == "-factor") {
                            factor = std::atoi(directiveTokens[i + 1].c_str());
                        } else if (directiveTokens[i] == "-dim") {
                            dim = std::atoi(directiveTokens[i + 1].c_str());
                        }
                        i++;
                    } else {
                        location = directiveTokens[i];
                        variable = directiveTokens[i + 1];
                        i++;
                    }
                }
                if (GlobalVariable* GV = M.getGlobalVariable(variable)) {
                    DEBUG(errs() << "Found global variable " << variable << "\n");
                    SmallVector<Metadata*, 4> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), 
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), type)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};
                    MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
                    GV->setMetadata("array_partition", arrayPartitionMDTuple);
                    for (Use& U : GV->uses()) {
                        if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                            MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
                            op->setMetadata("array_partition", arrayPartitionMDTuple);
                        }
                    }
                } else {
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
                                DEBUG(errs() << I->getName() << "\n");
                                if (I->getName() != variable)
                                    continue;
                                DEBUG(errs() << "Found variable " << variable << "\n");
                                SmallVector<Metadata*, 4> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), 
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), type)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};
                                MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
                                I->setMetadata("array_partition", arrayPartitionMDTuple);
                                for (Use& U : I->uses()) {
                                    if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                        MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
                                        op->setMetadata("array_partition", arrayPartitionMDTuple);
                                    }
                                }
                                found = true;
                                break;
                            }
                            if (found) break;
                        }
                        if (found) break;
                    }
                }
            }
        }
        return true;
    }

    std::vector<std::string> split(const std::string& s) {
        std::vector<std::string> tokens;
        std::string token;
        size_t last = 0, next;
        do {
            next = s.find(' ', last);
            token = s.substr(last, next - last);
            tokens.push_back(token);
            last = next + 1;
        } while (next != std::string::npos);
        return tokens;
    }
};

}

char AddDirectivesMetadataPass::ID = 0;
static RegisterPass<AddDirectivesMetadataPass> X("add-directives-md", "Add information about the directives in the input tcl file to the module's metadata", false, false);
