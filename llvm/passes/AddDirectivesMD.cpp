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

struct AddDirectivesMDPass : public ModulePass {
    static char ID;
    AddDirectivesMDPass() : ModulePass(ID) {}

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
            if (directiveTokens[0] == "set_directive_unroll") {
                // set_directive_unroll -factor N function/loop -> (1,N)
                // set_directive_unroll function/loop -> (1,0)
                size_t numTokens = directiveTokens.size();
                uint32_t factor = 0;
                std::string location = directiveTokens[numTokens - 1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);
                for (int i = 1; i < numTokens - 1; i++)  {
                    if (directiveTokens[i] == "-factor") {
                        factor = std::atoi(directiveTokens[i + 1].c_str());
                        break;
                    }
                }
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;
                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");
                            SmallVector<Metadata*, 2> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)), 
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
            } else if (directiveTokens[0] == "set_directive_pipeline") {
                // set_directive_pipeline -II N function[/loop] -> (1,N)
                // set_directive_pipeline function[/loop] -> (1,0)
                uint32_t pipelineII = 0;
                size_t numTokens = directiveTokens.size();
                std::string location = directiveTokens[numTokens - 1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                for (int i = 1; i < numTokens - 1; i++)  {
                    if (directiveTokens[i] == "-II") {
                        pipelineII = std::atoi(directiveTokens[i + 1].c_str());
                        break;
                    }
                }
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    SmallVector<Metadata*, 2> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1)),
                                                            ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};
                    if (slashPos == std::string::npos) {
                        DEBUG(errs() << "Found function " << F->getName() << "\n");
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
            } else if (directiveTokens[0] == "set_directive_loop_merge") {
                // set_directive_loop_merge function/loop -> (1)
                std::string location = directiveTokens.back();
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;
                    if (F->getName() != functionName)
                        continue;
                    if (slashPos == std::string::npos) {
                        DEBUG(errs() << "Found function " << F->getName() << "\n");
                        SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))};
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
                            }
                        }
                    } else {
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            if (BB->hasName() && BB->getName() == loopName) {
                                DEBUG(errs() << "Found loop " << loopName << "\n");
                                SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))};
                                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                    Instruction* I = &*II;
                                    I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
                                }
                                break;
                            }
                        }
                    }
                    break;
                }
            } else if (directiveTokens[0] == "set_directive_array_partition") {
                // set_directive_array_partition -type T -dim N -factor M location variable -> (T,N,M)
                // set_directive_array_partition [-type complete] location variable -> (1,0,0)
                uint32_t type = 1, dim = 0, factor = 0;
                size_t numTokens = directiveTokens.size();
                std::string variable = directiveTokens[numTokens - 1];
                std::string location = directiveTokens[numTokens - 2];
                for (int i = 1; i < numTokens - 2; i++)  {
                    if (directiveTokens[i] == "-type") {
                        std::string typeStr = directiveTokens[i + 1];
                        if (typeStr == "block") {
                            type = 2;
                        } else if (typeStr == "cyclic") {
                            type = 3;
                        }
                        i++;
                    } else if (directiveTokens[i] == "-factor") {
                        factor = std::atoi(directiveTokens[i + 1].c_str());
                        i++;
                    } else if (directiveTokens[i] == "-dim") {
                        dim = std::atoi(directiveTokens[i + 1].c_str());
                        i++;
                    }
                }
                SmallVector<Metadata*, 3> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), type)),
                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor)),
                                                              ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))};
                if (GlobalVariable* GV = M.getGlobalVariable(variable)) {
                    // Array to be partitioned is a global variable
                    DEBUG(errs() << "Found global array " << variable << "\n");
                    GV->setMetadata("array_partition", MDTuple::get(ctx, arrayPartitionMD));
                    for (Use& U : GV->uses()) {
                        if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                            op->setMetadata("array_partition", MDTuple::get(ctx, arrayPartitionMD));
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
                                DEBUG(errs() << "Found array " << variable << "\n");
                                I->setMetadata("array_partition", MDTuple::get(ctx, arrayPartitionMD));
                                for (Use& U : I->uses()) {
                                    if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                                        op->setMetadata("array_partition", MDTuple::get(ctx, arrayPartitionMD));
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

char AddDirectivesMDPass::ID = 0;
static RegisterPass<AddDirectivesMDPass> X("add-directives-md", "Add information about the directives in the input tcl file to the module's metadata", false, false);
