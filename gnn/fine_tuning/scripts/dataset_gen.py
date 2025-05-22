from abc import ABC, abstractmethod
from random import randint
import re
import copy
from pathlib import Path
import json
import pickle

from hls.run_hls import gen_tcl
                   



class Heuristic(ABC):

    def __init__(self, kernel_name, sources, top_fn, dct_config_path):
        self.kernel_name = kernel_name

        gen_tcl(sources, top_fn, kernel_name)

        with open(dct_config_path) as f:
            self.dse_config = json.load(f)

        dct_dict = copy.deepcopy(self.dse_config['directives'])
        self.dct_domain = {}

        for gp_name, gp in dct_dict:
            self.dct_domain[gp_name] = gp['possible_directives']

        self.solutions = []

    @abstractmethod
    def run(self):
        pass

    def write_to_file(self, filename):
        with open(filename, 'wb') as solutions_file:
            pickle.dump(self, solutions_file)

    def count_total_space(self):
        total = 1
        for directive_group in self.dct_domain:
            total *= len(self.dct_domain[directive_group])
        return total

    def count_pruned_space(self):
        total = 1
        directives_by_label: dict = self._build_label_dict(self.dct_domain)
        for item in directives_by_label.values():
            if 'pipeline' in item and 'unroll' in item:
                mult = (len(item['pipeline']) * len(item['unroll'])) - 1
                total *= mult
            else:
                for directive_list in item.values():
                    total *= len(directive_list)
        return total

    def _build_label_dict(self, directives: dict):
        new_dict: dict = {}
        directives_info = self.dse_config['directives']
        for directive_group in directives:
            label = directives_info[directive_group]['label']
            function = directives_info[directive_group]['function']
            key = f"{function}/{label}"
            directive_type = directives_info[directive_group]['directive_type']
            if key not in new_dict:
                new_dict[key] = {}
            new_dict[key][directive_type] = directives[directive_group]
        return new_dict

    def is_redundant_design(self, directives: dict):
        directives_by_label: dict = self._build_label_dict(directives)
        loops_info = self.dse_config['nested_loops']
        factor_regex = '\\s-factor\\s'

        for key, item in directives_by_label.items():
            if 'pipeline' not in item or 'unroll' not in item:
                continue
            if item['pipeline'] == '' or item['unroll'] == '':
                continue
            if re.search(factor_regex, item['unroll']) is None:
                return True
            if 'loop_flatten' in item and re.search(factor_regex, item['unroll']) is None and item['loop_flatten'] != '':
                return True

        for loop in loops_info:
            inner_loop = loop
            function = loop['function']
            pipeline_loop = None
            while inner_loop['nest']:
                label = inner_loop['label']
                key = f"{function}/{label}"
                item = directives_by_label[key]
                if 'pipeline' in item and item['pipeline'] != '':
                    pipeline_loop = inner_loop
                    break
                inner_loop = inner_loop['nest']

            if pipeline_loop:
                inner_loop = pipeline_loop
                while inner_loop['nest']:
                    inner_loop = inner_loop['nest']
                    label = inner_loop['label']
                    key = f"{function}/{label}"
                    item = directives_by_label[key]
                    if ('pipeline' in item and item['pipeline'] != '') or ('unroll' in item and item['unroll'] != ''):
                        return True

        return False

    def is_restricted_design(self, directives: dict):
        constraints_dict = self.dse_config['directives']
        for key in directives:
            for directive_group in constraints_dict:
                try:
                    constraints = constraints_dict[directive_group]['constraints']
                except Exception:
                    return False
                if key in constraints and directive_group in directives:
                    if directives[directive_group] != "" and directives[key] != "":
                        return True
        return False

    def generate_single_permutation(self, control_tree, current_directive, current_index, first_time=False):
        node = control_tree
        directive_selection = dict.fromkeys(self.dct_domain, '')
        if not first_time:
            domain_length = len(self.dct_domain[current_directive])

        for directive_group in self.dct_domain:
            if first_time:
                first_time = False
                current_directive = directive_group
                domain_length = len(self.dct_domain[current_directive])
                current_index = 1
            if directive_group != current_directive:
                directive_selection[directive_group] = self.dct_domain[directive_group][0]
            else:
                if current_index < domain_length:
                    directive_selection[directive_group] = self.dct_domain[directive_group][current_index]
                    current_index += 1
                else:
                    directive_selection[directive_group] = self.dct_domain[directive_group][0]
                    first_time = True

            if current_index in node:
                node = node[current_index]
            else:
                node[current_index] = {}
                node = node[current_index]

        return directive_selection, current_directive, current_index, first_time

    def generate_random_permutation(self, control_tree):
        node = control_tree
        permutation = dict.fromkeys(self.dct_domain, '')
        is_new = False

        for directive_group in self.dct_domain:
            domain_length = len(self.dct_domain[directive_group])
            rand_idx = randint(0, domain_length - 1)
            permutation[directive_group] = self.dct_domain[directive_group][rand_idx]

            if self.is_restricted_design(permutation) or self.is_redundant_design(permutation):
                permutation[directive_group] = ''
                rand_idx = self.dct_domain[directive_group].index('')

            if rand_idx in node:
                node = node[rand_idx]
            else:
                node[rand_idx] = {}
                node = node[rand_idx]
                is_new = True

        return permutation if is_new else None

    def store_permutations(self, tree, good_run_count):
        tree['good_run_count'] = str(good_run_count)
        file_path = f"./DATASETS/{self.kernel_name}/stored_permutations.json"
        with open(file_path, 'w') as f:
            json.dump(tree, f)

    def _decode_json(self, obj):
        if isinstance(obj, str):
            return int(obj)
        elif isinstance(obj, dict):
            return {self._decode_json(k): self._decode_json(v) for k, v in obj.items()}
        return obj

    def get_stored_permutations(self):
        file_path = Path(f"./DATASETS/{self.kernel_name}/stored_permutations.json")
        if not file_path.is_file():
            return None, -1

        with open(file_path, "r") as f:
            tree = json.load(f)

        good_run_count = tree.pop('good_run_count', -1)
        tree = self._decode_json(tree)

        return int(good_run_count), tree

    def append_solution(self, solution):
        self.solutions.append(copy.deepcopy(solution))

    def synthesis_wrapper(self, solution: Solution, time_limit=None, sol_saver=None, sol_count=1, tool_choice="vitis", alt=False):
        was_successful = False
        tool = DesignToolFactory.getDesignTool(tool_choice)
        try:
            if not alt:
                was_successful = tool.runSynthesis(solution, time_limit, sol_saver, self.kernel_name, sol_count)
            else:
                was_successful = tool.altRunSynth(solution, time_limit, sol_saver, self.kernel_name, sol_count)
        except Exception:
            raise
        else:
            self.append_solution(solution)
        return was_successful
