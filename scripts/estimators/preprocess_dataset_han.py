import pickle, subprocess, argparse
from pathlib import Path
from utils.parsers import *
from llvm.opt_utils import *
from estimators.han.cdfg import build_cdfg

def parse_args():
    parser = argparse.ArgumentParser(
        description="Create CDFGs for the IRs of the Vitis HLS projects in the given folder"
    )
    parser.add_argument("-d", "--dataset", help="Path to the original dataset folder", required=True)
    parser.add_argument("-o", "--output", help="Path where the processed dataset should be written", required=True)
    parser.add_argument("-f", "--filtered", help="Signal that the dataset is filtered", action="store_true")
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    dataset = Path(args.dataset)
    output_folder_path = Path(args.output)
    filtered = args.filtered

    benchmarks = sorted(list(dataset.iterdir()))

    for i, benchmark in enumerate(benchmarks):
        benchmark_name = benchmark.stem
        benchmark_folder = output_folder_path / benchmark_name
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

            ir = solution / ".autopilot/db/a.g.ld.0.bc"
            if not ir.exists():
                print(f"Intermediate representation not found for {solution}")
                continue

            ir_t1 = solution / ".autopilot/db/a.g.ld.0.t1.ll"
            ir_t2 = solution / ".autopilot/db/a.g.ld.0.t2.ll"
            ir_han = solution / ".autopilot/db/a.g.ld.0.han.ll"

            ir_path = ir.as_posix()
            ir_t1_path = ir_t1.as_posix()
            ir_t2_path = ir_t2.as_posix()
            ir_han_path = ir_han.as_posix()

            directives_path = solution / f"{solution.stem}_data.directive"
            if not directives_path.exists():
                print(f"Directives file not found for {solution}")
                continue

            directives_path = directives_path.as_posix()

            try:
                # Preprocess the IR, applying a series of transformations 
                # to make the CDFG more compact and easier to analyze
                subprocess.check_output(f"{OPT} -strip-debug -S < {ir_path} > {ir_t1_path};", shell=True)
                subprocess.check_output(f"{OPT} -strip-dead-prototypes -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -instnamer -S < {ir_t2_path} > {ir_t1_path};", shell=True)
                subprocess.check_output(f"{OPT} -indirectbr-expand -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -lowerinvoke -lowerswitch -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -mem2reg -dce -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -prep-gnn -S < {ir_t2_path} > {ir_t1_path};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -rm-spec -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -dce -S < {ir_t2_path} > {ir_t1_path};", shell=True)
                subprocess.check_output(f"{OPT} -strip-dead-prototypes -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md -S < {ir_t2_path} > {ir_t1_path};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -set-hls-md -dir {directives_path} -S < {ir_t1_path} > {ir_t2_path};", shell=True)
                subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -rename-vals -S < {ir_t2_path} > {ir_han_path};", shell=True)
            except subprocess.CalledProcessError as e:
                print(f"Error processing {solution}: {e}")
                ir_t1.unlink(missing_ok=True)
                ir_t2.unlink(missing_ok=True)
                ir_han.unlink(missing_ok=True)
                continue
            
            ir_t1.unlink()
            ir_t2.unlink()

            lut, bram, ff, dsp, clb, latch = extract_utilization(dataset, benchmark_name, solution.stem, filtered)
            wns, tns, target_clk, achieved_clk = extract_timing_summary(dataset, benchmark_name, solution.stem, filtered)
            cc = extract_hls_cc_report(dataset, benchmark_name, solution.stem, filtered)
            
            with open(instance_folder / "targets.txt", "w") as f:
                f.write(f"lut {lut}\nff {ff}\ndsp {dsp}\nbram {bram}\ncp {target_clk}\ncc {cc}\n")

            cdfg = build_cdfg(ir_han)

            with open(instance_folder / "cdfg.pkl", "wb") as f:
                pickle.dump(cdfg, f)
