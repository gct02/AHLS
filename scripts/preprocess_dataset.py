from pathlib import Path
from sys import argv

import json

from utils.parsers import parse_impl_rpt
from llvm.opt_utils import *

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
        solutions = sorted(list(project.iterdir()))
        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue

            ir = solution / ".autopilot/db/a.o.3.bc"

            if not ir.exists():
                print(f"File not found: {ir}")
                continue

            ir_mod_temp = solution / ".autopilot/db/a.o.4.temp.bc"
            ir_mod = solution / ".autopilot/db/a.o.4.bc"

            subprocess.check_output(f"{OPT} -strip-debug -mem2reg -instcombine -loop-simplify -indvars < {ir.as_posix()} > {ir_mod_temp.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_mod_temp.as_posix()} > {ir_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_mod.as_posix()} > {ir_mod_temp.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            ir_mod.unlink()
            ir_mod_temp.rename(ir_mod)

            instance_name = f"{project.stem}_{solution.stem}"
            instance_folder = processed_dataset_folder_path / instance_name
            instance_folder.mkdir(parents=True, exist_ok=True)

            instance_dfg = instance_folder / "dfg.txt"
            instance_resource_labels = instance_folder / "resource_labels.txt"
            instance_timing_labels = instance_folder / "timing_labels.txt"

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -get-dfg -dfg-file {instance_dfg.as_posix()} < {ir_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"

            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                instance_dfg.unlink()
                instance_folder.rmdir()
                continue

            ff, lut, dsp, cp = parse_impl_rpt(xml_rpt_file)
            with open(instance_resource_labels, "w") as f:
                f.write(f"{ff},{lut},{dsp}\n")
            
            with open(instance_timing_labels, "w") as f:
                f.write(f"{cp}\n")