from typing import List, Tuple, Union

import numpy as np
import pandas as pd
from pathlib import Path
from argparse import ArgumentParser
from estimators.utils.parsers import *
from analysis.plot_data_metrics import organize_data

_DEFAULT_LUT_THRESHOLD = 400

def separate_solutions(
    solution_data: pd.DataFrame, 
    lut_threshold: int = _DEFAULT_LUT_THRESHOLD,
    one_hot_directives: pd.DataFrame = None
) -> Tuple[pd.DataFrame, pd.DataFrame]:
    # Separate solutions based on LUT usage
    lut = solution_data['lut']
    lut_mask = lut <= lut_threshold
    lut_below = solution_data[lut_mask]
    lut_above = solution_data[~lut_mask]
    if one_hot_directives is not None:
        one_hot_directives_below = []
        one_hot_directives_above = []
        for i in range(len(one_hot_directives)):
            if lut_mask[i]:
                one_hot_directives_below.append(one_hot_directives[i])
            else:
                one_hot_directives_above.append(one_hot_directives[i])
        return lut_below, lut_above, one_hot_directives_below, one_hot_directives_above
    return lut_below, lut_above

def get_most_common_directives(
    dataset_path: Union[Path, str],
    benchmark_name: str,
    solutions_to_search: List[str]
) -> List[str]:
    directives = []
    for solution in solutions_to_search:
        solution_data_json = Path(
            f'{dataset_path}/{benchmark_name}/{solution}/{solution}_data.json'
        )
        if solution_data_json.exists():
            directives += extract_solution_directives(solution_data_json)
    
    # Count the number of occurrences of each directive
    directives_count = {}
    for directive in directives:
        if directive in directives_count:
            directives_count[directive] += 1
        else:
            directives_count[directive] = 1

    # Sort the directives by the number of occurrences
    directives_sorted = sorted(
        directives_count.items(), key=lambda x: x[1], reverse=True
    )
    return directives_sorted

def parse_args():
    parser = ArgumentParser()
    parser.add_argument('-d', '--dataset', help='dataset path', required=True)
    parser.add_argument('-b', '--benchmark', help='benchmark name', required=True)
    parser.add_argument('-o', '--output_dir', help='output directory', required=True)
    parser.add_argument('-a', '--available', help='Available directives file', 
                        required=False, default=None)
    parser.add_argument('-f', '--filtered', help='Sinalize if the dataset is filtered', 
                        required=False, action='store_true', default=False)
    parser.add_argument('-lt', '--lut_threshold', help='LUT threshold', 
                        required=False, default=_DEFAULT_LUT_THRESHOLD)
    parser.add_argument('-dr', '--directives', help='Sinalize to include information about directives', 
                        required=False, action='store_true', default=False)
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args()

    dataset_path = Path(args.dataset)
    benchmark_name = args.benchmark
    output_dir = Path(args.output_dir)
    available_directives = args.available
    directives = args.directives
    lut_threshold = int(args.lut_threshold)
    filtered = args.filtered

    if available_directives is not None:
        available_directives = Path(available_directives)
        assert available_directives.is_file()

    assert Path(f'{dataset_path}/{benchmark_name}').is_dir()

    solution_data = organize_data(
        dataset_path, benchmark_name, filtered=filtered
    )
    lut_below, lut_above = separate_solutions(solution_data, lut_threshold)

    if directives:
        solutions_below = lut_below['solution'].values
        directives_sorted = get_most_common_directives(
            dataset_path, benchmark_name, solutions_below
        )
        with open(output_dir / f'commom-directives_lut-lte-{lut_threshold}_{benchmark_name}.txt', 'w') as f:
            for directive in directives_sorted:
                f.write(f'{directive}\n')

        solutions_above = lut_above['solution'].values
        directives_sorted = get_most_common_directives(
            dataset_path, benchmark_name, solutions_above
        )
        with open(output_dir / f'commom-directives_lut-gt-{lut_threshold}_{benchmark_name}.txt', 'w') as f:
            for directive in directives_sorted:
                f.write(f'{directive}\n')
        
    lut_below.to_csv(
        output_dir / f'lut_below_{lut_threshold}_{benchmark_name}.csv', index=False
    )
    lut_above.to_csv(
        output_dir / f'lut_above_{lut_threshold}_{benchmark_name}.csv', index=False
    )