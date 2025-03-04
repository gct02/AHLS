#include "llvm/ADT/SmallVector.h"
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

#include <string>
#include <vector>
#include <cstdint>
#include <fstream>
#include <unordered_map>

using namespace llvm;

static cl::opt<std::string> outputFilePath(
    "out", 
    cl::desc("Specify the path to the file where the DFG should be written"), 
    cl::value_desc("filename")
);

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

enum class NodeType {
    INSTRUCTION,
    VARIABLE,
    CONSTANT,
    ARRAY,
    LOOP,
    FUNCTION
};

enum class EdgeType {
    LOAD,
    STORE,
    INPUT,
    OUTPUT,
    CAST,
    LOOP,
    FUNCTION
};

enum class DirectiveType {
    ARRAY_PARTITION,
    PIPELINE,
    UNROLL,
    LOOP_FLATTEN,
    LOOP_MERGE
};

struct Directive {
    DirectiveType type;
    uint32_t directiveID;
    std::string location;
};

struct ArrayṔartitionDirective : public Directive {
    std::string variable;
    uint32_t dim;
    uint32_t factor;
    std::string partitionType;
};

struct UnrollInfo {
    bool isFullUnroll;
    uint32_t factor;
};

struct LoopDirective : public Directive {
    std::string label;
    UnrollInfo unrollInfo;
};

struct Node {
    uint32_t ID;
    NodeType type;
    std::string name;
};

struct ArrayNode : public Node {
    Value* ref;
    Function* parentFunction;
    bool isGlobalArray;
    uint32_t elementTypeID;
    uint32_t elementBitwidth;
    uint32_t numElements;
    uint32_t numDims;
    std::vector<uint32_t> numElementsPerDim;
    bool hasPartitionDirective;
    ArrayṔartitionDirective partitionDirective;
};

struct VariableOrConstNode : public Node {
    Value* ref;
    bool storedInArray;
    bool loadedFromArray;
    ArrayNode* loadedArrayRef;
    std::vector<ArrayNode*> storedArrayRefs;
    uint32_t typeID;
    uint32_t bitwidth;
};

struct InstructionNode : public Node {
    Instruction* ref;
    Function* parentFunction;
    BasicBlock* parentBlock;
    VariableOrConstNode* LHS;
    VariableOrConstNode* RHS;
    VariableOrConstNode* result;
    uint32_t opcode;
    std::string opcodeName;
};

struct LoopNode : public Node {
    Loop* ref;
    BasicBlock* loopHeader;
    BasicBlock* loopPreheader;
    Function* parentFunction;
    uint32_t depth;
    uint32_t tripCount;
    std::vector<InstructionNode*> instructions;
    bool hasUnrollDirective;
    bool hasPipelineDirective;
    bool hasFlattenDirective;
    bool hasMergeDirective;
    LoopDirective unrollDirective;
    LoopDirective pipelineDirective;
    LoopDirective flattenDirective;
    LoopDirective mergeDirective;
};

struct FunctionNode : public Node {
    Function* ref;
    std::vector<InstructionNode*> instructions;
    std::vector<LoopNode*> loops;
    bool hasPipelineDirective;
    bool hasMergeDirective;
    LoopDirective pipelineDirective;
    LoopDirective mergeDirective;
};

struct Edge {
    uint32_t ID;
    EdgeType type;
    Node* src;
    Node* dst;
};

struct DFG {
    uint32_t numNodes;
    uint32_t numEdges;
    std::vector<VariableOrConstNode*> variablesAndConsts;
    std::vector<InstructionNode*> instructions;
    std::vector<ArrayNode*> arrays;
    std::vector<LoopNode*> loops;
    std::vector<FunctionNode*> functions;
    std::vector<Edge> edges;
};

struct NodeTypeStr {
    static std::string toString(NodeType type) {
        switch (type) {
            case NodeType::INSTRUCTION: return "INSTRUCTION";
            case NodeType::VARIABLE: return "VARIABLE";
            case NodeType::CONSTANT: return "CONSTANT";
            case NodeType::ARRAY: return "ARRAY";
            case NodeType::LOOP: return "LOOP";
            case NodeType::FUNCTION: return "FUNCTION";
        }
        return "";
    }
};

struct EdgeTypeStr {
    static std::string toString(EdgeType type) {
        switch (type) {
            case EdgeType::LOAD: return "LOAD";
            case EdgeType::STORE: return "STORE";
            case EdgeType::INPUT: return "INPUT";
            case EdgeType::OUTPUT: return "OUTPUT";
            case EdgeType::CAST: return "CAST";
            case EdgeType::LOOP: return "LOOP";
            case EdgeType::FUNCTION: return "FUNCTION";
        }
        return "";
    }
};

std::string serializeVariableOrConstNode(const VariableOrConstNode& node) {
    return "{ \"ID\": " + std::to_string(node.ID) + 
           ", \"NodeType\": \"" + NodeTypeStr::toString(node.type) + "\"" +
           ", \"Name\": \"" + node.name + "\"" +
           ", \"TypeID\": " + std::to_string(node.typeID) +
           ", \"Bitwidth\": " + std::to_string(node.bitwidth) + " }";
}

