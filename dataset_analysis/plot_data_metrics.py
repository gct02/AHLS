import numpy as np
import pandas as pd
import json
import matplotlib
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
from typing import List, Tuple, Union, Any
from numpy.typing import NDArray
from pathlib import Path
from argparse import ArgumentParser

def directives_to_one_hot(
    directive_index:int, 
    num_directives:int
) -> NDArray[Any]:
    one_hot = np.zeros(num_directives)
    one_hot[directive_index] = 1
    return one_hot

def find_directive_arg(
    key:str,
    arg_list:List[str]
) -> Tuple[int, Union[str, None]]:
    try:
        index = arg_list.index(key)
        return index, arg_list[index + 1]
    except ValueError:
        return -1, None

def parse_directive_tcl_cmd(
    directive_tcl_cmd:str
) -> List[str]:
    directive_type = directive_tcl_cmd.split(' ')[0]
    directive_args = directive_tcl_cmd.split(' ')[1:]

    if directive_type == 'set_directive_pipeline' \
        or directive_type == 'set_directive_loop_merge' \
        or directive_type == 'set_directive_loop_flatten':
        # All these directives have the same format:
        # set_directive_<directive_type> "<location>"
        location = directive_args[0].strip('\"')
        return [directive_type, location]

    if directive_type == 'set_directive_unroll':
        factor_index, factor = find_directive_arg('-factor', directive_args)
        if factor is not None:
            factor = int(factor)
            directive_args.pop(factor_index)
            directive_args.pop(factor_index)
        else:
            factor = 0
        location = directive_args[-1].strip('\"')
        return [directive_type, location, factor]

    if directive_type == 'set_directive_array_partition':
        partition_type_index, partition_type = find_directive_arg('-type', directive_args)
        if partition_type is None:
            partition_type = 'complete'
        else:
            directive_args.pop(partition_type_index)
            directive_args.pop(partition_type_index)
        partition_factor_index, partition_factor = find_directive_arg('-factor', directive_args)
        if partition_factor is not None:
            partition_factor = int(partition_factor)
            directive_args.pop(partition_factor_index)
            directive_args.pop(partition_factor_index)
        else:
            partition_factor = 0
        partition_dim_index, partition_dim = find_directive_arg('-dim', directive_args)
        if partition_dim is not None:
            partition_dim = int(partition_dim)
            directive_args.pop(partition_dim_index)
            directive_args.pop(partition_dim_index)
        else:
            partition_dim = 0
        partition_array = directive_args[-1]
        location = directive_args[-2].strip('\"')
        return [directive_type, location, partition_array, partition_type, partition_factor, partition_dim]

    return []

def finc_directive_in_list(
    directive: List[Union[str, int]],
    directive_list: List[List[Union[str, int]]]
) -> bool:
    for directive_in_list in directive_list:
        if directive == directive_in_list:
            return True
    return False

def get_one_hot_directives(
    directives_file:Path, 
    solution_data_json:Path
) -> NDArray[Any]:
    solution_directives_tcl = extract_solution_directives(solution_data_json)
    solution_directives = []
    for directive_tcl in solution_directives_tcl:
        parsed_directive = parse_directive_tcl_cmd(directive_tcl)
        if len(parsed_directive) > 0:
            solution_directives.append(parsed_directive)

    with open(directives_file, "r") as f:
        available_directives = json.load(f)

    one_hot_directives = []

    for directive_group in available_directives.values():
        for directive_dict in directive_group.values():
            directives = directive_dict["possible_directives"][1:]
            directive_index = 0
            for i, directive in enumerate(directives):
                parsed_directive = parse_directive_tcl_cmd(directive)
                if len(parsed_directive) == 0:
                    continue
                if finc_directive_in_list(parsed_directive, solution_directives):
                    directive_index = i + 1
                    break
            num_directives = len(directives) + 1
            one_hot_directive = directives_to_one_hot(directive_index, num_directives)
            one_hot_directives.append(one_hot_directive)

    max_directives = max(len(directive) for directive in one_hot_directives)
    for i, directive in enumerate(one_hot_directives):
        if len(directive) < max_directives:
            one_hot_directives[i] = np.pad(directive, (0, max_directives - len(directive)))
            
    one_hot_directives = np.ndarray(
        shape=(len(one_hot_directives), 2), 
        buffer=np.array(one_hot_directives)
    )

    return one_hot_directives

