import json
from pathlib import Path

import numpy as np


bench_info_path = Path("data/benchmarks/benchmark_info.json")
dataset_dir = Path("../dataset-filtered")

with open(bench_info_path, "r") as f:
    bench_info_dict = json.load(f)

elapsed_times = []

max_elapsed_time = 0.0

for bench_dir in dataset_dir.iterdir():
    if not bench_dir.is_dir():
        continue

    bench_name = bench_dir.name
    if bench_name not in bench_info_dict:
        print(f"Benchmark {bench_name} not found in benchmark info.")
        continue

    bench_info = bench_info_dict[bench_name]
    last_base_index = bench_info["last_base_index"]

    for solution_dir in bench_dir.iterdir():
        if (not solution_dir.is_dir() 
            or not solution_dir.name.startswith("solution")):
            continue

        solution_index = int(solution_dir.name.split("solution")[-1])
        if solution_index <= last_base_index:
            continue

        log_file = solution_dir / f"{solution_dir.name}.log"
        if not log_file.exists():
            print(f"Log file {log_file} does not exist for {bench_name} solution {solution_index}.")
            continue

        with open(log_file, "r") as f:
            lines = f.readlines()

        total_elapsed_time = 0.0

        start_index = 0
        for i, line in enumerate(lines):
            if 'INFO: [HLS 200-1505]' in line:
                start_index = i

        lines = lines[start_index:]  # Process only from the first occurrence of the marker
        finished = False

        for line in lines:
            # if 'INFO: [HLS 200-1505]' in line:
            #     total_elapsed_time = 0.0  # Reset for each solution

            if 'Elapsed time: ' in line:
                time_str = line.split('Elapsed time: ')[1].split(' ')[0]
                try:
                    elapsed_time = float(time_str)
                except ValueError:
                    print(f"Could not parse elapsed time from line: {line.strip()}")
                    elapsed_time = 0.0
                total_elapsed_time += elapsed_time

            if "INFO: [HLS 200-111] Finished Command csynth_design" in line:
                finished = True
                break

        # if not finished:
        #     print(f"Solution {solution_index} for benchmark {bench_name} did not finish properly.")
        #     continue

        if total_elapsed_time > max_elapsed_time:
            max_elapsed_time = total_elapsed_time
            print(f"New max elapsed time found: {max_elapsed_time:.2f} seconds for {bench_name} solution {solution_index}")

        elapsed_times.append(total_elapsed_time)

# Convert to numpy array for easier statistics
elapsed_times = np.array(elapsed_times)

# Calculate statistics
mean_time = np.mean(elapsed_times)
std_time = np.std(elapsed_times)
max_time = np.max(elapsed_times)
min_time = np.min(elapsed_times)
# Print statistics
print(f"Mean elapsed time: {mean_time:.2f} seconds")
print(f"Standard deviation of elapsed time: {std_time:.2f} seconds")
print(f"Maximum elapsed time: {max_time:.2f} seconds")
print(f"Minimum elapsed time: {min_time:.2f} seconds")