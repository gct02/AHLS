#include "HLSDSEUtils.h"

#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/IR/LLVMContext.h"
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

#include <iostream>
#include <string>
#include <vector>
#include <unordered_map>

namespace llvm {

uint32_t getIntMDOperand(MDNode* md, uint32_t index) {
    if (md && index < md->getNumOperands()) {
        return cast<ConstantInt>(
            dyn_cast<ConstantAsMetadata>(
                md->getOperand(index)
            )->getValue()
        )->getZExtValue();
    }
    return 0;
}

uint32_t getIntMetadata(Value& V, StringRef name, uint32_t index) {
    if (Instruction* I = dyn_cast<Instruction>(&V))
        return getIntMDOperand(I->getMetadata(name), index);
    if (GlobalObject* G = dyn_cast<GlobalObject>(&V))
        return getIntMDOperand(G->getMetadata(name), index);
    if (Function* F = dyn_cast<Function>(&V))
        return getIntMDOperand(F->getMetadata(name), index);
    if (Argument* A = dyn_cast<Argument>(&V))
        return getIntMDOperand(A->getParent()->getMetadata(name), index);
    if (BasicBlock* BB = dyn_cast<BasicBlock>(&V))
        return getIntMDOperand(BB->getTerminator()->getMetadata(name), index);
    return 0;
}

uint32_t getArgumentAttributeValue(const Argument* arg, StringRef attrName) {
    AttributeList attrs = arg->getParent()->getAttributes();
    const auto& attr = attrs.getParamAttr(arg->getArgNo(), attrName);
    auto attrStr = attr.getValueAsString();
    if (!attrStr.empty()) {
        uint32_t size;
        if (to_integer(attrStr, size))
            return size;
    }
    return 0;
}

uint32_t getDecayedDimSize(const Argument *arg) {
    return getArgumentAttributeValue(arg, "fpga.decayed.dim.hint");
}

void setIntMetadata(Value& V, StringRef name, uint32_t value) {
    LLVMContext& ctx = V.getContext();
    ConstantInt* ci = ConstantInt::get(Type::getInt32Ty(ctx), value);
    MDNode* md = MDNode::get(ctx, {ConstantAsMetadata::get(ci)});
    if (Instruction* I = dyn_cast<Instruction>(&V)) {
        I->setMetadata(name, md);
    } else if (GlobalObject* G = dyn_cast<GlobalObject>(&V)) {
        G->setMetadata(name, md);
    } else if (Function* F = dyn_cast<Function>(&V)) {
        F->setMetadata(name, md);
    } else if (Argument* A = dyn_cast<Argument>(&V)) {
        A->getParent()->setMetadata(name, md);
    } else if (BasicBlock* BB = dyn_cast<BasicBlock>(&V)) {
        BB->getTerminator()->setMetadata(name, md);
    }
}

void setIntMetadata(Loop& L, StringRef name, uint32_t value) {
    setIntMetadata(*L.getHeader(), name, value);
}

Type* getPointedType(Type* ptrTy) {
    while (ptrTy->isPointerTy()) {
        ptrTy = ptrTy->getPointerElementType();
    }
    return ptrTy;
}

Type* getArrayInnermostType(Type* arrayTy) {
    while (arrayTy->isArrayTy()) {
        arrayTy = arrayTy->getArrayElementType();
    }
    return arrayTy;
}

uint32_t getArrayDims(Type* arrayTy) {
    arrayTy = getPointedType(arrayTy);
    uint32_t dims = 0;
    while (arrayTy->isArrayTy()) {
        dims++;
        arrayTy = arrayTy->getArrayElementType();
    }
    return dims;
}

uint32_t getTotalArrayElements(Type* arrayTy) {
    arrayTy = getPointedType(arrayTy);
    uint32_t totalElems = 1;
    while (arrayTy->isArrayTy()) {
        totalElems *= arrayTy->getArrayNumElements();
        arrayTy = arrayTy->getArrayElementType();
    }
    return totalElems;
}

uint32_t getArrayDimSize(Type* arrayTy, uint32_t dim) {
    arrayTy = getPointedType(arrayTy);
    for (uint32_t i = 1; i < dim; i++) {
        arrayTy = arrayTy->getArrayElementType();
    }
    return arrayTy->getArrayNumElements();
}

ConstantAsMetadata* getConstantAsMetadata(LLVMContext& ctx, uint32_t value) {
    return ConstantAsMetadata::get(
        ConstantInt::get(Type::getInt32Ty(ctx), value)
    );
}

} // namespace llvm