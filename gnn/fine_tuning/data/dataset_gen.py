import subprocess
import time
import psutil
import json
import shutil
from pathlib import Path
from random import randint

from gnn.data.utils.parsers import parse_directive_cmd
from gnn.data.graph import find_array_node, find_region_node
from hls_utils.tcl_script import gen_script

NUM_INITIAL_BASE_POINTS = 4
NUM_INITIAL_FULL_POINTS = 2
NUM_INITIAL_POINTS = NUM_INITIAL_BASE_POINTS + NUM_INITIAL_FULL_POINTS


class DatasetGenerator:
    def __init__(self, project_dir, benchmark, kernel_graph, run_timeout=3600):
        if run_timeout <= 0:
            raise ValueError(f'Invalid value for run_timeout: {run_timeout}')

        bench_info_path = Path('data/benchmark_info.json')
        if not bench_info_path.exists():
            raise FileNotFoundError('Benchmark info file not found.')
        
        with open(bench_info_path, 'r') as f:
            bench_info_dict = json.load(f)

        if benchmark not in bench_info_dict:
            raise ValueError(f'Could not find info for benchmark {benchmark}.')
        
        self.benchmark_info = bench_info_dict[benchmark]
        self.run_timeout = run_timeout
        self.kernel_graph = kernel_graph

        self.control_tree = {}
        self.num_successful_runs = 0
        self.solution_index = 0
        self.project_dir = Path(project_dir)
        self.project_dir.mkdir(parents=True, exist_ok=True)
        
        self.prj_state_path = self.project_dir / 'prj_state.json'
        self.run_vitis_sh = './hls_utils/run_vitis.sh'

        self._temp_dir = Path(project_dir / '.temp')
        self._temp_dir.mkdir(parents=True, exist_ok=True)

        self._script_tcl_path = self._temp_dir / 'script.tcl'
        self._directives_tcl_path = self._temp_dir / 'directives.tcl'

        with open(self.benchmark_info['directives_path'], 'r') as f:
            domain = json.load(f)

        directive_groups = {}
        for group_label, group_data in domain['directives']:
            directives = group_data.get('possible_directives', [])
            directives = [dct.strip('\n') for dct in directives]

            disabled_dct = None
            for i, dct in enumerate(directives):
                if dct == '' or '-off' in dct:
                    disabled_dct = (i, dct)
                    break

            if disabled_dct is not None:
                del directives[disabled_dct[0]]
                directives = [disabled_dct[1]] + directives
            else:
                directives.insert(0, '')

            directive_groups[group_label] = {'possible_directives': directives}
            directive_groups[group_label].update({
                key: value for key, value in group_data.items() 
                if key != 'possible_directives'
            })
        
        self.domain = {
            'directives': directive_groups,
            'nested_loops': domain.get('nested_loops', [])
        }

    def run(self, clear_previous_runs: bool = False):
        if clear_previous_runs:
            shutil.rmtree(self.project_dir, ignore_errors=True)
            self.project_dir.mkdir(parents=True, exist_ok=True)
            self._temp_dir.mkdir(parents=True, exist_ok=True)
            self.solution_index = 0
            self.control_tree = {}
        else:
            self._handle_resume()

        self.num_successful_runs = 0
        gen_base_point = True

        while self.num_successful_runs < NUM_INITIAL_POINTS:
            if gen_base_point:
                dct_config = self._gen_base_config()
                if not dct_config:
                    gen_base_point = False
                    continue
            else:
                dct_config = self._gen_random_config()
                if not dct_config:
                    print("All valid configurations have been exhausted.")
                    break

            self._save_directives_as_tcl(dct_config)
            solution_dir = self.project_dir / f'solution{self.solution_index}'
            solution_dir.mkdir(parents=True, exist_ok=True)

            gen_script(
                self.project_dir, self.benchmark_info['source_files'],
                self.benchmark_info['top_level'], solution_dir.name,
                self._directives_tcl_path, self._script_tcl_path,
            )

            if self._gen_solution(solution_dir):
                self.num_successful_runs += 1
                self.solution_index += 1
                if self.num_successful_runs >= NUM_INITIAL_BASE_POINTS:
                    gen_base_point = False

                self._save_project_state()

        # Clean up temporary files
        if self._temp_dir.is_dir():
            shutil.rmtree(self._temp_dir, ignore_errors=True)

    def _gen_solution(self, solution_dir):
        try:
            print(f'\n** Starting {solution_dir.name} run **\n')

            proc = subprocess.Popen(
                [f'{self.run_vitis_sh} {self._script_tcl_path}'],
                shell=True
            )
            start_time = time.time()
            parent_proc = psutil.Process(proc.pid)

            while parent_proc.is_running() and parent_proc.status() != psutil.STATUS_ZOMBIE:
                time.sleep(30)

                if self._check_run_completion(solution_dir):
                    print(f'\n** Run completed successfully ({solution_dir.name}) **\n')
                    shutil.copy(self._directives_tcl_path, solution_dir / 'directives.tcl')
                    return True

                if (time.time() - start_time) > self.design_flow_timeout:
                    print(f'\n** Run exceeded time limit ({solution_dir.name}) **\n')
                    for child in parent_proc.children(recursive=True):
                        child.kill()
                    parent_proc.kill()
                    shutil.rmtree(solution_dir, ignore_errors=True)
                    return False

            # Final check in case the process finished between sleep intervals
            if self._check_run_completion(solution_dir):
                print(f'\n** Run completed successfully ({solution_dir.name}) **\n')
                shutil.copy(self._directives_tcl_path, solution_dir / 'directives.tcl')
                return True
            else:
                print(f'\n** Run did not complete successfully ({solution_dir.name})**\n')
                shutil.rmtree(solution_dir, ignore_errors=True)
                return False

        except Exception as e:
            print(e)
            shutil.rmtree(solution_dir, ignore_errors=True)
            return False

    def _handle_resume(self):
        if not self.prj_state_path.is_file():
            self._config_prj_state_from_previous_runs()
            self._save_project_state()
            return

        with open(self.prj_state_path, 'r') as f:
            prj_state = json.load(f)

        self.control_tree = self._decode_config_tree(prj_state.get('control_tree', {}))
        self.num_successful_runs = int(prj_state.get('num_successful_runs', 0))
        self.solution_index = self.num_successful_runs + 1

    def _check_run_completion(self, solution_dir: Path):
        impl_dir = solution_dir / 'impl'
        if not impl_dir.is_dir():
            return False
        
        run_dir = impl_dir / 'verilog/project.runs/impl_1'
        if not run_dir.is_dir():
            return False
        
        power_rpt_file = run_dir / 'bd_0_wrapper_power_routed.rpt'
        util_rpt_file = run_dir / 'bd_0_wrapper_utilization_placed.rpt'
        time_rpt_file = run_dir / 'bd_0_wrapper_timing_summary_routed.rpt'
        return power_rpt_file.exists() and util_rpt_file.exists() and time_rpt_file.exists()
    
    def _gen_random_config(self):
        node = self.control_tree
        dct_config = {}
        is_new = False

        for group_label, group_data in self.domain['directives'].items():
            directives = group_data['possible_directives']
            idx = randint(0, len(directives) - 1)
            dct = directives[idx]

            if idx != 0:
                if self._is_conflicting_directive(dct_config, group_label, dct):
                    idx = 0
                    dct_config[group_label] = directives[idx]
                else:
                    dct_config[group_label] = dct
                    if (self._is_restricted_design(dct_config) or 
                        self._is_redundant_design(dct_config)):
                        idx = 0
                        dct_config[group_label] = directives[idx]
            else:
                dct_config[group_label] = dct

            if idx not in node:
                is_new = True
                node[idx] = {}
            node = node[idx]

        return dct_config if is_new else None
    
    def _is_redundant_design(self, dct_config):
        label_dct_dict = self._build_label_dct_dict(dct_config)

        for loop in self.nested_loops:
            inner_loop = loop
            function = loop['function']
            pipeline_loop = None

            while (nest := inner_loop.get('nest')):
                label = inner_loop['label']
                key = f"{function}/{label}"
                if (config := label_dct_dict.get(key)) is None:
                    inner_loop = nest
                    continue

                pipeline_config = config.get('pipeline', '')
                if pipeline_config != '' and '-off' not in pipeline_config:
                    pipeline_loop = inner_loop
                    break

                inner_loop = nest

            if not pipeline_loop:
                continue
            
            inner_loop = pipeline_loop
            while (inner_loop := inner_loop.get('nest')):
                label = inner_loop['label']
                key = f"{function}/{label}"
                if (config := label_dct_dict.get(key)) is None:
                    continue

                pipeline_config = config.get('pipeline', '')
                unroll_config = config.get('unroll', '')
                if ((pipeline_config != '' and '-off' not in pipeline_config)
                    or unroll_config != ''):
                    return True

        return False

    def _is_restricted_design(self, dct_config):
        for key, value in dct_config.items():
            if value == '' or '-off' in value:
                continue
            
            for group_label, group_data in self.domain['directives'].items():
                if key != group_label:
                    dct = dct_config.get(group_label)
                    if not dct or '-off' in dct:
                        continue

                    if key in group_data.get('constraints', []):
                        return True
        return False
    
    def _is_conflicting_directive(self, dct_config, group, new_dct):
        group_data = self.domain['directives'].get(group)
        if not group_data:
            return False
        
        new_dct_type = group_data['directive_type']
        if (new_dct_type not in {'pipeline', 'unroll', 'loop_flatten'} or 
            (new_dct_type == 'unroll' and '-factor' in new_dct) or 
            (new_dct_type == 'pipeline' and '-off' in new_dct) or 
            (new_dct_type == 'loop_flatten' and ('-off' in new_dct or not new_dct))):
            return False
        
        label = group_data.get('label', '')
        function = group_data.get('function', '')
        key = f"{function}/{label}"

        label_dct_dict = self._build_label_dct_dict(dct_config, include_flatten=True)
        dct_dict = label_dct_dict.get(key, {})
        if not dct_dict:
            return False
        
        if new_dct_type == 'unroll':
            # Complete unroll directive would break the target 
            # of any other loop pragmas if applied
            if 'unroll' in dct_dict and dct_dict['unroll'] != '':
                return True
            if 'pipeline' in dct_dict:
                pipeline_dct = dct_dict['pipeline']
                if pipeline_dct != '' and '-off' not in pipeline_dct:
                    return True
            if 'loop_flatten' in dct_dict:
                loop_flatten_dct = dct_dict['loop_flatten']
                if loop_flatten_dct != '' and '-off' not in loop_flatten_dct:
                    return True
        else:
            if 'unroll' in dct_dict:
                unroll_dct = dct_dict['unroll']
                if unroll_dct != '' and '-factor' not in unroll_dct:
                    return True
            
        return False

    def _build_label_dct_dict(self, dct_config, include_flatten=False):
        dct_keys = {'pipeline', 'unroll'}
        if include_flatten:
            dct_keys.add('loop_flatten')

        label_dct_dict = {}
        for group in dct_config:
            group_data = self.domain['directives'][group]
            dct_type = group_data['directive_type']
            if dct_type not in dct_keys:
                continue

            function = group_data.get('function', '')
            target = group_data.get('label', '')
            key = f"{function}/{target}"
            
            if key not in label_dct_dict:
                label_dct_dict[key] = {}
            label_dct_dict[key][dct_type] = dct_config[group]

        return label_dct_dict
    
    def _select_prominent_directives(self):
        loop_targets = {}
        array_targets = {}

        loop_latency_pairs = [
            (node.name, node.feature_dict.get('latency', 0)) 
            for node in self.kernel_graph.nodes 
            if node.node_type == 'region' and node.is_loop and node.name in loop_targets
        ]
        loop_latency_pairs = sorted(loop_latency_pairs, key=lambda x: x[1], reverse=True)
        self._top_loops = [loop[0] for loop in loop_latency_pairs[:5]]
        selected_loops = self._top_loops[:3]

        global_arrays = [
            node for node in self.kernel_graph.nodes
            if node.node_type == 'internal_mem' and node.is_array and node.name in array_targets
            and node.feature_dict.get('is_global_mem', 0) == 1
        ]
        if global_arrays:
            array_info_tuples = [(node.name, node.num_dims, node.array_size) for node in global_arrays]
            array_info_tuples.sort(key=lambda x: (x[1], -x[2]))

            interface_arrays = [
                node for node in self.kernel_graph.nodes
                if node.node_type == 'port' and node.is_array and not node.is_top_level_port
                and node.name in array_targets
            ]
            interface_arrays = sorted(interface_arrays, key=lambda x: x.num_dims, reverse=True)
            top_interface_arrays = interface_arrays[:3]
            array_info_tuples += [
                (node.name, node.num_dims, node.array_size) for node in top_interface_arrays
            ]
            self._top_arrays = [array[0] for array in array_info_tuples[:5]]
        else:
            interface_arrays = [
                node for node in self.kernel_graph.nodes
                if node.node_type == 'port' and node.is_array and node.is_top_level_port
                and node.name in array_targets
            ]
            interface_arrays = sorted(interface_arrays, key=lambda x: x.num_dims, reverse=True)
            top_interface_arrays = interface_arrays[:3]
            self._top_arrays = [node.name for node in top_interface_arrays]
        selected_arrays = self._top_arrays[:2]

        # Combinations: (loop1, array1), (loop2, array1), (loop3, array1), (loop1, array2)
        ...

    def _config_prj_state_from_previous_runs(self):
        invalid_runs, successful_runs = [], []

        for solution_dir in self.project_dir.iterdir():
            if (not solution_dir.is_dir() or 
                not solution_dir.name.startswith('solution') or 
                solution_dir.name == 'solution0'):
                continue

            solution_index = solution_dir.name.replace('solution', '')
            if not solution_index.isdigit():
                invalid_runs.append(solution_dir)
                continue

            solution_index = int(solution_index)

            run_dir = solution_dir / 'impl/verilog/project.runs/impl_1'
            if not run_dir.is_dir():
                # Check if the solution was filtered
                reports_dir = solution_dir / 'reports'
                if not (solution_dir / 'reports').is_dir():
                    invalid_runs.append(solution_dir)
                    continue

                power_rpt_file = reports_dir / 'impl_power.rpt'
                util_rpt_file = reports_dir / 'impl_utilization_placed.rpt'
                time_rpt_file = reports_dir / 'impl_timing_summary.rpt'
            else:
                power_rpt_file = run_dir / 'bd_0_wrapper_power_routed.rpt'
                util_rpt_file = run_dir / 'bd_0_wrapper_utilization_placed.rpt'
                time_rpt_file = run_dir / 'bd_0_wrapper_timing_summary_routed.rpt'

            if power_rpt_file.exists() and util_rpt_file.exists() and time_rpt_file.exists():
                successful_runs.append(solution_dir)
            else:
                invalid_runs.append(solution_dir)

        for solution_dir in invalid_runs:
            print(f"Run {solution_dir.name} is incomplete or invalid. Removing it.")
            shutil.rmtree(solution_dir, ignore_errors=True)

        self.control_tree = {}

        for solution_dir in successful_runs:
            dct_config = self._extract_directives(solution_dir)
            if not dct_config:
                shutil.rmtree(solution_dir, ignore_errors=True)
                continue

            node = self.control_tree
            for group_label, group_data in self.domain['directives'].items():
                if group_label not in dct_config:
                    idx = 0
                else:
                    dct = dct_config[group_label]
                    if dct == '' or '-off' in dct:
                        idx = 0
                    elif dct not in group_data['possible_directives']:
                        print(f"Directive {dct} not found in group {group_label}.")
                        idx = 0
                    else:
                        idx = group_data['possible_directives'].index(dct)

                if idx not in node:
                    node[idx] = {}
                node = node[idx]

        solution_indices = [
            int(solution_dir.name.replace('solution', '')) 
            for solution_dir in self.project_dir.iterdir()
        ]
        self.solution_index = max(solution_indices) + 1 if solution_index else 1

    def _decode_config_tree(self, obj):
        if isinstance(obj, str):
            return int(obj)
        elif isinstance(obj, dict):
            return {
                self._decode_config_tree(key): self._decode_config_tree(value) 
                for key, value in obj.items()
            }
        return obj
    
    def _extract_directives(self, solution_dir: Path):
        directives_tcl = solution_dir / 'directives.tcl'
        if not directives_tcl.is_file():
            hls_data_json = solution_dir / f'{solution_dir.name}_data.json'
            if not hls_data_json.is_file():
                return None
            
            with open(hls_data_json, 'r') as f:
                hls_data = json.load(f)

            directive_data = hls_data.get('HlsSolution', {}).get('DirectiveTcl', [])
            if not directive_data:
                return None
            
            directive_data = '\n'.join(directive_data)
            with open(directives_tcl, 'w') as f:
                f.write(directive_data)

        with open(directives_tcl, 'r') as f:
            lines = f.readlines()
        
        dct_config = {}
        for line in lines:
            if (not line.startswith('set_directive_') or 
                line.startswith('set_directive_top')):
                continue

            cmd, args = parse_directive_cmd(line)
            location = args.get('location', '')

            if cmd == 'array_partition':
                variable = args.get('variable', '')
                label = f"{cmd} {variable} {location}"

                factor = args.get('factor', '')
                partition_type = args.get('type', '')
                dim = args.get('dim', '')

                factor = f"-factor {factor}" if factor else ''
                partition_type = f"-type {partition_type}" if partition_type else ''
                dim = f"-dim {dim}" if dim else ''

                args_str = ' '.join(
                    [arg for arg in [partition_type, factor, dim] if arg]
                )
                if args_str != '':
                    line = f"set_directive_{cmd} {args_str} \"{location}\" {variable}"
                else:
                    line = f"set_directive_{cmd} \"{location}\" {variable}"
            else:
                if '/' in location:
                    loop_label = location.split('/')[-1]
                    label = f"{cmd} {loop_label}"
                else:
                    label = f"{cmd} {location}"

                if cmd == 'unroll':
                    factor = args.get('factor', '')
                    if factor:
                        line = f"set_directive_{cmd} -factor {factor} \"{location}\""
                    else:
                        line = f"set_directive_{cmd} \"{location}\""
                elif 'off' in args:
                    line = f"set_directive_{cmd} -off \"{location}\""
                else:
                    line = f"set_directive_{cmd} \"{location}\""

            dct_config[label] = line
                
        return dct_config
    
    def _save_project_state(self):
        project_state = {
            'control_tree': self.control_tree,
            'num_successful_runs': self.num_successful_runs
        }
        with open(self._project_state_path, 'w') as f:
            json.dump(project_state, f, indent=2)

    def _save_directives_as_tcl(self, dct_config):
        with open(self._directives_tcl_path, "w") as f:
            f.write('\n'.join([v for v in dct_config.values() if v]))