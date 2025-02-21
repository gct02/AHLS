#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
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
#include "llvm/Analysis/IVDescriptors.h"
#include "llvm/Analysis/LoopAccessAnalysis.h"

#include "llvm/Analysis/XILINXLoopInfoUtils.h"
#include "llvm/IR/XILINXFPGAIntrinsicInst.h"

#include <iostream>
#include <sstream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <utility>

using namespace llvm;

/* Note: The directives file is a TCL script generated previously by the DSE heuristic
 * (when predicting a design's QoR metrics) or (during the training phase) by the
 * script responsible for preprocessing the IR (using the solution<N>_data.json file 
 * or the solution<N>.directive file, which are created by Vitis HLS). */
static cl::opt<std::string> directivesFilePath(
    "dir", 
    cl::desc("Path to the file containing the HLS directives"), 
    cl::value_desc("filepath")
);

namespace {

using DirectiveOptions = std::unordered_map<std::string, std::string>;

/* HLS directive */
typedef struct {
    std::string name;
    std::string functionName;
    std::string label;
    DirectiveOptions options;
} Directive;

/* Dictionary of directives, indexed by directive name.
 * It maps a directive type name to a vector of directives of that type. */
using DirectiveDict = std::unordered_map<std::string, std::vector<Directive>>;

struct SetHLSDirectivesMD : public ModulePass {
    static char ID;
    SetHLSDirectivesMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "set-hls-md"

        DirectiveDict directives;

        // Parse the TCL script containing the HLS directives
        parseDirectivesFile(directives, M);
        if (directives.empty()) {
            errs() << "No directives found\n";
            return false;
        }

        // Set metadata for each directive type
        setDirectivesMD(M, directives);

        return false;
    }

