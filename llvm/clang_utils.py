import subprocess
from pathlib import Path
from os import environ
from exceptions import ClangException

try:
    CLANG = environ['CLANG']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise

def create_executable_from_llvm_ir(
    ir_path: Path, 
    output_path: Path, 
    include_libraries: list = None
) -> None:
    """
    Compile the LLVM IR file at ir_path to an executable at output_path.
    """
    include_str = "" if include_libraries is None else " ".join([f"-I{lib}" for lib in include_libraries])

    compile_cmd = f"{CLANG} {include_str} -lm {ir_path} -o {output_path} -lstdc++"

    try:
        subprocess.check_output(compile_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise ClangException(ir_path.as_posix(), error.returncode, error.output)