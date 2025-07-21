import json
from pathlib import Path

import numpy as np


def extract_hls_elapsed_time(solution_dir: Path) -> float:
    log_file = solution_dir / f"{solution_dir.name}.log"
    if not log_file.exists():
        print(f"Log file {log_file} does not exist for {solution_dir.name}.")
        return -1.0

    with open(log_file, "r") as f:
        lines = f.readlines()

    start_index = 0
    for i, line in enumerate(lines):
        if 'INFO: [HLS 200-1505]' in line:
            start_index = i

    lines = lines[start_index:]

    total_elapsed_time = 0.0
    for line in lines:
        if 'Elapsed time: ' in line:
            time_str = line.split('Elapsed time: ')[1].split(' ')[0]
            try:
                elapsed_time = float(time_str)
            except ValueError:
                print(f"Could not parse elapsed time from line: {line.strip()}")
                elapsed_time = 0.0
            total_elapsed_time += elapsed_time

        if ('INFO: [HLS 200-111] Finished Command csynth_design' in line 
            or 'INFO: [HLS 200-111] Finished Generating all RTL models' in line):
            break

    return total_elapsed_time


def extract_impl_elapsed_time(solution_dir: Path) -> float:
    log_file = solution_dir / "reports/impl_runme.log"
    if not log_file.exists():
        print(f"Log file {log_file} does not exist for {solution_dir.name}.")
        return -1.0

    with open(log_file, "r") as f:
        lines = f.readlines()

    total_elapsed_time = 0.0
    prev_reported_time = 0.0
    for line in lines:
        if 'elapsed = ' in line:
            time_str = line.split('elapsed = ')[1].split(' ')[0]
            hours, minutes, seconds = time_str.split(':')
            total_seconds = int(hours) * 3600 + int(minutes) * 60 + float(seconds)
            elapsed_time = total_seconds
            if elapsed_time < prev_reported_time:
                total_elapsed_time += prev_reported_time
            prev_reported_time = elapsed_time

    return total_elapsed_time


def summarize_timing_info(dataset_dir: Path):
    benchmark_info_path = Path("data/benchmarks/benchmark_info.json")
    with open(benchmark_info_path, "r") as f:
        bench_info_dict = json.load(f)

    elapsed_times_base_hls = []
    elapsed_times_base_impl = []
    elapsed_times_non_base_hls = []
    elapsed_times_non_base_impl = []

    for bench_dir in dataset_dir.iterdir():
        if not bench_dir.is_dir():
            continue

        bench_name = bench_dir.name
        print(f"Processing benchmark: {bench_name}")

        benchmark_info = bench_info_dict[bench_name]
        last_base_index = benchmark_info["last_base_index"]

        for solution_dir in bench_dir.iterdir():
            if (not solution_dir.is_dir() 
                or not solution_dir.name.startswith("solution")
                or solution_dir.name == "solution0"):
                continue

            solution_index = int(solution_dir.name.split("solution")[-1])

            hls_elapsed_time = extract_hls_elapsed_time(solution_dir)
            if hls_elapsed_time < 1 or hls_elapsed_time > 2000: # Ignore extreme values
                continue

            impl_elapsed_time = extract_impl_elapsed_time(solution_dir)
            impl_elapsed_time += hls_elapsed_time
            if impl_elapsed_time < 1 or impl_elapsed_time > 10000: # Ignore extreme values
                continue

            if solution_index <= last_base_index:
                elapsed_times_base_hls.append(hls_elapsed_time)
                elapsed_times_base_impl.append(impl_elapsed_time)
            else:
                elapsed_times_non_base_hls.append(hls_elapsed_time)
                elapsed_times_non_base_impl.append(impl_elapsed_time)

    elapsed_times_base_hls = np.array(elapsed_times_base_hls)
    elapsed_times_base_impl = np.array(elapsed_times_base_impl)
    elapsed_times_non_base_hls = np.array(elapsed_times_non_base_hls)
    elapsed_times_non_base_impl = np.array(elapsed_times_non_base_impl)

    stats = {
        "base_hls": {
            "mean": np.mean(elapsed_times_base_hls),
            "std": np.std(elapsed_times_base_hls),
            "max": np.max(elapsed_times_base_hls),
            "min": np.min(elapsed_times_base_hls)
        },
        "base_impl": {
            "mean": np.mean(elapsed_times_base_impl),
            "std": np.std(elapsed_times_base_impl),
            "max": np.max(elapsed_times_base_impl),
            "min": np.min(elapsed_times_base_impl)
        },
        "non_base_hls": {
            "mean": np.mean(elapsed_times_non_base_hls),
            "std": np.std(elapsed_times_non_base_hls),
            "max": np.max(elapsed_times_non_base_hls),
            "min": np.min(elapsed_times_non_base_hls)
        },
        "non_base_impl": {
            "mean": np.mean(elapsed_times_non_base_impl),
            "std": np.std(elapsed_times_non_base_impl),
            "max": np.max(elapsed_times_non_base_impl),
            "min": np.min(elapsed_times_non_base_impl)
        }
    }

    for key, value in stats.items():
        print(f"{key} - Mean: {value['mean']:.4f}, Std: {value['std']:.4f}, "
              f"Max: {value['max']:.4f}, Min: {value['min']:.4f}")
        

if __name__ == "__main__":
    import sys

    dataset_dir = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("../dataset-filtered")
    if not dataset_dir.exists():
        print(f"Dataset directory {dataset_dir} does not exist.")
        sys.exit(1)

    summarize_timing_info(dataset_dir)