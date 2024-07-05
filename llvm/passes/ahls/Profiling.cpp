#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <string>
#include <vector>
#include <list>
#include <cstdint>

using namespace llvm;

static cl::opt<std::string> outputFileName("pf", cl::desc("Specify output filename for profiling results"), cl::value_desc("filename"));

namespace {

struct ProfilingPass : public ModulePass {
    static char ID;
    ProfilingPass() : ModulePass(ID) {}
    
    bool runOnModule(Module &M) override {
        #define DEBUG_TYPE "profiling"

        LLVMContext &ctx = M.getContext();

        // Create a new function named "profOp", which will be used to profile the operations.
        std::vector<Type*> paramTypesProfOp = {Type::getInt64Ty(ctx), Type::getInt8Ty(ctx), Type::getInt64Ty(ctx), Type::getInt64Ty(ctx), 
                                               Type::getDoubleTy(ctx), Type::getInt1Ty(ctx), Type::getInt1Ty(ctx), Type::getInt32Ty(ctx),
                                               Type::getInt32Ty(ctx), Type::getInt1Ty(ctx)};
        FunctionType *profOpType = FunctionType::get(Type::getVoidTy(ctx), paramTypesProfOp, false);
        Function *profOp = Function::Create(profOpType, Function::ExternalLinkage, "profOp", &M);

        // Create a new function named "saveProfile", which will be used to save the profiling results.
        std::vector<Type*> paramTypesSaveProfile = {Type::getInt8PtrTy(ctx)};
        FunctionType *saveProfileType = FunctionType::get(Type::getVoidTy(ctx), paramTypesSaveProfile, false);
        Function *saveProfile = Function::Create(saveProfileType, Function::ExternalLinkage, "saveProfile", &M);

        GlobalVariable* profileFileName = new GlobalVariable(M, ArrayType::get(Type::getInt8Ty(ctx), outputFileName.length() + 1), true, GlobalValue::PrivateLinkage, 
                                                             ConstantDataArray::getString(ctx, outputFileName, true), "profileFileName");
        Constant* zero = ConstantInt::get(Type::getInt32Ty(ctx), 0);
        Constant* index[] = { zero, zero };
        Constant* profileFileNameRef = ConstantExpr::getInBoundsGetElementPtr(profileFileName->getValueType(), profileFileName, index); 
        Value* args[10]; // Arguments for the "profOp" function

        bool modified = false;

        // Iterate over all instructions in the module and insert calls to the "profOp" function after each instruction.
        for (Function& F : M) {
            // Skip "part_select" and "part_set" functions (implementations of "llvm.legacy.part.*" intrinsics)
            // if (F.getName().startswith("part_select") || F.getName().startswith("part_set"))
            //    continue;
            for (auto FIter = F.begin(); FIter != F.end(); ++FIter) {
                BasicBlock& BB = *FIter;
                for (auto BBIter = BB.begin(); BBIter != BB.end(); ++BBIter) {
                    Instruction& I = *BBIter;
                    if (MDNode* opIDNode = I.getMetadata("opID")) {
                        if (I.isTerminator()) {
                            // Insert a call to profOp before the terminator instruction.
                            IRBuilder<NoFolder> builder(&I);
                            builder.SetInsertPoint(&BB, builder.GetInsertPoint());

                            ConstantInt* opID = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                            ConstantInt* opCode = ConstantInt::get(Type::getInt8Ty(ctx), 0);

                            args[0] = opID;
                            args[1] = opCode;
                            args[2] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                            args[3] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                            args[4] = ConstantFP::get(Type::getDoubleTy(ctx), 0);
                            args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                            args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                            args[7] = ConstantInt::get(Type::getInt32Ty(ctx), I.getType()->getPrimitiveSizeInBits());
                            args[8] = ConstantInt::get(Type::getInt32Ty(ctx), I.getNumUses());
                            args[9] = ConstantInt::get(Type::getInt1Ty(ctx), 0);

                            builder.CreateCall(profOp, args);
                            modified = true;
                            break;
                        }
                        // For non-terminator instructions, insert call to the profOp function after the instruction.
                        IRBuilder<NoFolder> builder(&I);
                        builder.SetInsertPoint(&BB, ++builder.GetInsertPoint());
                        
                        ConstantInt* opID = cast<ConstantInt>(dyn_cast<ConstantAsMetadata>(opIDNode->getOperand(0))->getValue());
                        StringRef opSignedness = cast<MDString>(I.getMetadata("opSignedness")->getOperand(0))->getString();
                        ConstantInt* opCode = ConstantInt::get(Type::getInt8Ty(ctx), I.getOpcode());

                        args[0] = opID;
                        args[1] = opCode;
                        args[7] = ConstantInt::get(Type::getInt32Ty(ctx), I.getType()->getPrimitiveSizeInBits());
                        args[8] = ConstantInt::get(Type::getInt32Ty(ctx), I.getNumUses());
                        if (I.isBinaryOp()) {
                            args[9] = ConstantInt::get(Type::getInt1Ty(ctx), 1);
                        } else {
                            args[9] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                        }

                        switch (I.getOpcode()) {
                            // Floating-point operations
                            case Instruction::FAdd:
                            case Instruction::FSub:
                            case Instruction::FMul:
                            case Instruction::FDiv:
                            case Instruction::FRem:
                                DEBUG(dbgs() << "Floating-point operation: " << I << "\n");
                                args[2] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[3] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[4] = builder.CreateFPExt(&I, Type::getDoubleTy(ctx));
                                args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 1);
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
                                args[4] = ConstantFP::get(Type::getDoubleTy(ctx), 0);
                                args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                if (opSignedness == "unsigned") {
                                    args[2] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                    args[3] = builder.CreateZExt(&I, Type::getInt64Ty(ctx));
                                    args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                } else {
                                    // Assume signed by default
                                    args[2] = builder.CreateSExt(&I, Type::getInt64Ty(ctx));
                                    args[3] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                    args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 1);
                                }
                                break;
                            // Division and remainder operations on unsigned integers
                            case Instruction::UDiv:
                            case Instruction::URem:
                                DEBUG(dbgs() << "Unsigned division or remainder: " << I << "\n");
                                args[2] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[3] = builder.CreateZExt(&I, Type::getInt64Ty(ctx)); 
                                args[4] = ConstantFP::get(Type::getDoubleTy(ctx), 0); 
                                args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 0); 
                                args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                break;
                            // Division and remainder operations on signed integers
                            case Instruction::SDiv:
                            case Instruction::SRem:
                                DEBUG(dbgs() << "Signed division or remainder: " << I << "\n");
                                args[2] = builder.CreateSExt(&I, Type::getInt64Ty(ctx)); 
                                args[3] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[4] = ConstantFP::get(Type::getDoubleTy(ctx), 0); 
                                args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 1); 
                                args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                break;
                            // Not a binary operation
                            default:
                                args[2] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[3] = ConstantInt::get(Type::getInt64Ty(ctx), 0);
                                args[4] = ConstantFP::get(Type::getDoubleTy(ctx), 0);
                                args[5] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                args[6] = ConstantInt::get(Type::getInt1Ty(ctx), 0);
                                break;
                        }
                        builder.CreateCall(profOp, args);
                        modified = true;
                    }
                }
            }
        }

        // Insert a call to the "saveProfile" function at the end of the main function.
        if (modified) {
            if (Function* main = M.getFunction("main")) {
                for (auto BBIter = main->begin(); BBIter != main->end(); ++BBIter) {
                    BasicBlock& BB = *BBIter;
                    DEBUG(dbgs() << "Basic block: " << BB.getName() << "\n");
                    if (ReturnInst* ret = dyn_cast<ReturnInst>(BB.getTerminator())) {
                        // Insert a call to the "saveProfile" function before the return instruction.
                        DEBUG(dbgs() << "Inserting call to saveProfile\n");
                        IRBuilder<NoFolder> builder(ret);
                        builder.SetInsertPoint(&BB, builder.GetInsertPoint());
                        builder.CreateCall(saveProfile, profileFileNameRef);
                    }
                }
            }
        }

        return modified;
    }
};

}

char ProfilingPass::ID = 0;
static RegisterPass<ProfilingPass> X("profile", "Profile binary operations in the module", false, false);