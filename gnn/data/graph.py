import os
import json
import copy
import math
import subprocess
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from typing import Optional, Dict, List, Any

import numpy as np
import networkx as nx

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import (
    parse_tcl_directives,
    extract_auto_dcts_from_log,
    extract_metrics,
    extract_module_utilization,
    AREA_METRICS
)

DIRECTIVES = [
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll",
    "dataflow", "inline"
]

OP_TYPES = [
    'memory', 'control_flow', 'arithmetic_int',
    'arithmetic_fp', 'bitwise_logical',
    'data_selection_manipulation', 'casting_conversion',
    'relational_specialized', 'io'
]

OPCODE_MAP = {
    # Memory operations
    'alloca': (0, 0),
    'load': (0, 1),
    'store': (0, 2),
    'getelementptr': (0, 3),

    # Control flow
    'br': (1, 0),
    'ret': (1, 1),
    'call': (1, 2),
    'switch': (1, 3),

    # Arithmetic (integer)
    'add': (2, 0),
    'sub': (2, 1),
    'mul': (2, 2),

    # Arithmetic (floating-point)
    'dadd': (3, 0),
    'dsub': (3, 1),
    'dmul': (3, 2),
    'ddiv': (3, 3),
    'dsqrt': (3, 4),
    'dexp': (3, 5),
    'sitodp': (3, 6),

    # Bitwise & logical
    'and': (4, 0),
    'or': (4, 1),
    'xor': (4, 2),
    'shl': (4, 3),
    'lshr': (4, 4),
    'ashr': (4, 5),

    # Data selection & manipulation
    'phi': (5, 0),
    'select': (5, 1),
    'mux': (5, 2),
    'sparsemux': (5, 3),
    'bitconcatenate': (5, 4),
    'bitselect': (5, 5),
    'partselect': (5, 6),
    'insertvalue': (5, 7),
    'extractvalue': (5, 8),

    # Casting & conversion
    'zext': (6, 0),
    'sext': (6, 1),
    'trunc': (6, 2),
    'bitcast': (6, 3),

    # Relational & specialized
    'icmp': (7, 0),
    'cttz': (7, 1),

    # I/O operations
    'read': (8, 0),
    'write': (8, 1)
}

NUM_OP_TYPES = len(OP_TYPES)
MAX_NUM_OPS_BY_TYPE = 9

