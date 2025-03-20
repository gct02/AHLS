#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/IVDescriptors.h"
#include "llvm/Analysis/LoopAccessAnalysis.h"
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

#include "HLSDSEUtils.h"

using namespace llvm;

// Note: The directives file is a TCL script generated previously by the DSE heuristic
// (when predicting a design's QoR metrics) or (during the training phase) by the
// script responsible for preprocessing the IR (using the solution<N>_data.json file 
// or the solution<N>.directive file, which are created by Vitis HLS).
static cl::opt<std::string> directivesFilePath(
    "directive", 
    cl::desc("Path to the TCL script containing the HLS directives"), 
    cl::value_desc("filepath")
);

namespace {

using DirectiveOptions = std::unordered_map<std::string, std::string>;

struct Directive {
    std::string name;
    std::string functionName;
    std::string label;
    DirectiveOptions options;

    Directive() : name(""), functionName(""), label("") {}
    Directive(const std::string& n) : name(n), functionName(""), label("") {}
    Directive(const std::string& n, const std::string& f) : name(n), functionName(f), label("") {}
    Directive(const std::string& n, const std::string& f, const std::string& l) 
        : name(n), functionName(f), label(l) {}
};

// Dictionary of directives, indexed by directive name.
// It maps a directive type name to a vector of directives of that type.
using DirectiveDict = std::unordered_map<std::string, std::vector<Directive>>;

struct SetHLSDirectivesMD : public ModulePass {
    static char ID;
    SetHLSDirectivesMD() : ModulePass(ID) {}

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "set-hls-md"

        // Parse the TCL script containing the HLS directives
        DirectiveDict directives;
        std::string topFunctionName;

        parseTclDirectives(M, directives, topFunctionName);

        setTopLevelMD(M, topFunctionName);

        if (directives.empty()) {
            errs() << "No directives found\n";
            return false;
        }

        // Set metadata for each directive type
        setDirectivesMD(M, directives);

        return false;
    }

