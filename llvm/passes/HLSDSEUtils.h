#ifndef LLVM_PASSES_HLS_DSE_UTILS_H
#define LLVM_PASSES_HLS_DSE_UTILS_H

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"

#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

namespace llvm {

ConstantAsMetadata* getConstantAsMetadata(LLVMContext& ctx, uint32_t value);
uint32_t getIntMDOperand(MDNode* md, uint32_t index=0);
uint32_t getIntMetadata(Value& V, StringRef name, uint32_t index=0);

void setIntMetadata(Value& V, StringRef name, uint32_t value);
void setIntMetadata(Loop& L, StringRef name, uint32_t value);

uint32_t getArgumentAttributeValue(const Argument* arg, StringRef attrName);
uint32_t getDecayedDimSize(const Argument *arg);

Type* getPointedType(Type* ptrTy);
Type* getArrayInnermostType(Type* arrayTy);
uint32_t getArrayDims(Type* arrayTy);
uint32_t getTotalArrayElements(Type* arrayTy);
uint32_t getArrayDimSize(Type* arrayTy, uint32_t dim);

} // namespace llvm

#endif // LLVM_PASSES_HLS_DSE_UTILS_H