std::string serializeInstructionNode(const InstructionNode& node) {
    return "{ \"ID\": " + std::to_string(node.ID) + 
           ", \"NodeType\": \"" + NodeTypeStr::toString(node.type) + "\"" +
           ", \"Name\": \"" + node.name + "\"" +
           ", \"Opcode\": " + std::to_string(node.opcode) +
           ", \"OpcodeName\": \"" + node.opcodeName + "\" }";
}

std::string serializeArrayNode(const ArrayNode& node) {
    std::string elementsPerDim = "[";
    for (size_t i = 0; i < node.numElementsPerDim.size(); ++i) {
        elementsPerDim += std::to_string(node.numElementsPerDim[i]);
        if (i != node.numElementsPerDim.size() - 1) elementsPerDim += ", ";
        elementsPerDim += "]";
    }
    uint32_t partitionDim = node.hasPartitionDirective ? node.partitionDirective.dim : 0;
    uint32_t partitionFactor = node.hasPartitionDirective ? node.partitionDirective.factor : 0;
    std::string partitionType = node.hasPartitionDirective ? node.partitionDirective.partitionType : "";
    return "{ \"ID\": " + std::to_string(node.ID) + 
           ", \"NodeType\": \"" + NodeTypeStr::toString(node.type) + "\"" +
           ", \"Name\": \"" + node.name + "\"" +
           ", \"ElementTypeID\": " + std::to_string(node.elementTypeID) +
           ", \"ElementBitwidth\": " + std::to_string(node.elementBitwidth) +
           ", \"NumElements\": " + std::to_string(node.numElements) +
           ", \"NumDims\": " + std::to_string(node.numDims) +
           ", \"NumElementsPerDim\": " + elementsPerDim + 
           ", \"Partitioned\": " + (node.hasPartitionDirective ? "true" : "false") + 
           ", \"PartitionDim\": " + std::to_string(partitionDim) +
           ", \"PartitionFactor\": " + std::to_string(partitionFactor) +
           ", \"PartitionType\": \"" + partitionType + "\" }";
}

std::string serializeLoopNode(const LoopNode& node) {
    return "{ \"ID\": " + std::to_string(node.ID) + 
           ", \"NodeType\": \"" + NodeTypeStr::toString(node.type) + "\"" +
           ", \"Name\": \"" + node.name + "\"" +
           ", \"Depth\": " + std::to_string(node.depth) +
           ", \"TripCount\": " + std::to_string(node.tripCount) + 
           ", \"Unrolled\": " + (node.hasUnrollDirective ? "true" : "false") +
           ", \"FullyUnrolled\": " + (node.unrollDirective.unrollInfo.isFullUnroll ? "true" : "false") +
           ", \"UnrollFactor\": " + std::to_string(node.unrollDirective.unrollInfo.factor) +
           ", \"Pipelined\": " + (node.hasPipelineDirective ? "true" : "false") +
           ", \"Flattened\": " + (node.hasFlattenDirective ? "true" : "false") +
           ", \"Merged\": " + (node.hasMergeDirective ? "true" : "false") + " }";
}

std::string serializeFunctionNode(const FunctionNode& node) {
    return "{ \"ID\": " + std::to_string(node.ID) + 
           ", \"NodeType\": \"" + NodeTypeStr::toString(node.type) + "\"" +
           ", \"Name\": \"" + node.name + "\"" +
           ", \"Pipelined\": " + (node.hasPipelineDirective ? "true" : "false") +
           ", \"Merged\": " + (node.hasMergeDirective ? "true" : "false") + " }";
}

std::string serializeEdge(const Edge& edge) {
    return "{ \"ID\": " + std::to_string(edge.ID) + 
           ", \"EdgeType\": \"" + EdgeTypeStr::toString(edge.type) + "\"" +
           ", \"Source\": " + std::to_string(edge.src->ID) + 
           ", \"Target\": " + std::to_string(edge.dst->ID) + " }";
}

std::string serializeDFG(const DFG& dfg) {
    std::string json = "{\n";

    json += "  \"NumNodes\": " + std::to_string(dfg.numNodes) + ",\n";
    json += "  \"NumEdges\": " + std::to_string(dfg.numEdges) + ",\n";

    json += "  \"Nodes\": {\n";
    json += "    \"VariablesAndConstants\": [";
    for (size_t i = 0; i < dfg.variablesAndConsts.size(); ++i) {
        json += "\n      " + serializeVariableOrConstNode(*dfg.variablesAndConsts[i]);
        if (i != dfg.variablesAndConsts.size() - 1) json += ",";
    }
    json += "\n    ],\n";

    json += "    \"Instructions\": [";
    for (size_t i = 0; i < dfg.instructions.size(); ++i) {
        json += "\n      " + serializeInstructionNode(*dfg.instructions[i]);
        if (i != dfg.instructions.size() - 1) json += ",";
    }
    json += "\n    ],\n";

    json += "    \"Arrays\": [";
    for (size_t i = 0; i < dfg.arrays.size(); ++i) {
        json += "\n      " + serializeArrayNode(*dfg.arrays[i]);
        if (i != dfg.arrays.size() - 1) json += ",";
    }
    json += "\n    ],\n";

    json += "    \"Loops\": [";
    for (size_t i = 0; i < dfg.loops.size(); ++i) {
        json += "\n      " + serializeLoopNode(*dfg.loops[i]);
        if (i != dfg.loops.size() - 1) json += ",";
    }
    json += "\n    ],\n";

    json += "    \"Functions\": [";
    for (size_t i = 0; i < dfg.functions.size(); ++i) {
        json += "\n      " + serializeFunctionNode(*dfg.functions[i]);
        if (i != dfg.functions.size() - 1) json += ",";
    }
    json += "\n     ]\n";
    json += "  },\n";

    json += "  \"Edges\": [";
    for (size_t i = 0; i < dfg.edges.size(); ++i) {
        json += "\n    " + serializeEdge(dfg.edges[i]);
        if (i != dfg.edges.size() - 1) json += ",";
    }
    json += "\n  ]\n";

    json += "}";
    return json;
}
    
