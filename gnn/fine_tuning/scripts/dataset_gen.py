import subprocess
import time
import psutil
import json
from pathlib import Path
from random import randint

from hls.hls_config import gen_design_config_tcl   


NUM_FINE_TUNING_SAMPLES = 10


class DatasetGenerator:
    def __init__(     
        self,
        project_dir, 
        sources,
        top_fn, 
        dct_config_path,
        max_instances=-1,
        synth_timeout=3600,
        resume=False,
        vitis_run_script='./hls/run_vitis.sh'
    ):
        self.project_dir = project_dir
        self.sources = sources
        self.top_fn = top_fn
        self.kernel_name = Path(project_dir).name
        self.dct_config_path = dct_config_path
        self.max_instances = max_instances
        self.synth_timeout = synth_timeout
        self.resume = resume
        self.vitis_run_script = vitis_run_script

        self.control_tree = {}
        self.solution_count = 0

        self._temp_dir = Path(self.project_dir) / '.temp'
        if not self._temp_dir.is_dir():
            self._temp_dir.mkdir(parents=True, exist_ok=True)

        self._dct_tcl_path = (self._temp_dir / f'directives.tcl').as_posix()
        self._hls_tcl_path = (self._temp_dir / f'hls_script.tcl').as_posix()

        self._control_tree_path = self._temp_dir / 'control_tree.json'

        with open(dct_config_path) as f:
            self.dse_config = json.load(f)

        dct_dict = self.dse_config['directives']

        self.dct_domain = {}
        for group, domain in dct_dict.items():
            possible_dcts = domain.get('possible_directives')
            if possible_dcts is None or len(possible_dcts) <= 1:
                continue

            off_idx, off_dct = None, None
            for i, dct in enumerate(possible_dcts):
                if dct == '' or '-off' in dct:
                    off_idx, off_dct = i, dct
                    break

            if off_idx:
                possible_dcts.pop(off_idx)
                possible_dcts.insert(0, off_dct)
            else:
                possible_dcts.insert(0, '')

            self.dct_domain[group] = possible_dcts

        self.dct_domain_info = {
            key: {
                'directive_type': value['directive_type'],
                'function': value.get('function', ''),
                'variable': value.get('variable', ''),
                'label': value.get('label', '')
            }
            for key, value in dct_dict.items()
        }
        self.dct_constraints = {
            key: value.get('constraints', [])
            for key, value in dct_dict.items()
        }
        self.loop_hierarchy = self.dse_config['nested_loops']

    def run(self):
        # Handle resume logic
        if self.resume:
            self._handle_resume()

        # Main loop for generating and running design configurations
        while True:
            dct_config = self._build_random_config()
            if not dct_config:
                print('All valid configurations have been explored. Exiting...')
                break

            solution_name = f'solution{self.solution_count}'
            self._save_current_directives(dct_config)

            gen_design_config_tcl(
                self.project_dir,
                self.sources,
                self.top_fn,
                solution_name,
                self._hls_tcl_path,
                dct_tcl_path=self._dct_tcl_path,
            )

            if self._run_synth(solution_name):
                self.solution_count += 1
                if self.max_instances > 0 and self.solution_count >= self.max_instances:
                    print('Reached max instance count. Exiting...')
                    break
            else:
                print(f'{solution_name} failed. Retrying with a new set of directives...')

        self._save_control_tree()

    def _save_current_directives(self, dct_config):
        with open(self._dct_tcl_path, "w") as f:
            f.write('\n'.join([v for v in dct_config.values() if v]))

    def _handle_resume(self):
        if not self._control_tree_path.is_file():
            print('WARNING: Resume flag set but no permutation file was found.')
            return
        
        with open(self._control_tree_path, "r") as f:
            control_tree = json.load(f)

        self.control_tree = self._decode_json(control_tree)
        self.solution_count = int(control_tree.get('solution_count', 0))

    def _run_synth(self, solution_name):
        solution_dir = Path(self.project_dir) / solution_name

        try:
            if not solution_dir.is_dir():
                solution_dir.mkdir(parents=True, exist_ok=True)

            print(f'** Starting {solution_name} run **')
            
            proc = subprocess.Popen([f'{self.vitis_run_script} {self._hls_tcl_path}'], shell=True)
            start_time = time.time()
            parent_proc = psutil.Process(proc.pid)

            while parent_proc.is_running() and parent_proc.status() != psutil.STATUS_ZOMBIE:
                time.sleep(60)

                completed, rpts_generated = self._check_run_completion(solution_dir)
                elapsed_time = time.time() - start_time

                if elapsed_time > self.synth_timeout or rpts_generated:
                    if rpts_generated:
                        print(f'Run was successful ({solution_name})!')
                    elif completed:
                        print(f'Run was successful but some reports were not generated'
                              f' ({solution_name}).')
                        time.sleep(60)
                    else:
                        print(f'Run exceeded time limit ({solution_name}).')

                    print('Killing processes...')
                    for child in parent_proc.children(recursive=True):
                        child.kill()
                    parent_proc.kill()

                    return completed

        except Exception as e:
            print(e)
            return False
        
    def _check_run_completion(self, solution_dir: Path):
        impl_dir = solution_dir / 'impl/verilog/project.runs/impl_1'
        if not impl_dir.is_dir():
            return False, False
        
        log_file = impl_dir / 'runme.log'
        if not log_file.is_file():
            return False, False

        with open(log_file, 'r') as f:
            text = f.read()

        if text.find('route_design completed successfully') == -1:
            return False, False
        
        if ((impl_dir / 'bd_0_wrapper_utilization_placed.rpt').is_file()
            and (impl_dir / 'bd_0_wrapper_power_routed.rpt').is_file()
            and (impl_dir / 'bd_0_wrapper_timing_summary_routed.rpt').is_file()):
            return True, True
        
        return True, False

    def _build_label_dct_dict(self, dct_config):
        label_dct_dict = {}

        for group in dct_config:
            dct_group = self.dct_domain_info[group]
            dct_type = dct_group['directive_type']

            if dct_type not in {'pipeline', 'unroll'}:
                continue

            function = dct_group.get('function', '')
            target = dct_group.get('label', '')
            key = f"{function}/{target}"
            
            if key not in label_dct_dict:
                label_dct_dict[key] = {}
            label_dct_dict[key][dct_type] = dct_config[group]

        return label_dct_dict

    def _is_redundant_design(self, dct_config):
        label_dct_dict = self._build_label_dct_dict(dct_config)

        for loop in self.loop_hierarchy:
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

            for group, constraints in self.dct_constraints.items():
                if key == group:
                    continue

                dct = dct_config.get(group)
                if not dct or '-off' in dct:
                    continue

                if key in constraints:
                    return True

        return False

    def _build_random_config(self):
        node = self.control_tree
        dct_config = {}
        is_new = False

        for group, domain in self.dct_domain.items():
            idx = randint(0, len(domain) - 1)
            dct_config[group] = domain[idx]

            if (self._is_restricted_design(dct_config) 
                or self._is_redundant_design(dct_config)):
                idx = 0
                dct_config[group] = domain[idx]

            if idx in node:
                node = node[idx]
            else:
                node[idx] = {}
                node = node[idx]
                is_new = True

        return dct_config if is_new else None

    def _save_control_tree(self):
        self.control_tree['solution_count'] = self.solution_count
        with open(self._control_tree_path, 'w') as f:
            json.dump(self.control_tree, f)

    def _decode_json(self, obj):
        if isinstance(obj, str):
            return int(obj)
        elif isinstance(obj, dict):
            return {self._decode_json(k): self._decode_json(v) for k, v in obj.items()}
        return obj


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Generate HLS dataset for fine-tuning.')

    parser.add_argument('-p', '--project_dir', type=str, required=True, 
                        help='Project directory')
    parser.add_argument('-s', '--sources', type=str, nargs='+', required=True,
                        help='Source files')
    parser.add_argument('-tf', '--top_fn', type=str, required=True, 
                        help='Top function name')
    parser.add_argument('-d', '--dct_config_path', type=str, required=True, 
                        help='Path to directives config file')
    parser.add_argument('-f', '--filter-dct', action='store_true',
                        help='Filter directives')
    parser.add_argument('-k', '--kernel-info-path', type=str,
                        help='Path to kernel info JSON file')
    parser.add_argument('-n', '--num_instances', type=int, default=NUM_FINE_TUNING_SAMPLES, 
                        help='Max instances to generate')
    parser.add_argument('-t', '--synth_timeout', type=int, default=3600, 
                        help='Synthesis timeout in seconds')
    parser.add_argument('-r', '--resume', action='store_true', 
                        help='Resume from last run')
    parser.add_argument('-v', '--vitis_run_script', type=str, default='./hls/run_vitis.sh',
                        help='Path to Vitis run script')
    parser.add_argument('-np', '--num_pipelines', type=int, default=2,
                        help='Number of pipeline directives to include')
    parser.add_argument('-nu', '--num_unrolls', type=int, default=1,
                        help='Number of unroll directives to include')

    args = parser.parse_args()

    dct_config_path = Path(args.dct_config_path)
    if not dct_config_path.is_file():
        print(f'Directives config file not found: {dct_config_path}')
        exit(1)

    if args.filter_dct:
        import pickle
        from gnn.fine_tuning.hls_dct_config import filter_directive_groups

        if not args.kernel_info_path:
            print('Kernel info path is required when filtering directives.')
            exit(1)

        if not Path(args.kernel_info_path).is_file():
            print(f'Kernel info file not found: {args.kernel_info_path}')
            exit(1)

        with open(args.kernel_info_path, "rb") as f:
            kernel_info = pickle.load(f)

        dct_config_path = Path(args.dct_config_path).parent / f'{dct_config_path.stem}_filtered.json'
        filter_directive_groups(
            args.dct_config_path,
            dct_config_path,
            kernel_info,
            num_pipelines=args.num_pipelines,
            num_unrolls=args.num_unrolls
        )

    generator = DatasetGenerator(
        project_dir=args.project_dir,
        sources=args.sources,
        top_fn=args.top_fn,
        dct_config_path=dct_config_path,
        max_instances=args.num_instances,
        synth_timeout=args.synth_timeout,
        resume=args.resume,
        vitis_run_script=args.vitis_run_script
    )
    
    generator.run()