    void setDirectivesMD(Module& M, const DirectiveDict& directives) {
        LLVMContext& ctx = M.getContext();
        uint32_t directiveIndex = 1;

        if (directives.find("arrayPartition") != directives.end()) {
            std::vector<Directive> arrayPartitionDirectives = directives.at("arrayPartition");
            for (const Directive& directive : arrayPartitionDirectives) {
                if (setArrayPartitionMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("pipeline") != directives.end()) {
            std::vector<Directive> pipelineDirectives = directives.at("pipeline");
            for (const Directive& directive : pipelineDirectives) {
                if (setPipelineMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("unroll") != directives.end()) {
            std::vector<Directive> unrollDirectives = directives.at("unroll");
            for (const Directive& directive : unrollDirectives) {
                if (setUnrollMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("loopFlatten") != directives.end()) {
            std::vector<Directive> loopFlattenDirectives = directives.at("loopFlatten");
            for (const Directive& directive : loopFlattenDirectives) {
                if (setLoopFlattenMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("loopMerge") != directives.end()) {
            std::vector<Directive> loopMergeDirectives = directives.at("loopMerge");
            for (const Directive& directive : loopMergeDirectives) {
                if (setLoopMergeMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
    }

    // Set named metadata for an instruction, global object or function
    void setMetadata(Value& V, StringRef name, uint32_t value) {
        LLVMContext& ctx = V.getContext();
        ConstantInt* valueCI = ConstantInt::get(Type::getInt32Ty(ctx), value);
        MDNode* md = MDNode::get(ctx, {ConstantAsMetadata::get(valueCI)});
        if (Instruction* I = dyn_cast<Instruction>(&V)) {
            I->setMetadata(name, md);
        } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
            G->setMetadata(name, md);
        } else if (Function* F = dyn_cast<Function>(&V)) {
            F->setMetadata(name, md);
        }
    }

    bool isNumber(const std::string& s) {
        return !s.empty() && s.find_first_not_of("-.0123456789") == std::string::npos;
    }

    uint32_t getNumericalOption(const Directive& directive, const std::string& optionName, 
                                uint32_t defaultValue=0) {
        if (directive.options.find(optionName) != directive.options.end()) {
            std::string optionValue = directive.options.at(optionName);
            if (isNumber(optionValue)) 
                return std::stoi(optionValue);
        }
        return defaultValue;
    }

    uint32_t getArrayNumDims(Type* arrayType) {
        uint32_t numDims = 0;
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        while (arrayType->isArrayTy()) {
            numDims++;
            arrayType = arrayType->getArrayElementType();
        }
        return numDims;
    }

    uint32_t getArrayNumElements(Type* arrayType) {
        uint32_t numElements = 1;
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        while (arrayType->isArrayTy()) {
            numElements *= arrayType->getArrayNumElements();
            arrayType = arrayType->getArrayElementType();
        }
        return numElements;
    }

    uint32_t getArrayDimNumElements(Type* arrayType, uint32_t dim) {
        if (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }
        for (size_t i = 1; i < dim; i++) {
            arrayType = arrayType->getArrayElementType();
        }
        return arrayType->getArrayNumElements();
    }

    ConstantAsMetadata* getConstantAsMetadata(LLVMContext& ctx, uint32_t value) {
        return ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), value));
    }

    MDTuple* getArrayPartitionMDTuple(LLVMContext& ctx, Type* arrayType, uint32_t directiveIndex, 
                                      uint32_t type, uint32_t dim, uint32_t factor) {
        while (arrayType->isPointerTy()) {
            arrayType = arrayType->getPointerElementType();
        }

        uint32_t dimSize, numPartitions;
        if (dim == 0) {
            // If the dimension is not specified, all dimensions are partitioned
            dimSize = getArrayNumElements(arrayType);
        } else {
            dimSize = getArrayDimNumElements(arrayType, dim);
        }

        if (type == 1) {
            // If the type is complete, the number of partitions is equal to
            // the number of elements in the dimension to be partitioned;
            numPartitions = dimSize;
        } else {
            // otherwise, the number of partitions is equal to the factor
            // multiplied by the number of dimensions of the array
            numPartitions = factor * getArrayNumDims(arrayType);
        }
        ConstantAsMetadata* indexMD = getConstantAsMetadata(ctx, directiveIndex);
        ConstantAsMetadata* dimMD = getConstantAsMetadata(ctx, dim);
        ConstantAsMetadata* typeMD = getConstantAsMetadata(ctx, type);
        ConstantAsMetadata* factorMD = getConstantAsMetadata(ctx, factor);
        ConstantAsMetadata* dimSizeMD = getConstantAsMetadata(ctx, dimSize);
        ConstantAsMetadata* numPartitionsMD = getConstantAsMetadata(ctx, numPartitions);
        SmallVector<Metadata*, 6> arrayPartitionMD = {indexMD, typeMD, dimMD, factorMD, 
                                                      dimSizeMD, numPartitionsMD};
        return MDTuple::get(ctx, arrayPartitionMD);
    }

    int setLoopMergeMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
        ConstantAsMetadata* functionLevelMD;
        if (directive.label.empty()) {
            functionLevelMD = getConstantAsMetadata(M.getContext(), 1);
        } else {
            functionLevelMD = getConstantAsMetadata(M.getContext(), 0);
        }
        
        bool found = false;
        if (directive.label.empty()) {
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, functionLevelMD});
                LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                Loop* L = LI.getLoopFor(BB);
                if (L) {
                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                    for (BasicBlock* loopBlock : loopBlocks) {
                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                            Instruction* I = &*II;
                            I->setMetadata("loopMerge", md);
                        }
                    }
                    found = true;
                }
            }
        } else {
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                if (BB->hasName() && BB->getName() == directive.label) {
                    BasicBlock* loopHeader;
                    // loopHeader = BB->getSingleSuccessor();
                    // if (!loopHeader) {
                    loopHeader = BB;
                    // }
                    MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, functionLevelMD});
                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                    Loop* L = LI.getLoopFor(loopHeader);
                    if (L) {
                        ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                        for (BasicBlock* loopBlock : loopBlocks) {
                            Loop* subLoop = LI.getLoopFor(loopBlock);
                            if (subLoop) {
                                for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                    Instruction* I = &*II;
                                    I->setMetadata("loopMerge", md);
                                }
                                found = true;
                            }
                        }
                    }
                    break;
                }
            }
        }
        return found ? 0 : -1;
    }

    int setLoopFlattenMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified\n";
            return -1;
        }
        if (directive.label.empty()) {
            errs() << "Loop label not specified\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        bool found = false;
        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (BB->hasName() && BB->getName() == directive.label) {
                BasicBlock* loopHeader = BB->getSingleSuccessor();
                if (!loopHeader) {
                    errs() << "Loop header not found\n";
                    return -1;
                }
                ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
                MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD});
                LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                Loop* L = LI.getLoopFor(loopHeader);
                if (L) {
                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                    for (BasicBlock* loopBlock : loopBlocks) {
                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                            Instruction* I = &*II;
                            I->setMetadata("loopFlatten", md);
                        }
                    }
                    found = true;
                }
                break;
            }
        }
        return found ? 0 : -1;
    }

    int setUnrollMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified\n";
            return -1;
        }
        if (directive.label.empty()) {
            errs() << "Loop label not specified\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        uint32_t factor = getNumericalOption(directive, "factor");
        DEBUG(dbgs() << "factor: " << factor << "\n");

        uint32_t complete = factor == 0 ? 1 : 0;

        bool found = false;
        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (BB->hasName() && BB->getName() == directive.label) {
                BasicBlock* loopHeader = BB->getSingleSuccessor();
                if (!loopHeader) {
                    errs() << "Loop header not found\n";
                    return -1;
                }
                LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                Loop* L = LI.getLoopFor(loopHeader);
                if (L) {
                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                    if (complete) {
                        // Use the loop trip count as factor if complete unrolling
                        BasicBlock* loopBlock = loopBlocks[0];
                        Instruction* I = &*loopBlock->begin();
                        MDNode* tripCountMD = I->getMetadata("tripCount");
                        uint32_t tripCount = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(tripCountMD->getOperand(0))->getValue())->getZExtValue();
                        factor = tripCount;
                    }
                    ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
                    ConstantAsMetadata* completeMD = getConstantAsMetadata(M.getContext(), complete);
                    ConstantAsMetadata* factorMD = getConstantAsMetadata(M.getContext(), factor);
                    MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, completeMD, factorMD});
                    for (BasicBlock* loopBlock : loopBlocks) {
                        for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                            Instruction* I = &*II;
                            I->setMetadata("unroll", md);
                        }
                    }
                    found = true;
                }
                break;
            }
        }
        return found ? 0 : -1;
    }

    int setPipelineMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.options.find("off") != directive.options.end()) {
            return 1;
        }
        if (directive.functionName.empty()) {
            errs() << "Function name not specified\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        uint32_t II = getNumericalOption(directive, "II", 0);

        ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
        ConstantAsMetadata* IIMD = getConstantAsMetadata(M.getContext(), II);
        ConstantAsMetadata* functionLevelMD;
        if (directive.label.empty()) {
            functionLevelMD = getConstantAsMetadata(M.getContext(), 1);
        } else {
            functionLevelMD = getConstantAsMetadata(M.getContext(), 0);
        }
        
        bool found = false;
        if (directive.label.empty()) {
            // Set metadata to all instructions in the function
            MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, IIMD, functionLevelMD});
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                    Instruction* I = &*II;
                    I->setMetadata("pipeline", md);
                }
            }
            found = true;
        } else {
            // Set metadata to all instructions in the loop labeled as directive.label
            MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, IIMD, functionLevelMD});
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                if (BB->hasName() && BB->getName() == directive.label) {
                    BasicBlock* loopHeader = BB->getSingleSuccessor();
                    if (!loopHeader) {
                        errs() << "Loop header not found\n";
                        return -1;
                    }
                    LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                    Loop* L = LI.getLoopFor(loopHeader);
                    if (L) {
                        ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
                        for (BasicBlock* loopBlock : loopBlocks) {
                            for (BasicBlock::iterator II = loopBlock->begin(), IE = loopBlock->end(); II != IE; ++II) {
                                Instruction* I = &*II;
                                I->setMetadata("pipeline", md);
                            }
                        }
                        found = true;
                    }
                    break;
                }
            }
        }
        return found ? 0 : -1;
    }

    int setArrayPartitionMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        LLVMContext& ctx = M.getContext();
        uint32_t dim, type, factor;

        dim = getNumericalOption(directive, "dim");
        DEBUG(dbgs() << "dim: " << dim << "\n");
        factor = getNumericalOption(directive, "factor");
        DEBUG(dbgs() << "factor: " << factor << "\n");

        std::string typeOption = directive.options.at("type");
        DEBUG(dbgs() << "type: " << typeOption << "\n");

        if (typeOption == "complete") {
            type = 1;
        } else if (typeOption == "cyclic") {
            type = 2;
        } else {
            type = 3; // block
        }

        std::string variable = directive.options.at("variable");
        if (variable.empty()) {
            errs() << "Variable name not found\n";
            return -1;
        }

        if (directive.functionName.empty()) {
            // Array is a global variable
            GlobalVariable* GV = M.getGlobalVariable(variable, true);
            if (!GV) {
                errs() << "Global variable not found: " << variable << "\n";
                return -1;
            }
            MDTuple* md = getArrayPartitionMDTuple(
                ctx, GV->getType(), directiveIndex, type, dim, factor
            );
            GV->setMetadata("arrayPartition", md);
        } else {
            // Array is scoped within a function
            Function* F = M.getFunction(directive.functionName);
            if (!F) {
                errs() << "Function not found: " << directive.functionName << "\n";
                return -1;
            }
            bool found = false;
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                    Instruction* I = &*II;
                    if (I->hasName() && I->getName() == variable) {
                        MDTuple* md = getArrayPartitionMDTuple(
                            ctx, I->getType(), directiveIndex, type, dim, factor
                        );
                        I->setMetadata("arrayPartition", md);
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
            if (!found) {
                errs() << "Variable not found: " << variable << "\n";
                return -1;
            }
        }

        return 0;
    }

    std::vector<std::string> tokenize(const std::string& str, 
                                      const std::string& delim=" ") {
        std::vector<std::string> tokens;
        std::size_t start = 0, end = 0;
        while ((end = str.find(delim, start)) != std::string::npos) {
            if (end != start) {
                tokens.push_back(str.substr(start, end - start));
            }
            start = end + 1;
        }
        if (end != start) {
            tokens.push_back(str.substr(start));
        }
        return tokens;
    }

    /* Parse the TCL script containing the HLS directives */
    int parseDirectivesFile(DirectiveDict& directives, Module& M) {
        std::ifstream file(directivesFilePath);
        if (!file.is_open()) {
            errs() << "Error opening file\n";
            return -1;
        }
        Directive directive;
        std::string line;

        while (std::getline(file, line)) {
            // Split the line into two tokens: the directive name and the arguments
            size_t firstSpace = line.find(" ");
            std::string directiveName = line.substr(0, firstSpace);
            std::string arguments = line.substr(firstSpace + 1);

            if (directiveName == "set_directive_array_partition") {
                // Format: set_directive_array_partition <location> [-dim <dim> -factor <factor> -type <type>] <array>
                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool locationFound = false;

                for (size_t i = 0; i < numTokens; i++) {
                    // Remove any leading or trailing whitespace
                    std::string token = argTokens[i];
                    token.erase(token.find_last_not_of(" \t") + 1);
                    token.erase(0, token.find_first_not_of(" \t"));

                    if (token == "-dim") {
                        directive.options["dim"] = argTokens[i + 1];
                        i++;
                    } else if (token == "-factor") {
                        directive.options["factor"] = argTokens[i + 1];
                        i++;
                    } else if (token == "-type") {
                        directive.options["type"] = argTokens[i + 1];
                        i++;
                    } else if (!locationFound) {
                        directive.functionName = token;
                        directive.label = "";
                        locationFound = true;
                    } else {
                        directive.options["variable"] = token;
                    }
                }
                // Set the undefined directive options to default values
                if (directive.options.find("dim") == directive.options.end()) {
                    directive.options["dim"] = "0";
                }
                if (directive.options.find("factor") == directive.options.end()) {
                    directive.options["factor"] = "0";
                }
                if (directive.options.find("type") == directive.options.end()) {
                    directive.options["type"] = "complete";
                }

                // Check if the array in the source code is a parameter of a function or a local variable.
                // If the array is a parameter, the `prep-gnn` pass may have created a global variable 
                // named as "functionName.arrayName" to represent the array, and if the array is a local 
                // variable or constant, Clang might have promoted it to a global constant.
                if (!directive.functionName.empty()) {
                    if (Function* F = M.getFunction(directive.functionName)) {
                        std::string arrayName = directive.options.at("variable");
                        Argument* arrayArg = nullptr;
                        for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
                            Argument* arg = &*AI;
                            if (arg->hasName() && arg->getName() == arrayName) {
                                arrayArg = arg;
                                break;
                            }
                        }
                        std::string globalArrayName = directive.functionName + "." + arrayName;
                        if (GlobalVariable* GV = M.getGlobalVariable(globalArrayName, true)) {
                            directive.options["variable"] = globalArrayName;
                            directive.functionName = "";
                        }
                    }
                }

                directive.name = "arrayPartition";
                directives["arrayPartition"].push_back(directive);

            } else if (directiveName == "set_directive_pipeline") {
                // Format: set_directive_pipeline <location> [-II <II> -off=true]
                // where <location> is <function>[/<label>]
                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();

                for (size_t i = 0; i < numTokens; i++) {
                    // Remove any leading or trailing whitespace
                    std::string token = argTokens[i];
                    token.erase(token.find_last_not_of(" \t") + 1);
                    token.erase(0, token.find_first_not_of(" \t"));

                    if (token == "-II") {
                        directive.options["II"] = argTokens[i + 1];
                        i++;
                    } else if (token.find("-off") != std::string::npos) {
                        directive.options["off"] = "true";
                    } else {
                        size_t slashPos = token.find("/");
                        if (slashPos != std::string::npos) {
                            directive.functionName = token.substr(0, slashPos);
                            directive.label = token.substr(slashPos + 1);
                        } else {
                            directive.functionName = token;
                            directive.label = "";
                        }
                    }
                }
                // Set the undefined directive options to default values
                if (directive.options.find("II") == directive.options.end()) {
                    directive.options["II"] = "0";
                }
                if (directive.label.empty()) {
                    directive.options["functionLevel"] = "1";
                } else {
                    directive.options["functionLevel"] = "0";
                }
                directive.name = "pipeline";
                directives["pipeline"].push_back(directive);

            } else if (directiveName == "set_directive_unroll") {
                // Format: set_directive_unroll <location> [-factor <factor>]
                // where <location> is <function>/<label>
                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool valid = true;

                for (size_t i = 0; i < numTokens; i++) {
                    // Remove any leading or trailing whitespace
                    std::string token = argTokens[i];
                    token.erase(token.find_last_not_of(" \t") + 1);
                    token.erase(0, token.find_first_not_of(" \t"));

                    if (token == "-factor") {
                        directive.options["factor"] = argTokens[i + 1];
                        i++;
                    } else {
                        size_t slashPos = token.find("/");
                        if (slashPos != std::string::npos) {
                            directive.functionName = token.substr(0, slashPos);
                            directive.label = token.substr(slashPos + 1);
                        } else {
                            errs() << "Invalid location format\n";
                            valid = false;
                            break;
                        }
                    }
                }
                if (!valid) {
                    continue;
                }
                // Set the undefined directive options to default values
                if (directive.options.find("factor") == directive.options.end()) {
                    directive.options["factor"] = "0";
                }
                directive.name = "unroll";
                directives["unroll"].push_back(directive);

            } else if (directiveName == "set_directive_loop_flatten") {
                // Format: set_directive_loop_flatten <location>
                // where <location> is <function>/<label>
                std::string location = arguments.substr(0, arguments.find(" "));
                size_t slashPos = location.find("/");

                if (slashPos != std::string::npos) {
                    directive.functionName = location.substr(0, slashPos);
                    directive.label = location.substr(slashPos + 1);
                } else {
                    errs() << "Invalid location format\n";
                    continue;
                }
                directive.name = "loopFlatten";
                directives["loopFlatten"].push_back(directive);

            } else if (directiveName == "set_directive_loop_merge") {
                // Format: set_directive_loop_merge <location>
                // where <location> is <function>[/<label>]
                std::string location = arguments.substr(0, arguments.find(" "));
                size_t slashPos = location.find("/");

                if (slashPos != std::string::npos) {
                    directive.functionName = location.substr(0, slashPos);
                    directive.label = location.substr(slashPos + 1);
                } else {
                    directive.functionName = location;
                    directive.label = "";
                }
                if (directive.label.empty()) {
                    directive.options["functionLevel"] = "1";
                } else {
                    directive.options["functionLevel"] = "0";
                }
                directive.name = "loopMerge";
                directives["loopMerge"].push_back(directive);
            }
        }
        file.close();
        return 0;
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
    
}; // struct SetHLSDirectivesMD

}  // anonymous namespace

char SetHLSDirectivesMD::ID = 0;
static RegisterPass<SetHLSDirectivesMD> X("set-hls-md", "Set HLS directives metadata", false, false);