import json, pickle, subprocess
from pathlib import Path
from sys import argv
from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.gat.utils.dfg import build_dfg

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

        if not project_folder.exists():
            project_folder.mkdir(parents=True, exist_ok=True)

        solutions = sorted(list(project.iterdir()))

        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue

            impl_folder = solution / "impl"
            if not impl_folder.exists():
                print(f"Implementation folder not found for {solution}")
                continue

            instance_folder = project_folder / solution.stem
            if instance_folder.exists():
                continue

            instance_folder.mkdir(parents=True, exist_ok=True)
            
            ir_pre_dirs = solution / ".autopilot/db/a.g.ld.5.gdce.bc"
            ir_post_dirs = solution / ".autopilot/db/a.o.3.bc"

            if not ir_pre_dirs.exists() or not ir_post_dirs.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            ir_post_dirs_temp_1 = solution / ".autopilot/db/a.o.3.t1.ll"
            ir_post_dirs_temp_2 = solution / ".autopilot/db/a.o.3.t2.ll"
            ir_post_dirs_mod = solution / ".autopilot/db/a.o.4.ll"

            subprocess.check_output(f"{OPT} -strip-debug -S < {ir_post_dirs.as_posix()} > {ir_post_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg -S < {ir_post_dirs_temp_1.as_posix()} > {ir_post_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-ir-gnn -S < {ir_post_dirs_temp_2.as_posix()} > {ir_post_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md -S < {ir_post_dirs_temp_1.as_posix()} > {ir_post_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)

            ir_post_dirs_temp_1.unlink()
            ir_post_dirs_temp_2.unlink()

            ir_pre_dirs_temp_1 = solution / ".autopilot/db/a.g.ld.5.gdce.t1.ll"
            ir_pre_dirs_temp_2 = solution / ".autopilot/db/a.g.ld.5.gdce.t2.ll"
            ir_pre_dirs_mod = solution / ".autopilot/db/a.g.6.ll"

            subprocess.check_output(f"{OPT} -strip-debug -S < {ir_pre_dirs.as_posix()} > {ir_pre_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg -S < {ir_pre_dirs_temp_1.as_posix()} > {ir_pre_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-ir-gnn -S < {ir_pre_dirs_temp_2.as_posix()} > {ir_pre_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md -dirmd -S < {ir_pre_dirs_temp_1.as_posix()} > {ir_pre_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -set-hls-md -tcl {directives_tcl_path.as_posix()} -S < {ir_pre_dirs_temp_2.as_posix()} > {ir_pre_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            ir_pre_dirs_temp_1.unlink()
            ir_pre_dirs_temp_2.unlink()

            instance_post_dir_dfg = instance_folder / "dfg_post_dirs.txt"
            instance_pre_dir_dfg = instance_folder / "dfg_pre_dirs.txt"

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -mdfg -gout {instance_post_dir_dfg.as_posix()} < {ir_post_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -mdfg -gout {instance_pre_dir_dfg.as_posix()} -dir < {ir_pre_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)

            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                instance_post_dir_dfg.unlink()
                instance_pre_dir_dfg.unlink()
                ir_post_dirs_mod.unlink()
                ir_pre_dirs_mod.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, bram, cp = parse_impl_rpt(xml_rpt_file)
            with open(instance_folder / "lut_label.txt", "w") as f:
                f.write(f"{lut}\n")
            with open(instance_folder / "ff_label.txt", "w") as f:
                f.write(f"{ff}\n")
            with open(instance_folder / "dsp_label.txt", "w") as f:
                f.write(f"{dsp}\n")
            with open(instance_folder / "bram_label.txt", "w") as f:
                f.write(f"{bram}\n")
            with open(instance_folder / "cp_label.txt", "w") as f:
                f.write(f"{cp}\n")

            dfg_post_dirs = build_dfg(instance_post_dir_dfg, has_directives=False, reduce_size=False)
            dfg_pre_dirs = build_dfg(instance_post_dir_dfg, has_directives=True, reduce_size=False)

            with open(instance_folder / "dfg_pre_dirs.pkl", "wb") as f:
                pickle.dump(dfg_pre_dirs, f)

            with open(instance_folder / "dfg_post_dirs.pkl", "wb") as f:
                pickle.dump(dfg_post_dirs, f)