from pathlib import Path
from sys import argv

import json, pickle, subprocess

from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.utils.cdfg import build_cdfg

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

            ir = solution / ".autopilot/db/a.g.ld.5.gdce.bc"

            if not ir.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            ir_temp_1 = solution / ".autopilot/db/temp.1.bc"
            ir_temp_2 = solution / ".autopilot/db/temp.2.bc"
            ir_mod = solution / ".autopilot/db/final.ll"

            subprocess.check_output(f"{OPT} -strip-debug < {ir.as_posix()} > {ir_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg < {ir_temp_1.as_posix()} > {ir_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -instcombine -loop-simplify -indvars < {ir_temp_2.as_posix()} > {ir_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            # subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_temp_1.as_posix()} > {ir_temp_2.as_posix()};",\
            #                       stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_temp_1.as_posix()} > {ir_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} -S < {ir_temp_2.as_posix()} > {ir_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            ir_temp_1.unlink()
            ir_temp_2.unlink()

            instance_folder = benchmark_folder / solution.stem
            instance_folder.mkdir(parents=True, exist_ok=True)

            instance_lut = instance_folder / "lut.txt"
            instance_ff = instance_folder / "ff.txt"
            instance_dsp = instance_folder / "dsp.txt"
            instance_cp = instance_folder / "cp.txt"

            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                ir_mod.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, bram, cp = parse_impl_rpt(xml_rpt_file)

            with open(instance_lut, "w") as f_lut, open(instance_ff, "w") as f_ff, open(instance_dsp, "w") as f_dsp:
                f_lut.write(f"{lut}\n")
                f_ff.write(f"{ff}\n")
                f_dsp.write(f"{dsp}\n")
            
            with open(instance_cp, "w") as f:
                f.write(f"{cp}\n")

            inst_nodes, var_nodes, const_nodes, inst_indexes, var_indexes, const_indexes, \
            unroll_nodes, pipeline_nodes, array_partition_nodes, unroll_indexes, pipeline_indexes, array_partition_indexes, \
            adj_mat_control, adj_mat_data, adj_mat_call, adj_mat_directives = build_cdfg(ir_mod, has_directives=True)
            cdfg = (inst_nodes, var_nodes, const_nodes, unroll_nodes, pipeline_nodes, array_partition_nodes, \
                    inst_indexes, var_indexes, const_indexes, unroll_indexes, pipeline_indexes, array_partition_indexes, \
                    adj_mat_control, adj_mat_data, adj_mat_call, adj_mat_directives)

            instance_cdfg_pkl = instance_folder / "cdfg.pkl"
            with open(instance_cdfg_pkl, "wb") as f:
                pickle.dump(cdfg, f)