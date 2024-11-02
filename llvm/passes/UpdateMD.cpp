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
#include <jsoncpp/json/json.h>
#include <unordered_map>
#include <fstream>
#include <string>
#include <vector>

using namespace llvm;

static cl::opt<std::string> solutionDataJSON("sd", cl::desc("Specify the JSON file containing the solution data"), cl::value_desc("filename"), cl::Optional, cl::init(""));
static cl::opt<bool> includeDirectivesMD("dirmd", cl::desc("Include directives metadata"), cl::Optional, cl::init(false));

namespace {

struct UpdateMD : public ModulePass {
	static char ID;
	UpdateMD() : ModulePass(ID) {}

	bool runOnModule(Module& M) override {
		#define DEBUG_TYPE "update-md"

		LLVMContext& ctx = M.getContext();

		uint32_t opID = 1;
		uint32_t functionID = 1;
		uint32_t bbID = 1;

		/*
		// Get the instruction counter metadata from the module. If it doesn't exist, create it.
		NamedMDNode* opCounter = M.getOrInsertNamedMetadata("opCounter");
		if (opCounter->getNumOperands() != 0) {
			opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opCounter->getOperand(0)->getOperand(0))->getValue())->getZExtValue();
			opCounter->dropAllReferences();
		} else {
			opID = 0;
		}
		*/

		std::unordered_map<std::string, std::vector<int>> solutionData = {};

		if (solutionDataJSON != "") {
			solutionData = parseSolutionData(solutionDataJSON);
		}

		for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
			Function& F = *FI;

			if (F.size() == 0) 
				continue;

			DEBUG(dbgs() << "Analyzing function: " << F.getName() << "\n");

			LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
			int enteringNodeTripCount = 1;
			int enteringNodePipelineII = 0;

			for (BasicBlock& BB : F) {
				int tripCount = 1;
				int pipelineII = 0;
				if (solutionDataJSON != "") {
					if (BB.hasName() && solutionData.find(BB.getName()) != solutionData.end()) {
						tripCount = solutionData[BB.getName()][0];
						pipelineII = solutionData[BB.getName()][1];
						enteringNodeTripCount = tripCount;
						enteringNodePipelineII = pipelineII;
					} else if (Loop* L = LI.getLoopFor(&BB)) {
						pipelineII = enteringNodePipelineII;
						tripCount = enteringNodeTripCount;
						DEBUG(dbgs() << "Trip count: " << tripCount << "\n");
					}
				}
				for (Instruction& I : BB) {
					DEBUG(dbgs() << "Setting attributes for instruction: " << I << " (opID = " << opID << ")\n");

					int opCode = I.getOpcode();
					int bitwidth = I.getType()->getPrimitiveSizeInBits();
					int opTypeID = (int)I.getType()->getTypeID();
					int loopDepth = getLoopDepth(I, LI);

					I.setMetadata("opID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opID))}));
					I.setMetadata("functionID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), functionID))}));
					I.setMetadata("bbID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bbID))}));
					I.setMetadata("opCode", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opCode))}));
					I.setMetadata("bitwidth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bitwidth))}));
					I.setMetadata("valueType", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opTypeID))}));
					I.setMetadata("loopDepth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), loopDepth))}));
					if (solutionDataJSON != "") {
						I.setMetadata("tripCount", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), tripCount))}));
					}

					if (includeDirectivesMD) {
						SmallVector<Metadata*, 6> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																	  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																	  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																	  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																	  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																	  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

						SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), pipelineII))};

						SmallVector<Metadata*, 4> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

						SmallVector<Metadata*, 2> loopFlattenMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																   ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

						SmallVector<Metadata*, 2> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																 ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

						// Set the instruction's directives.
						I.setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
						I.setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
						I.setMetadata("unroll", MDTuple::get(ctx, unrollMD));
						I.setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
						I.setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
					}

					I.setMetadata("ID." + std::to_string(opID), MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opID))}));

					opID++;
				}
				bbID++;
			}
			functionID++;
		}

		uint32_t globalID = 1;

		for (auto& global : M.getGlobalList()) {
			global.setMetadata("globalID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalID))}));

			int bitwidth = global.getType()->getPointerElementType()->getPrimitiveSizeInBits();
			int globalTypeID = (int)global.getType()->getPointerElementType()->getTypeID();

			global.setMetadata("bitwidth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bitwidth))}));
			global.setMetadata("valueType", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalTypeID))}));

			if (includeDirectivesMD) {
				SmallVector<Metadata*, 5> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

				global.setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
			}

			global.setMetadata("ID." + std::to_string(globalID), MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalID))}));

			globalID++;
		}

		return true;
	}

	std::unordered_map<std::string, std::vector<int>> parseSolutionData(std::string filename) {
		std::ifstream file(filename);

		Json::Reader reader;
		Json::Value obj;
		reader.parse(file, obj);

		std::unordered_map<std::string, std::vector<int>> data;

		for (auto& function : obj["ModuleInfo"]["Metrics"]) {
			for (auto& loop : function["Loops"]) {
				std::string loopName = loop["Name"].asString();
				std::string tripCountStr = loop["TripCount"].asString();
				std::string pipelineIIStr = loop["PipelineII"].asString();
				int tripCount = 1;
				int pipelineII = 0;
				if (pipelineIIStr != "") {
					pipelineII = std::stoi(pipelineIIStr);
				}
				if (tripCountStr != "") {
					tripCount = std::stoi(tripCountStr);
				}
				data[loopName] = {tripCount, pipelineII};
			}
		}

		return data;
	}

	unsigned int getLoopDepth(Instruction& I, LoopInfo& LI) {
		for (LoopInfo::iterator L = LI.begin(), LE = LI.end(); L != LE; ++L) {
			if ((*L)->contains(I.getParent())) {
				return (*L)->getLoopDepth();
			}
		}
		return 0;
	}

	virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
    }
};

}

char UpdateMD::ID = 0;
static RegisterPass<UpdateMD> X("update-md", "Add metadata including additional information about the module's instructions", false, false);