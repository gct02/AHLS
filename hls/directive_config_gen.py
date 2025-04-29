import json

from hls.c_json import file_to_dict


def get_loop(node, ret_label=False):
    ntype = node.get('_nodetype')
    if ntype in ['For', 'While']:
        if ret_label:
            return node, ''
        return node
    elif ntype in ['Label']:
        stmt = node['stmt']
        stype = stmt['_nodetype']
        if stype in ['For', 'While']:
            if ret_label:
                return stmt, node['name']
            return stmt
    if ret_label:
        return None, None
    return None


def get_inner_loops(loop):
    inner_loops = []
    stmt = loop.get('stmt')
    if not stmt:
        return inner_loops
    blocks = stmt.get('block_items')
    if not blocks:
        return inner_loops
    for b in blocks:
        il, illabel = get_loop(b, True)
        if il is None:
            continue
        inner_loop = {
            'name': illabel,
            'inner_loops': get_inner_loops(il),
            'ast_node': il
        }
        inner_loops.append(inner_loop)
    return inner_loops


def extract_funcs_and_loops(ast_dict):
    funcs = []

    for node in ast_dict['ext']:
        if node['_nodetype'] != 'FuncDef':
            continue
        loops = []
        blocks = node['body']['block_items']
        for b in blocks:
            l, llabel = get_loop(b, ret_label=True)
            if l is None:
                continue
            loop = {
                'name': llabel,
                'inner_loops': get_inner_loops(l),
                'ast_node': l
            }
            loops.append(loop)

        funcs.append({
            "name": node['decl']['name'],
            "loops": loops,
            "ast_node": node
        })
    
    return funcs


def gen_loop_directive_groups(loop, fname, parent_loop_name=None):
    directive_groups = {}

    lname = loop['name']
    if lname == '':
        return directive_groups
    
    ast_node = loop['ast_node']
    init = ast_node['init']['rvalue']
    cond = ast_node['cond']['right']
    
    init_val = init.get('value')
    stop_val = cond.get('value')
    if init_val is None or stop_val is None:
        tripcount = 0
    else:
        tripcount = int(stop_val) - int(init_val)

    possible_directives = ['', f'set_directive_unroll \"{fname}/{lname}\"']
    factor = 2
    while tripcount // factor > 1:
        possible_directives.append(f'set_directive_unroll -factor {factor} \"{fname}/{lname}\"')
        factor *= 2
    
    directive_groups[f'unroll {lname}'] = {
        'possible_directives': possible_directives,
        'function': fname,
        'label': lname,
        'directive_type': 'unroll'
    }
    directive_groups[f'pipeline {lname}'] = {
        'possible_directives': [
            f'set_directive_pipeline -off \"{fname}/{lname}\"',
            f'set_directive_pipeline \"{fname}/{lname}\"'
        ],
        'function': fname,
        'label': lname,
        'directive_type': 'pipeline'
    }

    inner_loops = loop['inner_loops']
    if len(inner_loops) == 0:
        if parent_loop_name is not None:
            directive_groups[f'loop_flatten {lname}'] = {
            'possible_directives': [
                f'set_directive_loop_flatten -off \"{fname}/{lname}\"',
                f'set_directive_loop_flatten \"{fname}/{lname}\"'
            ],
            'function': fname,
            'label': lname,
            'directive_type': 'loop_flatten'
        }
        return directive_groups
    
    if len(inner_loops) >= 2:
        directive_groups[f'loop_merge {lname}'] = {
            'possible_directives': ['', f'set_directive_loop_merge \"{fname}/{lname}\"'],
            'function': fname,
            'label': lname,
            'directive_type': 'loop_merge'
        }

    for il in inner_loops:
        directive_groups.update(gen_loop_directive_groups(il, fname, lname))

    return directive_groups


def _find_items_by_type(root, key_type):
    if isinstance(root, str):
        return []
    else:
        items = []
        if isinstance(root, dict):
            root_type = root.get('_nodetype')
            if root_type == key_type:
                items.append(root)
            for v in root.values():
                items.extend(_find_items_by_type(v, key_type))
        elif isinstance(root, list):
            for v in root:
                items.extend(_find_items_by_type(v, key_type))
        return items


def gen_directive_groups(funcs):
    directive_groups = {}

    for f in funcs:
        fname = f['name']
        loops = f['loops']

        directive_groups[f'pipeline {fname}'] = {
            'possible_directives': [f'set_directive_pipeline -off \"{fname}\"'],
            'function': fname,
            'label': '',
            'directive_type': 'pipeline'
        }

        arrays = []
        for array_decl in _find_items_by_type(f['ast_node'], 'ArrayDecl'):
            array_type = array_decl['type']
            if (array_name := array_type.get('declname')) is None:
                array_name = array_type['type'].get('declname')
            if array_name is None:
                continue
            array_dim = array_decl['dim']

            array_dim_type = array_dim.get("_nodetype")
            if array_dim_type == "Constant":
                array_size = int(array_dim["value"])
            elif array_dim_type == "BinaryOp":
                l = int(array_dim["left"]["value"])
                r = int(array_dim["right"]["value"])
                op = array_dim["op"]
                if op == "*":
                    array_size = l * r
                elif op == "+":
                    array_size = l + r
                elif op == "-":
                    array_size = l - r
                elif op == "/":
                    array_size = l / r
                else:
                    continue
            else:
                continue
            
            arrays.append((array_name, array_size))

        for aname, asize in arrays:
            possible_directives = ['', f'set_directive_array_partition \"{fname}\" {aname}']
            factor = 2
            while asize // factor > 1:
                possible_directives.extend([
                    f'set_directive_array_partition -type block -factor {factor} \"{fname}\" {aname}',
                    f'set_directive_array_partition -type cyclic -factor {factor} \"{fname}\" {aname}'
                ])
                factor *= 2

            directive_groups[f'array_partition {aname} {fname}'] = {
                'possible_directives': possible_directives,
                'function': fname,
                'label': '',
                'variable': aname,
                'directive_type': 'array_partition'
            }

        if len(loops) == 0:
            continue

        if len(loops) >= 2:
            directive_groups[f'loop_merge {fname}'] = {
                'possible_directives': ['', f'set_directive_loop_merge \"{fname}\"'],
                'function': fname,
                'label': '',
                'directive_type': 'loop_merge'
            }

        for l in loops:
            directive_groups.update(gen_loop_directive_groups(l, fname))

    return directive_groups
        

if __name__ == '__main__':
    import sys
    from sys import argv

    sys.path.extend(['.', '..'])

    from hls.c_json import file_to_dict

    ast_dict = file_to_dict(argv[1])
    funcs = extract_funcs_and_loops(ast_dict)
    directive_groups = gen_directive_groups(funcs)
    directives = {"directives": directive_groups}
    with open(argv[2], 'w') as f:
        json.dump(directives, f, indent=2)
    