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

namespace 
{

struct SetHLSDirectivesMD : public ModulePass 
{
    static char ID;
    SetHLSDirectivesMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override 
    {
        #define DEBUG_TYPE "set-hls-md"

        LLVMContext& ctx = M.getContext();

        std::ifstream directivesTclFile(directivesTclFilePath);
        if (!directivesTclFile.is_open()) {
            errs() << "Error opening file " << directivesTclFilePath << "\n";
            return false;
        }

        ConstantAsMetadata* constZeroMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0));
        ConstantAsMetadata* constOneMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 1));

        uint32_t directiveIndex = 1; // Assign an index for each directive
        std::string line;

        while (std::getline(directivesTclFile, line)) {
            DEBUG (errs() << "Directive: " << line << "\n");

            // Split the directive into tokens (separated by spaces)
            std::vector<std::string> directiveTokens = split(line);

            if (directiveTokens[0] == "set_directive_unroll") {
                // set_directive_unroll -factor N function/loop -> (directiveIndex,1,0,N)
                // set_directive_unroll function/loop -> (directiveIndex,1,1,tripCount)
                uint32_t factor = 0;
                uint32_t complete = 1; // If the factor is not specified, the loop will be completely unrolled
                std::string location;

                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++) {
                    if (directiveTokens[i].at(0) != '-') {
                        location = directiveTokens[i];
                    } 
                    else if (directiveTokens[i] == "-factor") {
                        complete = 0;
                        factor = std::atoi(directiveTokens[i + 1].c_str());
                        i++;
                    }
                }

                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->getName() != functionName) continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                        
                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (BB->hasName() && BB->getName() == loopName) {
                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            if (complete == 1) {
                                // If the factor is not specified, get the trip count of the loop and use it as the factor
                                Instruction* firstInstruction = &*BB->getFirstInsertionPt();
                                if (MDNode* tripCountMDNode = firstInstruction->getMetadata("tripCount")) {
                                    int tripCount = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(tripCountMDNode->getOperand(0))->getValue())->getZExtValue();
                                    if (tripCount > 1) 
                                        // Trip count will be <= 1 only if it is not computable by ScalarEvolution
                                        factor = tripCount;
                                }
                            }
                            ConstantAsMetadata* directiveIndexMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex));
                            ConstantAsMetadata* directiveOnMD = constOneMD;
                            ConstantAsMetadata* completeMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), complete));
                            ConstantAsMetadata* factorMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor));
                            SmallVector<Metadata*, 4> unrollMD = {directiveIndexMD, directiveOnMD, completeMD, factorMD};

                            /*
                            // Attach metadata to all instructions in the loop entering node
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("unroll", MDTuple::get(ctx, unrollMD));
                            }
                            */

                            // Attach metadata to all instructions in the loop
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
            } 
            else if (directiveTokens[0] == "set_directive_pipeline") {
                // set_directive_pipeline -II N function -> (directiveIndex,1,1,0,N)
                // set_directive_pipeline function/loop -> (directiveIndex,1,0,1,0)
                uint32_t pipelineII = 0;
                uint32_t IINotSpecified = 1;
                std::string location;

                size_t numTokens = directiveTokens.size();
                for (int i = 1; i < numTokens; i++) {
                    if (directiveTokens[i].at(0) != '-') {
                        location = directiveTokens[i];
                    } 
                    else if (directiveTokens[i] == "-II" || directiveTokens[i] == "-ii") {
                        IINotSpecified = 0;
                        pipelineII = std::atoi(directiveTokens[i + 1].c_str());
                        i++;
                    }
                }
                ConstantAsMetadata* directiveIndexMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex));
                ConstantAsMetadata* directiveOnMD = constOneMD;
                ConstantAsMetadata* isFunctionPipeline;
                ConstantAsMetadata* IINotSpecifiedMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), IINotSpecified));
                ConstantAsMetadata* pipelineIIMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII));

                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0 || F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    if (slashPos == std::string::npos) {
                        DEBUG(errs() << "Found function " << F->getName() << "\n");

                        isFunctionPipeline = constOneMD;

                        SmallVector<Metadata*, 5> pipelineMD = {directiveIndexMD, directiveOnMD, isFunctionPipeline, IINotSpecifiedMD, pipelineIIMD};

                        // Attach metadata to all instructions in the function
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                            }
                        }
                    } 
                    else {
                        std::string loopName = location.substr(slashPos + 1);

                        isFunctionPipeline = constZeroMD;

                        // Find the loop in the function
                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;

                            if (!BB->hasName() || BB->getName() != loopName) continue;

                            DEBUG(errs() << "Found loop " << loopName << "\n");

                            SmallVector<Metadata*, 5> pipelineMD = {directiveIndexMD, directiveOnMD, isFunctionPipeline, IINotSpecifiedMD, pipelineIIMD};

                            /*
                            // Attach metadata to all instructions in the loop entering node
                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
                            }*/

                            // Attach metadata to all instructions in the loop
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
                    break;
                }
                directiveIndex++;
            } 
            else if (directiveTokens[0] == "set_directive_array_partition") {
                // set_directive_array_partition -type T -dim N -factor M location local_variable -> (directiveIndex,1,1,dimSize,T,M,N)
                // set_directive_array_partition [-type complete] -dim N location global_variable -> (directiveIndex,1,0,dimSize,1,arrayLength,N)
                // set_directive_array_partition [-type complete] location local_variable -> (directiveIndex,1,1,dimSize,1,arrayLength,0)
                uint32_t type = 1, dim = 0, factor = 0;
                size_t numTokens = directiveTokens.size();
                std::string variable, location;
                bool locationFound = false;

                for (int i = 1; i < numTokens; i++)  {
                    if (directiveTokens[i].at(0) != '-') {
                        if (!locationFound) {
                            location = directiveTokens[i];
                            locationFound = true;
                        } 
                        else 
                            variable = directiveTokens[i];
                    } 
                    else if (directiveTokens[i] == "-type") {
                        if (directiveTokens[i + 1] == "block")
                            type = 2;
                        else if (directiveTokens[i + 1] == "cyclic") 
                            type = 3;
                        i++;
                    } 
                    else if (directiveTokens[i] == "-dim") {
                        dim = std::atoi(directiveTokens[i + 1].c_str());
                        i++;
                    }
                }

                ConstantAsMetadata* directiveIndexMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex));
                ConstantAsMetadata* directiveOnMD = constOneMD;
                ConstantAsMetadata* isLocalArrayMD;
                ConstantAsMetadata* typeMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), type));
                ConstantAsMetadata* dimMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), dim));

                if (GlobalVariable* GV = M.getGlobalVariable(variable)) {
                    // Array to be partitioned is a global variable
                    DEBUG(errs() << "Found global array " << variable << "\n");

                    isLocalArrayMD = constZeroMD;
                    Type* arrayType = GV->getType();

                    // Get the array type that the global variable points to
                    if (arrayType->isPointerTy()) 
                        arrayType = arrayType->getPointerElementType();

                    size_t arrayNumElementsInDim; // The number of elements in the dimension to be partitioned
                    size_t numDims = 1;

                    if (dim == 0) {
                        // If the dimension is not specified, all dimensions are partitioned
                        arrayNumElementsInDim = arrayType->getArrayNumElements();
                        arrayType = arrayType->getArrayElementType();
                        while (arrayType->isArrayTy()) {
                            numDims++;
                            arrayNumElementsInDim *= arrayType->getArrayNumElements();
                            arrayType = arrayType->getArrayElementType();
                        }
                    }
                    else {
                        // Get the number of elements in the specified dimension
                        for (size_t i = 1; i < dim; i++) {
                            arrayType = arrayType->getArrayElementType();
                        }
                        arrayNumElementsInDim = arrayType->getArrayNumElements();
                    }

                    if (type == 1)
                        // If the type is complete, the factor will be set to 
                        // the number of elements in the dimension to be partitioned;
                        factor = arrayNumElementsInDim;
                    else
                        // otherwise, the factor is multiplied by the number of dimensions that will be partitioned
                        factor *= numDims;
                    

                    ConstantAsMetadata* dimSizeMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), arrayNumElementsInDim));
                    ConstantAsMetadata* factorMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor));

                    SmallVector<Metadata*, 7> arrayPartitionMD = {directiveIndexMD, directiveOnMD, isLocalArrayMD, dimSizeMD, typeMD, factorMD, dimMD};

                    GV->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));

                    for (Use& U : GV->uses()) {
                        if (Instruction* op = dyn_cast<Instruction>(U.getUser())) {
                            op->setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
                        }
                    }
                } 
                else {
                    // Array to be partitioned is a local variable
                    std::string functionName = location.substr(0, location.find_first_of('/'));
                    bool found = false;

                    for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                        Function* F = &*FI;

                        if (F->size() == 0 || F->getName() != functionName) continue;

                        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                            BasicBlock* BB = &*BI;

                            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                
                                if (I->getName() != variable) continue;

                                DEBUG(errs() << "Found local array " << variable << "\n");

                                isLocalArrayMD = constOneMD;
                               	Type* arrayType = I->getType();
                   		        // If the variable is a pointer to an array, get the type of the array that it points to
                                if (arrayType->isPointerTy()) 
                                    arrayType = arrayType->getPointerElementType();

                                size_t arrayNumElementsInDim; // The number of elements in the dimension to be partitioned
                                size_t numDims = 1;

                                if (dim == 0) {
                                    // If the dimension is not specified, all dimensions are partitioned
                                    arrayNumElementsInDim = arrayType->getArrayNumElements();
                                    arrayType = arrayType->getArrayElementType();
                                    while (arrayType->isArrayTy()) {
                                        numDims++;
                                        arrayNumElementsInDim *= arrayType->getArrayNumElements();
                                        arrayType = arrayType->getArrayElementType();
                                    }
                                }
                                else {
                                    // Get the number of elements in the specified dimension
                                    for (size_t i = 1; i < dim; i++) {
                                        arrayType = arrayType->getArrayElementType();
                                    }
                                    arrayNumElementsInDim = arrayType->getArrayNumElements();
                                }

                                if (type == 1)
                                    // If the type is complete, the factor will be set to 
                                    // the number of elements in the dimension to be partitioned;
                                    factor = arrayNumElementsInDim;
                                else
                                    // otherwise, the factor is multiplied by the number of dimensions that will be partitioned
                                    factor *= numDims;

                                ConstantAsMetadata* dimSizeMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), arrayNumElementsInDim));
                                ConstantAsMetadata* factorMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), factor));

                                SmallVector<Metadata*, 7> arrayPartitionMD = {directiveIndexMD, directiveOnMD, isLocalArrayMD, dimSizeMD, typeMD, factorMD, dimMD};

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
            } 
            else if (directiveTokens[0] == "set_directive_loop_flatten") {
                // set_directive_loop_flatten function/loop -> (directiveIndex,1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                ConstantAsMetadata* directiveIndexMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex));
                ConstantAsMetadata* directiveOnMD = constOneMD;

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0 || F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (!BB->hasName() || BB->getName() != loopName) continue;

                        DEBUG(errs() << "Found loop " << loopName << "\n");

                        SmallVector<Metadata*, 2> loopFlattenMD = {directiveIndexMD, directiveOnMD};

                        /*
                        // Attach metadata to all instructions in the loop entering node
                        for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                            Instruction* I = &*II;
                            I->setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
                        }*/

                        // Attach metadata to all instructions in the loop
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
                    break;
                }
                directiveIndex++;
            } 
            else if (directiveTokens[0] == "set_directive_loop_merge") {
                // set_directive_loop_merge function/loop -> (directiveIndex,1)
                std::string location = directiveTokens[1];
                size_t slashPos = location.find_first_of('/');
                std::string functionName = location.substr(0, slashPos);
                std::string loopName = location.substr(slashPos + 1);

                ConstantAsMetadata* directiveIndexMD = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), directiveIndex));
                ConstantAsMetadata* directiveOnMD = constOneMD;

                for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
                    Function* F = &*FI;

                    if (F->size() == 0 || F->getName() != functionName)
                        continue;

                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();

                    for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                        BasicBlock* BB = &*BI;

                        if (!BB->hasName() || BB->getName() != loopName) continue;

                        DEBUG(errs() << "Found loop " << loopName << "\n");

                        SmallVector<Metadata*, 2> loopMergeMD = {directiveIndexMD, directiveOnMD};

                        /*
                        // Attach metadata to all instructions in the loop entering node
                        for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                            Instruction* I = &*II;
                            I->setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
                        }*/
                        
                        // Attach metadata to all instructions in the loop
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
                directiveIndex++;
            }
        }

        return false; // Module is not modified
    }

    // Split a string into tokens separated by spaces
    std::vector<std::string> split(const std::string& str) 
    {
        std::vector<std::string> result;
        std::istringstream iss(str);
        std::string token;

        while (std::getline(iss, token, ' ')) {
            if (!token.empty()) 
                result.push_back(token);
        }

        return result;
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override 
    {
        AU.addRequired<LoopInfoWrapperPass>();
    }
}; // struct AddDirectivesMD

}  // namespace

char SetHLSDirectivesMD::ID = 0;
static RegisterPass<SetHLSDirectivesMD> X("set-hls-md", "Set HLS directives metadata", false, false);
