from pathlib import Path
from sys import argv

import json, pickle, subprocess

from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.utils.custom_dfg import get_dfg_pre_directives_lut_ff, \
                                        get_dfg_post_directives_lut_ff, \
                                        get_dfg_pre_directives_dsp, \
                                        get_dfg_post_directives_dsp

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
    n_projects = len(projects)

    train_dataset_folder = processed_dataset_folder_path / "train"
    test_dataset_folder = processed_dataset_folder_path / "test"
    train_dataset_folder.mkdir(parents=True, exist_ok=True)
    test_dataset_folder.mkdir(parents=True, exist_ok=True)

    for i, project in enumerate(projects):
        # Leave last benchmark for testing
        if i == n_projects - 1:
            project_folder = test_dataset_folder / project.stem
        else:
            project_folder = train_dataset_folder / project.stem
        project_folder.mkdir(parents=True, exist_ok=True)
        solutions = sorted(list(project.iterdir()))
        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue
            
            ir_pre_dirs = solution / ".autopilot/db/a.g.ld.5.gdce.bc"
            ir_post_dirs = solution / ".autopilot/db/a.o.3.bc"

            if not ir_pre_dirs.exists() or not ir_post_dirs.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            ir_post_dirs_temp_1 = solution / ".autopilot/db/a.o.4.t1.bc"
            ir_post_dirs_temp_2 = solution / ".autopilot/db/a.o.4.t2.bc"
            ir_post_dirs_mod = solution / ".autopilot/db/a.o.4.bc"

            subprocess.check_output(f"{OPT} -strip-debug < {ir_post_dirs.as_posix()} > {ir_post_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg < {ir_post_dirs_temp_1.as_posix()} > {ir_post_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -instcombine -loop-simplify -indvars -mergereturn -argpromotion -inline < {ir_post_dirs_temp_2.as_posix()} > {ir_post_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_post_dirs_temp_1.as_posix()} > {ir_post_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_post_dirs_temp_2.as_posix()} > {ir_post_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_post_dirs_temp_1.as_posix()} > {ir_post_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            ir_post_dirs_temp_1.unlink()
            ir_post_dirs_temp_2.unlink()

            ir_pre_dirs_temp_1 = solution / ".autopilot/db/a.g.ld.5.gdce.t1.bc"
            ir_pre_dirs_temp_2 = solution / ".autopilot/db/a.g.ld.5.gdce.t2.bc"
            ir_pre_dirs_mod = solution / ".autopilot/db/a.g.6.bc"

            subprocess.check_output(f"{OPT} -strip-debug < {ir_pre_dirs.as_posix()} > {ir_pre_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -mem2reg < {ir_pre_dirs_temp_1.as_posix()} > {ir_pre_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -instcombine -loop-simplify -indvars -mergereturn -argpromotion -inline < {ir_pre_dirs_temp_2.as_posix()} > {ir_pre_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -preprocess-vitis-ir < {ir_pre_dirs_temp_1.as_posix()} > {ir_pre_dirs_temp_2.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_pre_dirs_temp_2.as_posix()} > {ir_pre_dirs_temp_1.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_pre_dirs_temp_1.as_posix()} > {ir_pre_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            ir_pre_dirs_temp_1.unlink()
            ir_pre_dirs_temp_2.unlink()

            instance_folder = project_folder / solution.stem
            instance_folder.mkdir(parents=True, exist_ok=True)

            instance_post_dir_dfg = instance_folder / "dfg_pre_dirs.txt"
            instance_pre_dir_dfg = instance_folder / "dfg_post_dirs.txt"
            instance_lut_label = instance_folder / "lut_label.txt"
            instance_ff_label = instance_folder / "ff_label.txt"
            instance_dsp_label = instance_folder / "dsp_label.txt"
            instance_cp_label = instance_folder / "cp_label.txt"

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -dfg -df {instance_post_dir_dfg.as_posix()} < {ir_post_dirs_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -dfg -df {instance_pre_dir_dfg.as_posix()} < {ir_pre_dirs_mod.as_posix()};",\
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

            ff, lut, dsp, cp = parse_impl_rpt(xml_rpt_file)
            with open(instance_lut_label, "w") as f_lut, open(instance_ff_label, "w") as f_ff, open(instance_dsp_label, "w") as f_dsp:
                f_lut.write(f"{lut}\n")
                f_ff.write(f"{ff}\n")
                f_dsp.write(f"{dsp}\n")
            
            with open(instance_cp_label, "w") as f:
                f.write(f"{cp}\n")

            node_features_post_dirs_lut_ff, adj_mat_post_dirs_lut_ff = get_dfg_post_directives_lut_ff(instance_post_dir_dfg)
            dfg_post_dirs_lut_ff = (node_features_post_dirs_lut_ff, adj_mat_post_dirs_lut_ff)
            node_features_pre_dirs_lut_ff, adj_mat_pre_dirs_lut_ff = get_dfg_pre_directives_lut_ff(instance_pre_dir_dfg)
            dfg_pre_dirs_lut_ff = (node_features_pre_dirs_lut_ff, adj_mat_pre_dirs_lut_ff)

            node_features_post_dirs_dsp, adj_mat_post_dirs_dsp = get_dfg_post_directives_dsp(instance_post_dir_dfg)
            dfg_post_dirs_dsp = (node_features_post_dirs_dsp, adj_mat_post_dirs_dsp)
            node_features_pre_dirs_dsp, adj_mat_pre_dirs_dsp = get_dfg_pre_directives_dsp(instance_pre_dir_dfg)
            dfg_pre_dirs_dsp = (node_features_pre_dirs_dsp, adj_mat_pre_dirs_dsp)

            dfg_pre_dirs_lut_ff_pkl = instance_folder / "dfg_pre_dirs_lut_ff.pkl"
            with open(dfg_pre_dirs_lut_ff_pkl, "wb") as f:
                pickle.dump(dfg_pre_dirs_lut_ff, f)

            dfg_post_dirs_lut_ff_pkl = instance_folder / "dfg_post_dirs_lut_ff.pkl"
            with open(dfg_post_dirs_lut_ff_pkl, "wb") as f:
                pickle.dump(dfg_post_dirs_lut_ff, f)

            dfg_pre_dirs_dsp_pkl = instance_folder / "dfg_pre_dirs_dsp.pkl"
            with open(dfg_pre_dirs_dsp_pkl, "wb") as f:
                pickle.dump(dfg_pre_dirs_dsp, f)

            dfg_post_dirs_dsp_pkl = instance_folder / "dfg_post_dirs_dsp.pkl"
            with open(dfg_post_dirs_dsp_pkl, "wb") as f:
                pickle.dump(dfg_post_dirs_dsp, f)