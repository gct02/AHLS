from pathlib import Path
from sys import argv
from enum import Enum
import xml.etree.ElementTree as ET

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

            instance_start = 0
            instance_end = 0
            expression_start = 0
            expression_end = 0

            i = 0
            while "== Utilization Estimates" not in lines[i] and i < n_lines:
                i += 1

            if i == n_lines:
                continue
            i += 2

            while i < n_lines:
                if "+ Detail:" not in lines[i]:
                    i += 1
                    continue
                i += 1

                while "* Instance:" not in lines[i]:
                    i += 1
                i += 1

                if "N/A" not in lines[i]:
                    i += 3
                    instance_start = i
                    while "+-" not in lines[i]:
                        i += 1
                    instance_end = i
                i += 2

                while "* Expression:" not in lines[i]:
                    i += 1
                i += 1

                if "N/A" not in lines[i]:
                    i += 3
                    expression_start = i
                    while "+-" not in lines[i]:
                        i += 1
                    expression_end = i
                break
            
            if instance_start != 0 and instance_end != 0:
                instance_table = [line.split("|") for line in lines[instance_start:instance_end]]
                instance_table = [[col.strip() for col in row][1:7] for row in instance_table]

                for row in instance_table:
                    if row[0] in operation_reports:
                        # Assign LUT and FF value
                        operation_reports[row[0]][3] = int(row[5]) # LUT
                        operation_reports[row[0]][6] = int(row[4]) # FF
            
            if expression_start != 0 and expression_end != 0:
                expression_table = [line.split("|") for line in lines[expression_start:expression_end]]
                expression_table = [[col.strip() for col in row][1:7] for row in expression_table]

                for row in expression_table:
                    if row[0] not in operation_reports:
                        operation_reports[row[0]] = ["", 0, 0, 0, 0, 0, 0]
                        if row[1] == "+":
                            operation_reports[row[0]][0] = "add"
                        elif row[1] == "-":
                            operation_reports[row[0]][0] = "sub"
                        else:
                            operation_reports[row[0]][0] = row[1]
                    # Assign LUT value
                    operation_reports[row[0]][3] = int(row[5]) # LUT
                
    for op_name in operation_reports.keys():
        # Search for teh declaration of this variable in the verilog file
        # to get the signedness
        found = False
        for f in verilog_folder.glob("*.v"):
            lines = f.read_text().split("\n")
            regs_and_wires = []
            for i, line in enumerate(lines):
                if ("reg" in line) | ("wire" in line) | ("input" in line) | ("output" in line):
                    regs_and_wires.append(line)
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
                elif op_name in line and "(" in line:
                    dout_width_line = lines[i - 1]
                    operation_reports[op_name][2] = int(dout_width_line.split('( ')[1].split(' )')[0])

                    dout_line = lines[i + 3]
                    dout = dout_line.split("(")[1].split(")")[0]
                    for reg_wire in regs_and_wires:
                        if dout in reg_wire:
                            if "signed" in reg_wire:
                                operation_reports[op_name][1] = 1
                            else:
                                operation_reports[op_name][1] = 0
                            break
                    found = True
                if found:
                    break
            if found:
                break
            
    return operation_reports
            
if __name__ == "__main__":
    OPCODES = {
        'add': 11,
        'fadd': 12,
        'sub': 13,
        'fsub': 14,
        'mul': 15,
        'fmul': 16,
        'udiv': 17,
        'sdiv': 18,
        'fdiv': 19,
        'urem': 20,
        'srem': 21,
        'frem': 22,
        'shl': 23,
        'lshr': 24,
        'ashr': 25,
        'and': 26,
        'or': 27,
        'xor': 28
    }

    solution_syn_dir = Path(argv[1])
    output_file = Path(argv[2])
    op_rpts = parse_reports(solution_syn_dir)

    # Remove non-binary operations
    bin_op_rpts = {}
    for op_name, op_rpt in op_rpts.items():
        if op_rpt[0] in OPCODES.keys():
            bin_op_rpts[op_name] = [OPCODES[op_rpt[0]], op_rpt[1], op_rpt[2],\
                                    op_rpt[3], op_rpt[4], op_rpt[5], op_rpt[6]]
    
    # x = (opcode, signed, bitwidth)
    samples = [[bin_op_rpt[0], bin_op_rpt[1], bin_op_rpt[2]] for bin_op_rpt in bin_op_rpts.values()]
    # y = (lut, dsp, ff, latency)
    labels = [[bin_op_rpt[3], bin_op_rpt[4], bin_op_rpt[6], bin_op_rpt[5]] for bin_op_rpt in bin_op_rpts.values()]

    with open(output_file, "w") as f:
        f.write("opcode,signed,bitwidth,lut,dsp,ff,latency\n")
        for op_rpt in bin_op_rpts.values():
            f.write(f"{op_rpt[0]},{op_rpt[1]},{op_rpt[2]},{op_rpt[3]},{op_rpt[4]},{op_rpt[5]},{op_rpt[6]}\n")