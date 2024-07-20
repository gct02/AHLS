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
            bool found = false;
            std::vector<std::string> directiveTokens = split(line);
            if (directiveTokens[0] == "set_directive_unroll") {
                uint32_t factor = 1;
                std::string location;
                size_t numTokens = directiveTokens.size() - 1;
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        if (directiveTokens[i] == "-factor") {
                            factor = std::atoi(directiveTokens[i + 1].c_str());
                        }
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
                            SmallVector<Metadata*, 2> unrollMD;
                            unrollMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))}));
                            unrollMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor))}));
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                MDTuple* unrollMDTuple = MDTuple::get(ctx, unrollMD);
                                I->setMetadata("llvm.loop.unroll.enable", unrollMDTuple);
                            }
                            break;
                        }
                    }
                    break;
                }
            } else if (directiveTokens[0] == "set_directive_pipeline") {
                uint32_t pipelineII = 1;
                std::string location;
                size_t numTokens = directiveTokens.size() - 1;
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-') {
                        if (directiveTokens[i] == "-II") {
                            pipelineII = std::atoi(directiveTokens[i + 1].c_str());
                        }
                    } else {
                        location = directiveTokens[i];
                    }
                }
                std::string functionName = location.substr(0, location.find_first_of('/'));
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function& F = *FI;
                    if (F.getName() != functionName)
                        continue;
                    SmallVector<Metadata*, 2> pipelineMD;
                    pipelineMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))}));
                    pipelineMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))}));
                    if (location.find_first_of('/') == std::string::npos) {
                        for (Function::iterator BI = F.begin(), BE = F.end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                MDTuple* pipelineMDTuple = MDTuple::get(ctx, pipelineMD);
                                I->setMetadata("pipeline", pipelineMDTuple);
                            }
                        }
                    } else {
                        std::string loopName = location.substr(location.find_first_of('/') + 1);
                        for (Function::iterator BI = F.begin(), BE = F.end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            if (BB->hasName() && BB->getName() == loopName) {
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
                std::string location;
                size_t numTokens = directiveTokens.size() - 1;
                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) == '-')
                        continue;
                    location = directiveTokens[i];
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
                            SmallVector<Metadata*, 1> loopMergeMD;
                            loopMergeMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))}));
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
                uint32_t type = 1, dim = 0, factor = 0;
                std::string location, variable;
                size_t numTokens = directiveTokens.size() - 1;
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
                    } else {
                        location = directiveTokens[i];
                        variable = directiveTokens[i + 1];
                    }
                }
                std::string functionName = location.substr(0, location.find_first_of('/'));
                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function& F = *FI;
                    if (F.getName() != functionName)
                        continue;
                    for (Function::iterator BI = F.begin(), BE = F.end(); BI != BE; ++BI) {
                        BasicBlock& BB = *BI;
                        for (BasicBlock::iterator II = BB.begin(), IE = BB.end(); II != IE; ++II) {
                            Instruction& I = *II;
                            DEBUG(errs() << I.getName() << "\n");
                            if (I.getName() != variable)
                                continue;
                            SmallVector<Metadata*, 4> arrayPartitionMD;
                            arrayPartitionMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1))}));
                            arrayPartitionMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), type))}));
                            arrayPartitionMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor))}));
                            arrayPartitionMD.push_back(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim))}));
                            MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
                            I.setMetadata("array_partition", arrayPartitionMDTuple);
                            for (Use& U : I.uses()) {
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
        return true;
    }

    std::vector<std::string> split(const std::string& s) {
        std::vector<std::string> tokens;
        std::string token;
        size_t last = 0, next;
        while ((next = s.find(" ", last)) != std::string::npos) {
            token = s.substr(last, next);
            tokens.push_back(token);
            last = next + 1;
        }
        return tokens;
    }
};

}

char AddDirectivesMetadataPass::ID = 0;
static RegisterPass<AddDirectivesMetadataPass> X("add-directives-md", "Add information about the directives in the input tcl file to the module's metadata", false, false);
