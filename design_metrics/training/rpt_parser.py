from pathlib import Path
from sys import argv
import xml.etree.ElementTree as ET

'''
TODO: Get FF values from the report files
'''

def parse_reports(solution_syn_dir: Path):
    reports_folder = solution_syn_dir / "report"
    verilog_folder = solution_syn_dir / "verilog"

    rpt_files = list(reports_folder.glob("*.rpt"))
    function_rpt_files = [f for f in rpt_files if f.name != "csynth.rpt" and f.name != "csynth_design_size.rpt"]
    csynth_xml_file = reports_folder / "csynth.xml"

    # Parse csynth.xml
    tree = ET.parse(csynth_xml_file)
    root = tree.getroot()
    operation_reports = {}

    bind_nodes = root.findall("ModuleInformation/Module/BindNodes/")

    for bind_node in bind_nodes:
        if bind_node.attrib.get("BINDTYPE") == "storage":
            continue
        name = bind_node.attrib.get("RTLNAME")
        optype = bind_node.attrib.get("OPTYPE")
        dsp = bind_node.attrib.get("DSP")
        latency = bind_node.attrib.get("LATENCY")

        operation_reports[name] = [optype, 0, 0, 0, dsp, latency, 0]
    
    for function_rpt_file in function_rpt_files:
        with open(function_rpt_file, "r") as f:
            lines = f.readlines()
            n_lines = len(lines)
            op_rpt_lines = 0
            i = 0
            while i < n_lines:
                if "* Expression:" in lines[i]:
                    i += 4
                    while '+-' not in lines[i + op_rpt_lines]:
                        op_rpt_lines += 1
                    break
                i += 1

            if op_rpt_lines == 0:
                continue

            op_rpt_table = [line.split('|') for line in lines[i:i + op_rpt_lines]]
            op_rpt_table = [[col.strip() for col in row][1:8] for row in op_rpt_table]

            for row in op_rpt_table:
                if row[0] not in operation_reports:
                    operation_reports[row[0]] = ["", 0, 0, 0, 0, 0, 0]
                    if row[1] == "+":
                        operation_reports[row[0]][0] = "add"
                    elif row[1] == "-":
                        operation_reports[row[0]][0] = "sub"
                    else:
                        operation_reports[row[0]][0] = row[1]
                # Assign LUT value
                operation_reports[row[0]][3] = int(row[4])
                
    for op_name in operation_reports.keys():
        # Search for teh declaration of this variable in the verilog file
        # to get the signedness
        found = False
        for f in verilog_folder.glob("*.v"):
            lines = f.read_text().split("\n")
            for line in lines:
                if ("reg" in line) | ("wire" in line) | ("input" in line) | ("output" in line):
                    if op_name in line:
                        if "signed" in line:
                            operation_reports[op_name][1] = 1
                        else:
                            operation_reports[op_name][1] = 0
                        
                        # Get bitwidth
                        if '[' in line:
                            operation_reports[op_name][2] = int(line.split("[")[1].split(":")[0])
                        else:
                            operation_reports[op_name][2] = 1
                        found = True
                        break
            if found:
                break

    return operation_reports
            
            
if __name__ == "__main__":
    solution_syn_dir = Path(argv[1])
    output_file = Path(argv[2])
    operation_reports = parse_reports(solution_syn_dir)
    with open(output_file, "w") as f:
        f.write("variable,operation,signed,bitwidth,lut,dsp,latency,ff\n")
        for op_name, op_data in operation_reports.items():
            f.write(f"{op_name},{op_data[0]},{op_data[1]},{op_data[2]},{op_data[3]},{op_data[4]},{op_data[5]},{op_data[6]}\n")