import json
from pathlib import Path
from typing import List, Optional

import numpy as np


def find_lines_containing(lines: List[str], search_str: str) -> List[str]:
    """
    Find all lines in the list that contain the specified search string.
    
    Args:
        lines (List[str]): List of lines to search through.
        search_str (str): The string to search for in each line.
    
    Returns:
        List[str]: List of lines that contain the search string.
    """
    return [line for line in lines if search_str in line]


def find_line_containing(
    lines: List[str], 
    search_str: str, 
    start_index: int = 0, 
    get_last: bool = False,
) -> Optional[int]:
    num_lines = len(lines)
    if start_index < 0 or start_index >= num_lines:
        print(f"Invalid start index {start_index} for lines of length {num_lines}.")
        return None

    if get_last:
        for i in range(num_lines - 1, start_index - 1, -1):
            if search_str in lines[i]:
                return i
        return None
    
    for i in range(start_index, num_lines):
        if search_str in lines[i]:
            return i
    return None

def get_elapsed_time_from_line_hls(line: str) -> float:
    if 'Elapsed time: ' in line:
        time_str = line.split('Elapsed time: ')[1].split(' ')[0]
        try:
            return float(time_str)
        except ValueError:
            print(f"Could not parse elapsed time from line: {line.strip()}")
            return -1.0
    return -1.0


def get_elapsed_time_from_line_impl(line: str) -> float:
    if 'elapsed = ' in line:
        time_str = line.split('elapsed = ')[1].split(' ')[0]
        hours, minutes, seconds = time_str.split(':')
        try:
            total_seconds = int(hours) * 3600 + int(minutes) * 60 + float(seconds)
            return total_seconds
        except ValueError:
            print(f"Could not parse elapsed time from line: {line.strip()}")
            return -1.0
    return -1.0


def extract_hls_elapsed_time(solution_dir: Path) -> float:
    log_file = solution_dir / f"{solution_dir.name}.log"
    if not log_file.exists():
        print(f"Log file {log_file} does not exist for {solution_dir.name}.")
        return -1.0

    with open(log_file, "r") as f:
        lines = f.readlines()

    finished_csynth_idx = find_line_containing(
        lines, 'INFO: [HLS 200-111] Finished Command csynth_design', get_last=True
    )
    if finished_csynth_idx is not None:
        finished_csynth_line = lines[finished_csynth_idx]
        csynth_time = get_elapsed_time_from_line_hls(finished_csynth_line)
        if csynth_time >= 0:
            return csynth_time

    # Some logs of failed runs may not have been deleted and the 
    # log of the successful run may have been appended to it.
    # We will search for the last occurrence of the command indicating
    # the start of the synthesis process and start parsing from there.
    start_index = find_line_containing(lines, 'INFO: [HLS 200-1505]', get_last=True)
    if start_index is None:
        print(f"Could not find the start of synthesis in {log_file}.")
        return -1.0

    lines = lines[start_index:]
    csynth_time = 0.0

    finished_compiling_opt_idx = find_line_containing(
        lines, 'INFO: [HLS 200-111] Finished Compiling Optimization and Transform'
    )
    if finished_compiling_opt_idx is not None:
        finished_compiling_opt_line = lines[finished_compiling_opt_idx]
        elapsed_time = get_elapsed_time_from_line_hls(finished_compiling_opt_line)
        if elapsed_time >= 0:
            csynth_time += elapsed_time
        else:
            lines_before_compiling_opt = find_lines_containing(
                lines[:finished_compiling_opt_idx], 'Elapsed time: '
            )
            for line in lines_before_compiling_opt:
                elapsed_time = get_elapsed_time_from_line_hls(line)
                if elapsed_time >= 0:
                    csynth_time += elapsed_time
        lines = lines[finished_compiling_opt_idx + 1:]

    finished_arch_synth_idx = find_line_containing(
        lines, 'INFO: [HLS 200-111] Finished Architecture Synthesis'
    )
    if finished_arch_synth_idx is not None:
        finished_arch_synth_line = lines[finished_arch_synth_idx]
        elapsed_time = get_elapsed_time_from_line_hls(finished_arch_synth_line)
        if elapsed_time >= 0:
            csynth_time += elapsed_time
        else:
            lines_before_arch_synth = find_lines_containing(
                lines[:finished_arch_synth_idx], 'Elapsed time: '
            )
            for line in lines_before_arch_synth:
                elapsed_time = get_elapsed_time_from_line_hls(line)
                if elapsed_time >= 0:
                    csynth_time += elapsed_time
        lines = lines[finished_arch_synth_idx + 1:]

    finished_rtl_gen_idx = find_line_containing(
        lines, 'INFO: [HLS 200-111] Finished Generating all RTL models'
    )
    if finished_rtl_gen_idx is not None:
        finished_rtl_gen_line = lines[finished_rtl_gen_idx]
        elapsed_time = get_elapsed_time_from_line_hls(finished_rtl_gen_line)
        if elapsed_time >= 0:
            csynth_time += elapsed_time
        else:
            lines_before_rtl_gen = find_lines_containing(
                lines[:finished_rtl_gen_idx], 'Elapsed time: '
            )
            for line in lines_before_rtl_gen:
                elapsed_time = get_elapsed_time_from_line_hls(line)
                if elapsed_time >= 0:
                    csynth_time += elapsed_time
    else:
        lines_with_elapsed_time = find_lines_containing(lines, 'Elapsed time: ')
        for line in lines_with_elapsed_time:
            elapsed_time = get_elapsed_time_from_line_hls(line)
            if elapsed_time >= 0:
                csynth_time += elapsed_time

    return csynth_time


