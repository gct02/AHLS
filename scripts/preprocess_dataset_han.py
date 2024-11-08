from pathlib import Path
from sys import argv

import json, pickle, subprocess, argparse

from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.han.utils.cdfg import build_cdfg

def create_directives_tcl(solution_data_json:Path, output_path:Path):
    with open(solution_data_json, "r") as f:
        data = json.load(f)
    directives_tcl = data["HlsSolution"]["DirectiveTcl"]
    with open(output_path, "w") as f:
        directives_tcl = "\n".join(directives_tcl)
        f.write(directives_tcl)

def parse_args():
    parser = argparse.ArgumentParser(prog="preprocess_dataset_han", description="Create CDFGs from HLS solutions")
    parser.add_argument("-b", "--benchs", help = "Path to the folder containing the Vitis HLS projects", required=True)
    parser.add_argument("-o", "--output", help = "Path where the processed dataset should be written", required=True)
    parser.add_argument("-d", "--directives", help = "Sinalize that directives features should be included", action="store_true", required=False, default=False)
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    benchmark_path = Path(args.benchs)
    output_folder_path = Path(args.output)
    directives = args.directives

    benchmarks = sorted(list(benchmark_path.iterdir()))

    for i, benchmark in enumerate(benchmarks):
        benchmark_folder = output_folder_path / benchmark.stem
        benchmark_folder.mkdir(parents=True, exist_ok=True)
        solutions = sorted(list(benchmark.iterdir()))
        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue

            impl_folder = solution / "impl"
            if not impl_folder.exists():
                print(f"Implementation folder not found for {solution}")
                continue

            instance_folder = benchmark_folder / solution.stem
            if instance_folder.exists():
                continue

            instance_folder.mkdir(parents=True, exist_ok=True)

            ir = solution / ".autopilot/db/a.o.3.bc"

            if not ir.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            solution_data_json = solution / f"{solution.stem}_data.json"

            ir_temp1 = solution / ".autopilot/db/temp.1.ll"
            ir_temp2 = solution / ".autopilot/db/temp.2.ll"
            ir_mod = solution / ".autopilot/db/final.ll"

            ir_posix = ir.as_posix()
            ir_temp1_posix = ir_temp1.as_posix()
            ir_temp2_posix = ir_temp2.as_posix()
            ir_mod_posix = ir_mod.as_posix()

            try:
                subprocess.check_output(f"{OPT} -strip-debug -S < {ir_posix} > {ir_temp1_posix};", shell=True) 
                subprocess.check_output(f"{OPT} -mem2reg -S < {ir_temp1_posix} > {ir_temp2_posix};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-ir-gnn -S < {ir_temp2_posix} > {ir_temp1_posix};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md -S < {ir_temp1_posix} > {ir_temp2_posix};", shell=True)
                if directives:
                    tcl_path = solution / "directives.tcl"
                    create_directives_tcl(solution_data_json, tcl_path)
                    tcl_path = tcl_path.as_posix()
                    subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -set-hls-md -tcl {tcl_path} -S < {ir_temp2_posix} > {ir_temp1_posix};", shell=True)
                    subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -rename -S < {ir_temp1_posix} > {ir_mod_posix};", shell=True)
                else:
                    subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -rename -S < {ir_temp2_posix} > {ir_mod_posix};", shell=True)
                
            except subprocess.CalledProcessError as e:
                print(f"Error processing {solution}")
                print(e)
                ir_temp1.unlink()
                ir_temp2.unlink()
                ir_mod.unlink()
                continue

            ir_temp1.unlink()
            ir_temp2.unlink()

            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                ir_mod.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, bram, cp = parse_impl_rpt(xml_rpt_file)

            with open(instance_folder / "lut.txt", "w") as f:
                f.write(f"{lut}\n")

            with open(instance_folder / "ff.txt", "w") as f:
                f.write(f"{ff}\n")

            with open(instance_folder / "dsp.txt", "w") as f:
                f.write(f"{dsp}\n")

            with open(instance_folder / "bram.txt", "w") as f:
                f.write(f"{bram}\n")

            with open(instance_folder / "cp.txt", "w") as f:
                f.write(f"{cp}\n")

            cdfg = build_cdfg(ir_mod)

            with open(instance_folder / "cdfg.pkl", "wb") as f:
                pickle.dump(cdfg, f)