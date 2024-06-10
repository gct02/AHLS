#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <string>
#include <vector>

using namespace llvm;

namespace
{
struct BinOpTrace : public ModulePass
{
    static char ID;
    BinOpTrace() : ModulePass(ID) {}

    bool runOnModule(Module& M) override
    {
        LLVMContext& ctx = M.getContext();

        Function* printfFunc = M.getFunction("printf");
        
        for (auto& F : M) {
            if (F.isDeclaration()) 
                continue;
            
            for (auto& B : F) {
                // Skip the basic block if it is an exception handling block
                if(B.isEHPad() || B.isLandingPad()) 
                    continue;
                
                for (auto& I : B) {
                    if (auto* binOp = dyn_cast<BinaryOperator>(&I)) {
                        // Place the printf call after the binary operation
                        IRBuilder<> builder(binOp->getNextNode());

                        Value* arg1 = binOp->getOperand(0);
                        Value* arg2 = binOp->getOperand(1);
                        Value* result = &I;

                        // After each binary operation, there will be a printf call
                        // that will print the operation name, the two operands, and the result
                        std::string opName = binOp->getOpcodeName();
                        opName += " : ";
                        builder.CreateCall(printfFunc, {builder.CreateGlobalStringPtr(opName.c_str())});

                        if (arg1->getType()->isFloatingPointTy()) {
                            // If the operand is a float, we need to extend it to double
                            Value* arg1Ext = builder.CreateFPExt(arg1, Type::getDoubleTy(ctx));
                            Value* arg2Ext = builder.CreateFPExt(arg2, Type::getDoubleTy(ctx));
                            Value* resultExt = builder.CreateFPExt(result, Type::getDoubleTy(ctx));
                            builder.CreateCall(printfFunc, {builder.CreateGlobalStringPtr("%f %f -> %f\n"), arg1Ext, arg2Ext, resultExt});
                        } else if (arg1->getType()->isDoubleTy()) {
                            builder.CreateCall(printfFunc, {builder.CreateGlobalStringPtr("%f %f -> %f\n"), arg1, arg2, result});
                        } else {
                            builder.CreateCall(printfFunc, {builder.CreateGlobalStringPtr("%d %d -> %d\n"), arg1, arg2 ,result});
                        }
                    }
                }
            }
        }

        return true;
    }
};
} // namespace

char BinOpTrace::ID = 0;
static RegisterPass<BinOpTrace> X("binop-trace", "Insert calls to print information about each binary operation", false, false);