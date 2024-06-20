

def get_operation_resource_summary(rpt_file):
    """
    Get the operation resource summary from the Vitis report file.

    Args:
        rpt_file (str): The path to the Vitis report file.

    Returns:
        dict: The operation resource summary.
    """
    operation_resource_summary = {}
    with open(rpt_file, 'r') as f:
        lines = f.readlines()
        for i, line in enumerate(lines):
            if 'Operation Resource Summary' in line:
                for j in range(i + 3, len(lines)):
                    if '------------------------------------------------' in lines[j]:
                        break
                    if 'Total' in lines[j]:
                        continue
                    operation, resource = lines[j].strip().split(':')
                    operation_resource_summary[operation.strip()] = resource.strip()
                break
    return operation_resource_summary