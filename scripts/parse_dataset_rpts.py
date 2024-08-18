from pathlib import Path
from sys import argv

from utils.parsers import parse_impl_rpt

if __name__ == "__main__":
    dataset_path = Path(argv[1])
    ff_file_path = Path(argv[2])
    lut_file_path = Path(argv[3])
    cp_file_path = Path(argv[4])

    ff_file = open(ff_file_path, 'w')
    lut_file = open(lut_file_path, 'w')
    cp_file = open(cp_file_path, 'w')

    projects = sorted(list(dataset_path.iterdir()))

    for project in projects:
        solutions = sorted(list(project.iterdir()))
        for solution in solutions:
            if not solution.is_dir():
                continue
            xml_rpt_file = solution / "impl/report/verilog/export_impl.xml"
            if not xml_rpt_file.exists():
                print(f"File not found: {xml_rpt_file}")
                continue
            ff, lut, cp = parse_impl_rpt(xml_rpt_file)
            ff_file.write(f"{ff}\n")
            lut_file.write(f"{lut}\n")
            cp_file.write(f"{cp}\n")

    ff_file.close()
    lut_file.close()
    cp_file.close()