struct DFGForHLS : public ModulePass {
    static char ID;
    DFGForHLS() : ModulePass(ID) {}

    DFG dfg;

    bool runOnModule(Module& M) override {
        #define DEBUG_TYPE "hls-dfg"

        buildDFG(M);
        writeDFG();

        return false;  // No changes in the module
    }

    void writeDFG() {
        std::ofstream file(outputFilePath);
        if (!file.is_open()) {
            errs() << "Failed to open file: " << outputFilePath << "\n";
            return;
        }
        file << serializeDFG(dfg);
        file.close();
    }

    void buildDFG(Module& M) {
        dfg.numNodes = 0;
        dfg.numEdges = 0;
        buildNodes(M);
        buildEdges();
    }

    void buildEdges() {
        buildDataFlowEdges();
        buildFunctionEdges();
        buildLoopEdges();
    }

    void buildNodes(Module& M) {
        buildNodesFromArrays(M);
        std::vector<Instruction*> binaryOps = getBinaryOps(M);
        buildNodesFromBinaryOps(binaryOps);
        buildNodesFromLoopsAndFunctions(M);
        parseTclAndSetDirectiveInfo(M); // May add extra nodes
    }

    void buildDataFlowEdges() {
        for (InstructionNode* instructionNode : dfg.instructions) {
            if (instructionNode->LHS) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::INPUT;
                edge.src = instructionNode->LHS;
                edge.dst = instructionNode;
                dfg.edges.push_back(edge);

                if (instructionNode->LHS->loadedFromArray) {
                    edge.ID = dfg.numEdges++;
                    edge.type = EdgeType::LOAD;
                    edge.src = instructionNode->LHS->loadedArrayRef;
                    edge.dst = instructionNode->LHS;
                    dfg.edges.push_back(edge);
                }
            }
            if (instructionNode->RHS) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::INPUT;
                edge.src = instructionNode->RHS;
                edge.dst = instructionNode;
                dfg.edges.push_back(edge);

                if (instructionNode->RHS->loadedFromArray) {
                    edge.ID = dfg.numEdges++;
                    edge.type = EdgeType::LOAD;
                    edge.src = instructionNode->RHS->loadedArrayRef;
                    edge.dst = instructionNode->RHS;
                    dfg.edges.push_back(edge);
                }
            }
            if (instructionNode->result) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::OUTPUT;
                edge.src = instructionNode;
                edge.dst = instructionNode->result;
                dfg.edges.push_back(edge);

                for (ArrayNode* arrayNode : instructionNode->result->storedArrayRefs) {
                    edge.ID = dfg.numEdges++;
                    edge.type = EdgeType::STORE;
                    edge.src = instructionNode->result;
                    edge.dst = arrayNode;
                    dfg.edges.push_back(edge);
                }

