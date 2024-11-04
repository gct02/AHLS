#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
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
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include <sstream>
#include <string>
#include <vector>
#include <utility>

using namespace llvm;

static cl::opt<bool> includeHLSDirectivesMD("dirmd", cl::desc("Include HLS directives metadata"), cl::Optional, cl::init(false));

namespace 
{

struct UpdateMD : public ModulePass 
{
	static char ID;
	UpdateMD() : ModulePass(ID) {}

	bool runOnModule(Module& M) override 
	{
		#define DEBUG_TYPE "update-md"

		LLVMContext& ctx = M.getContext();

		uint32_t opID = 1, functionID = 1, bbID = 1, globalID = 1;

		ConstantAsMetadata* constZero = ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0));
		SmallVector<Metadata*, 7> arrayPartitionMD(7, constZero);
		SmallVector<Metadata*, 5> pipelineMD(5, constZero);
		SmallVector<Metadata*, 4> unrollMD(4, constZero);
		SmallVector<Metadata*, 2> loopFlattenMD(2, constZero);
		SmallVector<Metadata*, 2> loopMergeMD(2, constZero);

		for (Module::iterator FI = M.begin(), FE = M.end(); FI != FE; ++FI) {
			Function& F = *FI;
			if (F.size() == 0) continue;

			setLoopMD(F, ctx);

			for (BasicBlock& BB : F) {
				for (Instruction& I : BB) {
					DEBUG(dbgs() << "Setting metadata for instruction: " << I << " (opID = " << opID << ")\n");

					int opCode = I.getOpcode();
					int bitwidth = I.getType()->getPrimitiveSizeInBits();
					int retValType = (int)I.getType()->getTypeID();

					I.setMetadata("opID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opID))}));
					I.setMetadata("functionID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), functionID))}));
					I.setMetadata("bbID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bbID))}));
					I.setMetadata("opCode", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), opCode))}));
					I.setMetadata("bitwidth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bitwidth))}));
					I.setMetadata("valueType", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), retValType))}));

					if (includeHLSDirectivesMD) {
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

		for (auto& global : M.getGlobalList()) {
			DEBUG(dbgs() << "Setting metadata for global: " << global << " (globalID = " << globalID << ")\n");

			int bitwidth = global.getType()->getPointerElementType()->getPrimitiveSizeInBits();
			int globalType = (int)global.getType()->getPointerElementType()->getTypeID();

			global.setMetadata("globalID", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalID))}));
			global.setMetadata("bitwidth", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), bitwidth))}));
			global.setMetadata("valueType", MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalType))}));

			if (includeHLSDirectivesMD) {
				global.setMetadata("arrayPartition", MDTuple::get(ctx, arrayPartitionMD));
			}
			global.setMetadata("ID." + std::to_string(globalID), MDNode::get(ctx, {ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), globalID))}));
			globalID++;
		}
		
		return false; // Module is not modified
	}

	// Set loop metadata (trip count and loop depth) for all instructions in function
	void setLoopMD(Function& F, LLVMContext& ctx) 
	{
		// Get LoopInfo and ScalarEvolution for the function
		LoopInfo& LI = getAnalysis<LoopInfoWrapperPass>(F).getLoopInfo();
		ScalarEvolution& SE = getAnalysis<ScalarEvolutionWrapperPass>(F).getSE();

		// Iterate over all basic blocks in the function
		for (BasicBlock& BB : F) {
			Loop* L = LI.getLoopFor(&BB);

			if (L) {
				DEBUG(dbgs() << "Basic block " << BB.getName() << " is inside loop " << L->getHeader()->getName() << "\n");
				// The basic block is inside a loop; get the trip count and loop depth
				const SCEV* tripCount = SE.getBackedgeTakenCount(L);

				// Get loop depth
				unsigned int loopDepth = L->getLoopDepth();

				if (const SCEVConstant *tripCountConst = dyn_cast<SCEVConstant>(tripCount)) {
					// Extract the constant integer value
					ConstantInt* tripCountValue = tripCountConst->getValue();

					DEBUG(dbgs() << "Trip count: " << tripCountValue->getValue() << "\n");

					MDNode* tripCountMD =  MDNode::get(ctx, ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), tripCountValue->getZExtValue())));
					MDNode* loopDepthMD = MDNode::get(ctx, ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), loopDepth)));

					// Attach metadata to all instructions in the basic block
					for (Instruction &I : BB) {
						I.setMetadata("tripCount", tripCountMD);
						I.setMetadata("loopDepth", loopDepthMD);
					}
				}
				else {
					MDNode* tripCountMD =  MDNode::get(ctx, ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), 0)));
					MDNode* loopDepthMD = MDNode::get(ctx, ConstantAsMetadata::get(ConstantInt::get(Type::getInt32Ty(ctx), loopDepth)));

					// Attach metadata to all instructions in the basic block
					for (Instruction &I : BB) {
						I.setMetadata("tripCount", tripCountMD);
						I.setMetadata("loopDepth", loopDepthMD);
					}
				}
			} 
			else {
				// The basic block is not inside any loop; use trip count of 1 and loop depth of 0
				ConstantInt *tripCountOne = ConstantInt::get(Type::getInt32Ty(ctx), 1);
				ConstantInt *loopDepthZero = ConstantInt::get(Type::getInt32Ty(ctx), 0);

				MDNode *tripCountMD = MDNode::get(ctx, ConstantAsMetadata::get(tripCountOne));
				MDNode *loopDepthMD = MDNode::get(ctx, ConstantAsMetadata::get(loopDepthZero));

				// Attach metadata to all instructions in the basic block
				for (Instruction &I : BB) {
					I.setMetadata("tripCount", tripCountMD);
					I.setMetadata("loopDepth", loopDepthMD);
				}
			}
		}
	}

	unsigned int getLoopDepth(BasicBlock* BB, LoopInfo& LI) 
	{
		for (LoopInfo::iterator L = LI.begin(), LE = LI.end(); L != LE; ++L) {
			if ((*L)->contains(BB)) {
				return (*L)->getLoopDepth();
			}
		}
		return 0;
	}

	virtual void getAnalysisUsage(AnalysisUsage& AU) const override 
	{
        AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.setPreservesAll();
    }
}; // struct UpdateMD

}  // namespace

char UpdateMD::ID = 0;
static RegisterPass<UpdateMD> X("update-md", "Add metadata to instructions and global values", false, false);