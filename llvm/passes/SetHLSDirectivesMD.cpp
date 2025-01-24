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

#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <utility>

using namespace llvm;

/* Note: The directives file is a TCL script generated previously by the DSE heuristic
 * (when predicting a design's QoR metrics) or, during the training phase, by the
 * script responsible for preprocessing the IR using the solution<N>_data.json file 
 * or the solution<N>.directive file, which are created by Vitis HLS. */
static cl::opt<std::string> directivesFilePath(
    "dir", 
    cl::desc("Path to the file containing the HLS directives"), 
    cl::value_desc("filepath")
);

namespace {

/* HLS directive */
typedef struct {
    std::string name;
    std::string functionName;
    std::string label;
    std::unordered_map<std::string, std::string> options;
} Directive;

/* Dictionary of directives, indexed by directive name.
 * It maps a directive type name to a vector of directives of that type. */
using DirectiveDict = std::unordered_map<std::string, std::vector<Directive>>;

struct SetHLSDirectivesMD : public ModulePass {
    static char ID;
    SetHLSDirectivesMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "set-hls-md"

        LLVMContext& ctx = M.getContext();
        DirectiveDict directives;

        // Parse the TCL script containing the HLS directives
        parseDirectivesFile(directives, M);
        if (directives.empty()) {
            errs() << "No directives found\n";
            return false;
        }

        // Set metadata for each directive type
        setDirectivesMD(M, directives);

        return false; // Module is not modified
    }

