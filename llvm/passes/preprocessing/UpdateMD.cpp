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
#include <cstdint>

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
		NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opCounter");
		if (counterNamedMDNode->getNumOperands() != 0) {
			opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(counterNamedMDNode->getOperand(0)->getOperand(0))->getValue())->getZExtValue();
			counterNamedMDNode->dropAllReferences();
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
					// Set the instruction's attributes (opID, opCode, isSignedValue, isFpValue, bitwidth, numUses).
					opID++;
					DEBUG(dbgs() << "Setting attributes for instruction: " << I << " (opID = " << opID << ")\n");

					MDNode* opIDMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))});
					I.setMetadata("opID", opIDMDNode);
					MDNode* opCodeMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt8Ty(ctx), I.getOpcode()))});
					I.setMetadata("opCode", opCodeMDNode);
					MDNode* bitwidthMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), I.getType()->getPrimitiveSizeInBits()))});
					I.setMetadata("bitwidth", bitwidthMDNode);
					MDNode* numUsesMDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), I.getNumUses()))});
					I.setMetadata("numUses", numUsesMDNode);
				}
			}
		}

		// Update the instruction counter metadata in the module.
		counterNamedMDNode->addOperand(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))}));

		return true;
	}
};

}

char UpdateMDPass::ID = 0;
static RegisterPass<UpdateMDPass> X("update-md", "Add metadata for instructions (ID and signedness info)", false, false);