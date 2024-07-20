import sys, os
import subprocess
from pathlib import Path
from llvm.opt_utils import *

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise

if __name__ == "__main__":
    bench_vitis_projects_dir = Path("hls/vitis_projects/ldrgen")
    for bench_vitis_project in bench_vitis_projects_dir.iterdir():
        bench_name = bench_vitis_project.name
        bench_folder = Path(f"benchmarks/ldrgen/{bench_name}")

        bench_ahls_folder = bench_folder / "ahls"
        bench_folder.mkdir(parents=True, exist_ok=True)

        bench_ir_folder = bench_ahls_folder / "ir"
        bench_dfg_folder = bench_ahls_folder / "dfg"
        bench_ir_folder.mkdir(parents=True, exist_ok=True)
        bench_dfg_folder.mkdir(parents=True, exist_ok=True)

        bench_vitis_ir = bench_vitis_project / "solution1/.autopilot/db/a.g.ld.5.gdce.bc"
        cp_cmd = f"cp {bench_vitis_ir} {bench_ir_folder}"
        subprocess.run(cp_cmd, shell=True)

        ir_path = bench_ir_folder / "a.g.ld.5.gdce.bc"
        preprocessed_ir_path = bench_ir_folder / f"{bench_name}.bc"
        preprocess_ir_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_path.as_posix()} > {preprocessed_ir_path.as_posix()}"

        subprocess.run(preprocess_ir_cmd, shell=True)

        instrumented_ir_path = update_md_and_instrument(preprocessed_ir_path, Path("data_stats.txt"))
        md_updated_ir_path = instrumented_ir_path.parent / (instrumented_ir_path.stem + ".md.bc")

        dfg_nodes_path = bench_dfg_folder / "dfg_nodes.txt"
        dfg_edges_path = bench_dfg_folder / "dfg_edges.txt"

        extract_dfg_info(instrumented_ir_path, dfg_nodes_path, dfg_edges_path)




