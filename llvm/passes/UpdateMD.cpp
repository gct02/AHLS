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

struct UpdateMDPass : public ModulePass {
	static char ID;
	UpdateMDPass() : ModulePass(ID) {}

	bool runOnModule(Module& M) override {
		#define DEBUG_TYPE "update-md"

		LLVMContext& ctx = M.getContext();

		uint64_t opID;
		// Get the instruction counter metadata from the module. If it doesn't exist, create it.
		NamedMDNode* opCounter = M.getOrInsertNamedMetadata("opCounter");
		if (opCounter->getNumOperands() != 0) {
			opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opCounter->getOperand(0)->getOperand(0))->getValue())->getZExtValue();
			opCounter->dropAllReferences();
		} else {
			opID = 0;
		}

		for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
			Function& F = *FI;
			if (F.size() == 0) continue;
			DEBUG(dbgs() << "Analyzing function: " << F.getName() << "\n");
			LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					if (MDNode* opIDMDNode = I.getMetadata("opID")) {
						DEBUG(dbgs() << "Instruction " << opIDMDNode << " already has attributes\n");
						continue;
					}
					// Set the instruction's attributes (opID, opCode, bitwidth, isFp, inLoop), along with information
					// about the directives applied to it.
					opID++;
					DEBUG(dbgs() << "Setting attributes for instruction: " << I << " (opID = " << opID << ")\n");

					int opCode = I.getOpcode();
					int bitwidth = I.getType()->getPrimitiveSizeInBits();
					bool isFp = I.getType()->isFloatingPointTy();
					int loopDepth = getLoopDepth(I, LI);

					I.setMetadata("opID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))}));
					I.setMetadata("opCode", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt8Ty(ctx), opCode))}));
					I.setMetadata("bitwidth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bitwidth))}));
					I.setMetadata("isFp", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), isFp))}));
					I.setMetadata("loopDepth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), loopDepth))}));

					// Initially, directives = (0,0,0,0,0,0,0,0)
					SmallVector<Metadata*, 3> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 2> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
														    ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 2> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)),
														  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

					// Set the instruction's directives.
					I.setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
					I.setMetadata("pipeline", MDTuple::get(ctx, pipelineMD));
					I.setMetadata("unroll", MDTuple::get(ctx, unrollMD));
					I.setMetadata("loopMerge", MDTuple::get(ctx, loopMergeMD));
				}
			}
		}
		// Update the instruction counter metadata in the module.
		opCounter->addOperand(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))}));

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

char UpdateMDPass::ID = 0;
static RegisterPass<UpdateMDPass> X("update-md", "Add metadata including additional information about the module's instructions", false, false);