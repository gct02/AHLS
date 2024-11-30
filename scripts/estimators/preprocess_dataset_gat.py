import pickle, subprocess
from pathlib import Path
from sys import argv
from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *
from estimators.gat.dfg import build_module_dfg

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
            
            ir = solution / ".autopilot/db/a.o.3.bc"
            if not ir.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            ir_tmp1 = solution / ".autopilot/db/a.o.3.t1.ll"
            ir_tmp2 = solution / ".autopilot/db/a.o.3.t2.ll"
            ir_mod = solution / ".autopilot/db/a.o.4.ll"

            ir_path = ir.as_posix()
            ir_tmp1_path = ir_tmp1.as_posix()
            ir_tmp2_path = ir_tmp2.as_posix()
            ir_mod_path = ir_mod.as_posix()

            try:
                subprocess.check_output(
                    f"{OPT} -strip-debug -S < {ir_path} > {ir_tmp1_path};",
                    shell=True
                ) 
                subprocess.check_output(
                    f"{OPT} -mem2reg -S < {ir_tmp1_path} > {ir_tmp2_path};",
                    shell=True
                )
                subprocess.check_output(
                    f"{OPT} -load {AHLS_LLVM_LIB} -prepgnn -S < {ir_tmp2_path} > {ir_tmp1_path};",
                    shell=True
                )
                subprocess.check_output(
                    f"{OPT} -load {AHLS_LLVM_LIB} -update-md -S < {ir_tmp1_path} > {ir_tmp2_path};",
                    shell=True
                )
                subprocess.check_output(
                    f"{OPT} -load {AHLS_LLVM_LIB} -rmspec -S < {ir_tmp2_path} > {ir_tmp1_path};",
                    shell=True
                )
            except subprocess.CalledProcessError as e:
                print(f"Error processing {solution}")
                print(e)
                ir_tmp1.unlink()
                ir_tmp2.unlink()
                ir_mod.unlink()
                continue

            ir_tmp1.unlink()
            ir_tmp2.unlink()

            dfg_txt = solution / "dfg.txt"
            dfg_txt_path = dfg_txt.as_posix()
            try:
                subprocess.check_output(
                    f"{OPT} -load {AHLS_LLVM_LIB} -mdfg -gout {dfg_txt_path} < {ir_mod_path};", 
                    shell=True
                )
            except subprocess.CalledProcessError as e:
                print(f"Error processing {solution}")
                print(e)
                ir_mod.unlink()
                if dfg_txt.exists():
                    dfg_txt.unlink()
                continue

            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                dfg_txt.unlink()
                ir_mod.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, bram, cp = parse_impl_rpt(xml_rpt_file)

            with open(instance_folder / "targets.txt", "w") as f:
                f.write(f"lut {lut}\nff {ff}\ndsp {dsp}\nbram {bram}\ncp {cp}\n")
                
            dfg = build_module_dfg(dfg_txt)

            with open(instance_folder / "dfg.pkl", "wb") as f:
                pickle.dump(dfg, f)