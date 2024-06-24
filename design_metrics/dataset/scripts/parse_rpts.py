import os
from rpt_parser import parse_rpt
from pathlib import Path
from sys import argv

def parse_rpts_in_folder(project_folder, output_folder):
    directory = os.fsencode(project_folder)
    for folder in os.listdir(directory):
        project_folder = os.path.join(directory, folder)
        solution_impl_dir = Path(str(project_folder, 'utf-8')) / "solution1/impl"
        output_file = Path(output_folder) / (Path(str(project_folder, 'utf-8')).stem + ".csv")
        parse_rpt(solution_impl_dir, output_file)

if __name__ == "__main__":
    project_folder = argv[1]
    output_folder = argv[2]
    parse_rpts_in_folder(project_folder, output_folder)
