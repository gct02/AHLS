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

					switch (I.getOpcode()) {
						// Floating-point operations
						case Instruction::FAdd:
						case Instruction::FSub:
						case Instruction::FMul:
						case Instruction::FDiv:
						case Instruction::FRem:
							DEBUG(dbgs() << "Floating-point operation: " << I << "\n");
							MDNode* isFpValue = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), 1))});
							I.setMetadata("isFpValue", isFpValue);
							MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "signed")});
							I.setMetadata("signedness", signednessMDNode);
							break;
						// Logical, arithmetic, and shift operations on integers
						case Instruction::Add:
						case Instruction::Sub:
						case Instruction::Mul:
						case Instruction::Or:
						case Instruction::And:
						case Instruction::Xor:
						case Instruction::Shl:
						case Instruction::LShr:
						case Instruction::AShr:
							DEBUG(dbgs() << "Integer operation: " << I << "\n");
							MDNode* isFpValue = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), 0))});
							I.setMetadata("isFpValue", isFpValue);
							MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "unknown")});
							I.setMetadata("signedness", signednessMDNode);
							break;
						// Division and remainder operations on unsigned integers
						case Instruction::UDiv:
						case Instruction::URem:
							DEBUG(dbgs() << "Unsigned division or remainder: " << I << "\n");
							MDNode* isFpValue = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), 0))});
							I.setMetadata("isFpValue", isFpValue);
							MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "unsigned")});
							I.setMetadata("signedness", signednessMDNode);
							break;
						// Division and remainder operations on signed integers
						case Instruction::SDiv:
						case Instruction::SRem:
							DEBUG(dbgs() << "Signed division or remainder: " << I << "\n");
							MDNode* isFpValue = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), 0))});
							I.setMetadata("isFpValue", isFpValue);
							MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "signed")});
							I.setMetadata("signedness", signednessMDNode);
							break;
						// Not a binary operation
						default:
							MDNode* isFpValue = MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt1Ty(ctx), 0))});
							I.setMetadata("isFpValue", isFpValue);
							MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "unknown")});
							I.setMetadata("signedness", signednessMDNode);
							break;
                    }
				}
			}
		}

		// Propagate known signedness information
		for (Function& F : M) {
			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					if (MDNode* signednessMDNode = I.getMetadata("signedness")) {
						StringRef signedness = cast<MDString>(signednessMDNode->getOperand(0))->getString();
						if (signedness == "unknown") {
							continue;
						}
						DEBUG(dbgs() << "Propagating signedness information for instruction: " << I << "\n");
						for (User* U : I.users()) {
							if (Instruction* userI = dyn_cast<Instruction>(U)) {
								if (MDNode* userSignednessMDNode = userI->getMetadata("signedness")) {
									StringRef userSignedness = cast<MDString>(userSignednessMDNode->getOperand(0))->getString();
									if (userSignedness == "unknown") {
										DEBUG(dbgs() << "Propagating signedness information to instruction: " << *userI << "\n");
										MDNode* signednessMDNodeCopy = MDNode::get(ctx, {MDString::get(ctx, signedness)});
										userI->setMetadata("signedness", signednessMDNodeCopy);
									}
								} else {
									MDNode* signednessMDNodeCopy = MDNode::get(ctx, {MDString::get(ctx, cast<MDString>(signednessMDNode->getOperand(0))->getString())});
									userI->setMetadata("signedness", signednessMDNodeCopy);
								}
							}
						}
						for (auto operandIter = I.op_begin(); operandIter != I.op_end(); operandIter++) {
							if (Instruction* operandI = dyn_cast<Instruction>(operandIter->get())) {
								if (MDNode* operandSignednessMDNode = operandI->getMetadata("signedness")) {
									StringRef operandSignedness = cast<MDString>(operandSignednessMDNode->getOperand(0))->getString();
									if (operandSignedness == "unknown") {
										DEBUG(dbgs() << "Propagating signedness information to instruction: " << *operandI << "\n");
										MDNode* signednessMDNodeCopy = MDNode::get(ctx, {MDString::get(ctx, signedness)});
										operandI->setMetadata("signedness", signednessMDNodeCopy);
									}
								} else {
									MDNode* signednessMDNodeCopy = MDNode::get(ctx, {MDString::get(ctx, cast<MDString>(signednessMDNode->getOperand(0))->getString())});
									operandI->setMetadata("signedness", signednessMDNodeCopy);
								}
							}
						}
					}
				}
			}
		}

		for (Function& F : M) {
			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					if (MDNode* signednessMDNode = I.getMetadata("signedness")) {
						StringRef signedness = cast<MDString>(signednessMDNode->getOperand(0))->getString();
						if (signedness == "unknown") {
							if (I.isBinaryOp()) {
								MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "signed")});
								I.setMetadata("signedness", signednessMDNode);
							} else {
								MDNode* signednessMDNode = MDNode::get(ctx, {MDString::get(ctx, "unsigned")});
								I.setMetadata("signedness", signednessMDNode);
							}
						}
					}
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