    void setDirectivesMD(Module& M, const DirectiveDict& directives) {
        LLVMContext& ctx = M.getContext();
        uint32_t directiveIndex = 1;

        if (directives.find("ARRAY_PARTITION") != directives.end()) {
            std::vector<Directive> arrayPartitionDirectives = directives.at("ARRAY_PARTITION");
            for (const Directive& directive : arrayPartitionDirectives) {
                if (setArrayPartitionMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("PIPELINE") != directives.end()) {
            std::vector<Directive> pipelineDirectives = directives.at("PIPELINE");
            for (const Directive& directive : pipelineDirectives) {
                if (setPipelineMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("UNROLL") != directives.end()) {
            std::vector<Directive> unrollDirectives = directives.at("UNROLL");
            for (const Directive& directive : unrollDirectives) {
                if (setUnrollMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("LOOP_FLATTEN") != directives.end()) {
            std::vector<Directive> loopFlattenDirectives = directives.at("LOOP_FLATTEN");
            for (const Directive& directive : loopFlattenDirectives) {
                if (setLoopFlattenMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
        if (directives.find("LOOP_MERGE") != directives.end()) {
            std::vector<Directive> loopMergeDirectives = directives.at("LOOP_MERGE");
            for (const Directive& directive : loopMergeDirectives) {
                if (setLoopMergeMD(M, directive, directiveIndex) == 0) {
                    directiveIndex++;
                }
            }
        }
    }

    // Set named metadata for an instruction or global object
    void setMetadata(Value& V, StringRef name, uint32_t value) {
        LLVMContext& ctx = V.getContext();
        ConstantInt* valueCI = ConstantInt::get(Type::getInt32Ty(ctx), value);
        MDNode* md = MDNode::get(ctx, {ConstantAsMetadata::get(valueCI)});
        if (Instruction* I = dyn_cast<Instruction>(&V)) {
            I->setMetadata(name, md);
        } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
            G->setMetadata(name, md);
        }
    }

    uint32_t getNumericalOption(const Directive& directive, const std::string& optionName, 
                                uint32_t defaultValue=0) {
        if (directive.options.find(optionName) != directive.options.end()) {
            // Check if the option is a numerical value
            if (directive.options.at(optionName).find_first_not_of("0123456789.- \n\t") != std::string::npos) {
                return defaultValue;
            }
            return std::stoi(directive.options.at(optionName));
        } else {
            return defaultValue;
        }
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
                                      uint32_t type, uint32_t dim, uint32_t factor, bool isGlobal) {
        uint32_t dimSize, numPartitions;
        if (dim == 0) {
            // If the dimension is not specified, all dimensions are partitioned
            dimSize = getArrayNumElements(arrayType);
        } else {
            dimSize = getArrayDimNumElements(arrayType, dim);
        }
        if (type == 1) {
            // If the type is complete, the factor will be set to 
            // the number of elements in the dimension to be partitioned;
            numPartitions = dimSize;
        } else {
            // otherwise, the factor is multiplied by the number of 
            // dimensions that will be partitioned. 
            numPartitions = factor * getArrayNumDims(arrayType);
        }
        ConstantAsMetadata* indexMD = getConstantAsMetadata(ctx, directiveIndex);
        ConstantAsMetadata* dimMD = getConstantAsMetadata(ctx, dim);
        ConstantAsMetadata* typeMD = getConstantAsMetadata(ctx, type);
        ConstantAsMetadata* factorMD = getConstantAsMetadata(ctx, factor);
        ConstantAsMetadata* dimSizeMD = getConstantAsMetadata(ctx, dimSize);
        ConstantAsMetadata* partitionsMD = getConstantAsMetadata(ctx, numPartitions);
        ConstantAsMetadata* isGlobalMD = getConstantAsMetadata(ctx, isGlobal ? 1 : 0);
        SmallVector<Metadata*, 7> arrayPartitionMD = {indexMD, typeMD, dimMD, factorMD, 
                                                      dimSizeMD, partitionsMD, isGlobalMD};
        return MDTuple::get(ctx, arrayPartitionMD);
    }

    int setLoopMergeMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
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
        ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
        
        bool found = false;
        if (directive.label.empty()) {
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD});
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
                    BasicBlock* loopHeader = BB->getSingleSuccessor();
                    if (!loopHeader) {
                        errs() << "Loop header not found\n";
                        return -1;
                    }
                    MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD});
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
        if (directive.options.find("off") != directive.options.end()) {
            return 1;
        }
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
        if (directive.options.find("off") != directive.options.end()) {
            return 1;
        }
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
                ConstantAsMetadata* directiveIndexMD = getConstantAsMetadata(M.getContext(), directiveIndex);
                ConstantAsMetadata* completeMD = getConstantAsMetadata(M.getContext(), complete);
                ConstantAsMetadata* factorMD = getConstantAsMetadata(M.getContext(), factor);
                MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, completeMD, factorMD});
                LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(*F).getLoopInfo();
                Loop* L = LI.getLoopFor(loopHeader);
                if (L) {
                    ArrayRef<BasicBlock*> loopBlocks = L->getBlocks();
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
        
        bool found = false;
        if (directive.label.empty()) {
            // Set metadata to all instructions in the function
            MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, IIMD});
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
            MDTuple* md = MDTuple::get(M.getContext(), {directiveIndexMD, IIMD});
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
                }
            }
        }
        return found ? 0 : -1;
    }

    int setArrayPartitionMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.options.find("off") != directive.options.end()) {
            return 1;
        }
        LLVMContext& ctx = M.getContext();
        uint32_t dim, type, factor, dimSize, numPartitions;

        dim = getNumericalOption(directive, "dim");
        factor = getNumericalOption(directive, "factor");
        if (directive.options.find("cyclic") == directive.options.end()) {
            type = 2;
        } else if (directive.options.find("block") == directive.options.end()) {
            type = 3;
        } else {
            type = 1; // complete
        }

        if (directive.functionName.empty()) {
            // Array is a global variable
            GlobalVariable* GV = M.getGlobalVariable(directive.label, true);
            if (!GV) {
                errs() << "Global variable not found: " << directive.label << "\n";
                return -1;
            }
            Type* valueType = GV->getType();
            if (valueType->isPointerTy()) {
                valueType = valueType->getPointerElementType();
            }
            if (!valueType->isArrayTy()) {
                errs() << "Variable is not an array: " << directive.label << "\n";
                return -1;
            }
            MDTuple* md = getArrayPartitionMDTuple(ctx, valueType, directiveIndex, 
                                                   type, dim, factor, true);
            GV->setMetadata("arrayPartition", md);
        } else {
            // Array is scoped within a function
            Function* F = M.getFunction(directive.functionName);
            if (!F) {
                errs() << "Function not found: " << directive.functionName << "\n";
                return -1;
            }
            std::string variable = directive.options.at("variable");
            if (variable.empty()) {
                errs() << "Variable name not found\n";
                return -1;
            }
            bool found = false;
            for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
                Argument* arg = &*AI;
                for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                    BasicBlock* BB = &*BI;
                    for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                        Instruction* I = &*II;
                        if (I->getName() == variable) {
                            Type* valueType = I->getType();
                            if (valueType->isPointerTy()) {
                                valueType = valueType->getPointerElementType();
                            }
                            if (!valueType->isArrayTy()) {
                                errs() << "Variable is not an array: " << variable << "\n";
                                return -1;
                            }
                            MDTuple* md = getArrayPartitionMDTuple(ctx, valueType, directiveIndex, 
                                                                   type, dim, factor, false);
                            I->setMetadata("arrayPartition", md);
                            found = true;
                            break;
                        }
                    }
                    if (found) break;
                }
            }
            if (!found) {
                errs() << "Variable not found: " << variable << "\n";
                return -1;
            }
        }
        return 0;
    }

    void setArrayMD(Value& V) {
        Type* valueType = V.getType();
        if (valueType->isPointerTy()) {
            valueType = valueType->getPointerElementType();
        }
        if (valueType->isArrayTy()) {
            setMetadata(V, "isArray", 1);

            uint32_t numDims = getArrayNumDims(V.getType());
            uint32_t numElements = getArrayNumElements(V.getType());
            setMetadata(V, "numDims", numDims);
            setMetadata(V, "numElements", numElements);
            
            // for (uint32_t dim = 1; dim <= numDims; dim++) {
            //     uint32_t dimSize = getArrayDimNumElements(V.getType(), dim);
            //     setMetadata(V, "dimSize." + std::to_string(dim), dimSize);
            // }

            // Get element type of the array
            while (valueType->isArrayTy()) {
                valueType = valueType->getArrayElementType();
            }
            setMetadata(V, "elementType", (uint32_t)valueType->getTypeID());
            setMetadata(V, "elementBitwidth", valueType->getPrimitiveSizeInBits());
        }
    }

    /* Parse the TCL script containing the HLS directives */
    void parseDirectivesFile(DirectiveDict& directives, Module& M) {
        std::ifstream file(directivesFilePath);
        if (!file.is_open()) {
            errs() << "Error opening file\n";
            return;
        }

        std::string line;
        Directive directive;

        while (std::getline(file, line)) {
            // Split the line into two tokens: the directive name and the arguments
            std::string directiveName = line.substr(0, line.find(" "));
            std::string arguments = line.substr(line.find(" ") + 1);

            if (directiveName == "set_directive_array_partition") {
                // Format: set_directive_array_partition <location> [-dim <dim> -factor <factor> -type <type>] <array>
                // <location> can be <function>/<label> or <label>
                std::string location = arguments.substr(0, arguments.find(" "));

                std::string arrayName = arguments.substr(arguments.find_last_of(" ") + 1);
                directive.options["variable"] = arrayName;

                if (location.find("/") != std::string::npos) {
                    directive.functionName = location.substr(0, location.find("/"));
                    directive.label = location.substr(location.find("/") + 1);
                } else {
                    directive.functionName = location;
                    directive.label = location;
                }

                Function* F = M.getFunction(directive.functionName);
                if (F && F->getMetadata("top")) {
                    // Check if the array is a parameter of the top-level function
                    bool found = false;
                    Argument* arrayArg = nullptr;
                    for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
                        Argument* arg = &*AI;
                        if (arg->getName() == arrayName) {
                            found = true;
                            arrayArg = arg;
                            break;
                        }
                    }
                    if (found) {
                        // Create a dummy global variable to represent the array
                        // and set the metadata for the global variable
                        std::string dummyArrayName = F->getName().str() + "." + arrayName;
                        GlobalVariable* GV = new GlobalVariable(M, arrayArg->getType(), true, 
                                                                GlobalValue::ExternalLinkage, nullptr, 
                                                                dummyArrayName);
                        GV->setMetadata("top", F->getMetadata("top"));
                        setArrayMD(*GV);

                        directive.label = dummyArrayName;
                        directive.functionName = "";
                        directive.options["variable"] = dummyArrayName;
                    }
                }

                // Initialize the options with default values
                directive.options["dim"] = "0";
                directive.options["factor"] = "0";
                directive.options["type"] = "complete";

                arguments = arguments.substr(location.size() + 1);
                std::istringstream iss(arguments);
                std::string arg;
                while (iss >> arg) {
                    if (arg == "-dim") {
                        iss >> arg;
                        directive.options["dim"] = arg;
                    } else if (arg == "-factor") {
                        iss >> arg;
                        directive.options["factor"] = arg;
                    } else if (arg == "-type") {
                        iss >> arg;
                        directive.options["type"] = arg;
                    }
                }
                directives["ARRAY_PARTITION"].push_back(directive);
            } else if (directiveName == "set_directive_pipeline") {
                // Format: set_directive_pipeline <function>[/<label>] [-II <II> -off=true]
                // Check if the directive is disabled
                if (arguments.find("-off") != std::string::npos) {
                    directive.options["off"] = "true";
                }
                std::string location = arguments.substr(0, arguments.find(" "));
                if (location.find("/") != std::string::npos) {
                    directive.functionName = location.substr(0, location.find("/"));
                    directive.label = location.substr(location.find("/") + 1);
                } else {
                    directive.label = location;
                }
                directive.options["II"] = "0";

                arguments = arguments.substr(location.size() + 1);
                std::istringstream iss(arguments);
                std::string arg;
                while (iss >> arg) {
                    if (arg == "-II") {
                        iss >> arg;
                        directive.options["II"] = arg;
                    }
                }
                directives["PIPELINE"].push_back(directive);
            } else if (directiveName == "set_directive_unroll") {
                // Format: set_directive_unroll <location> [-factor <factor>]
                std::string location = arguments.substr(0, arguments.find(" "));
                if (location.find("/") != std::string::npos) {
                    directive.functionName = location.substr(0, location.find("/"));
                    directive.label = location.substr(location.find("/") + 1);
                } else {
                    directive.label = location;
                }
                directive.options["factor"] = "0";

                arguments = arguments.substr(location.size() + 1);
                std::istringstream iss(arguments);
                std::string arg;
                while (iss >> arg) {
                    if (arg == "-factor") {
                        iss >> arg;
                        directive.options["factor"] = arg;
                    }
                }
                directives["UNROLL"].push_back(directive);
            } else if (directiveName == "set_directive_loop_flatten") {
                // Format: set_directive_loop_flatten <location>
                std::string location = arguments.substr(0, arguments.find(" "));
                if (location.find("/") != std::string::npos) {
                    directive.functionName = location.substr(0, location.find("/"));
                    directive.label = location.substr(location.find("/") + 1);
                } else {
                    directive.label = location;
                }
                directives["LOOP_FLATTEN"].push_back(directive);
            } else if (directiveName == "set_directive_loop_merge") {
                // Format: set_directive_loop_merge <location>
                std::string location = arguments.substr(0, arguments.find(" "));
                if (location.find("/") != std::string::npos) {
                    directive.functionName = location.substr(0, location.find("/"));
                    directive.label = location.substr(location.find("/") + 1);
                } else {
                    directive.label = location;
                }
                directives["LOOP_MERGE"].push_back(directive);
            }
        }
        file.close();
    }

}; // struct SetHLSDirectivesMD

}  // anonymous namespace

char SetHLSDirectivesMD::ID = 0;
static RegisterPass<SetHLSDirectivesMD> X("set-hls-md", "Set HLS directives metadata", false, false);