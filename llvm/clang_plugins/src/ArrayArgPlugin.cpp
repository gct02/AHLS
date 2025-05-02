#include "clang/AST/AST.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Rewrite/Core/Rewriter.h"

#include <iostream>
#include <string>
#include <vector>
#include <cstddef>
#include <memory>
#include <type_traits>
#include <utility>

using namespace clang;

class ArrayArgVisitor : public RecursiveASTVisitor<ArrayArgVisitor> {
public:
    explicit ArrayArgVisitor(ASTContext &Context, Rewriter &R) 
        : Context(Context), TheRewriter(R) {}

    bool VisitFunctionDecl(FunctionDecl *FD) {
        for (unsigned i = 0; i < FD->getNumParams(); ++i) {
            ParmVarDecl *Param = FD->getParamDecl(i);
            if (Param->getType()->isArrayType()) {
                // Preserve the array type in the argument
                auto ArrayType = Param->getType()->getAsArrayTypeUnsafe();
                if (ArrayType) {
                    llvm::errs() << "Found array parameter: " 
                                 << Param->getName() << "\n";
                }
            }
        }
        return true;
    }

private:
    ASTContext &Context;
    Rewriter &TheRewriter;
};

class ArrayArgASTConsumer : public ASTConsumer {
public:
    explicit ArrayArgASTConsumer(ASTContext &Context, Rewriter &R)
        : Visitor(Context, R) {}

    void HandleTranslationUnit(ASTContext &Context) override {
        Visitor.TraverseDecl(Context.getTranslationUnitDecl());
    }

private:
    ArrayArgVisitor Visitor;
};

class ArrayArgFrontendAction : public PluginASTAction {
public:
    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance &CI,
                                                   llvm::StringRef File) override {
        TheRewriter.setSourceMgr(CI.getSourceManager(), CI.getLangOpts());
        return std::make_unique<ArrayArgASTConsumer>(CI.getASTContext(), TheRewriter);
    }

    void EndSourceFileAction() override {
        // Output modified source code
        TheRewriter.getEditBuffer(TheRewriter.getSourceMgr().getMainFileID())
            .write(llvm::outs());
    }

    bool ParseArgs(const CompilerInstance &CI, const std::vector<std::string> &args) override {
        // Implement if needed
        for (const auto &arg : args) {
            llvm::errs() << "Plugin arg: " << arg << "\n";
        }
        return true;
    }

private:
    Rewriter TheRewriter;
};

static clang::FrontendPluginRegistry::Add<ArrayArgFrontendAction>
    X("array-arg-plugin", "Plugin to handle array arguments in function prototypes");
