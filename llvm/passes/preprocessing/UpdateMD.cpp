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
#include <list>
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
		NamedMDNode* counterNamedMDNode = M.getOrInsertNamedMetadata("opIDCounter");
		if (counterNamedMDNode->getNumOperands() != 0) {
			opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(counterNamedMDNode->getOperand(0)->getOperand(0))->getValue())->getZExtValue();
			counterNamedMDNode->dropAllReferences();
		} else {
			opID = 0;
		}

		bool modified = false;

		// Iterate over all instructions in the module and assign an opID and signedness info to each one.
		for (Function& F : M) {
			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					// If the instruction already has signedness info, propagate its signedness info to its users and operands.
					if (MDNode* signednessMDNode = I.getMetadata("opSignedness")) {
						DEBUG(dbgs() << "Instruction already has signedness info: " << *signednessMDNode << "\n");
						for(auto user : I.users()){  
							if (auto destination = dyn_cast<Instruction>(user)) {
								// Destination instruction uses I.
								DEBUG(dbgs() << "Propagating signedness info to destination: " << *destination << "\n");
								destination->setMetadata("opSignedness", signednessMDNode);
								modified = true;
							}
						}
						for (auto operandIterator = I.op_begin(); operandIterator != I.op_end(); ++operandIterator) {
							if (auto source = dyn_cast<Instruction>(*operandIterator)) {
								// Source instruction is used by I.
								DEBUG(dbgs() << "Propagating signedness info to source: " << *source << "\n");
								source->setMetadata("opSignedness", signednessMDNode);
								modified = true;
							}
						}
					}

					// Skip instructions that already have an opID.
					if (MDNode* opIDNode = I.getMetadata("opID")) {
						uint64_t existingOpID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue())->getZExtValue();
						DEBUG(dbgs() << "Instruction already has opID: " << existingOpID << "\n");
						continue;
					}
					
					// Set the instruction's opID.
					opID++;
					DEBUG(dbgs() << "Setting opID " << opID << " for instruction: " << I << "\n");
					MDNode* opIDNode = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))});
					I.setMetadata("opID", opIDNode);
					modified = true;

					// If the instruction has no signedness info, set it to "unknownSignedness".
					if (MDNode* signednessMDNode = I.getMetadata("opSignedness"))
						continue;
					I.setMetadata("opSignedness", MDNode::get(ctx, MDString::get(ctx, "unknownSignedness")));
				}
			}
		}
		// Update the instruction counter metadata in the module.
		counterNamedMDNode->addOperand(MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt64Ty(ctx), opID))}));

		return modified;
	}
};

}

char UpdateMDPass::ID = 0;
static RegisterPass<UpdateMDPass> X("update-md", "Add metadata for instructions (ID and signedness info)", false, false);