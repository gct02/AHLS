#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/XILINXLoopInfoUtils.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Metadata.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <string>
#include <vector>

using namespace llvm;

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

		for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
			Function& F = *FI;

			if (F.size() == 0) 
				continue;

			DEBUG(dbgs() << "Analyzing function: " << F.getName() << "\n");

			LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();

			for (BasicBlock& BB : F) {
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
					I.setMetadata("opType", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opTypeID))}));
					I.setMetadata("loopDepth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), loopDepth))}));

					SmallVector<Metadata*, 5> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 4> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
														    ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
															ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 3> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
														  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
														  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 1> loopFlattenMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

					// Set the instruction's directives.
					I.setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
					I.setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
					I.setMetadata("unroll", MDTuple::get(ctx, unrollMD));
					I.setMetadata("loopFlatten", MDTuple::get(ctx, loopFlattenMD));
					I.setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));

					// Include a dummy opID metadata to use as a reference for the instruction 
					// while building the CDFG using ProGraML
					std::string opIDStr = "opID." + std::to_string(opID);
					I.setMetadata(opIDStr, MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opID))}));

					opID++;
				}
				bbID++;
			}
			functionID++;
		}

		return true;
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