from pathlib import Path
from sys import argv
import xml.etree.ElementTree as ET

def parse_hls_rpt(rpt_xml_file:Path):
    tree = ET.parse(rpt_xml_file)
    root = tree.getroot()
    dsp = root.findall("AreaEstimates/Resources/DSP")[0].text
    lut = root.findall("AreaEstimates/Resources/LUT")[0].text
    cp = root.findall("PerformanceEstimates/SummaryOfTimingAnalysis/EstimatedClockPeriod")[0].text
    return dsp, lut, cp

if __name__ == "__main__":
    vitis_projects_dir = Path(argv[1])
    output_cp_file = Path(argv[2])
    output_dsp_file = Path(argv[3])
    output_lut_file = Path(argv[4])

    with open(output_cp_file, 'w') as cp_file, open(output_dsp_file, 'w') as dsp_file, open(output_lut_file, 'w') as lut_file:
        bench_suites = sorted(list(vitis_projects_dir.iterdir()))
        for bench_suite_dir in bench_suites:
            benchs = sorted(list(bench_suite_dir.iterdir()))
            for project_dir in benchs:
                rpt_xml_file = project_dir / "solution1/syn/report/csynth.xml"
                if not rpt_xml_file.exists():
                    continue
                dsp, lut, cp = parse_hls_rpt(rpt_xml_file)
                print(f"{project_dir.name}: DSP={dsp}, LUT={lut}, CP={cp}")
                cp_file.write(f"{cp}\n")
                dsp_file.write(f"{dsp}\n")
                lut_file.write(f"{lut}\n")
