import subprocess, argparse
from pathlib import Path
from os import environ
from sys import argv

from preprocessing.preprocessor import AHLSPreProcessor
from llvm.opt_utils import *
from llvm.clang_utils import *
from design_metrics.error_eval import *

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as ahls_error:
    print(f"Error: environment variable {ahls_error.args[0]} not defined.")
    raise

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", help = "Input design file", required=True)
    parser.add_argument("-p", "--populate", help = "Populate IO file", required=True)
    parser.add_argument("-d", "--datastats", help = "Data stats file", required=False)
    return parser.parse_args()

if __name__ == "__main__":
    ...