from string import Template
from pathlib import Path
from sys import argv

def generate_tcl_with_input_ir(bench_suite, proj_name):
    proj_dir = f"benchmarks/{bench_suite}/{proj_name}"

    src_path = Path(proj_dir) / "src"
    src_files = " ".join(list(map(lambda x: x.as_posix(), src_path.iterdir())))

    substitutions = {
        'b': bench_suite,
        'p': proj_name,
        'f': src_files
    }

    with open('hls/template.tcl', "r") as f:
        tcl_template = Template(f.read())
    
    tcl_script = tcl_template.substitute(substitutions)

    with open(f"hls/tcl/run_{proj_name}.tcl", "w") as f:
        f.write(tcl_script)

if __name__ == "__main__":
    bench_suite = argv[1]
    bench_suite_dir = Path(f"benchmarks/{bench_suite}")
    for bench in bench_suite_dir.iterdir():
        proj_name = bench.stem
        generate_tcl_with_input_ir(bench_suite, proj_name)