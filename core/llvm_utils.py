import subprocess
from pathlib import Path
from os import environ

from exceptions.ahls_exceptions import UpdateMDError, InstrumentationError

try:
    CLANG = environ['CLANG']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise

def create_executable_from_llvm_ir(ir_path : Path, output_path : Path, include_libraries : list=None):
    include_str = "" if include_libraries is None else " ".join([f"-I{lib}" for lib in include_libraries])

    compile_cmd = f"{CLANG} {include_str} -lm {ir_path} -o {output_path} -lstdc++"

    try:
        subprocess.check_output(compile_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)