    void setTopLevelMD(Module& M, const std::string& topFunctionName) {
        if (Function* F = M.getFunction(topFunctionName)) {
            setIntMetadata(*F, "topLevel", 1);

            // Search for global variables named after the function's arguments
            for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
                Argument* arg = &*AI;
                std::string argName = topFunctionName + "." + arg->getName().str();
                if (GlobalVariable* GV = M.getGlobalVariable(argName, true)) {
                    setIntMetadata(*GV, "topLevelParam", 1);
                }
            }
        }
    }

    void setDirectivesMD(Module& M, const DirectiveDict& directives) {
        LLVMContext& ctx = M.getContext();
        uint32_t idx = 1;
        if (directives.find("arrayPartition") != directives.end()) {
            std::vector<Directive> arrayPartitionDirectives = directives.at("arrayPartition");
            for (const Directive& directive : arrayPartitionDirectives) {
                if (setArrayPartitionMD(M, directive, idx) == 0) idx++;
            }
        }
        if (directives.find("pipeline") != directives.end()) {
            std::vector<Directive> pipelineDirectives = directives.at("pipeline");
            for (const Directive& directive : pipelineDirectives) {
                if (setPipelineMD(M, directive, idx) == 0) idx++;
            }
        }
        if (directives.find("unroll") != directives.end()) {
            std::vector<Directive> unrollDirectives = directives.at("unroll");
            for (const Directive& directive : unrollDirectives) {
                if (setUnrollMD(M, directive, idx) == 0) idx++;
            }
        }
        if (directives.find("loopFlatten") != directives.end()) {
            std::vector<Directive> loopFlattenDirectives = directives.at("loopFlatten");
            for (const Directive& directive : loopFlattenDirectives) {
                if (setLoopFlattenMD(M, directive, idx) == 0) idx++;
            }
        }
        if (directives.find("loopMerge") != directives.end()) {
            std::vector<Directive> loopMergeDirectives = directives.at("loopMerge");
            for (const Directive& directive : loopMergeDirectives) {
                if (setLoopMergeMD(M, directive, idx) == 0) idx++;
            }
        }
    }

    uint32_t getNumericalOption(
        const Directive& directive, const std::string& optionName, 
        uint32_t defaultValue=0
    ) {
        if (directive.options.find(optionName) != directive.options.end()) {
            std::string optionValue = directive.options.at(optionName);
            if (isNumber(optionValue)) 
                return std::stoi(optionValue);
        }
        return defaultValue;
    }

    int setLoopMergeMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified for loop merge directive\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        uint32_t functionLevel = directive.label.empty() ? 1 : 0;
        SmallVector<Metadata*, 2> mds = {
            getConstantAsMetadata(M.getContext(), directiveIndex),
            getConstantAsMetadata(M.getContext(), functionLevel)
        };
        MDTuple* md = MDTuple::get(M.getContext(), mds);

        if (functionLevel) {
            F->setMetadata("loopMerge", md);
            return 0;
        } else {
            for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
                BasicBlock* BB = &*BI;
                if (!BB->hasName() || BB->getName().str() != directive.label) {
                    continue;
                }
                BasicBlock* header = BB->getSingleSuccessor();
                if (header) {
                    header->getTerminator()->setMetadata("loopMerge", md);
                } else {
                    errs() << "Loop header not found for loop merge directive in label: " 
                           << directive.label << "\n";
                    BB->getTerminator()->setMetadata("loopMerge", md);
                }
                return 0;
            }
        }
        return -1;
    }

    int setLoopFlattenMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified in loop flatten directive\n";
            return -1;
        }
        if (directive.label.empty()) {
            errs() << "Loop label not specified in loop flatten directive\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (!BB->hasName() || BB->getName().str() != directive.label) {
                continue;
            }
            MDTuple* md = MDTuple::get(
                M.getContext(), 
                {getConstantAsMetadata(M.getContext(), directiveIndex)}
            );
            BasicBlock* header = BB->getSingleSuccessor();
            if (header) {
                header->getTerminator()->setMetadata("loopFlatten", md);
            } else {
                errs() << "Loop header not found for loop flatten directive in label: " 
                       << directive.label << "\n";
                BB->getTerminator()->setMetadata("loopFlatten", md);
            }
            return 0;
        }
        return -1;
    }

    int setUnrollMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.functionName.empty()) {
            errs() << "Function name not specified in unroll directive\n";
            return -1;
        }
        if (directive.label.empty()) {
            errs() << "Loop label not specified in unroll directive\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        uint32_t factor = getNumericalOption(directive, "factor");
        uint32_t complete = factor == 0 ? 1 : 0;

        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (!BB->hasName() || BB->getName().str() != directive.label) {
                continue;
            }
            BasicBlock* target;
            BasicBlock* header = BB->getSingleSuccessor();
            if (header == nullptr) {
                errs() << "Loop header not found for unroll directive in label: " 
                       << directive.label << "\n";
                target = BB;
            } else {
                target = header;
            }
            auto* term = target->getTerminator();

            if (complete) {
                if (MDNode* tripCountMD = term->getMetadata("tripCount")) {
                    factor = getIntMDOperand(tripCountMD); 
                }
            }
            SmallVector<Metadata*, 3> mds = {
                getConstantAsMetadata(M.getContext(), directiveIndex),
                getConstantAsMetadata(M.getContext(), complete),
                getConstantAsMetadata(M.getContext(), factor)
            };
            MDTuple* md = MDTuple::get(M.getContext(), mds);
            term->setMetadata("unroll", md);
            return 0;
        }
        errs() << "Loop label not found: " << directive.label << "\n";
        return -1;
    }

    int setPipelineMD(Module& M, const Directive& directive, uint32_t directiveIndex) {
        if (directive.options.find("off") != directive.options.end()) {
            return 1;
        }
        if (directive.functionName.empty()) {
            errs() << "Function name not specified in pipeline directive\n";
            return -1;
        }
        Function* F = M.getFunction(directive.functionName);
        if (!F) {
            errs() << "Function not found: " << directive.functionName << "\n";
            return -1;
        }
        uint32_t ii = getNumericalOption(directive, "II", 0);
        uint32_t functionLevel = directive.label.empty() ? 1 : 0;

        SmallVector<Metadata*, 3> mds = {
            getConstantAsMetadata(M.getContext(), directiveIndex),
            getConstantAsMetadata(M.getContext(), ii),
            getConstantAsMetadata(M.getContext(), functionLevel)
        };
        MDTuple* md = MDTuple::get(M.getContext(), mds);
        
        if (functionLevel) {
            F->setMetadata("pipeline", md);
            return 0;
        }
        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (!BB->hasName() || BB->getName().str() != directive.label) {
                continue;
            }
            BasicBlock* header = BB->getSingleSuccessor();
            if (header) {
                header->getTerminator()->setMetadata("pipeline", md);
            } else {
                errs() << "Loop header not found for pipeline directive in label: " 
                       << directive.label << "\n";
                BB->getTerminator()->setMetadata("pipeline", md);
            }
            return 0;
        }
        errs() << "Loop label not found: " << directive.label << "\n";
        return -1;
    }

    int setArrayPartitionMD(
        Module& M, const Directive& directive, 
        uint32_t directiveIndex
    ) {
        LLVMContext& ctx = M.getContext();
        uint32_t dim = 0, factor = 0, type = 1;

        dim = getNumericalOption(directive, "dim");
        factor = getNumericalOption(directive, "factor");

        std::string typeName = directive.options.at("type");
        if (typeName == "cyclic") {
            type = 2;
        } else if (typeName == "block") {
            type = 3;   
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
                    if (I->hasName() && I->getName().str() == variable) {
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
                // Check if it was promoted to a global constant
                GlobalVariable* GV = M.getGlobalVariable(variable, true);
                if (!GV) {
                    errs() << "Variable not found: " << variable << "\n";
                    return -1;
                }
                MDTuple* md = getArrayPartitionMDTuple(
                    ctx, GV->getType(), directiveIndex, type, dim, factor
                );
                GV->setMetadata("arrayPartition", md);
            }
        }

        return 0;
    }

    MDTuple* getArrayPartitionMDTuple(
        LLVMContext& ctx, 
        Type* arrayType, uint32_t directiveIndex, 
        uint32_t partitionType, uint32_t dim, uint32_t factor
    ) {
        if (factor == 0) {
            arrayType = getPointedType(arrayType);
            if (dim == 0) {
                factor = getTotalArrayElements(arrayType);
            } else {
                factor = getArrayDimSize(arrayType, dim);
            }
        }
        SmallVector<Metadata*, 4> mds = {
            getConstantAsMetadata(ctx, directiveIndex),
            getConstantAsMetadata(ctx, partitionType),
            getConstantAsMetadata(ctx, dim),
            getConstantAsMetadata(ctx, factor),
        };
        return MDTuple::get(ctx, mds);
    }

    // Parse the TCL script containing the HLS directives
    // and populate the directives dictionary
    int parseTclDirectives(
        Module& M,
        DirectiveDict& directives, 
        std::string& topFunctionName
    ) {
        std::ifstream file(directivesFilePath);
        if (!file.is_open()) {
            errs() << "Error opening file\n";
            return -1;
        }
        
        std::string line;
        while (std::getline(file, line)) {
            // Split the line into two tokens: the directive name and the arguments
            size_t firstSpace = line.find(" ");
            std::string directiveName = line.substr(0, firstSpace);
            std::string arguments = line.substr(firstSpace + 1);

            if (directiveName == "set_directive_array_partition") {
                // Format: 
                // set_directive_array_partition <location> \ 
                // [-dim <dim> -factor <factor> -type <type>] <array>
                Directive directive;
                directive.functionName = "";
                directive.label = "";
                directive.options = {};
                directive.options["dim"] = "0";
                directive.options["factor"] = "0";
                directive.options["type"] = "complete";

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool locationFound = false;

                for (size_t i = 0; i < numTokens; i++) {
                    std::string token = argTokens[i];
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
                // Check if the global variable is an extracted parameter 
                // (see `TransformForCDFGExtraction.cpp`)
                if (!directive.functionName.empty()) {
                    if (Function* F = M.getFunction(directive.functionName)) {
                        std::string arrayName = directive.options.at("variable");
                        Argument* arrayArg = nullptr;
                        for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
                            Argument* arg = &*AI;
                            if (arg->hasName() && arg->getName().str() == arrayName) {
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
                Directive directive;
                directive.functionName = "";
                directive.label = "";
                directive.options = {};
                directive.options["II"] = "0";

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();

                for (size_t i = 0; i < numTokens; i++) {
                    std::string token = argTokens[i];
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
                directive.options["functionLevel"] = directive.label.empty() ? "1" : "0";
                directive.name = "pipeline";
                directives["pipeline"].push_back(directive);
            } else if (directiveName == "set_directive_unroll") {
                // Format: set_directive_unroll <location> [-factor <factor>]
                // where <location> is <function>/<label>
                Directive directive;
                directive.functionName = "";
                directive.label = "";
                directive.options = {};
                directive.options["factor"] = "0";

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool valid = true;

                for (size_t i = 0; i < numTokens; i++) {
                    std::string token = argTokens[i];
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
                if (valid) {
                    directive.name = "unroll";
                    directives["unroll"].push_back(directive);
                }
            } else if (directiveName == "set_directive_loop_flatten") {
                // Format: set_directive_loop_flatten <location>
                // where <location> is <function>/<label>
                Directive directive;
                directive.functionName = "";
                directive.label = "";
                directive.options = {};

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
                Directive directive;
                directive.functionName = "";
                directive.label = "";
                directive.options = {};

                std::string location = arguments.substr(0, arguments.find(" "));
                size_t slashPos = location.find("/");

                if (slashPos != std::string::npos) {
                    directive.functionName = location.substr(0, slashPos);
                    directive.label = location.substr(slashPos + 1);
                } else {
                    directive.functionName = location;
                    directive.label = "";
                }
                directive.options["functionLevel"] = directive.label.empty() ? "1" : "0";
                directive.name = "loopMerge";
                directives["loopMerge"].push_back(directive);
            } else if (directiveName == "set_directive_top") {
                topFunctionName = arguments.substr(0, arguments.find(" "));
            }
        }
        file.close();
        return 0;
    }

    std::vector<std::string> tokenize(
        const std::string& str, const std::string& delim=" "
    ) {
        std::vector<std::string> tokens;
        std::size_t start = 0, end = 0;
        if (str.empty()) return tokens;
        if (str.find(delim) == std::string::npos) {
            tokens.push_back(str);
            return tokens;
        }
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

    bool isNumber(const std::string& s) {
        return !s.empty() && s.find_first_not_of("-.0123456789") == std::string::npos;
    }

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct SetHLSDirectivesMD

} // anonymous namespace

char SetHLSDirectivesMD::ID = 0;
static RegisterPass<SetHLSDirectivesMD> X(
    "set-hls-md", 
    "Set metadata about HLS directives for loops, arrays and functions",
    false, false
);