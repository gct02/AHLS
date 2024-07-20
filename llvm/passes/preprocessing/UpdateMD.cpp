#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Function.h"
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

		for (Function& F : M) {
			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					if (MDNode* opIDMDNode = I.getMetadata("opID")) {
						DEBUG(dbgs() << "Instruction " << opIDMDNode << " already has attributes\n");
						continue;
					}
					// Set the instruction's attributes (opID, opCode and bitwidth), along with information
					// about the directives affecting it (directly or not).
					opID++;
					DEBUG(dbgs() << "Setting attributes for instruction: " << I << " (opID = " << opID << ")\n");

					MDNode* opIDMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))});
					MDNode* opCodeMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt8Ty(ctx), I.getOpcode()))});
					MDNode* bitwidthMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), I.getType()->getPrimitiveSizeInBits()))});
					I.setMetadata("opID", opIDMDNode);
					I.setMetadata("opCode", opCodeMDNode);
					I.setMetadata("bitwidth", bitwidthMDNode);

					// Initially, directives = (0,0,0,0,0,0)
					SmallVector<Metadata*, 4> arrayPartitionMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
																  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 2> pipelineMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
														    ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 2> unrollMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)), 
														  ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};
					SmallVector<Metadata*, 1> loopMergeMD = {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0))};

					MDTuple* arrayPartitionMDTuple = MDTuple::get(ctx, arrayPartitionMD);
					MDTuple* pipelineMDTuple = MDTuple::get(ctx, pipelineMD);
					MDTuple* unrollMDTuple = MDTuple::get(ctx, unrollMD);
					MDTuple* loopMergeMDTuple = MDTuple::get(ctx, loopMergeMD);

					// Set the instruction's directives.
					I.setMetadata("array_partition", arrayPartitionMDTuple);
					I.setMetadata("pipeline", pipelineMDTuple);
					I.setMetadata("unroll", unrollMDTuple);
					I.setMetadata("loop_merge", loopMergeMDTuple);
				}
			}
		}
		// Update the instruction counter metadata in the module.
		opCounter->addOperand(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))}));

		return true;
	}
};

}

char UpdateMDPass::ID = 0;
static RegisterPass<UpdateMDPass> X("update-md", "Add metadata including additional information about the module's instructions", false, false);