                std::vector<CastInst*> casts = findCastUsers(instructionNode->result->ref);
                for (CastInst* cast : casts) {
                    DEBUG(dbgs() << "Found cast: " << *cast << " for " << *instructionNode->result->ref << "\n");
                    VariableOrConstNode* castedValue = getVariableOrConstNodeFromValue(cast);
                    if (castedValue) {
                        DEBUG(dbgs() << "Casted value: " << castedValue->name << "\n");
                        edge.ID = dfg.numEdges++;
                        edge.type = EdgeType::CAST;
                        edge.src = instructionNode->result;
                        edge.dst = castedValue;
                        dfg.edges.push_back(edge);
                    }
                }
            }
        }
    }

    void buildFunctionEdges() {
        for (FunctionNode* functionNode : dfg.functions) {
            for (InstructionNode* instructionNode : functionNode->instructions) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::FUNCTION;
                edge.src = functionNode;
                edge.dst = instructionNode;
                dfg.edges.push_back(edge);
            }
            for (LoopNode* loopNode : functionNode->loops) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::FUNCTION;
                edge.src = functionNode;
                edge.dst = loopNode;
                dfg.edges.push_back(edge);
            }
        }
    }

    void buildLoopEdges() {
        for (LoopNode* loopNode : dfg.loops) {
            for (InstructionNode* instructionNode : loopNode->instructions) {
                Edge edge;
                edge.ID = dfg.numEdges++;
                edge.type = EdgeType::LOOP;
                edge.src = loopNode;
                edge.dst = instructionNode;
                dfg.edges.push_back(edge);
            }
        }
    }

    Value* getArray(
        Module& M, 
        const std::string& arrayName, 
        const std::string& functionName
    ) {
        if (GlobalVariable* GV = M.getGlobalVariable(arrayName, true)) {
            return GV;
        }
        Function* F = M.getFunction(functionName);
        if (!F) {
            return nullptr;
        }
        for (Function::arg_iterator AI = F->arg_begin(), AE = F->arg_end(); AI != AE; ++AI) {
            Argument* arg = &*AI;
            if (arg->hasName() && arg->getName().str() == arrayName) {
                return arg;
            }
        }
        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            for (BasicBlock::iterator II = BB->begin(), IE = BB->end(); II != IE; ++II) {
                Instruction* I = &*II;
                if (I->hasName() && I->getName().str() == arrayName) {
                    return I;
                }
            }
        }
        return nullptr;
    }

    std::tuple<LoopNode*, BasicBlock*, bool> getLoop(
        Module& M, 
        std::string& loopLabel, 
        std::string& functionName
    ) {
        bool isWhileLoop = false;

        Function* F = M.getFunction(functionName);
        if (!F) {
            return std::make_tuple(nullptr, nullptr, isWhileLoop);
        }

        for (auto LI = dfg.loops.begin(); LI != dfg.loops.end(); ++LI) {
            LoopNode* loop = *LI;
            if ((loop->loopPreheader->hasName() && loop->loopPreheader->getName().str() == loopLabel)
                || (loop->loopHeader->hasName() && loop->loopHeader->getName().str() == loopLabel)) {
                return std::make_tuple(loop, loop->loopHeader, isWhileLoop);
            }
        }

        for (Function::iterator BI = F->begin(), BE = F->end(); BI != BE; ++BI) {
            BasicBlock* BB = &*BI;
            if (BB->hasName() && BB->getName().str() == loopLabel) {
                // Vitis HLS loop-targeted directives use the label of the preheader block,
                // so we should get the successor of the preheader block to find the loop header
                BasicBlock* loopHeader = BB->getSingleSuccessor();
                if (!loopHeader) {
                    return std::make_tuple(nullptr, nullptr, isWhileLoop);
                }
                // The loop can be a while loop.
                // In this case, we return the loop header only.
                isWhileLoop = true;
                return std::make_tuple(nullptr, loopHeader, isWhileLoop);
            }
        }

        return std::make_tuple(nullptr, nullptr, isWhileLoop);
    }

    void setLoopDirective(
        Module& M, 
        LoopDirective& directive, 
        uint32_t& directiveIndex, 
        bool mayBeFunctionLevel=true
    ) {
        if (directive.location.empty()) {
            errs() << "Invalid location format\n";
        }

        Function* function = M.getFunction(directive.location);
        if (!function) {
            errs() << "Function not found: " << directive.location << "\n";
            return;
        }
        FunctionNode* functionNode = getFunctionNodeFromFunction(M.getFunction(directive.location));
        if (!functionNode) {
            errs() << "Function node not found for function: " << directive.location << "\n";
            return;
        }

        if (directive.label.empty()) {
            if (!mayBeFunctionLevel) {
                errs() << "Loop label not specified\n";
                return;
            }
            if (directive.type == DirectiveType::LOOP_MERGE) {
                directive.directiveID = directiveIndex++;
                functionNode->hasMergeDirective = true;
                functionNode->mergeDirective = directive;
            } else if (directive.type == DirectiveType::PIPELINE) {
                directive.directiveID = directiveIndex++;
                functionNode->hasPipelineDirective = true;
                functionNode->pipelineDirective = directive;
            } else {
                errs() << "Invalid directive type\n";
            }
        } else {
            std::tuple<LoopNode*, BasicBlock*, bool> loop = getLoop(M, directive.label, directive.location);
            LoopNode* loopNode = std::get<0>(loop);
            BasicBlock* loopHeader = std::get<1>(loop);

            if (!loopNode) {
                if (!loopHeader) {
                    errs() << "Loop not found: " << directive.label << "\n";
                    return;
                }
                LoopNode* newLoopNode = new LoopNode();
                newLoopNode->ID = dfg.numNodes++;
                newLoopNode->type = NodeType::LOOP;
                newLoopNode->ref = nullptr;
                newLoopNode->loopHeader = loopHeader;
                newLoopNode->loopPreheader = loopHeader->getSinglePredecessor();
                newLoopNode->parentFunction = function;
                newLoopNode->depth = 1;  // Placeholder value
                newLoopNode->tripCount = 0;  // Placeholder value

                newLoopNode->hasUnrollDirective = false;
                newLoopNode->hasMergeDirective = false;
                newLoopNode->hasFlattenDirective = false;
                newLoopNode->hasPipelineDirective = false;

                newLoopNode->instructions = {};
                for (Instruction& I : *loopHeader) {
                    InstructionNode* instructionNode = getInstructionNodeFromInstruction(&I);
                    if (instructionNode) {
                        newLoopNode->instructions.push_back(instructionNode);
                    }
                }
                BasicBlock* loopBody = loopHeader->getNextNode();
                if (loopBody) {
                    for (Instruction& I : *loopBody) {
                        InstructionNode* instructionNode = getInstructionNodeFromInstruction(&I);
                        if (instructionNode) {
                            newLoopNode->instructions.push_back(instructionNode);
                        }
                    }
                }
                BasicBlock* loopEnd = loopBody->getNextNode();
                if (loopEnd) {
                    for (Instruction& I : *loopEnd) {
                        InstructionNode* instructionNode = getInstructionNodeFromInstruction(&I);
                        if (instructionNode) {
                            newLoopNode->instructions.push_back(instructionNode);
                        }
                    }
                }

                if (directive.type == DirectiveType::LOOP_MERGE) {
                    directive.directiveID = directiveIndex++;
                    newLoopNode->hasMergeDirective = true;
                    newLoopNode->mergeDirective = directive;
                } else if (directive.type == DirectiveType::PIPELINE) {
                    directive.directiveID = directiveIndex++;
                    newLoopNode->hasPipelineDirective = true;
                    newLoopNode->pipelineDirective = directive;
                } else if (directive.type == DirectiveType::LOOP_FLATTEN) {
                    directive.directiveID = directiveIndex++;
                    newLoopNode->hasFlattenDirective = true;
                    newLoopNode->flattenDirective = directive;
                } else if (directive.type == DirectiveType::UNROLL) {
                    directive.directiveID = directiveIndex++;
                    newLoopNode->hasUnrollDirective = true;
                    newLoopNode->unrollDirective = directive;
                } else {
                    errs() << "Invalid directive type\n";
                }

                dfg.loops.push_back(newLoopNode);
                functionNode->loops.push_back(newLoopNode);
            } else {
                if (directive.type == DirectiveType::LOOP_MERGE) {
                    directive.directiveID = directiveIndex++;
                    loopNode->hasMergeDirective = true;
                    loopNode->mergeDirective = directive;
                } else if (directive.type == DirectiveType::PIPELINE) {
                    directive.directiveID = directiveIndex++;
                    loopNode->hasPipelineDirective = true;
                    loopNode->pipelineDirective = directive;
                } else if (directive.type == DirectiveType::LOOP_FLATTEN) {
                    directive.directiveID = directiveIndex++;
                    loopNode->hasFlattenDirective = true;
                    loopNode->flattenDirective = directive;
                } else if (directive.type == DirectiveType::UNROLL) {
                    directive.directiveID = directiveIndex++;
                    loopNode->hasUnrollDirective = true;
                    loopNode->unrollDirective = directive;
                } else {
                    errs() << "Invalid directive type\n";
                }
            }
        }
    }

    // Parse the TCL script containing the HLS directives
    int parseTclAndSetDirectiveInfo(Module& M) {
        std::ifstream file(directivesFilePath);
        if (!file.is_open()) {
            errs() << "Error opening file\n";
            return -1;
        }
        
        uint32_t directiveIndex = 0;
        std::string line;
        while (std::getline(file, line)) {
            // Split the line into two tokens: the directive name and the arguments
            size_t firstSpace = line.find(" ");
            std::string directiveName = line.substr(0, firstSpace);
            std::string arguments = line.substr(firstSpace + 1);

            if (directiveName == "set_directive_array_partition") {
                // Format: set_directive_array_partition <location> [-dim <dim> -factor <factor> -type <type>] <variable>
                ArrayṔartitionDirective directive;
                directive.type = DirectiveType::ARRAY_PARTITION;
                directive.location = "";
                directive.variable = "";
                directive.dim = 0;
                directive.factor = 0;
                directive.partitionType = "complete";

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool locationFound = false;

                for (size_t i = 0; i < numTokens; i++) {
                    // Remove any leading or trailing whitespace
                    std::string token = argTokens[i];
                    if (token == "-dim") {
                        directive.dim = std::stoi(argTokens[i + 1]);
                        i++;
                    } else if (token == "-factor") {
                        directive.factor = std::stoi(argTokens[i + 1]);
                        i++;
                    } else if (token == "-type") {
                        directive.partitionType = argTokens[i + 1];
                        i++;
                    } else if (!locationFound) {
                        directive.location = token;
                        locationFound = true;
                    } else {
                        directive.variable = token;
                    }
                }

                Value* array = getArray(M, directive.variable, directive.location);
                if (!array) {
                    errs() << "Array not found: " << directive.variable << "\n";
                    continue;
                }

                ArrayNode* arrayNode = getArrayNodeFromValue(array);
                if (!arrayNode) {
                    errs() << "Array node not found for array: " << directive.variable << "\n";
                    continue;
                }
                directive.directiveID = directiveIndex++;
                arrayNode->hasPartitionDirective = true;
                arrayNode->partitionDirective = directive;

            } else if (directiveName == "set_directive_pipeline") {
                // Format: set_directive_pipeline <location> [-off=true]
                // where <location> is <function>[/<label>]
                LoopDirective directive;
                directive.type = DirectiveType::PIPELINE;
                directive.location = "";
                directive.label = "";
                bool off = false;

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();

                for (size_t i = 0; i < numTokens; i++) {
                    std::string token = argTokens[i];
                    if (token.find("-off") != std::string::npos) {
                        off = true;
                        break;
                    } else {
                        size_t slashPos = token.find("/");
                        if (slashPos != std::string::npos) {
                            directive.location = token.substr(0, slashPos);
                            directive.label = token.substr(slashPos + 1);
                        } else {
                            directive.location = token;
                            directive.label = "";
                        }
                    }
                }
                if (off) {
                    continue;
                }
                setLoopDirective(M, directive, directiveIndex, true);

            } else if (directiveName == "set_directive_unroll") {
                // Format: set_directive_unroll <location> [-factor <factor>]
                // where <location> is <function>/<label>
                LoopDirective directive;
                directive.type = DirectiveType::UNROLL;
                directive.location = "";
                directive.label = "";
                directive.unrollInfo.factor = 0;
                directive.unrollInfo.isFullUnroll = true;

                std::vector<std::string> argTokens = tokenize(arguments, " ");
                size_t numTokens = argTokens.size();
                bool valid = true;

                for (size_t i = 0; i < numTokens; i++) {
                    std::string token = argTokens[i];
                    if (token == "-factor") {
                        directive.unrollInfo.factor = std::stoi(argTokens[i + 1]);
                        directive.unrollInfo.isFullUnroll = false;
                        i++;
                    } else {
                        size_t slashPos = token.find("/");
                        if (slashPos != std::string::npos) {
                            directive.location = token.substr(0, slashPos);
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
                setLoopDirective(M, directive, directiveIndex, false);

            } else if (directiveName == "set_directive_loop_flatten") {
                // Format: set_directive_loop_flatten <location>
                // where <location> is <function>/<label>
                LoopDirective directive;
                directive.type = DirectiveType::LOOP_FLATTEN;
                directive.location = "";
                directive.label = "";

                std::string location = arguments.substr(0, arguments.find(" "));
                size_t slashPos = location.find("/");

                if (slashPos != std::string::npos) {
                    directive.location = location.substr(0, slashPos);
                    directive.label = location.substr(slashPos + 1);
                } else {
                    errs() << "Invalid location format\n";
                    continue;
                }
                setLoopDirective(M, directive, directiveIndex, false);

            } else if (directiveName == "set_directive_loop_merge") {
                // Format: set_directive_loop_merge <location>
                // where <location> is <function>[/<label>]
                LoopDirective directive;
                directive.type = DirectiveType::LOOP_MERGE;
                directive.location = "";
                directive.label = "";

                std::string location = arguments.substr(0, arguments.find(" "));
                size_t slashPos = location.find("/");

                if (slashPos != std::string::npos) {
                    directive.location = location.substr(0, slashPos);
                    directive.label = location.substr(slashPos + 1);
                } else {
                    directive.location = location;
                    directive.label = "";
                }
                setLoopDirective(M, directive, directiveIndex, true);
            }
        }
        file.close();
        return 0;
    }

    std::vector<Instruction*> getBinaryOps(Module& M) {
        std::vector<Instruction*> binaryOps;
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (I.isBinaryOp()) {
                        binaryOps.push_back(&I);
                    }
                }
            }
        }
        return binaryOps;
    }

    uint64_t getDecayedDimSize(const Argument* arg) {
        return getArgAttributeValue(arg, "fpga.decayed.dim.hint");
    }

    uint64_t getArgAttributeValue(const Argument* arg, StringRef attrName) {
        AttributeList attrs = arg->getParent()->getAttributes();
        auto idx = arg->getArgNo();
        const auto &attr = attrs.getParamAttr(idx, attrName);
        auto attrStr = attr.getValueAsString();
        if (attrStr.empty()) {
            return 0;
        }
        unsigned size;
        if (to_integer(attrStr, size)) {
            return size;
        }
        return 0;
    }

    InstructionNode* createInstructionNode(
        Instruction* I, 
        VariableOrConstNode* LHS, 
        VariableOrConstNode* RHS, 
        VariableOrConstNode* result
    ) {
        InstructionNode* node = new InstructionNode();
        node->ID = dfg.numNodes++;
        node->name = I->hasName() ? I->getName().str() : "";
        node->type = NodeType::INSTRUCTION;
        node->ref = I;
        node->parentFunction = I->getFunction();
        node->parentBlock = I->getParent();
        node->opcode = I->getOpcode();
        node->opcodeName = I->getOpcodeName();
        node->LHS = LHS;
        node->RHS = RHS;
        node->result = result;
        dfg.instructions.push_back(node);
        return node;
    }

    void buildNodesFromLoopsAndFunctions(Module& M) {
        for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
            Function& F = *FI;
            if (F.size() == 0 || F.isDeclaration() || F.isIntrinsic()) {
                continue;
            }

            FunctionNode* functionNode = new FunctionNode();
            functionNode->name = F.getName().str();
            functionNode->type = NodeType::FUNCTION;
            functionNode->ref = &F;
            functionNode->hasPipelineDirective = false;
            functionNode->hasMergeDirective = false;

            // Get LoopInfo and ScalarEvolution analyses
            LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
            ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();
            DominatorTree DT(F);

            LI.analyze(DT);

            for (Loop* L : LI) {
                LoopNode* loopNode = new LoopNode();
                loopNode->name = L->getHeader()->hasName() ? L->getHeader()->getName().str() : "";
                loopNode->ID = dfg.numNodes++;
                loopNode->type = NodeType::LOOP;
                loopNode->ref = L;
                loopNode->loopHeader = L->getHeader();
                loopNode->loopPreheader = L->getLoopPreheader();
                loopNode->parentFunction = &F;

                loopNode->depth = L->getLoopDepth();
                const SCEV* tripCount = SE.getBackedgeTakenCount(L);
                if (const SCEVConstant* tripCountConst = dyn_cast<SCEVConstant>(tripCount)) {
                    loopNode->tripCount = tripCountConst->getValue()->getZExtValue();
                } else {
                    loopNode->tripCount = 0;
                }

                loopNode->hasUnrollDirective = false;
                loopNode->hasPipelineDirective = false;
                loopNode->hasFlattenDirective = false;
                loopNode->hasMergeDirective = false;

                for (BasicBlock* BB : L->getBlocks()) {
                    for (Instruction& I : *BB) {
                        InstructionNode* instructionNode = getInstructionNodeFromInstruction(&I);
                        if (instructionNode) {
                            loopNode->instructions.push_back(instructionNode);
                        }
                    }
                }
                dfg.loops.push_back(loopNode);
                functionNode->loops.push_back(loopNode);
            }

            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    InstructionNode* instructionNode = getInstructionNodeFromInstruction(&I);
                    if (instructionNode) {
                        functionNode->instructions.push_back(instructionNode);
                    }
                }
            }
            functionNode->ID = dfg.numNodes++;
            dfg.functions.push_back(functionNode);
        }
    }

    ArrayNode* buildArrayNode(Value* V, Function* parentFunction, Type* decayedType=nullptr) {
        Type* Ty = decayedType ? decayedType : V->getType();
        while (Ty->isPointerTy()) {
            Ty = Ty->getPointerElementType();
        }
        
        Type* elementType = Ty->getArrayElementType();
        while (elementType->isArrayTy()) {
            elementType = elementType->getArrayElementType();
        }

        ArrayNode* arrayNode = new ArrayNode();
        arrayNode->ID = dfg.numNodes++;
        arrayNode->name = V->hasName() ? V->getName().str() : "";
        arrayNode->type = NodeType::ARRAY;
        arrayNode->ref = V;
        arrayNode->parentFunction = parentFunction;
        arrayNode->isGlobalArray = parentFunction == nullptr;
        arrayNode->elementTypeID = elementType->getTypeID();
        arrayNode->elementBitwidth = elementType->getPrimitiveSizeInBits();

        arrayNode->numElements = getArrayNumElements(Ty);
        arrayNode->numDims = getArrayNumDims(Ty);

        arrayNode->numElementsPerDim = std::vector<uint32_t>(arrayNode->numDims);
        
        for (size_t i = 0; i < arrayNode->numDims; i++) {
            arrayNode->numElementsPerDim[i] = getArrayDimNumElements(Ty, i + 1);
        }
        arrayNode->hasPartitionDirective = false;
        dfg.arrays.push_back(arrayNode);
        return arrayNode;
    }

    bool isArray(Type* Ty) {
        while (Ty->isPointerTy()) {
            Ty = Ty->getPointerElementType();
        }
        return Ty->isArrayTy();
    }

    void buildNodesFromArrays(Module& M) {
        std::vector<Value*> arrays;

        // Collect global arrays
        for (GlobalVariable& G : M.globals()) {
            if (isArray(G.getType())) {
                buildArrayNode(&G, nullptr);
            }
        }
        // Collect local arrays
        for (Function& F : M) {
            for (BasicBlock& BB : F) {
                for (Instruction& I : BB) {
                    if (auto* Alloca = dyn_cast<AllocaInst>(&I)) {
                        if (isArray(Alloca->getAllocatedType())) {
                            buildArrayNode(Alloca, &F);
                        }
                    }
                }
            }
        }
        // Collect array parameters
        for (Function& F : M) {
            for (Argument& A : F.args()) {
                uint64_t decayedDimSize = getDecayedDimSize(&A);
                if (decayedDimSize != 0) {
                    buildArrayNode(
                        &A, &F, 
                        ArrayType::get(A.getType()->getPointerElementType(), decayedDimSize)
                    );
                }
            }
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

    void buildNodesFromBinaryOps(std::vector<Instruction*>& binaryOps) {
        for (auto* I : binaryOps) {
            Value* LHS = I->getOperand(0);
            VariableOrConstNode* lhsNode = getVariableOrConstNodeFromValue(LHS);
            if (!lhsNode) {
                lhsNode = new VariableOrConstNode();
                lhsNode->ID = dfg.numNodes++;
                lhsNode->name = LHS->hasName() ? LHS->getName().str() : "";

                bool isConstant = isa<Constant>(LHS);
                lhsNode->type = isConstant ? NodeType::CONSTANT : NodeType::VARIABLE;

                lhsNode->ref = LHS;
                lhsNode->typeID = LHS->getType()->getTypeID();
                lhsNode->bitwidth = LHS->getType()->getPrimitiveSizeInBits();

                lhsNode->loadedArrayRef = locateLoadedArrayReference(LHS);
                lhsNode->loadedFromArray = lhsNode->loadedArrayRef != nullptr;
                lhsNode->storedInArray = false;

                dfg.variablesAndConsts.push_back(lhsNode);
            }

            Value* RHS = I->getOperand(1);
            VariableOrConstNode* rhsNode = getVariableOrConstNodeFromValue(RHS);
            if (!rhsNode) {
                rhsNode = new VariableOrConstNode();
                rhsNode->ID = dfg.numNodes++;
                rhsNode->name = RHS->hasName() ? RHS->getName().str() : "";

                bool isConstant = isa<Constant>(RHS);
                rhsNode->type = isConstant ? NodeType::CONSTANT : NodeType::VARIABLE;

                rhsNode->ref = RHS;
                rhsNode->typeID = RHS->getType()->getTypeID();
                rhsNode->bitwidth = RHS->getType()->getPrimitiveSizeInBits();

                rhsNode->loadedArrayRef = locateLoadedArrayReference(RHS);
                rhsNode->loadedFromArray = rhsNode->loadedArrayRef != nullptr;
                rhsNode->storedInArray = false;
 
                dfg.variablesAndConsts.push_back(rhsNode);
            }

            VariableOrConstNode* resultNode = getVariableOrConstNodeFromValue(I);
            if (!resultNode) {
                resultNode = new VariableOrConstNode();
                resultNode->ID = dfg.numNodes++;
                resultNode->name = I->hasName() ? I->getName().str() : "";
                resultNode->type = NodeType::VARIABLE;
                resultNode->ref = I;
                resultNode->typeID = I->getType()->getTypeID();
                resultNode->bitwidth = I->getType()->getPrimitiveSizeInBits();

                resultNode->loadedArrayRef = nullptr;
                resultNode->loadedFromArray = false;
                resultNode->storedArrayRefs = locateStoredArrayReferences(I);
                resultNode->storedInArray = !resultNode->storedArrayRefs.empty();

                dfg.variablesAndConsts.push_back(resultNode);
            }
            createInstructionNode(I, lhsNode, rhsNode, resultNode);
        }
    }

    std::vector<StoreInst*> findStoreUsers(Value* V) {
        std::vector<StoreInst*> stores;
        for (User* U : V->users()) {
            if (auto* SI = dyn_cast<StoreInst>(U)) {
                stores.push_back(SI);
            }
        }
        return stores;
    }

    std::vector<CastInst*> findCastUsers(Value* V) {
        std::vector<CastInst*> casts;
        for (User* U : V->users()) {
            if (auto* CI = dyn_cast<CastInst>(U)) {
                casts.push_back(CI);
            }
        }
        return casts;
    }

    std::vector<BinaryOperator*> findBinaryOpUsers(Value* V) {
        std::vector<BinaryOperator*> binaryOps;
        for (User* U : V->users()) {
            if (auto* BO = dyn_cast<BinaryOperator>(U)) {
                binaryOps.push_back(BO);
            }
        }
        return binaryOps;
    }

    ArrayNode* locateLoadedArrayReference(Value* V) {
        ArrayNode* array = nullptr;

        if (auto* CI = dyn_cast<CastInst>(V)) {
            DEBUG(dbgs() << "Found cast: " << *CI << " for " << *V << "\n");
            V = CI->getOperand(0);
        }

        if (auto* LI = dyn_cast<LoadInst>(V)) {
            Value* ptr = LI->getPointerOperand();
            DEBUG(dbgs() << "Found load: " << *LI << " for " << *ptr << "\n");
            array = getArrayNodeFromValue(ptr);
            while (!array) {
                auto* GEP = dyn_cast<GetElementPtrInst>(ptr);
                if (!GEP) break;
                ptr = GEP->getPointerOperand();
                array = getArrayNodeFromValue(ptr);
            }
            if (array) {
                DEBUG(dbgs() << "Found array: " << array->name << "\n");
            }
        }
        return array;
    }

    std::vector<ArrayNode*> locateStoredArrayReferences(Value* V) {
        std::vector<ArrayNode*> arrays;
        std::vector<StoreInst*> stores = findStoreUsers(V);
        std::vector<CastInst*> casts = findCastUsers(V);

        for (auto* CI : casts) {
            std::vector<StoreInst*> castStores = findStoreUsers(CI);
            stores.insert(stores.end(), castStores.begin(), castStores.end());
        }

        for (auto* SI : stores) {
            Value* ptr = SI->getPointerOperand();
            if (ArrayNode* array = getArrayNodeFromValue(ptr)) {
                arrays.push_back(array);
            }
        }
        return arrays;
    }

    ArrayNode* getArrayNodeFromValue(Value* ptr) {
        for (auto* array : dfg.arrays) {
            if (array->ref == ptr) {
                return array;
            }
        }
        return nullptr;
    }

    VariableOrConstNode* getVariableOrConstNodeFromValue(Value* V) {
        for (auto* var : dfg.variablesAndConsts) {
            if (var->ref == V) {
                return var;
            }
        }
        return nullptr;
    }

    LoopNode* getLoopNodeFromLoop(Loop* L) {
        for (auto* loop : dfg.loops) {
            if (loop->ref == L) {
                return loop;
            }
        }
        return nullptr;
    }

    InstructionNode* getInstructionNodeFromInstruction(Instruction* I) {
        for (auto* instruction : dfg.instructions) {
            if (instruction->ref == I) {
                return instruction;
            }
        }
        return nullptr;
    }

    FunctionNode* getFunctionNodeFromFunction(Function* F) {
        for (auto* function : dfg.functions) {
            if (function->ref == F) {
                return function;
            }
        }
        return nullptr;
    }

    std::vector<std::string> tokenize(
        const std::string& str, 
        const std::string& delim=" "
    ) {
        std::vector<std::string> tokens;
        std::size_t start = 0, end = 0;
        if (str.empty()) {
            return tokens;
        }
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

    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
};  // struct DFGForHLS

}  // anonymous namespace

char DFGForHLS::ID = 0;
static RegisterPass<DFGForHLS> X(
    "hls-dfg", 
    "Build a DFG for pre-HLS analysis", 
    false, false
);