BASE_TYPE_MAP = {
    '11': [1, 0, 0],
    '3': [0, 1, 0],
    'unknown': [0, 0, 1]
}
CONST_TYPE_MAP = {
    '0': [1, 0, 0],
    '1': [0, 1, 0],
    '5': [0, 0, 1]
}
CORE_MAP = {
    'TAddSub': [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
    'LogicGate': [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'Shifter': [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'Int2Double': [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'Multiplexer': [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'Adder': [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'DMul_maxdsp': [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'SparseMux': [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'Sel': [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'DSqrt': [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'RAM': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'DAddSub_fulldsp': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    'ROM_1P_LUTRAM': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    'ROM': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
    'DDiv': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    'Cmp': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
    'DSP48': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    'Multiplier': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    'DExp_fulldsp': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    'unknown': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
}
BASE_TYPE_LEN = 3
CONST_TYPE_LEN = 3
CORE_LEN = 20

EDGE_TYPE_MAP = {
    '2': [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    '4': [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    'data': [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    'hier': [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
    'hier_rev': [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    'call': [0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
    'ret': [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    'store': [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    'alloca': [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    'arg': [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
}

MAX_ARRAY_DIM = 4
MAX_LOOP_DEPTH = 5

INLINE_THRESHOLD = 30

NODE_TYPES = ['port', 'internal_mem', 'op', 'const', 'block', 'region']
NODE_TYPE_MAP = {
    'port': [1, 0, 0, 0, 0, 0],
    'internal_mem': [0, 1, 0, 0, 0, 0],
    'op': [0, 0, 1, 0, 0, 0],
    'const': [0, 0, 0, 1, 0, 0],
    'block': [0, 0, 0, 0, 1, 0],
    'region': [0, 0, 0, 0, 0, 1]
}

DEFAULT_FEATURES = {
    'latency': 0,
    'trip_count': 0,
    'loop_depth': [0] * (MAX_LOOP_DEPTH + 1),
    'is_top_level_loop': 0,
    'has_perfectly_nested_child': 0,
    'is_part_of_perfect_nest': 0,
    'region_lut_sum': 0,
    'region_ff_sum': 0,
    'region_dsp_sum': 0,
    'region_bram_sum': 0,
    'region_num_memory_ops': 0,
    'region_num_control_flow_ops': 0,
    'region_num_arithmetic_int_ops': 0,
    'region_num_arithmetic_fp_ops': 0,
    'region_num_bitwise_logical_ops': 0,
    'region_num_data_selection_manipulation_ops': 0,
    'region_num_casting_conversion_ops': 0,
    'region_num_relational_specialized_ops': 0,
    'region_num_io_ops': 0,
    'region_total_num_ops': 0,
    'num_sub_regions': 0,
    'num_blocks': 0,
    'is_small_function': 0,
    'achieved_ii_base': 0,
    'target_ii': 0,
    'pipeline': 0,
    'auto_pipeline': 0,
    'unroll': 0,
    'loop_flatten': 0,
    'loop_merge': 0,
    'dataflow': 0,
    'inline': 0,
    'is_array': 0,
    'bitwidth': 0,
    'direction': [0, 0, 0],
    'is_top_level_port': 0,
    'is_large_array': 0,
    'array_size': 0,
    'original_array_dims': [0] * MAX_ARRAY_DIM,
    'original_bitwidth': 0,
    'original_base_type': [0] * BASE_TYPE_LEN,
    'base_type': [0] * BASE_TYPE_LEN,
    'array_partition': 0,
    'partition_type': [0] * 3,
    'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
    'partition_factor': 0,
    'is_unevenly_partitioned': 0,
    'has_hybrid_impl': 0,
    'is_global_mem': 0,
    'lut': 0,
    'ff': 0,
    'dsp': 0,
    'bram': 0,
    'opcode': [0] * (NUM_OP_TYPES + MAX_NUM_OPS_BY_TYPE),
    'core_name': [0] * CORE_LEN,
    'op_delay': 0.0,
    'is_on_critical_path': 0,
    'callee_size': 0,
    'const_type': [0] * CONST_TYPE_LEN,
    'block_lut_sum': 0,
    'block_ff_sum': 0,
    'block_dsp_sum': 0,
    'block_bram_sum': 0,
    'block_num_memory_ops': 0,
    'block_num_control_flow_ops': 0,
    'block_num_arithmetic_int_ops': 0,
    'block_num_arithmetic_fp_ops': 0,
    'block_num_bitwise_logical_ops': 0,
    'block_num_data_selection_manipulation_ops': 0,
    'block_num_casting_conversion_ops': 0,
    'block_num_relational_specialized_ops': 0,
    'block_num_io_ops': 0,
    'block_total_num_ops': 0
}

NODE_DIM = 137
EDGE_DIM = 11

FEATURES = list(DEFAULT_FEATURES.keys())

NUMERICAL_FEATURES = [
    'bitwidth', 'latency', 'op_delay', 'original_array_dims', 
    'array_size', 'trip_count', 'achieved_ii_base', 
    'callee_size', 'num_blocks', 'num_sub_regions',
    'block_total_num_ops', 'region_total_num_ops'
] + AREA_METRICS + [
    f'block_{metric}_sum' for metric in AREA_METRICS
] + [
    f'region_{metric}_sum' for metric in AREA_METRICS
] + [
    f'block_num_{op_type}_ops' for op_type in OP_TYPES
] + [
    f'region_num_{op_type}_ops' for op_type in OP_TYPES
]

NO_LOG_SCALING_KEYS = ['original_bitwidth', 'bitwidth', 'op_delay']

class Node(ABC):
    @abstractmethod
    def get_homogeneous_features(self, as_dict: bool = False):
        pass

    @abstractmethod
    def as_dict(self):
        pass

    @abstractmethod
    def __str__(self):
        pass

    @abstractmethod
    def __repr__(self):
        pass


class CDFGNode(Node):
    def __init__(self, element: ET.Element, node_type: str, function_name: str = ''):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        if obj is None:
            raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
        
        self.id = findint(obj, 'id')
        if self.id is None:
            raise ValueError("Element does not contain 'id' tag")
        
        self.node_type = node_type
        self.name = obj.findtext('name', '')
        self.rtl_name = obj.findtext('rtlName', '')
        self.function_name = function_name
        self.label = f"{self.function_name}/{self.name}"
        self.feature_dict = {}

    def get_homogeneous_features(self, as_dict: bool = False):
        homogeneous_features = {'node_type': NODE_TYPE_MAP[self.node_type]}

        for feature in FEATURES:
            if feature in self.feature_dict:
                homogeneous_features[feature] = self.feature_dict[feature]
            else:
                homogeneous_features[feature] = DEFAULT_FEATURES[feature]

        if as_dict:
            return homogeneous_features
        
        feature_vector = []
        for feature in ['node_type'] + FEATURES:
            feature_value = homogeneous_features[feature]
            if not isinstance(feature_value, (int, float, np.float_, np.float64)):
                feature_vector.extend(list(feature_value))
            else:
                feature_vector.append(feature_value)

        return feature_vector

    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label, 
            'rtl_name': self.rtl_name,
            'feature_dict': self.feature_dict
        }
        return node_as_dict

    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class RegionNode(Node):
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str,
        is_function: bool = False,
        loop_md: Optional[Dict[str, Any]] = None
    ):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        
        self.node_type = 'region'
        self.function_name = function_name
        self.is_function = is_function

        if is_function:
            self.name = function_name
            self.label = function_name
        else:
            self.name = element.findtext('mNormTag', '')
            if not self.name:
                self.name = element.findtext('mTag', '').replace('.', '_')
            norm_name = self.name.replace(' ', '_')
            self.label = f'{function_name}/{norm_name}'

        latency = max(0, findint(element, 'mMaxLatency', 0))
        trip_count = max(0, findint(element, 'mMaxTripCount', 0))
        ii = max(0, findint(element, 'mII', 0))
        auto_pipeline = ii > 0

        if loop_md is not None:
            self.is_loop = True
            is_top_level_loop = loop_md.get('IsTopLevel', 0)
            has_perfectly_nested_child = loop_md.get('HasPerfectlyNestedChild', 0)
            is_part_of_perfect_nest = loop_md.get('IsPartOfPerfectNest', 0)
            loop_depth = max(1, loop_md.get('Depth', 0))
            if loop_depth > MAX_LOOP_DEPTH:
                loop_depth = MAX_LOOP_DEPTH
        else:
            self.is_loop = findint(element, 'mType', 0) == 1
            is_top_level_loop = 0
            has_perfectly_nested_child = 0
            is_part_of_perfect_nest = 0
            loop_depth = 1 if self.is_loop else 0

        encoded_loop_depth = [0] * (MAX_LOOP_DEPTH + 1)
        encoded_loop_depth[loop_depth] = 1

        self.feature_dict = {
            'is_loop': int(self.is_loop),
            'is_function': int(is_function),
            'latency': latency,
            'trip_count': trip_count,
            'is_top_level_loop': is_top_level_loop,
            'has_perfectly_nested_child': has_perfectly_nested_child,
            'is_part_of_perfect_nest': is_part_of_perfect_nest,
            'loop_depth': encoded_loop_depth, 
            'achieved_ii_base': ii, 
            'target_ii': 0,
            'auto_pipeline': int(auto_pipeline),
            'pipeline': 0,
            'unroll': 0,
            'unroll_factor': 0,
            'loop_flatten': 0,
            'loop_merge': 0,
            'inline': 0,
            'dataflow': 0
        }

        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')
        self.ops = []
    
    def _extract_items(self, element, tag):
        parent_tag = element.find(tag)
        if parent_tag is None:
            return []
        return [int(item.text) for item in parent_tag.findall('item')]
    
    def get_homogeneous_features(self, as_dict: bool = False):
        homogeneous_features = {'node_type': NODE_TYPE_MAP[self.node_type]}

        for feature in FEATURES:
            if feature in self.feature_dict:
                homogeneous_features[feature] = self.feature_dict[feature]
            else:
                homogeneous_features[feature] = DEFAULT_FEATURES[feature]

        if as_dict:
            return homogeneous_features
        
        feature_vector = []
        for feature in ['node_type'] + FEATURES:
            feature_value = homogeneous_features[feature]
            if not isinstance(feature_value, (int, float, np.float_, np.float64)):
                feature_vector.extend(list(feature_value))
            else:
                feature_vector.append(feature_value)

        return feature_vector

    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label,
            'feature_dict': self.feature_dict,
            'sub_regions': self.sub_regions,
            'blocks': self.blocks
        }
        return node_as_dict
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)

    def __repr__(self):
        return self.__str__()
    

class PortNode(CDFGNode):
    def __init__(
        self,
        element: ET.Element,
        function_name: str,
        is_top_level_port: bool = False,
        array_md: Optional[Dict[str, Any]] = None
    ):
        super().__init__(element, 'port', function_name)
        self.is_top_level_port = is_top_level_port

        bitwidth = max(0, findint(element, 'Value/bitwidth', 0))
        
        if array_md is not None and 'OriginalDimensions' in array_md:
            self.is_array = True

            self.array_size = array_md['TotalSize']
            self.num_dims = array_md['OriginalNumDimensions']
            base_type = str(array_md['BaseType'])
            original_bitwidth = array_md['OriginalBaseBitwidth']
            original_base_type = str(array_md['OriginalBaseType'])
            dims = array_md['OriginalDimensions']

            if self.num_dims > MAX_ARRAY_DIM:
                # Truncate to MAX_ARRAY_DIM
                for i in range(self.num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                    dims[i - 1] *= dims[i]
                    dims.pop()
            elif self.num_dims < MAX_ARRAY_DIM:
                # Pad with 1s
                dims.extend([1] * (MAX_ARRAY_DIM - self.num_dims))
        else:
            self.is_array = findint(element, 'if_type', 0) == 1
            self.array_size = findint(element, 'array_size', 0)

            if self.is_array:
                self.num_dims = 1
                dims = [self.array_size] + [1] * (MAX_ARRAY_DIM - 1)
            else:
                self.num_dims = 0
                dims = [0] * MAX_ARRAY_DIM

            base_type = 'unknown'
            original_bitwidth = bitwidth
            original_base_type = base_type

        direction = [0, 0, 0] # IN, OUT, BI
        direction[findint(element, 'direction', 2)] = 1

        if base_type in BASE_TYPE_MAP:
            one_hot_base_type = BASE_TYPE_MAP[base_type]
        else:
            one_hot_base_type = BASE_TYPE_MAP['unknown']

        if original_base_type in BASE_TYPE_MAP:
            one_hot_original_base_type = BASE_TYPE_MAP[original_base_type]
        else:
            one_hot_original_base_type = BASE_TYPE_MAP['unknown']

        self.feature_dict.update({
            'is_array': int(self.is_array),
            'is_top_level_port': int(is_top_level_port),
            'is_large_array': int(self.array_size >= 1024),
            'direction': direction,
            'array_size': self.array_size,
            'original_array_dims': dims,
            'original_bitwidth': original_bitwidth,
            'original_base_type': one_hot_original_base_type,
            'bitwidth': bitwidth,
            'base_type': one_hot_base_type,
            'array_partition': 0,
            'partition_type': [0] * 3,
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0,
            'is_unevenly_partitioned': 0,
            'has_hybrid_impl': 0
        })

        self.matching_ports = []
    
    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label,
            'feature_dict': self.feature_dict,
            'matching_ports': self.matching_ports
        }
        return node_as_dict


class InternalMemNode(Node):
    def __init__(
        self,
        element: Optional[ET.Element] = None,
        function_name: str = '',
        name: str = '',
        node_id: Optional[int] = None,
        rtl_name: str = '',
        array_md: Optional[Dict[str, Any]] = None,
        is_global_mem: bool = False,
        utilization: Optional[Dict[str, int]] = None
    ):
        self.node_type = 'internal_mem'

        if element is not None:
            value = element.find('Value')
            obj = element.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            self.id = findint(obj, 'id')
            if self.id is None:
                raise ValueError("Element does not contain 'id' tag")
            
            self.name = obj.findtext('name', '')
            self.rtl_name = obj.findtext('rtlName', '')
        else:
            self.id = node_id if node_id is not None else -1
            self.name = name
            self.rtl_name = rtl_name

        self.function_name = function_name
        self.label = f"{self.function_name}/{self.name}"
        self.is_global_mem = is_global_mem
    
        if array_md is not None:
            self.is_array = True
            self.array_size = array_md['TotalSize']
            self.num_dims = array_md['OriginalNumDimensions']

            bitwidth = array_md['BaseBitwidth']
            base_type = str(array_md['BaseType'])
            original_bitwidth = array_md['OriginalBaseBitwidth']
            original_base_type = str(array_md['OriginalBaseType'])
            dims = array_md['OriginalDimensions']

            if self.num_dims > MAX_ARRAY_DIM:
                # Truncate to MAX_ARRAY_DIM
                for i in range(self.num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                    dims[i - 1] *= dims[i]
                    dims.pop()
            elif self.num_dims < MAX_ARRAY_DIM:
                # Pad with 1s
                dims.extend([1] * (MAX_ARRAY_DIM - self.num_dims))
        else:
            self.array_size = findint(element, 'Value/Obj/storageDepth', 0)
            self.is_array = self.array_size > 0

            if self.is_array:
                self.num_dims = 1
                dims = [self.array_size] + [1] * (MAX_ARRAY_DIM - 1)
            else:
                self.num_dims = 0
                dims = [0] * MAX_ARRAY_DIM

            bitwidth = max(0, findint(element, 'Value/bitwidth', 0))
            base_type = 'unknown'
            original_bitwidth = bitwidth
            original_base_type = base_type

        if base_type in BASE_TYPE_MAP:
            one_hot_base_type = BASE_TYPE_MAP[base_type]
        else:
            one_hot_base_type = BASE_TYPE_MAP['unknown']

        if original_base_type in BASE_TYPE_MAP:
            one_hot_original_base_type = BASE_TYPE_MAP[original_base_type]
        else:
            one_hot_original_base_type = BASE_TYPE_MAP['unknown']

        self.feature_dict = {
            'is_array': int(self.is_array),
            'is_global_mem': int(is_global_mem),
            'is_large_array': int(self.array_size >= 1024),
            'array_size': self.array_size,
            'original_array_dims': dims,
            'original_bitwidth': original_bitwidth,
            'original_base_type': one_hot_original_base_type,
            'bitwidth': bitwidth,
            'base_type': one_hot_base_type,
            'array_partition': 0,
            'partition_type': [0] * 3,
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0,
            'is_unevenly_partitioned': 0,
            'has_hybrid_impl': 0
        }

        if utilization is not None:
            for res in AREA_METRICS:
                self.feature_dict[res] = utilization.get(res, 0)
        else:
            self.feature_dict.update({res: 0 for res in AREA_METRICS})

        self.matching_ports = []

    def get_homogeneous_features(self, as_dict: bool = False):
        homogeneous_features = {'node_type': NODE_TYPE_MAP[self.node_type]}

        for feature in FEATURES:
            if feature in self.feature_dict:
                homogeneous_features[feature] = self.feature_dict[feature]
            else:
                homogeneous_features[feature] = DEFAULT_FEATURES[feature]
            if isinstance(homogeneous_features[feature], str):
                print(f'String feature: {feature} - {homogeneous_features[feature]}')

        if as_dict:
            return homogeneous_features
        
        feature_vector = []
        for feature in ['node_type'] + FEATURES:
            feature_value = homogeneous_features[feature]
            if not isinstance(feature_value, (int, float, np.float_, np.float64)):
                feature_vector.extend(list(feature_value))
            else:
                feature_vector.append(feature_value)

        return feature_vector

    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label,
            'rtl_name': self.rtl_name,
            'is_global_mem': self.is_global_mem,
            'feature_dict': self.feature_dict,
            'matching_ports': self.matching_ports
        }
        return node_as_dict
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)

    def __repr__(self):
        return self.__str__()
    

class OperationNode(CDFGNode):
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str,
        utilization: Optional[Dict[str, int]] = None
    ):
        super().__init__(element, 'op', function_name)

        self.opcode = element.findtext('opcode', 'unknown')
        self.core_name = element.findtext('Value/Obj/coreName', '')
        if not self.core_name:
            self.core_name = 'unknown'

        if self.core_name in CORE_MAP:
            one_hot_core = CORE_MAP[self.core_name]
        else:
            one_hot_core = CORE_MAP['unknown']
        
        one_hot_opcode = self._get_one_hot_opcode()

        self.feature_dict.update({
            'opcode': one_hot_opcode,
            'core_name': one_hot_core,
            'bitwidth': max(0, findint(element, 'Value/bitwidth', 0)),
            'op_delay': findfloat(element, 'm_delay', 0.0),
            'is_on_critical_path': findint(element, 'm_isOnCriticalPath', 0),
            'callee_size': 0
        })

        if utilization is not None:
            for res in AREA_METRICS:
                self.feature_dict[res] = utilization.get(res, 0)
        else:
            self.feature_dict.update({res: 0 for res in AREA_METRICS})

        op_edges = element.find('oprand_edges') # ** This is not a typo **
        if op_edges is None:
            self.operand_edges = []
        else:
            self.operand_edges = [int(edge.text) for edge in op_edges.findall('item')]

    def _get_one_hot_opcode(self):
        if self.opcode not in OPCODE_MAP:
            return [0] * (NUM_OP_TYPES + MAX_NUM_OPS_BY_TYPE)
        
        encoded_op_type = [0] * NUM_OP_TYPES
        encoded_op = [0] * MAX_NUM_OPS_BY_TYPE

        op_type, op_num = OPCODE_MAP[self.opcode]
        encoded_op_type[op_type] = 1
        encoded_op[op_num] = 1

        return encoded_op_type + encoded_op
    
    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label,
            'rtl_name': self.rtl_name,
            'core_name': self.core_name,
            'opcode': self.opcode,
            'feature_dict': {
                key: value 
                for key, value in self.feature_dict.items() 
                if key not in ['opcode', 'core_name']
            },
            'operand_edges': self.operand_edges
        }
        return node_as_dict


class ConstantNode(CDFGNode):
    def __init__(self, element: ET.Element, function_name: str):
        super().__init__(element, 'const', function_name)

        self.content = element.findtext('content', '')
        self.label += f" ({self.content})"

        self.const_type = str(element.findtext('const_type', 'unknown'))
        if self.const_type in CONST_TYPE_MAP:
            one_hot_const_type = CONST_TYPE_MAP[self.const_type]
        else:
            one_hot_const_type = [0] * 3

        self.feature_dict.update({
            'bitwidth': max(0, findint(element, 'Value/bitwidth', 0)),
            'const_type': one_hot_const_type
        })


class BlockNode(CDFGNode):
    def __init__(self, element: ET.Element, function_name: str):
        super().__init__(element, 'block', function_name)

        self.ops = self._extract_items(element, 'node_objs')

    def _extract_items(self, element, tag):
        parent_tag = element.find(tag)
        if parent_tag is None:
            return []
        return [int(item.text) for item in parent_tag.findall('item')]
    
    def as_dict(self):
        node_as_dict = {
            'id': self.id,
            'label': self.label,
            'feature_dict': self.feature_dict,
            'ops': self.ops,
        }
        return node_as_dict


class Edge:
    def __init__(self, src: str, dst: str, etype: str, is_back_edge: bool = False):
        self.src = src
        self.dst = dst
        self.etype = etype
        self.one_hot_etype = EDGE_TYPE_MAP.get(etype, [0] * 10)
        self.is_back_edge = is_back_edge
        self.label = f"{src} -> {dst} ({etype})"

    def as_dict(self):
        edge_as_dict = {
            'src': self.src,
            'dst': self.dst,
            'etype': self.etype,
            'is_back_edge': self.is_back_edge
        }
        return edge_as_dict
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

class CDFG:
    def __init__(
        self,
        root: ET.Element,
        top_level_name: str,
        global_names: List[str],
        array_md_dict: Dict[str, Dict[str, Any]],
        loop_md_dict: Dict[str, Dict[str, Any]],
        utilization_dict: Dict[str, Dict[str, int]]
    ):
        cdfg = root.find('syndb/cdfg')
        if cdfg is None:
            raise ValueError("CDFG not found in the XML file")
        
        cdfg_regions = root.find('syndb/cdfg_regions')
        if cdfg_regions is None:
            raise ValueError("CDFG regions not found in the XML file")
        
        self.name = cdfg.findtext('name')
        
        if self.name.endswith('_1'):
            self.original_name = self.name[:-2]
            self.unnormalized_name = self.original_name + '.1'
        else:
            self.original_name = self.name
            self.unnormalized_name = self.name

        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth', 0)
        self.is_top_level = self.original_name == top_level_name
        
        self.nodes = {}
        self.edges = {}
        self.function_calls = []
        self.global_rtl_name_dict = {}

        self._parse_nodes(
            cdfg, cdfg_regions, global_names, 
            array_md_dict, loop_md_dict, utilization_dict
        )
        self._parse_edges(cdfg)
        self._build_hierarchy_edges()

    def _parse_nodes(
        self, cdfg, cdfg_regions, global_names, 
        array_md_dict, loop_md_dict, utilization_dict
    ):
        if (consts := cdfg.find('consts')) is None:
            raise ValueError("CDFG does not contain 'consts' section")
        if (ops_and_mem := cdfg.find('nodes')) is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        if (ports := cdfg.find('ports')) is None:
            raise ValueError("CDFG does not contain 'ports' section")
        if (blocks := cdfg.find('blocks')) is None:
            raise ValueError("CDFG does not contain 'blocks' section")
        
        self._process_ops_and_internal_mem(ops_and_mem, array_md_dict, utilization_dict)
        self._process_ports(ports, global_names, array_md_dict)
        self._process_consts(consts)
        self._process_blocks(blocks)
        self._process_regions(cdfg_regions, loop_md_dict)

    def _process_ops_and_internal_mem(self, ops_and_mem, array_md_dict, utilization_dict):
        self._allocas = []
        self._alloca_edges = []

        for elem in ops_and_mem.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            name = obj.findtext('name', '')
            rtl_name = obj.findtext('rtlName', '')
            
            opcode = elem.findtext('opcode', '')
            if opcode == 'GlobalMem':
                if name and rtl_name and name not in self.global_rtl_name_dict:
                    self.global_rtl_name_dict[name] = rtl_name
                continue # Skip globals for now

            utilization = utilization_dict.get(rtl_name) if rtl_name else None

            op_node = OperationNode(elem, self.original_name, utilization=utilization)
            op_id = f'{self.name}.{op_node.id}'
            self.nodes[op_id] = op_node

            if opcode == 'alloca':
                self._allocas.append(op_id)

                array_md = None
                if f'{self.unnormalized_name}/{name}' in array_md_dict:
                    array_md = array_md_dict[f'{self.unnormalized_name}/{name}']
                elif f'{self.name}/{name}' in array_md_dict:
                    array_md = array_md_dict[f'{self.name}/{name}']
                elif f'{self.original_name}/{name}' in array_md_dict:
                    array_md = array_md_dict[f'{self.original_name}/{name}']

                internal_mem_node = InternalMemNode(
                    elem, self.original_name, 
                    array_md=array_md, utilization=utilization
                )
                internal_mem_id = op_id + '.internal_mem'
                self.nodes[internal_mem_id] = internal_mem_node
                self._alloca_edges.append((op_id, internal_mem_id))

    def _process_ports(self, ports, global_names, array_md_dict):
        for elem in ports.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            name = obj.findtext('name', '')
            if name in global_names:
                continue # Skip globals for now

            array_md = None
            if f'{self.unnormalized_name}/{name}' in array_md_dict:
                array_md = array_md_dict[f'{self.unnormalized_name}/{name}']
            elif f'{self.name}/{name}' in array_md_dict:
                array_md = array_md_dict[f'{self.name}/{name}']
            elif f'{self.original_name}/name' in array_md_dict:
                array_md = array_md_dict[f'{self.original_name}/{name}']

            node = PortNode(
                elem, self.original_name, 
                is_top_level_port=self.is_top_level, array_md=array_md 
            )
            port_id = f'{self.name}.{node.id}'
            self.nodes[port_id] = node

    def _process_consts(self, consts):
        # Note: Constant nodes with type '4' and '6' are used to represent 
        # indices for getelementptr operations and call edges, respectivelly. 
        # Those will be removed later.
        self._const_callee_name_map = {}
        self._gep_index_consts = []

        for elem in consts.findall('item'):
            node = ConstantNode(elem, self.original_name)
            const_id = f'{self.name}.{node.id}'

            if node.const_type == '4':
                self._gep_index_consts.append(const_id)
            elif node.const_type == '6':
                self._const_callee_name_map[const_id] = node.name
            else:
                self.nodes[const_id] = node

    def _process_blocks(self, blocks):
        for elem in blocks.findall('item'):
            node = BlockNode(elem, self.original_name)
            block_id = f'{self.name}.{node.id}'

            node.feature_dict.update({f"block_{res}_sum": 0 for res in AREA_METRICS})
            node.feature_dict.update({f'block_num_{op_type}_ops': 0 for op_type in OP_TYPES})
            is_on_critical_path = 0

            updated_ops = []
            for op in node.ops:
                op_id = f'{self.name}.{op}'
                if op_id in self.nodes:
                    updated_ops.append(op_id)

                    op_node = self.nodes[op_id]
                    for res in AREA_METRICS:
                        node.feature_dict[f"block_{res}_sum"] += op_node.feature_dict.get(res, 0)
                        
                    if op_node.opcode in OPCODE_MAP:
                        op_type, _ = OPCODE_MAP[op_node.opcode]
                        op_type = OP_TYPES[op_type]
                        node.feature_dict[f'block_num_{op_type}_ops'] += 1

                    if op_node.feature_dict.get('is_on_critical_path', 0):
                        is_on_critical_path = 1

            node.ops = updated_ops
            node.feature_dict['block_total_num_ops'] = len(updated_ops)
            node.feature_dict['is_on_critical_path'] = is_on_critical_path
            self.nodes[block_id] = node

    def _process_regions(self, regions, loop_md_dict):
        elems = regions.findall('item')

        function_node = None
        if elems:
            first_elem = elems[0]
            if findint(first_elem, 'mType', 0) != 1: # Not a loop
                function_node = RegionNode(
                    first_elem, self.original_name, is_function=True
                )

        if function_node is None:
            raise ValueError("CDFG does not contain a function region")
        
        region_nodes = {}
        function_id = f'{self.name}.region.{function_node.id - 1}'
        region_nodes[function_id] = function_node

        for elem in elems[1:]:
            name = elem.findtext('mTag', '')
            loop_md = None
            if f'{self.unnormalized_name}/{name}' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.unnormalized_name}/{name}']
            elif f'{self.name}/{name}' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.name}/{name}']
            elif f'{self.original_name}/name' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.original_name}/{name}']

            node = RegionNode(elem, self.original_name, loop_md=loop_md) 
            region_id = f'{self.name}.region.{node.id - 1}'

            updated_sub_regions = []
            for sub_region in node.sub_regions:
                updated_sub_regions.append(f'{self.name}.region.{sub_region - 1}')

            updated_blocks = []
            for block in node.blocks:
                block_id = f'{self.name}.{block}'
                if block_id in self.nodes:
                    updated_blocks.append(block_id)

            node.sub_regions = updated_sub_regions
            node.blocks = updated_blocks
            region_nodes[region_id] = node

        for region_id, region_node in region_nodes.items():
            all_sub_regions = self._get_all_sub_regions(region_nodes, region_node)
            all_blocks = set(region_node.blocks)
            for sub_region_id in all_sub_regions:
                if sub_region_id in region_nodes:
                    sub_region = region_nodes[sub_region_id]
                    all_blocks.update(sub_region.blocks)

            region_node.feature_dict.update(
                {f"region_{res}_sum": 0 for res in AREA_METRICS}
            )
            region_node.feature_dict.update(
                {f'region_num_{op_type}_ops': 0 for op_type in OP_TYPES}
            )
            region_node.feature_dict['region_total_num_ops'] = 0

            for block_id in all_blocks:
                if block_id not in self.nodes:
                    continue

                block_node = self.nodes[block_id]
                if block_node.node_type != 'block':
                    continue

                for op_type in OP_TYPES:
                    region_node.feature_dict[f'region_num_{op_type}_ops'] += block_node.feature_dict.get(f'block_num_{op_type}_ops', 0)
                    
                for res in AREA_METRICS:
                    region_node.feature_dict[f'region_{res}_sum'] += block_node.feature_dict.get(f'block_{res}_sum', 0)
                
                region_node.feature_dict['region_total_num_ops'] += block_node.feature_dict.get('block_total_num_ops', 0)
            
            region_node.feature_dict['num_sub_regions'] = len(all_sub_regions)
            region_node.feature_dict['num_blocks'] = len(all_blocks)

            num_ops = region_node.feature_dict['region_total_num_ops']
            if region_node.is_function and num_ops < INLINE_THRESHOLD:
                region_node.feature_dict['is_small_function'] = 1
            else:
                region_node.feature_dict['is_small_function'] = 0

            self.nodes[region_id] = region_node

    def _get_all_sub_regions(self, region_nodes, region_node):
        all_sub_regions = set(region_node.sub_regions)
        for sub_region_id in region_node.sub_regions:
            if sub_region_id in region_nodes:
                sub_region_node = region_nodes[sub_region_id]
                all_sub_regions.update(self._get_all_sub_regions(region_nodes, sub_region_node))
        return all_sub_regions

    def _parse_edges(self, cdfg):
        src_gep_index_consts = []
        dst_get_index_consts = []

        for elem in cdfg.find('edges').findall('item'):
            etype = elem.findtext('edge_type', '')
            edge_id = elem.findtext('id', '')
            if not etype or not edge_id:
                continue

            if etype in ['1', '3']:
                etype = 'data'

            is_back_edge = findint(elem, 'is_back_edge', 0) == 1
            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')

            if src is None or dst is None:
                continue

            src_id = f'{self.name}.{src}'
            dst_id = f'{self.name}.{dst}'

            if src_id in self._const_callee_name_map:
                if dst_id in self.nodes:
                    callee_name = self._const_callee_name_map[src_id]
                    self.function_calls.append((dst_id, callee_name))
                continue

            if src_id in self._gep_index_consts:
                if dst_id in self.nodes:
                    src_gep_index_consts.append((src_id, dst_id))
                continue

            if dst_id in self._gep_index_consts:
                if src_id in self.nodes:
                    if src_id in self._allocas:
                        internal_mem_id = src_id + '.internal_mem'
                        dst_get_index_consts.append((internal_mem_id, dst_id))
                    dst_get_index_consts.append((src_id, dst_id))
                continue

            if src_id not in self.nodes or dst_id not in self.nodes:
                continue
            
            edge_id = f'{self.name}.{edge_id}'
            if src_id in self._allocas and etype in ['data', '4']:
                internal_mem_id = src_id + '.internal_mem'
                if internal_mem_id in self.nodes:
                    internal_mem_edge_id = edge_id + '.internal_mem'
                    internel_mem_edge = Edge(src_id, internal_mem_id, etype, is_back_edge)
                    self.edges[internal_mem_edge_id] = internel_mem_edge

            edge = Edge(src_id, dst_id, etype, is_back_edge)
            self.edges[edge_id] = edge

        num_edges = len(self.edges)

        for src, dst_const in dst_get_index_consts:
            for src_const, op in src_gep_index_consts:
                if src_const == dst_const:
                    self.edges[f'{self.name}.{num_edges}'] = Edge(src, op, 'get_index')
                    num_edges += 1

        for src, dst in self._alloca_edges:
            if src in self.nodes and dst in self.nodes:
                self.edges[f'{self.name}.{num_edges}'] = Edge(src, dst, 'alloca')
                num_edges += 1

    def _build_hierarchy_edges(self):
        num_edges = len(self.edges)

        for node_id, node in self.nodes.items():
            if node.node_type != 'region':
                continue

            for sub_region_id in node.sub_regions:
                if sub_region_id not in self.nodes:
                    continue
                
                self.edges[f'{self.name}.{num_edges}'] = Edge(node_id, sub_region_id, 'hier')
                num_edges += 1

            for block_id in node.blocks:
                if block_id not in self.nodes:
                    continue

                self.edges[f'{self.name}.{num_edges}'] = Edge(node_id, block_id, 'hier')
                num_edges += 1

                block_node = self.nodes[block_id]
                for op_id in block_node.ops:
                    if op_id not in self.nodes:
                        continue

                    self.edges[f'{self.name}.{num_edges}'] = Edge(block_id, op_id, 'hier')
                    self.edges[f'{self.name}.{num_edges + 1}'] = Edge(node_id, op_id, 'hier')
                    num_edges += 2
        
        rev_hier_edges = {}
        for edge_id, edge in self.edges.items():
            if edge.etype == 'hier':
                rev_hier_edges[edge_id + '.rev'] = Edge(edge.dst, edge.src, 'hier_rev')
                
        self.edges.update(rev_hier_edges)
    
    def as_dict(self):
        return {
            'name': self.original_name,
            'ret_bitwidth': self.ret_bitwidth,
            'is_top_level': self.is_top_level,
            'function_calls': self.function_calls,
            'nodes': {
                node_id: node.as_dict()
                for node_id, node in self.nodes.items()
            },
            'edges': {
                edge_id: edge.as_dict()
                for edge_id, edge in self.edges.items()
            }
        }
    
    def save_as_json(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.as_dict(), f, indent=2)

    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)

class KernelGraph:
    def __init__(
        self,
        solution_dir: str,
        top_level_name: str,
        global_array_md_dict: Dict[str, Dict[str, Any]],
        local_array_md_dict: Dict[str, Dict[str, Any]],
        loop_md_dict: Dict[str, Dict[str, Any]],
        benchmark_name: Optional[str] = None,
        filtered: bool = False
    ):
        self.top_level_name = top_level_name
        self.benchmark_name = benchmark_name if benchmark_name else '__empty__'

        self._global_array_md_dict = global_array_md_dict
        self._local_array_md_dict = local_array_md_dict
        self._loop_md_dict = loop_md_dict
        self._global_array_names = list(global_array_md_dict.keys())

        self.ground_truth_metrics = extract_metrics(solution_dir, filtered=filtered)
        self.utilization_dict = extract_module_utilization(solution_dir, filtered=filtered)

        self.nodes = {}
        self.edges = {}
        self._cdfgs = {}

        self._process_adb_files(solution_dir, filtered)
        self._update_array_info()
        self._include_call_flow()

    def to_networkx(self):
        DG = nx.DiGraph()

        for edge in self.edges.values():
            edge_attr = edge.one_hot_etype + [int(edge.is_back_edge)]
            DG.add_edge(edge.src, edge.dst, edge_attr=edge_attr)
            DG.edges[edge.src, edge.dst]['edge_attr'] = edge_attr

        for node_id, node in self.nodes.items():
            x = node.get_homogeneous_features()
            DG.add_node(node_id, x=x)
            DG.nodes[node_id]['x'] = x

        return DG

    def _process_adb_files(self, solution_dir, filtered):
        try:
            adb_file_list = collect_adb_files(solution_dir, filtered)
        except FileNotFoundError as e:
            print(e)
            raise

        if not adb_file_list:
            print(f"No ADB files found in {solution_dir}")
            raise FileNotFoundError("No ADB files found")
        
        self._global_rtl_name_dict = {}

        for path in adb_file_list:
            print(f"Processing file: {path}")
            tree = ET.parse(path)
            root = tree.getroot()
            cdfg = CDFG(
                root=root, 
                top_level_name=self.top_level_name, 
                global_names=self._global_array_names,
                array_md_dict=self._local_array_md_dict,
                loop_md_dict=self._loop_md_dict,
                utilization_dict=self.utilization_dict
            )
            self.nodes.update(cdfg.nodes)
            self.edges.update(cdfg.edges)
            self._global_rtl_name_dict.update(cdfg.global_rtl_name_dict)
            self._cdfgs[cdfg.name] = cdfg

    def _include_call_flow(self):
        # Collect array operands from function calls
        operand_dict = {}
        for edge in self.edges.values():
            src_node = self.nodes[edge.src]
            dst_node = self.nodes[edge.dst]
            if (dst_node.node_type == 'op' and dst_node.opcode == 'call' and 
                src_node.node_type in ['internal_mem', 'port'] and src_node.is_array):
                if dst_node.id not in operand_dict:
                    operand_dict[edge.dst] = []
                operand_dict[edge.dst].append(edge.src)

        for cdfg in self._cdfgs.values():
            for function_call in cdfg.function_calls:
                print(f"Processing function call: {function_call}")
                call_op_id = function_call[0]
                callee = function_call[1]
                if callee not in self._cdfgs:
                    print(f"Warning: Callee {callee} not found in CDFGs, skipping call flow.")
                    continue

                callee_cdfg = self._cdfgs[callee]
                callee_region_id = f'{callee_cdfg.name}.region.0'
                callee_region_node = callee_cdfg.nodes[callee_region_id]

                num_edges = len(self.edges)

                for src_id in operand_dict.get(call_op_id, []):
                    src_node = self.nodes[src_id]

                    # Find matching port in callee CDFG
                    for callee_node_id, callee_node in callee_cdfg.nodes.items():
                        if callee_node.node_type == 'port' and callee_node.name == src_node.name:
                            self.nodes[src_id].matching_ports.append(callee_node_id)
                            edge_id = f'callflow.{num_edges}'
                            self.edges[edge_id] = Edge(src_id, callee_node_id, 'arg')
                            num_edges += 1
                            break
            
                call_edge_id = f'{callee_cdfg.name}.{num_edges}'
                ret_edge_id = f'{callee_cdfg.name}.{num_edges + 1}'
                num_edges += 2

                self.edges[call_edge_id] = Edge(call_op_id, callee_region_id, 'call')
                self.edges[ret_edge_id] = Edge(callee_region_id, call_op_id, 'ret')

                callee_size = callee_region_node.feature_dict.get('region_total_num_ops', 0)
                self.nodes[call_op_id].feature_dict['callee_size'] = callee_size

    def _update_array_info(self):
        num_nodes = len(self.nodes)
        num_edges = len(self.edges)
        
        for array_name, array_md in self._global_array_md_dict.items():
            rtl_name = ''
            utilization = None
            if array_name in self._global_rtl_name_dict:
                rtl_name = self._global_rtl_name_dict[array_name]
                if rtl_name in self.utilization_dict:
                    utilization = self.utilization_dict[rtl_name]

            array_node = InternalMemNode(
                node_id=num_nodes,
                function_name=self.top_level_name, # Use top-level name for global arrays
                name=array_name,
                rtl_name=rtl_name,
                array_md=array_md,
                is_global_mem=True,
                utilization=utilization
            )
            array_id = f'global.{array_node.id}'
            self.nodes[array_id] = array_node
            num_nodes += 1

            for store_info in array_md.get('Stores', []):
                function_name = store_info.get('FunctionName', '')
                idx = store_info.get('Index', -1)
                if not function_name or idx < 0 or function_name not in self._cdfgs:
                    print(f"Warning: Invalid store info for {array_name} in {function_name}, skipping.")
                    continue

                cdfg = self._cdfgs[function_name]
                count = 0
                for op_id, op_node in cdfg.nodes.items():
                    if op_node.node_type == 'op' and op_node.opcode == 'store':
                        if count == idx:
                            self.edges[f'global.{num_edges}'] = Edge(array_id, op_id, '1')
                            num_edges += 1
                            break
                        count += 1

            for key in ['Loads', 'GEPs']:
                for op_info in array_md.get(key, []):
                    function_name = op_info.get('FunctionName', '')
                    inst_name = op_info.get('Name', '')
                    if not function_name or not inst_name or function_name not in self._cdfgs:
                        print(f"Warning: Invalid {key.lower()} info for {array_name} in {function_name}, skipping.")
                        continue

                    cdfg = self._cdfgs[function_name]
                    for op_id, op_node in cdfg.nodes.items():
                        if op_node.node_type == 'op' and op_node.name == inst_name:
                            self.edges[f'global.{num_edges}'] = Edge(array_id, op_id, '1')
                            num_edges += 1
                            break

        existing_edges_set = set((e.src, e.dst, e.etype) for e in self.edges.values())

        for array_label, array_md in self._local_array_md_dict.items():
            function_name, array_name = array_label.split('/')
            if function_name not in self._cdfgs:
                print(f"Warning: Function {function_name} not found in CDFGs, skipping array {array_name}.")
                continue

            cdfg = self._cdfgs[function_name]
            array_id = None
            for port_id, port_node in cdfg.nodes.items():
                if port_node.node_type == 'port' and port_node.name == array_name:
                    array_id = port_id
                    break

            if array_id is None:
                print(f"Warning: Array {array_name} not found in function {function_name}, skipping.")
                continue

            for store_info in array_md.get('Stores', []):
                idx = store_info.get('Index', -1)
                if store_info.get('FunctionName', '') != function_name or idx < 0:
                    continue

                count = 0
                for op_id, op_node in cdfg.nodes.items():
                    if op_node.node_type == 'op' and op_node.opcode == 'store':
                        if count == idx:
                            if (array_id, op_id, '1') not in existing_edges_set:
                                self.edges[f'global.{num_edges}'] = Edge(array_id, op_id, '1')
                                existing_edges_set.add((array_id, op_id, '1'))
                                num_edges += 1
                            break
                        count += 1

            for key in ['Loads', 'GEPs']:
                for op_info in array_md.get(key, []):
                    inst_name = op_info.get('Name', '')
                    if not inst_name or op_info.get('FunctionName', '') != function_name:
                        continue

                    for op_id, op_node in cdfg.nodes.items():
                        if op_node.node_type == 'op' and op_node.name == inst_name:
                            if (array_id, op_id, '1') not in existing_edges_set:
                                self.edges[f'global.{num_edges}'] = Edge(array_id, op_id, '1')
                                existing_edges_set.add((array_id, op_id, '1'))
                                num_edges += 1
                            break
        
        new_edges = {}
        for edge in self.edges.values():
            if edge.etype != 'data':
                continue
            src_node = self.nodes[edge.src]
            dst_node = self.nodes[edge.dst]
            if src_node.node_type in ['internal_mem', 'port'] and dst_node.node_type == 'op':
                if dst_node.opcode == 'getelementptr':
                    # Add a (Node -> Op) edge for each (Node -> GEP -> Op) path
                    for next_edge in self.edges.values():
                        if next_edge.etype == 'data' and next_edge.src == edge.dst:
                            next_dst_node = self.nodes[next_edge.dst]
                            if next_dst_node.node_type == 'op':
                                if (edge.src, next_edge.dst, '1') not in existing_edges_set:
                                    new_edges[f'additional.{num_edges}'] = Edge(edge.src, next_edge.dst, '1')
                                    num_edges += 1

        for edge in self.edges.values():
            if edge.etype != 'data':
                continue
            src_node = self.nodes[edge.src]
            dst_node = self.nodes[edge.dst]
            if src_node.node_type in ['internal_mem', 'port'] and dst_node.node_type == 'op':
                if dst_node.opcode == 'store':
                    # Add a (Store -> Array) edge for each (Array -> Store) edge
                    if (edge.dst, edge.src, 'store') not in existing_edges_set:
                        new_edges[f'additional.{num_edges}'] = Edge(edge.dst, edge.src, 'store')
                        num_edges += 1

        self.edges.update(new_edges)
    
    def as_dict(self):
        node_dict = {
            node_id: node.as_dict() 
            for node_id, node in self.nodes.items()
        }
        edge_dict = {
            edge_id: edge.as_dict() 
            for edge_id, edge in self.edges.items()
        }
        return {
            'benchmark_name': self.benchmark_name,
            'top_level_function': self.top_level_name,
            'ground_truth_metrics': self.ground_truth_metrics,
            'cdfgs': [cdfg.name for cdfg in self._cdfgs.values()],
            'nodes': node_dict,
            'edges': edge_dict
        }

    def save_as_json(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.as_dict(), f, indent=2)
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


def collect_adb_files(solution_dir, filtered=False):
    if filtered:
        ir_dir = os.path.join(solution_dir, "IRs")
    else:
        ir_dir = os.path.join(solution_dir, ".autopilot/db")

    if not os.path.exists(ir_dir):
        raise FileNotFoundError(f"Directory {ir_dir} not found")

    file_paths = []
    for file_name in os.listdir(ir_dir):
        if file_name.endswith(".adb"):
            if ".bind" in file_name or ".sched" in file_name:
                continue
            print(f"Found file: {file_name}")
            file_paths.append(os.path.join(ir_dir, file_name))

    return file_paths


def compute_scaling_stats(
    kernal_graphs: List[KernelGraph],
) -> Dict[str, Dict[str, float]]:
    """Compute statistics (mean and std deviation) for numerical features in the dataset.
    Args:
        dataset_dir (str): Path to the dataset directory.
        benchmarks (Optional[Union[str, List[str]]]): Specific benchmarks to compute stats for.
    Returns:
        Dict[str, Dict[str, float]]: Scaling statistics for each numerical feature.
    """
    numerical_feats = {feat: [] for feat in NUMERICAL_FEATURES}

    for kernel_graph in kernal_graphs:
        for node in kernel_graph.nodes.values():
            for key, value in node.feature_dict.items():
                if 'bitwidth' in key:
                    base_key = 'bitwidth'
                else:
                    base_key = key
                
                if base_key in numerical_feats:
                    if 'dims' in base_key:
                        for dim in value:
                            if dim > 1:
                                numerical_feats[base_key].append(float(dim))
                    elif value > 0:
                        numerical_feats[base_key].append(float(value))

    scaling_stats = {}
    for key, values in numerical_feats.items():
        if not values:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
            continue

        values_arr = np.array(values, dtype=np.float64)
        if key not in NO_LOG_SCALING_KEYS:
            values_arr = np.log1p(values_arr)

        mean = np.mean(values_arr)
        std = np.std(values_arr)
        if std < 1e-8:
            std = 1.0

        scaling_stats[key] = {'mean': mean, 'std': std}

    if 'bitwidth' in scaling_stats:
        scaling_stats['original_bitwidth'] = scaling_stats['bitwidth']

    return scaling_stats


def extract_pure_graphs(benchmark_info_dict: Dict[str, Dict[str, Any]]) -> Dict[str, KernelGraph]:
    from gnn.data.utils.llvm_ir import extract_array_and_loop_md
    
    kernel_info_dict = {}
    for bench_name, bench_info in benchmark_info_dict.items():
        sol_dir = bench_info['base_solution_dir']
        top_level_name = bench_info['top_level']

        ir_dir = f"{sol_dir}/.autopilot/db"
        try:
            array_md_dict, loop_md_dict = extract_array_and_loop_md(ir_dir)
        except Exception as e:
            print(f"Error extracting array info for {bench_name} in {sol_dir}: {e}")
            continue

        kernel_info_dict[bench_name] = KernelGraph(
            solution_dir=sol_dir, 
            top_level_name=top_level_name, 
            global_array_md_dict=array_md_dict['Global'],
            local_array_md_dict=array_md_dict['Local'],
            loop_md_dict=loop_md_dict,
            benchmark_name=bench_name,
            filtered=False
        )

    return kernel_info_dict


def update_with_directives(
    pure_graph: KernelGraph, 
    solution_dct_tcl_path: str,
    vitis_log_path: Optional[str] = None
) -> KernelGraph:
    kernel_graph = copy.deepcopy(pure_graph)
    directives = parse_tcl_directives(solution_dct_tcl_path)

    for dct, args in directives:
        if dct not in DIRECTIVES or "off" in args:
            continue

        if dct == "array_partition":
            function_name = args.get("location", "")
            target_name = args.get("variable")
            if target_name is None:
                print("Warning: No variable specified for array partition.")
                continue

            array_node = find_array_node(kernel_graph, target_name, function_name)
            if array_node is None:
                print(f"Warning: Variable '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue

            array_node.feature_dict["array_partition"] = 1

            partition_type = args.get("type", "complete")

            if partition_type == "cyclic":
                array_node.feature_dict["partition_type"] = [1, 0, 0]
            elif partition_type == "block":
                array_node.feature_dict["partition_type"] = [0, 1, 0]
            else:
                array_node.feature_dict["partition_type"] = [0, 0, 1]

            partition_dim = int(args.get("dim", 0))
            if partition_dim > array_node.num_dims:
                partition_dim = 0
            elif partition_dim > MAX_ARRAY_DIM:
                partition_dim = MAX_ARRAY_DIM

            if partition_type == "complete":
                if partition_dim == 0:
                    partition_factor = array_node.array_size
                else:
                    partition_factor = array_node.feature_dict['original_array_dims'][partition_dim - 1]

                partitioned_array_size = array_node.array_size // partition_factor
                if partitioned_array_size < 1024:
                    array_node.feature_dict["is_large_array"] = 0
            else:
                if partition_dim == 0:
                    partition_dim = array_node.num_dims

                target_dim_size = array_node.feature_dict['original_array_dims'][partition_dim - 1]
                product_of_non_target_dims = 1
                for i in range(array_node.num_dims):
                    if i != partition_dim - 1:
                        product_of_non_target_dims *= array_node.feature_dict['original_array_dims'][i]

                partition_factor = int(args.get("factor", 0))

                ceiled_partitioned_dim_size = math.ceil(target_dim_size / float(partition_factor))
                ceiled_partitioned_array_size = ceiled_partitioned_dim_size * product_of_non_target_dims

                last_partitioned_dim_size = target_dim_size % partition_factor

                is_unevenly_partitioned = last_partitioned_dim_size != 0
                array_node.feature_dict["is_unevenly_partitioned"] = int(is_unevenly_partitioned)

                if ceiled_partitioned_array_size < 1024:
                    array_node.feature_dict["is_large_array"] = 0
                elif is_unevenly_partitioned:
                    last_partitioned_array_size = last_partitioned_dim_size * product_of_non_target_dims
                    if last_partitioned_array_size < 1024:
                        if (array_node.node_type == "internal_mem" or 
                            (array_node.node_type == "port" and not array_node.is_top_level_port)):
                            array_node.feature_dict["has_hybrid_impl"] = 1

            array_node.feature_dict["partition_factor"] = partition_factor
            array_node.feature_dict["partition_dim"][partition_dim] = 1

            matching_ports = array_node.matching_ports
            while matching_ports:
                port_id = matching_ports.pop()
                port_node = kernel_graph.nodes[port_id]

                port_node.feature_dict["array_partition"] = 1
                port_node.feature_dict["partition_type"] = array_node.feature_dict["partition_type"]
                port_node.feature_dict["partition_dim"] = array_node.feature_dict["partition_dim"]
                port_node.feature_dict["partition_factor"] = partition_factor
                port_node.feature_dict["is_large_array"] = array_node.feature_dict["is_large_array"]
                port_node.feature_dict["is_unevenly_partitioned"] = array_node.feature_dict["is_unevenly_partitioned"]
                port_node.feature_dict["has_hybrid_impl"] = array_node.feature_dict["has_hybrid_impl"]

                matching_ports.extend(port_node.matching_ports)
        else:
            location = args["location"]
            if "/" in location:
                function_name, target_name = location.split("/")
            else:
                function_name = location
                target_name = location

            region_node = find_region_node(kernel_graph, target_name, function_name)
            if region_node is None:
                print(f"Warning: Region '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue

            if dct == "pipeline":
                ii = max(1, int(args.get("ii", 1)))
                region_node.feature_dict["target_ii"] = ii
                region_node.feature_dict["achieved_ii_base"] = 0
                region_node.feature_dict["pipeline"] = 1
                _unroll_pipelined_subloops(kernel_graph, region_node)
            elif dct == "unroll":
                if region_node.feature_dict["unroll"] != 1:
                    trip_count = region_node.feature_dict.get("trip_count", 0)
                    unroll_factor = int(args.get("factor", 0))
                    if unroll_factor <= 0 or (trip_count > 0 and unroll_factor > trip_count):
                        unroll_factor = trip_count
                    region_node.feature_dict["unroll_factor"] = unroll_factor
                    region_node.feature_dict["unroll"] = 1
            else:
                region_node.feature_dict[dct] = 1

    if not vitis_log_path:
        return kernel_graph
    
    if not os.path.exists(vitis_log_path):
        print(f"Warning: Vitis log file '{vitis_log_path}' does not exist.")
        return kernel_graph
    
    auto_dcts = extract_auto_dcts_from_log(vitis_log_path)
    auto_inline = auto_dcts.get("inline", set())
    auto_pipeline = auto_dcts.get("pipeline", set())

    for function_name in auto_inline:
        for node in kernel_graph.nodes.values():
            if node.node_type == 'region' and node.name == function_name:
                node.feature_dict["inline"] = 1
                break

    for loop_name in auto_pipeline:
        for node in kernel_graph.nodes.values():
            if (node.node_type == 'region' and node.name == loop_name and 
                node.feature_dict["auto_pipeline"] == 0):
                node.feature_dict["auto_pipeline"] = 1
                if node.feature_dict["achieved_ii_base"] == 0:
                    node.feature_dict["target_ii"] = 1
                if node.is_loop:
                    _unroll_pipelined_subloops(kernel_graph, node)

    return kernel_graph


def find_array_node(kernel_info, array_name, function_name):
    if function_name:
        for node in kernel_info.nodes.values():
            if (node.node_type in ['internal_mem', 'port']
                and node.name == array_name 
                and node.function_name == function_name):
                return node
                
    # If not found, search for array_name only
    for node in kernel_info.nodes.values():
        if node.node_type in ['internal_mem', 'port'] and node.name == array_name:
            return node

    return None


def find_region_node(kernel_info, region_name, function_name):
    for node in kernel_info.nodes.values():
        if (node.node_type == 'region'
            and node.name == region_name
            and node.function_name == function_name):
            return node
        
    # If not found, search for region_name only
    for node in kernel_info.nodes.values():
        if node.node_type == 'region' and node.name == region_name:
            return node
    
    return None


def _unroll_pipelined_subloops(graph, loop_node):
    """Completely unroll all subloops of a pipelined loop."""
    for sub_region_id in loop_node.sub_regions:
        node = graph.nodes[sub_region_id]
        if node.is_loop:
            trip_count = node.feature_dict.get("trip_count", 0)
            node.feature_dict["unroll_factor"] = trip_count
            node.feature_dict["unroll"] = 1
        _unroll_pipelined_subloops(graph, node)


if __name__ == "__main__":
    import argparse
    from torch_geometric.utils.convert import from_networkx
    from gnn.data.utils.llvm_ir import extract_array_and_loop_md

    from pathlib import Path

    dataset_dir = Path('data/base_solutions')

    with open('data/benchmarks/benchmark_info.json', 'r') as f:
        benchmark_info = json.load(f)

    etypes = set()

    for bench_dir in dataset_dir.iterdir():
        if not bench_dir.is_dir():
            continue

        bench_name = bench_dir.name

        solution_dir = bench_dir / 'solution0'
        ir_dir = solution_dir / '.autopilot/db'

        array_md_dict, loop_md_dict = extract_array_and_loop_md(ir_dir)
        global_array_md_dict = array_md_dict['Global']
        local_array_md_dict = array_md_dict['Local']
        
        top_level_name = benchmark_info[bench_name]['top_level']
        
        graph = KernelGraph(
            solution_dir=str(solution_dir),
            top_level_name=top_level_name,
            global_array_md_dict=global_array_md_dict,
            local_array_md_dict=local_array_md_dict,
            loop_md_dict=loop_md_dict,
            benchmark_name=bench_name,
            filtered=False
        )

        for edge in graph.edges.values():
            etypes.add(edge.etype)

    # parser = argparse.ArgumentParser(description="Kernel Graph Generator")
    # parser.add_argument("solution_dir", type=str, help="Path to the solution directory")
    # parser.add_argument("top_level_name", type=str, help="Top-level function name")
    # parser.add_argument("-b", "--benchmark_name", type=str, default=None, help="Benchmark name")
    # parser.add_argument("-f", "--filtered", action='store_true', help="Use filtered ADB files")
    # parser.add_argument("-o", "--output", type=str, default=None, help="Output file path for the kernel graph JSON")

    # args = parser.parse_args()

    # ir_dir = os.path.join(args.solution_dir, "IRs" if args.filtered else ".autopilot/db")
    # array_md_dict, loop_md_dict = extract_array_and_loop_md(ir_dir)
    # global_array_md_dict = array_md_dict['Global']
    # local_array_md_dict = array_md_dict['Local']

    # kernel_graph = KernelGraph(
    #     solution_dir=args.solution_dir,
    #     top_level_name=args.top_level_name,
    #     global_array_md_dict=global_array_md_dict,
    #     local_array_md_dict=local_array_md_dict,
    #     loop_md_dict=loop_md_dict,
    #     benchmark_name=args.benchmark_name,
    #     filtered=args.filtered
    # )

    # if args.output:
    #     kernel_graph.save_as_json(args.output)
    #     print(f"Kernel graph saved to {args.output}")
    # else:
    #     print(kernel_graph)
    #     print("Kernel graph generated. Use --output to save it as a JSON file.")

    # DG = kernel_graph.to_networkx()
    # print(f"NetworkX graph created with {len(DG.nodes)} nodes and {len(DG.edges)} edges.")

    # edge_types = set()
    # for edge in kernel_graph.edges.values():
    #     edge_types.add(edge.etype)

    print(f"Edge types: {etypes}")