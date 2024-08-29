from pathlib import Path
from sys import argv

import json, pickle, subprocess

from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.utils.dfg import build_dfg_for_area_estimation, build_dfg_for_area_estimation_aux

def create_directives_tcl(solution_data_json:Path, output_path:Path):
    with open(solution_data_json, "r") as f:
        data = json.load(f)
    directives_tcl = data["HlsSolution"]["DirectiveTcl"]
    with open(output_path, "w") as f:
        directives_tcl = "\n".join(directives_tcl)
        f.write(directives_tcl)

if __name__ == "__main__":
    dataset_path = Path(argv[1])
    processed_dataset_folder_path = Path(argv[2])

    projects = sorted(list(dataset_path.iterdir()))

    for i, project in enumerate(projects):
        project_folder = processed_dataset_folder_path / project.stem
        project_folder.mkdir(parents=True, exist_ok=True)
        solutions = sorted(list(project.iterdir()))
        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue
            
            ir_g = solution / ".autopilot/db/a.g.ld.5.gdce.bc"
            ir_o = solution / ".autopilot/db/a.o.3.bc"

            if not ir_g.exists() or not ir_o.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            ir_o_temp_1 = solution / ".autopilot/db/a.o.4.t1.bc"
            ir_o_temp_2 = solution / ".autopilot/db/a.o.4.t2.bc"
            ir_o_mod = solution / ".autopilot/db/a.o.4.bc"

            subprocess.check_output(f"{OPT} -strip-debug < {ir_o.as_posix()} > {ir_o_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg < {ir_o_temp_1.as_posix()} > {ir_o_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -instcombine -loop-simplify -indvars -mergereturn -argpromotion -inline < {ir_o_temp_2.as_posix()} > {ir_o_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_o_temp_1.as_posix()} > {ir_o_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_o_temp_2.as_posix()} > {ir_o_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_o_temp_1.as_posix()} > {ir_o_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            ir_o_temp_1.unlink()
            ir_o_temp_2.unlink()

            ir_g_temp_1 = solution / ".autopilot/db/a.g.ld.5.gdce.t1.bc"
            ir_g_temp_2 = solution / ".autopilot/db/a.g.ld.5.gdce.t2.bc"
            ir_g_mod = solution / ".autopilot/db/a.g.6.bc"

            subprocess.check_output(f"{OPT} -strip-debug < {ir_g.as_posix()} > {ir_g_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg < {ir_g_temp_1.as_posix()} > {ir_g_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -instcombine -loop-simplify -indvars -mergereturn -argpromotion -inline < {ir_g_temp_2.as_posix()} > {ir_g_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_g_temp_1.as_posix()} > {ir_g_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_g_temp_2.as_posix()} > {ir_g_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_g_temp_1.as_posix()} > {ir_g_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            ir_g_temp_1.unlink()
            ir_g_temp_2.unlink()

            instance_folder = project_folder / solution.stem
            instance_folder.mkdir(parents=True, exist_ok=True)

            instance_o_dfg = instance_folder / "dfg_o.txt"
            instance_g_dfg = instance_folder / "dfg_g.txt"
            instance_resource_labels = instance_folder / "resource_labels.txt"
            instance_timing_labels = instance_folder / "timing_labels.txt"

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -dfg -df {instance_o_dfg.as_posix()} < {ir_o_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -dfg -df {instance_g_dfg.as_posix()} < {ir_g_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)

            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                instance_o_dfg.unlink()
                instance_g_dfg.unlink()
                ir_o_mod.unlink()
                ir_g_mod.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, cp = parse_impl_rpt(xml_rpt_file)
            with open(instance_resource_labels, "w") as f:
                f.write(f"{ff},{lut},{dsp}\n")
            
            with open(instance_timing_labels, "w") as f:
                f.write(f"{cp}\n")

            node_features_o, adj_mat_o = build_dfg_for_area_estimation(instance_o_dfg)
            dfg_o = (node_features_o, adj_mat_o)
            instance_dfg_o_pickle = instance_folder / "dfg_o.pkl"
            with open(instance_dfg_o_pickle, "wb") as f:
                pickle.dump(dfg_o, f)

            node_features_g, adj_mat_g = build_dfg_for_area_estimation_aux(instance_g_dfg)
            dfg_g = (node_features_g, adj_mat_g)
            instance_dfg_g_pickle = instance_folder / "dfg_g.pkl"
            with open(instance_dfg_g_pickle, "wb") as f:
                pickle.dump(dfg_g, f)