def extract_synth_elapsed_time(solution_dir: Path) -> float:
    log_file = solution_dir / "reports/synth_runme.log"
    if not log_file.exists():
        print(f"Log file {log_file} does not exist for {solution_dir.name}.")
        return -1.0
    
    with open(log_file, "r") as f:
        lines = f.readlines()

    finished_synth_idx = find_line_containing(lines, 'synth_design: ')
    if finished_synth_idx is None:
        print(f"Could not find 'synth_design' in {log_file}.")
        return -1.0
    
    finished_synth_line = lines[finished_synth_idx]
    elapsed_time = get_elapsed_time_from_line_impl(finished_synth_line)
    if elapsed_time < 0:
        print(f"Could not parse elapsed time from line: {finished_synth_line.strip()}")
        return -1.0
    
    return elapsed_time


def extract_impl_elapsed_time(solution_dir: Path) -> float:
    log_file = solution_dir / "reports/impl_runme.log"
    if not log_file.exists():
        print(f"Log file {log_file} does not exist for {solution_dir.name}.")
        return -1.0

    with open(log_file, "r") as f:
        lines = f.readlines()

    place_completed_idx = find_line_containing(lines, 'place_design: ')
    if place_completed_idx is None:
        print(f"Could not find 'place_design' in {log_file}.")
        return -1.0

    route_completed_idx = find_line_containing(lines, 'route_design: ')
    if route_completed_idx is None:
        print(f"Could not find 'route_design' in {log_file}.")
        return -1.0
    
    place_completed_line = lines[place_completed_idx]
    route_completed_line = lines[route_completed_idx]

    place_elapsed_time = get_elapsed_time_from_line_impl(place_completed_line)
    if place_elapsed_time < 0:
        print(f"Could not parse elapsed time from line: {place_completed_line.strip()}")
        return -1.0
    
    route_elapsed_time = get_elapsed_time_from_line_impl(route_completed_line)
    if route_elapsed_time < 0:
        print(f"Could not parse elapsed time from line: {route_completed_line.strip()}")
        return -1.0
    
    return place_elapsed_time + route_elapsed_time


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
            if hls_elapsed_time < 0:
                print(f"Skipping {solution_dir.name} due to missing HLS time.")
                continue

            synth_elaped_time = extract_synth_elapsed_time(solution_dir)
            if synth_elaped_time < 0:
                print(f"Skipping {solution_dir.name} due to missing synthesis time.")
                continue
            
            impl_elapsed_time = extract_impl_elapsed_time(solution_dir)
            if impl_elapsed_time < 0:
                print(f"Skipping {solution_dir.name} due to missing implementation time.")
                continue

            total_elapsed_time = hls_elapsed_time + synth_elaped_time + impl_elapsed_time

            if solution_index <= last_base_index:
                elapsed_times_base_hls.append(hls_elapsed_time)
                elapsed_times_base_impl.append(total_elapsed_time)
            else:
                elapsed_times_non_base_hls.append(hls_elapsed_time)
                elapsed_times_non_base_impl.append(total_elapsed_time)

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