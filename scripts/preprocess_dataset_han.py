from pathlib import Path
from sys import argv

import json, pickle, subprocess

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

if __name__ == "__main__":
    dataset_path = Path(argv[1])
    output_folder_path = Path(argv[2])

    benchmarks = sorted(list(dataset_path.iterdir()))
    n_benchmarks = len(benchmarks)

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
            # directives_tcl_path = solution / f"directives.tcl"
            # create_directives_tcl(solution_data_json, directives_tcl_path)

            ir_temp_1 = solution / ".autopilot/db/temp.1.ll"
            ir_temp_2 = solution / ".autopilot/db/temp.2.ll"
            ir_mod = solution / ".autopilot/db/final.ll"

            try:
                subprocess.check_output(f"{OPT} -strip-debug -S < {ir.as_posix()} > {ir_temp_1.as_posix()};",\
                                        stderr=subprocess.STDOUT, shell=True)
                subprocess.check_output(f"{OPT} -mem2reg -S < {ir_temp_1.as_posix()} > {ir_temp_2.as_posix()};",\
                                        stderr=subprocess.STDOUT, shell=True)
                # subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-hls-ir-x86 -S < {ir_temp_2.as_posix()} > {ir_temp_1.as_posix()};",\
                #                         stderr=subprocess.STDOUT, shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md -S < {ir_temp_2.as_posix()} > {ir_temp_1.as_posix()};",\
                                        stderr=subprocess.STDOUT, shell=True)
                # ubprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} -S < {ir_temp_2.as_posix()} > {ir_temp_1.as_posix()};",\
                #                         stderr=subprocess.STDOUT, shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -rename -S < {ir_temp_1.as_posix()} > {ir_mod.as_posix()};",\
                                        stderr=subprocess.STDOUT, shell=True)
            except subprocess.CalledProcessError as e:
                print(f"Error processing {solution}")
                print(e)
                ir_temp_1.unlink()
                ir_temp_2.unlink()
                ir_mod.unlink()
                continue

            ir_temp_1.unlink()
            ir_temp_2.unlink()

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