def extract_solution_directives(
    solution_data_json:Union[Path, str]
) -> List[str]:
    with open(solution_data_json, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    return directives

def extract_timing_summary(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> Tuple[float, float, float, float]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'
    rpt_path = f'{path}export_impl.xml'

    if Path(rpt_path).is_file() == False:
        return -1.0, -1.0, -1.0, -1.0

    tree = ET.parse(rpt_path)
    root = tree.getroot()

    wns          = root.find('TimingReport/WNS_FINAL').text
    tns          = root.find('TimingReport/TNS_FINAL').text
    target_clk   = root.find('TimingReport/TargetClockPeriod').text
    achieved_clk = root.find('TimingReport/AchievedClockPeriod').text

    return float(wns), float(tns), float(target_clk), float(achieved_clk)

def extract_utilization(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> Tuple[int, int, int, int, int, int]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'
    rpt_path = f'{path}export_impl.xml'

    if Path(rpt_path).is_file() == False:
        return -1, -1, -1, -1, -1, -1

    tree = ET.parse(rpt_path)
    root = tree.getroot()

    lut   = root.find('AreaReport/Resources/LUT').text
    bram  = root.find('AreaReport/Resources/BRAM').text
    ff    = root.find('AreaReport/Resources/FF').text
    dsp   = root.find('AreaReport/Resources/DSP').text
    clb   = root.find('AreaReport/Resources/CLB').text
    latch = root.find('AreaReport/Resources/LATCH').text

    return int(lut), int(bram), int(ff), int(dsp), int(clb), int(latch)

def extract_hls_cc_report(
    dataset_path:Union[Path, str],
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> int:
    if filtered:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/reports/csynth.xml'
    else:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/syn/report/csynth.xml'

    if Path(rpt_path).is_file() == False:
        return -1

    tree = ET.parse(rpt_path)
    root = tree.getroot()

    cc = root.find(
        'PerformanceEstimates/SummaryOfOverallLatency/Average-caseLatency'
    ).text

    return int(cc)

def organize_data(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    available_directives:Union[Path, str],
    filtered:bool=False,
    directives:bool=True
) -> Tuple[pd.DataFrame, List[NDArray[Any]]]:
    dset_dir = f'{dataset_path}/{bench_name}'
    sol_index = 1
    sol_dir = 'solution' + str(sol_index)

    list_to_df = []
    if directives:
        one_hot_directives_list = []
    else:
        one_hot_directives_list = None

    for _ in Path(dset_dir).iterdir():
        if Path(f'{dset_dir}/{sol_dir}').is_dir():
            if directives:
                solution_data_json = Path(f'{dset_dir}/{sol_dir}/solution{sol_index}_data.json')
                if solution_data_json.exists():
                    one_hot_directives = get_one_hot_directives(available_directives, solution_data_json)
                    one_hot_directives_list.append(one_hot_directives)
                else:
                    one_hot_directives_list.append(np.zeros(2))

            wns, tns, target_clk, achieved_clk = extract_timing_summary(dataset_path, bench_name, sol_dir, filtered)
            lut, bram, ff, dsp, clb, latch  = extract_utilization(dataset_path, bench_name, sol_dir, filtered)
            cc = extract_hls_cc_report(dataset_path, bench_name, sol_dir, filtered)

            if achieved_clk == -1.0 or cc == -1:
                timing = -1.0
            else:
                timing = achieved_clk * cc

            metrics = [sol_dir, lut, bram, ff, dsp, clb, latch, 
                        target_clk, achieved_clk, wns, tns, cc, timing]

            list_to_df.append(metrics)

        sol_index += 1
        sol_dir = "solution" + str(sol_index)

    cols = ['solution', 'lut', 'bram', 'ff', 'dsp', 'clb', 'latch', 
            'target_clk', 'achieved_clk', 'wns', 'tns', 'cycles', 'estimated_time']
    
    bench_dataframe = pd.DataFrame(list_to_df, columns=cols)
    
    return bench_dataframe, one_hot_directives_list

def matrix_hamming_distance(
    matrix1:NDArray[Any], 
    matrix2:NDArray[Any]
) -> Union[int, float]:
    return np.sum(matrix1 != matrix2)

def matrix_euclidean_distance(
    matrix1:NDArray[Any], 
    matrix2:NDArray[Any]
) -> float:
    return np.linalg.norm(matrix1 - matrix2)

def group_solutions_by_directives(
    one_hot_directives_list:List[NDArray[Any]],
    num_clusters:int,
    num_iter:int=100
) -> NDArray[Any]:
    num_solutions = len(one_hot_directives_list)
    centroid_indices = np.random.choice(num_solutions, num_clusters, replace=False)
    centroids = np.array([one_hot_directives_list[i] for i in centroid_indices])

    for k in range(num_iter):
        new_centroids = np.zeros(shape=centroids.shape)
        group_sizes = np.zeros(num_clusters)
        for i in range(num_solutions):
            min_distance = matrix_euclidean_distance(one_hot_directives_list[i], centroids[0])
            group = 0
            for j in range(1, num_clusters):
                distance = matrix_euclidean_distance(one_hot_directives_list[i], centroids[j])
                if distance <= min_distance:
                    min_distance = distance
                    group = j
            new_centroids[group] += one_hot_directives_list[i]
            group_sizes[group] += 1
        for i in range(num_clusters):
            if group_sizes[i] == 0:
                continue
            new_centroids[i] /= group_sizes[i]
        if np.array_equal(centroids, new_centroids):
            print(f'Converged after {k} iterations')
            break
        centroids = new_centroids

    distances = np.array(
        [[matrix_euclidean_distance(one_hot_directives_list[i], centroids[j]) for j in range(num_clusters)] for i in range(num_solutions)]
    )

    return np.argmin(distances, axis=1)

def build_graphs(
    resources_data:pd.DataFrame, 
    bench_name:str, 
    x_data:str, 
    y_data:str, 
    one_hot_directives_list:List[NDArray[Any]],
    num_clusters:int=4,
    output_folder:Union[Path, str]=None,
    directives:bool=False
):
    if directives:
        solution_groups = group_solutions_by_directives(
            one_hot_directives_list,
            num_clusters=num_clusters,
            num_iter=100
        )
        print(solution_groups)
        resources_data['group'] = solution_groups

        colors = ['red', 'blue', 'purple', 'green', 'orange']

        for i in range(num_clusters):
            group_data = resources_data[resources_data['group'] == i]
            plt.scatter(
                group_data[x_data], 
                group_data[y_data], 
                color=colors[i],
            )
    else:
        plt.scatter(resources_data[x_data], resources_data[y_data])
    
    plt.xlabel(x_data)
    plt.ylabel(y_data)
    plt.title(f'{bench_name}: {x_data} x {y_data}')
    plt.grid()

    if output_folder is not None:
        if directives:
            plt.savefig(f'{output_folder}/{bench_name}_{x_data}_{y_data}_{num_clusters}.png')
        else:
            plt.savefig(f'{output_folder}/{bench_name}_{x_data}_{y_data}.png')

    plt.show()

def parse_args():
    parser = ArgumentParser()

    parser.add_argument('-d', '--dataset', help='dataset path', required=True)
    parser.add_argument('-b', '--benchmark', help='benchmark name (if not provided, use all benchmarks available)', required=True)
    parser.add_argument('-o', '--output', help='Output folder', required=False, default=None)
    parser.add_argument('-a', '--available', help='Available directives file', required=True)
    parser.add_argument('-x', '--xdata', help='X axis data', required=False, default='lut')
    parser.add_argument('-y', '--ydata', help='Y axis data',required=False, default='estimated_time')
    parser.add_argument('-s', '--seed', help='Random seed', required=False, default=42)
    parser.add_argument('-c', '--clusters', help='Number of clusters', required=False, default=4)
    parser.add_argument('-f', '--filtered', help='Sinalize if the dataset is filtered', required=False, action='store_true', default=False)
    parser.add_argument('-dr', '--directives', help='Sinalize to plot information about directives', required=False, action='store_true', default=False)

    return parser.parse_args()

def main():
    args = parse_args()

    dataset_path = args.dataset
    bench_name = args.benchmark
    available_directives = args.available
    x_data = args.xdata
    y_data = args.ydata
    clusters = int(args.clusters)
    seed = int(args.seed)
    filtered = args.filtered
    directives = args.directives

    np.random.seed(seed)

    assert Path(f'{dataset_path}/{bench_name}').is_dir()
    data, directives = organize_data(dataset_path, bench_name, available_directives, filtered, directives)
    build_graphs(data, bench_name, x_data, y_data, directives, clusters, args.output, directives)

if __name__ == '__main__':
    main()
