from pathlib import Path
from sys import argv
import xml.etree.ElementTree as ET
import os

def get_resource_usage(proj_export_rpt: Path) -> dict:
    rpt = {}
    with open(proj_export_rpt, 'r') as f:
        lines = f.readlines()
        rpt_start = 9
        rpt_end = 18
        rpt_lines = lines[rpt_start:rpt_end]
        for rpt_line in rpt_lines:
            rpt_line_split = rpt_line.split(':')
            rpt[rpt_line_split[0]] = int(rpt_line_split[1].strip())
    return rpt

def get_resource_usage_per_op(solution_impl_dir: Path):
    reports_folder = solution_impl_dir / "report/verilog"
    verilog_folder = solution_impl_dir / "verilog"

    export_syn_xml = reports_folder / "export_syn.xml"
    export_syn_rpt = reports_folder / "export_syn.rpt"

    op_rpts = {}

    # Parse export_syn.xml
    tree = ET.parse(export_syn_xml)
    root = tree.getroot()

    bind_nodes = root.findall("RtlModules/RtlModule/BindNode")

    for bind_node in bind_nodes:
        if bind_node.attrib.get("BINDTYPE") is None or bind_node.attrib.get("BINDTYPE") == "storage":
            continue
        name = bind_node.attrib.get("RTLNAME")
        optype = bind_node.attrib.get("OPTYPE")
        dsp = bind_node.attrib.get("DSP")
        latency = bind_node.attrib.get("LATENCY")

        op_rpts[name] = [optype, 0, 0, 0, dsp, 0, latency]
    
    # Parse export_syn.rpt
    with open(export_syn_rpt, "r") as f:
        lines = f.readlines()
        rtl_resources_start = 0
        rtl_resources_end = 0
        i = 0

        while "== RTL Synthesis Resources" not in lines[i]:
            i += 1
        i += 5
        rtl_resources_start = i
        while "+-" not in lines[i]:
            i += 1
        rtl_resources_end = i
        rtl_resources_table = [line.split("|")[1:5] for line in lines[rtl_resources_start:rtl_resources_end]]
        rtl_resources_table = [[col.strip() for col in row] for row in rtl_resources_table]

        for row in rtl_resources_table:
            if row[0] in op_rpts:
                op_rpts[row[0]][3] = 0 if row[1] == '' else int(row[1])
                op_rpts[row[0]][5] = 0 if row[2] == '' else int(row[2])
        
    for op_name in op_rpts.keys():
        # Search for teh declaration of this variable in the verilog file
        # to get the signedness and bitwidth information
        found = False
        for f in verilog_folder.glob("*.v"):
            lines = f.read_text().split("\n")
            regs_and_wires = []
            for i, line in enumerate(lines):
                if ("reg" in line) | ("wire" in line) | ("input" in line) | ("output" in line):
                    regs_and_wires.append(line)
                    if op_name in line:
                        # Get signedness
                        op_rpts[op_name][1] = 1 if "signed" in line else 0
                        # Get bitwidth
                        op_rpts[op_name][2] = int(line.split("[")[1].split(":")[0]) if '[' in line else 1
                        found = True
                elif op_name in line and "(" in line:
                    dout_width_line = lines[i - 1]
                    op_rpts[op_name][2] = int(dout_width_line.split('( ')[1].split(' )')[0])
                    dout_line = lines[i + 3]
                    dout = dout_line.split("(")[1].split(")")[0]
                    for reg_wire in regs_and_wires:
                        if dout in reg_wire:
                            op_rpts[op_name][1] = 1 if "signed" in reg_wire else 0
                            break
                    found = True
                if found:
                    break
            if found:
                break

    return op_rpts

def parse_rpt(solution_syn_dir: Path, output_file: Path):
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

    op_rpts = get_resource_usage_per_op(solution_syn_dir)

    # Remove non-binary operations
    bin_op_rpts = {}
    for op_name, op_rpt in op_rpts.items():
        if op_rpt[0] in OPCODES.keys():
            bin_op_rpts[op_name] = [OPCODES[op_rpt[0]], op_rpt[1], op_rpt[2],\
                                    op_rpt[3], op_rpt[4], op_rpt[5], op_rpt[6]]

    with open(output_file, "w") as f:
        f.write("opcode,signed,bitwidth,lut,dsp,ff,latency\n")
        for op_rpt in bin_op_rpts.values():
            f.write(f"{op_rpt[0]},{op_rpt[1]},{op_rpt[2]},{op_rpt[3]},{op_rpt[4]},{op_rpt[5]},{op_rpt[6]}\n")

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