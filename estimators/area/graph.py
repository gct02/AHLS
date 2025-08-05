import os
import json
import copy
import math
import random
import re
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from typing import Optional, Dict, List, Any

import numpy as np

from estimators.common.xml_utils import findint, findfloat
from estimators.common.parsers import (
    AREA_METRICS,
    extract_per_module_area,
    extract_area_metrics,
    parse_tcl_directives,
    extract_auto_dcts_from_log
)

DIRECTIVES = [
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll",
    "dataflow", "inline"
]

OPCODES = [
    'alloca', 'load', 'store', 'getelementptr',
    'br', 'ret', 'call', 'switch',
    'add', 'sub', 'mul',
    'dadd', 'dsub', 'dmul', 'ddiv', 'dsqrt', 'dexp', 'sitodp',
    'and', 'or', 'xor', 'shl', 'lshr', 'ashr',
    'phi', 'select', 'mux', 'sparsemux', 'bitconcatenate',
    'bitselect', 'partselect', 'insertvalue', 'extractvalue',
    'zext', 'sext', 'trunc', 'bitcast',
    'icmp', 'cttz',
    'read', 'write'
]
OPCODE_MAP = {op: i for i, op in enumerate(OPCODES)}
NUM_OPCODES = len(OPCODES)

BASE_TYPE_MAP = {
    '11': 0, # Integer
    '1': 1,  # Floating-point types
    '2': 1,
    '3': 1,
    '4': 1,
    '5': 1,
    '6': 1,
    'unknown': 2
}
NUM_BASE_TYPES = 3

CONST_TYPES = ['0', '1', '3', '5']
CONST_TYPE_MAP = {ctype: i for i, ctype in enumerate(CONST_TYPES)}
NUM_CONST_TYPES = len(CONST_TYPES)

CORE_TYPES = [
    'TAddSub', 'LogicGate', 'Shifter', 'Int2Double',
    'Multiplexer', 'Adder', 'DMul_maxdsp', 'SparseMux',
    'Sel', 'DSqrt', 'RAM', 'DAddSub_fulldsp',
    'ROM_1P_LUTRAM', 'ROM', 'DDiv', 'Cmp',
    'DSP48', 'Multiplier', 'DExp_fulldsp', 'none'
]
CORE_TYPE_MAP = {name: i for i, name in enumerate(CORE_TYPES)}
NUM_CORE_TYPES = len(CORE_TYPES)

EDGE_TYPES = [
    '1', '2', '3', '4', 'hier', 'hier_rev',
    'call', 'ret', 'store', 'alloca', 'arg'
]
EDGE_TYPE_MAP = {etype: i for i, etype in enumerate(EDGE_TYPES)}
NUM_EDGE_TYPES = len(EDGE_TYPES)

NODE_TYPES = ['port', 'internal_mem', 'op', 'const', 'block', 'region', 'function']
NODE_TYPE_MAP = {ntype: i for i, ntype in enumerate(NODE_TYPES)}
NUM_NODE_TYPES = len(NODE_TYPES)

MAX_ARRAY_DIM = 4
MAX_LOOP_DEPTH = 5
INLINE_THRESHOLD = 30

DEFAULT_NODE_FEATURES = {
    'latency': 0, 'trip_count': 0, 'loop_depth': [0] * (MAX_LOOP_DEPTH + 1),
    'is_loop': 0, 'is_top_level_loop': 0, 'has_perfectly_nested_child': 0, 
    'is_part_of_perfect_nest': 0,

    'region_lut_sum': 0, 'region_ff_sum': 0, 'region_dsp_sum': 0, 'region_bram_sum': 0,
    'region_num_ops': 0, 'region_num_sub_regions': 0, 'region_num_blocks': 0,
    
    'module_lut': 0, 'module_ff': 0, 'module_dsp': 0, 'module_bram': 0,
    'function_num_sub_regions': 0, 'function_num_blocks': 0, 'function_num_ops': 0,
    'is_small_function': 0,

    'achieved_ii_base': 0, 'auto_pipeline': 0, 'pipeline': 0,
    'unroll': 0, 'unroll_factor': 0, 'loop_flatten': 0, 
    'loop_merge': 0, 'dataflow': 0, 'inline': 0,

    'bitwidth': 0, 'original_bitwidth': 0, 
    'is_array': 0, 'direction': [0] * 3, 'is_top_level_port': 0,
    'is_large_array': 0, 'array_size': 0, 'original_array_dims': [0] * MAX_ARRAY_DIM,
    'original_base_type': [0] * NUM_BASE_TYPES, 'base_type': [0] * NUM_BASE_TYPES, 
    'is_global_mem': 0,

    'array_partition': 0, 'partition_type': [0] * 3, 
    'partition_dim': [0] * (MAX_ARRAY_DIM + 1), 'partition_factor': 0,
    'is_unevenly_partitioned': 0, 'has_hybrid_impl': 0, 

    'lut': 0, 'ff': 0, 'dsp': 0, 'bram': 0,
    'opcode': [0] * NUM_OPCODES, 'core_name': [0] * NUM_CORE_TYPES,
    'op_delay': 0.0, 'is_on_critical_path': 0, 
    'callee_size': 0,

    'const_type': [0] * NUM_CONST_TYPES,

    'block_lut_sum': 0, 'block_ff_sum': 0, 'block_dsp_sum': 0, 'block_bram_sum': 0,
    'block_num_ops': 0
}
NODE_FEATURES = list(DEFAULT_NODE_FEATURES.keys())

NODE_DIM = sum([len(v) if isinstance(v, list) else 1 for v in DEFAULT_NODE_FEATURES.values()]) + NUM_NODE_TYPES
EDGE_DIM = 12

NUMERICAL_FEATURES = [
    'bitwidth', 'latency', 'op_delay', 'original_array_dims', 
    'array_size', 'trip_count', 'achieved_ii_base', 'callee_size', 
    'region_num_blocks', 'region_num_sub_regions', 'region_num_ops',
    'function_num_blocks', 'function_num_sub_regions', 'function_num_ops',
    'block_num_ops'
] + AREA_METRICS + [
    f'block_{metric}_sum' for metric in AREA_METRICS
] + [
    f'region_{metric}_sum' for metric in AREA_METRICS
] + [
    f'module_{metric}' for metric in AREA_METRICS
]
NO_LOG_SCALING_KEYS = ['original_bitwidth', 'bitwidth', 'op_delay']


def get_default_feature_value(key: str) -> Any:
    if key not in DEFAULT_NODE_FEATURES:
        raise ValueError(f"Unknown feature key: {key}")
    value = DEFAULT_NODE_FEATURES[key]
    if isinstance(value, list):
        return value.copy()
    return value


class Node(ABC):
    def get_homogeneous_features(self):
        if self.node_type not in NODE_TYPE_MAP:
            raise ValueError(f"Unknown node type: {self.node_type}")
        
        feat_vector = [0] * NUM_NODE_TYPES
        feat_vector[NODE_TYPE_MAP[self.node_type]] = 1

        for key in NODE_FEATURES:
            if key not in self.feature_dict:
                value = get_default_feature_value(key)
            else:
                value = self.feature_dict[key]

            if isinstance(value, (list, tuple, np.ndarray)):
                feat_vector.extend(value)
            else:
                feat_vector.append(value)

        if len(feat_vector) != NODE_DIM:
            raise ValueError(
                f"Feature vector length mismatch: expected {NODE_DIM}, got {len(feat_vector)}"
            )

        return feat_vector

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

    def as_dict(self):
        node_as_dict = {
            'node_type': self.node_type,
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

            base_type = 'unknown' if self.is_array else 'none'
            original_bitwidth = bitwidth
            original_base_type = base_type
        
        self.base_type = base_type
        self.original_base_type = original_base_type

        ohe_base_type = [0] * NUM_BASE_TYPES
        base_type_index = BASE_TYPE_MAP.get(base_type, -1)
        if base_type_index >= 0:
            ohe_base_type[base_type_index] = 1

        ohe_orig_base_type = [0] * NUM_BASE_TYPES
        original_base_type_index = BASE_TYPE_MAP.get(original_base_type, -1)
        if original_base_type_index >= 0:
            ohe_orig_base_type[original_base_type_index] = 1

        direction_index = findint(element, 'direction', 2)
        if direction_index not in [0, 1, 2]:
            direction_index = 2  # Default to 'BI'

        ohe_direction = [0, 0, 0] # IN, OUT, BI
        ohe_direction[direction_index] = 1

        self.feature_dict.update({
            'is_array': int(self.is_array),
            'is_top_level_port': int(is_top_level_port),
            'is_large_array': int(self.array_size >= 1024),
            'direction': ohe_direction,
            'array_size': self.array_size,
            'original_array_dims': dims,
            'original_bitwidth': original_bitwidth,
            'original_base_type': ohe_orig_base_type,
            'bitwidth': bitwidth,
            'base_type': ohe_base_type,
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
            'node_type': self.node_type,
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
        node_id: Optional[int] = None,
        function_name: str = '',
        name: str = '',
        rtl_name: str = '',
        is_global_mem: bool = False,
        array_md: Optional[Dict[str, Any]] = None,
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
            self.id = node_id or random.randint(-1e9, -1)
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
            if element is not None:
                bitwidth = max(0, findint(element, 'Value/bitwidth', 0))
                self.array_size = findint(element, 'Value/Obj/storageDepth', 0)
            else:
                bitwidth = 0
                self.array_size = 0

            self.is_array = self.array_size > 0
            if self.is_array:
                self.num_dims = 1
                dims = [self.array_size] + [1] * (MAX_ARRAY_DIM - 1)
                base_type = 'unknown'
            else:
                self.num_dims = 0
                dims = [0] * MAX_ARRAY_DIM
                base_type = 'none'

            original_bitwidth = bitwidth
            original_base_type = base_type

        self.base_type = base_type
        self.original_base_type = original_base_type

        ohe_base_type = [0] * NUM_BASE_TYPES
        base_type_index = BASE_TYPE_MAP.get(base_type, -1)
        if base_type_index >= 0:
            ohe_base_type[base_type_index] = 1

        ohe_orig_base_type = [0] * NUM_BASE_TYPES
        original_base_type_index = BASE_TYPE_MAP.get(original_base_type, -1)
        if original_base_type_index >= 0:
            ohe_orig_base_type[original_base_type_index] = 1

        self.feature_dict = {
            'is_array': int(self.is_array),
            'is_global_mem': int(is_global_mem),
            'is_large_array': int(self.array_size >= 1024),
            'array_size': self.array_size,
            'original_array_dims': dims,
            'original_bitwidth': original_bitwidth,
            'original_base_type': ohe_orig_base_type,
            'bitwidth': bitwidth,
            'base_type': ohe_base_type,
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

    def as_dict(self):
        node_as_dict = {
            'node_type': self.node_type,
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
        self.core_name = element.findtext('Value/Obj/coreName', 'none')
        if not self.core_name:
            self.core_name = 'none'

        ohe_core = [0] * NUM_CORE_TYPES
        ohe_core_index = CORE_TYPE_MAP.get(self.core_name, -1)
        if ohe_core_index >= 0:
            ohe_core[ohe_core_index] = 1

        ohe_op = [0] * NUM_OPCODES
        op_index = OPCODE_MAP.get(self.opcode, -1)
        if op_index >= 0:
            ohe_op[op_index] = 1

        self.feature_dict.update({
            'opcode': ohe_op,
            'core_name': ohe_core,
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
    
    def as_dict(self):
        node_as_dict = {
            'node_type': self.node_type,
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

        ohe_const_type = [0] * NUM_CONST_TYPES
        const_type_index = CONST_TYPE_MAP.get(self.const_type, -1)
        if const_type_index >= 0:
            ohe_const_type[const_type_index] = 1

        self.feature_dict.update({
            'bitwidth': max(0, findint(element, 'Value/bitwidth', 0)),
            'const_type': ohe_const_type
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
            'node_type': self.node_type,
            'id': self.id,
            'label': self.label,
            'feature_dict': self.feature_dict,
            'ops': self.ops,
        }
        return node_as_dict


class RegionNode(Node):
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str,
        loop_md: Optional[Dict[str, Any]] = None
    ):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        
        self.node_type = 'region'
        self.function_name = function_name

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

        ohe_loop_depth = [0] * (MAX_LOOP_DEPTH + 1)
        ohe_loop_depth[loop_depth] = 1

        self.feature_dict = {
            'is_loop': int(self.is_loop),
            'latency': latency,
            'trip_count': trip_count,
            'is_top_level_loop': is_top_level_loop,
            'has_perfectly_nested_child': has_perfectly_nested_child,
            'is_part_of_perfect_nest': is_part_of_perfect_nest,
            'loop_depth': ohe_loop_depth, 
            'auto_pipeline': int(auto_pipeline),
            'achieved_ii_base': ii,
            'pipeline': 0, 'unroll': 0, 'unroll_factor': 0,
            'loop_flatten': 0, 'loop_merge': 0
        }
        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')
    
    def _extract_items(self, element, tag):
        parent_tag = element.find(tag)
        if parent_tag is None:
            return []
        return [int(item.text) for item in parent_tag.findall('item')]

    def as_dict(self):
        node_as_dict = {
            'node_type': self.node_type,
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
    

class FunctionNode(Node):
    def __init__(
        self, 
        element: ET.Element, 
        name: str,
        sub_regions: List[str],
        blocks: List[str],
        op_nodes: List[OperationNode],
        original_name: Optional[str] = None,
        utilization: Optional[Dict[str, int]] = None,
    ):
        self.node_type = 'function'
        self.name = name
        self.original_name = original_name or name
        self.function_name = name
        self.label = name
        self.id = 1
        self.norm_id = f'{name}.region.0'

        self.latency = max(0, findint(element, 'mMaxLatency', 0))
        self.num_sub_regions = len(sub_regions)
        self.num_blocks = len(blocks)
        self.num_ops = len(op_nodes)

        self.feature_dict = {
            'latency': self.latency,
            'function_num_sub_regions': self.num_sub_regions,
            'function_num_blocks': self.num_blocks,
            'function_num_ops': self.num_ops,
            'is_small_function': 1 if self.num_ops < INLINE_THRESHOLD else 0,
            'loop_merge': 0, 'inline': 0, 'dataflow': 0
        }
        if utilization is not None:
            for res in AREA_METRICS:
                self.feature_dict[f'module_{res}'] = utilization.get(res, 0)
        else:
            res_dict = {f'module_{res}': 0 for res in AREA_METRICS}
            for op in op_nodes:
                for res in AREA_METRICS:
                    res_dict[f'module_{res}'] += op.feature_dict.get(res, 0)
            self.feature_dict.update(res_dict)

        self.sub_regions = [
            f'{self.name}.region.{i - 1}' 
            for i in self._extract_items(element, 'sub_regions')
        ]
        self.blocks = [
            f'{self.name}.{i}' 
            for i in self._extract_items(element, 'basic_blocks')
        ]

    def _extract_items(self, element, tag):
        parent_tag = element.find(tag)
        if parent_tag is None:
            return []
        return [int(item.text) for item in parent_tag.findall('item')]
    
    def as_dict(self):
        node_as_dict = {
            'node_type': self.node_type,
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


class Edge:
    def __init__(self, src: str, dst: str, etype: str, is_back_edge: bool = False):
        self.src = src
        self.dst = dst
        self.etype = etype
        self.is_back_edge = is_back_edge
        self.label = f"{src} -> {dst} ({etype})"

        self.one_hot_etype = [0] * NUM_EDGE_TYPES
        etype_index = EDGE_TYPE_MAP.get(etype, -1)
        if etype_index >= 0:
            self.one_hot_etype[etype_index] = 1

    def as_dict(self):
        edge_as_dict = {
            'label': self.label,
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
        
        if re.search(r"_[1-9]\d*$", self.name) and 'Pipeline' not in self.name:
            self.original_name = self.name[:self.name.rfind('_')]
            self.unnormalized_name = self.original_name + f'.{self.name[self.name.rfind("_") + 1:]}'
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
        self._process_regions(cdfg_regions, loop_md_dict, utilization_dict)

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
                    element=elem, function_name=self.original_name, 
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
            elif f'{self.original_name}/{name}' in array_md_dict:
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
            node.feature_dict.update(
                {f"block_{res}_sum": 0 for res in AREA_METRICS}
            )
            updated_ops = []
            for op in node.ops:
                op_id = f'{self.name}.{op}'
                if op_id not in self.nodes:
                    continue
                updated_ops.append(op_id)
                op_node = self.nodes[op_id]
                for res in AREA_METRICS:
                    res_value = op_node.feature_dict.get(res, 0)
                    node.feature_dict[f"block_{res}_sum"] += res_value

            node.ops = updated_ops
            node.feature_dict['block_num_ops'] = len(updated_ops)
            self.nodes[block_id] = node

    def _process_regions(self, regions, loop_md_dict, utilization_dict):
        elems = regions.findall('item')

        function_node = None
        if elems:
            first_elem = elems[0]
            if findint(first_elem, 'mType', 0) != 1: # Not a loop
                sub_regions = []
                for elem in elems[1:]:
                    region_id = findint(elem, 'mId')
                    if region_id is not None:
                        sub_regions.append(f'{self.name}.region.{region_id - 1}')
                blocks = [node_id for node_id, node in self.nodes.items() if node.node_type == 'block']
                op_nodes = [node for node in self.nodes.values() if node.node_type == 'op']

                utilization = None
                if self.name in utilization_dict:
                    utilization = utilization_dict[self.name]
                elif self.original_name in utilization_dict:
                    utilization = utilization_dict[self.original_name]
                elif self.unnormalized_name in utilization_dict:
                    utilization = utilization_dict[self.unnormalized_name]

                function_node = FunctionNode(
                    first_elem, self.name, 
                    sub_regions, blocks, op_nodes,
                    original_name=self.original_name,
                    utilization=utilization
                )

        if function_node is None:
            raise ValueError("CDFG does not contain a function region")

        self.nodes[function_node.norm_id] = function_node
        region_nodes = {}

        for elem in elems[1:]:
            name = elem.findtext('mTag', '')
            loop_md = None
            if f'{self.unnormalized_name}/{name}' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.unnormalized_name}/{name}']
            elif f'{self.name}/{name}' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.name}/{name}']
            elif f'{self.original_name}/{name}' in loop_md_dict:
                loop_md = loop_md_dict[f'{self.original_name}/{name}']

            node = RegionNode(elem, self.original_name, loop_md=loop_md) 
            region_id = f'{self.name}.region.{node.id - 1}'

            for i in range(len(node.sub_regions)):
                sub_region = node.sub_regions[i]
                node.sub_regions[i] = f'{self.name}.region.{int(sub_region) - 1}'

            for i in range(len(node.blocks)):
                block = node.blocks[i]
                node.blocks[i] = f'{self.name}.{int(block)}'

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
            region_num_ops = 0

            for block_id in all_blocks:
                if block_id not in self.nodes:
                    continue
                block_node = self.nodes[block_id]
                if block_node.node_type != 'block':
                    continue

                for res in AREA_METRICS:
                    res_value = block_node.feature_dict.get(f'block_{res}_sum', 0)
                    region_node.feature_dict[f'region_{res}_sum'] += res_value
                
                region_num_ops += block_node.feature_dict.get('block_num_ops', 0)
            
            region_node.feature_dict['region_num_sub_regions'] = len(all_sub_regions)
            region_node.feature_dict['region_num_blocks'] = len(all_blocks)
            region_node.feature_dict['region_num_ops'] = region_num_ops
            self.nodes[region_id] = region_node

    def _get_all_sub_regions(self, region_nodes, region_node):
        all_sub_regions = set(region_node.sub_regions)
        for sub_region_id in region_node.sub_regions:
            if sub_region_id in region_nodes:
                all_sub_regions.add(sub_region_id)
                sub_region_node = region_nodes[sub_region_id]
                all_sub_regions.update(
                    self._get_all_sub_regions(region_nodes, sub_region_node)
                )
        return all_sub_regions

    def _parse_edges(self, cdfg):
        src_gep_index_consts = []
        dst_get_index_consts = []

        for elem in cdfg.find('edges').findall('item'):
            etype = elem.findtext('edge_type', '')
            edge_id = elem.findtext('id', '')
            if not etype or not edge_id:
                continue

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
            if src_id in self._allocas and etype in ['1', '3']:
                internal_mem_id = src_id + '.internal_mem'
                if internal_mem_id in self.nodes:
                    internal_mem_edge_id = edge_id + '.internal_mem'
                    internal_mem_edge = Edge(src_id, internal_mem_id, etype, is_back_edge)
                    self.edges[internal_mem_edge_id] = internal_mem_edge

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
        n_edges = len(self.edges)

        for node_id, node in self.nodes.items():
            if node.node_type != 'block':
                continue
            
            for op_id in node.ops:
                if op_id in self.nodes:
                    self.edges[f'{self.name}.{n_edges}'] = Edge(node_id, op_id, 'hier')
                    n_edges += 1

        for node_id, node in self.nodes.items():
            if node.node_type not in ['region', 'function']:
                continue
            
            for sub_region_id in node.sub_regions:
                if sub_region_id in self.nodes:
                    self.edges[f'{self.name}.{n_edges}'] = Edge(node_id, sub_region_id, 'hier')
                    n_edges += 1

            for block_id in node.blocks:
                if block_id in self.nodes:
                    self.edges[f'{self.name}.{n_edges}'] = Edge(node_id, block_id, 'hier')
                    n_edges += 1
                    
                    for op_id in self.nodes[block_id].ops:
                        if op_id in self.nodes:
                            self.edges[f'{self.name}.{n_edges}'] = Edge(block_id, op_id, 'hier')
                            self.edges[f'{self.name}.{n_edges + 1}'] = Edge(node_id, op_id, 'hier')
                            n_edges += 2
        
        rev_hier_edges = {}
        for edge_id, edge in self.edges.items():
            if edge.etype == 'hier':
                rev_hier_edges[edge_id + '.rev'] = Edge(edge.dst, edge.src, 'hier_rev')
                
        self.edges.update(rev_hier_edges)
    
    def as_dict(self):
        return {
            'name': self.name,
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

    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)

class KernelGraph:
    def __init__(
        self,
        solution_dir: str,
        top_level_name: str,
        array_md_dict: Dict[str, Dict[str, Any]],
        loop_md_dict: Dict[str, Dict[str, Any]],
        benchmark_name: Optional[str] = None
    ):
        self.top_level_name = top_level_name
        self.benchmark_name = benchmark_name or top_level_name

        if 'Global' not in array_md_dict or 'Local' not in array_md_dict:
            raise ValueError("Global and Local arrays must be present in the array metadata dictionary.")

        self._global_array_md_dict = array_md_dict['Global']
        self._local_array_md_dict = array_md_dict['Local']
        self._loop_md_dict = loop_md_dict
        self._global_array_names = list(self._global_array_md_dict.keys())

        self.ground_truth_metrics = extract_area_metrics(solution_dir)
        if any(self.ground_truth_metrics.get(res, 0) < 0 for res in AREA_METRICS):
            raise ValueError("Invalid area metrics found in the solution directory.")
        
        self.module_area_dict = extract_per_module_area(solution_dir)

        self.nodes = {}
        self.edges = {}
        self._cdfgs = {}

        self._process_adb_files(solution_dir)
        self._update_array_info()
        self._include_call_flow()

    def _process_adb_files(self, solution_dir):
        try:
            adb_file_list = collect_adb_files(solution_dir)
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
                utilization_dict=self.module_area_dict
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
            for (call_op_id, callee) in cdfg.function_calls:
                if callee not in self._cdfgs:
                    print(f"Warning: Callee {callee} not found in CDFGs, skipping call flow.")
                    continue

                callee_cdfg = self._cdfgs[callee]
                callee_id = f'{callee_cdfg.name}.region.0'
                callee_node = callee_cdfg.nodes[callee_id]
                num_edges = len(self.edges)

                for src_id in operand_dict.get(call_op_id, []):
                    src_node = self.nodes[src_id]

                    # Find matching port in callee CDFG
                    for callee_port_id, callee_port in callee_cdfg.nodes.items():
                        if callee_port.node_type == 'port' and callee_port.name == src_node.name:
                            self.nodes[src_id].matching_ports.append(callee_port_id)
                            self.edges[f'callflow.{num_edges}'] = Edge(src_id, callee_port_id, 'arg')
                            num_edges += 1
                            break
                
                self.nodes[call_op_id].feature_dict['callee_size'] = callee_node.num_ops
                self.edges[f'callflow.{num_edges}'] = Edge(call_op_id, callee_id, 'call')
                self.edges[f'callflow.{num_edges + 1}'] = Edge(callee_id, call_op_id, 'ret')
                num_edges += 2

    def _update_array_info(self):
        num_nodes = len(self.nodes)
        num_edges = len(self.edges)
        
        for array_name, array_md in self._global_array_md_dict.items():
            rtl_name = ''
            utilization = None
            if array_name in self._global_rtl_name_dict:
                rtl_name = self._global_rtl_name_dict[array_name]
                if rtl_name in self.module_area_dict:
                    utilization = self.module_area_dict[rtl_name]

            array_node = InternalMemNode(
                node_id=num_nodes,
                function_name=self.top_level_name, # Use top-level name for global arrays
                name=array_name,
                rtl_name=rtl_name,
                is_global_mem=True,
                array_md=array_md,
                utilization=utilization
            )
            array_id = f'global.{array_node.id}'
            self.nodes[array_id] = array_node
            num_nodes += 1

            for store_info in array_md.get('Stores', []):
                function_name = store_info.get('FunctionName', '')

                if function_name.endswith('<double>'):
                    function_name = function_name[:-8] + '_double_s'
                elif re.search(r"\.[1-9]\d*$", function_name) is not None:
                    function_name = function_name[:function_name.rfind('.')] + f'_{function_name[function_name.rfind(".") + 1:]}'

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
                    inst_name = op_info.get('Name', '')
                    function_name = op_info.get('FunctionName', '')

                    if function_name.endswith('<double>'):
                        function_name = function_name[:-8] + '_double_s'
                    elif re.search(r"\.[1-9]\d*$", function_name) is not None:
                        function_name = function_name[:function_name.rfind('.')] + f'_{function_name[function_name.rfind(".") + 1:]}'

                    if not function_name or not inst_name or function_name not in self._cdfgs:
                        print(f"Warning: Invalid load info for {array_name} in {function_name}, skipping.")
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
            if edge.etype not in ['1', '3']:
                continue
            src_node = self.nodes[edge.src]
            dst_node = self.nodes[edge.dst]
            if src_node.node_type in ['internal_mem', 'port'] and dst_node.node_type == 'op':
                if dst_node.opcode == 'getelementptr':
                    # Add a (Node -> Op) edge for each (Node -> GEP -> Op) path
                    for next_edge in self.edges.values():
                        if next_edge.etype in ['1', '3'] and next_edge.src == edge.dst:
                            next_dst_node = self.nodes[next_edge.dst]
                            if next_dst_node.node_type == 'op':
                                if (edge.src, next_edge.dst, '1') not in existing_edges_set:
                                    new_edges[f'additional.{num_edges}'] = Edge(edge.src, next_edge.dst, '1')
                                    num_edges += 1

        for edge in self.edges.values():
            if edge.etype not in ['1', '3']:
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


def collect_adb_files(solution_dir):
    ir_dir = os.path.join(solution_dir, "IRs")
    if not os.path.exists(ir_dir):
        ir_dir = os.path.join(solution_dir, ".autopilot/db")
        if not os.path.exists(ir_dir):
            raise FileNotFoundError(f"IR directory not found in {solution_dir}")

    file_paths = []
    for file_name in os.listdir(ir_dir):
        if file_name.endswith(".adb"):
            if ".bind" in file_name or ".sched" in file_name:
                continue
            file_paths.append(os.path.join(ir_dir, file_name))

    return file_paths


def compute_scaling_stats(kernel_graphs: List[KernelGraph],) -> Dict[str, Dict[str, float]]:
    """Compute statistics (mean and std deviation) for numerical features in the dataset.
    Args:
        dataset_dir (str): Path to the dataset directory.
        benchmarks (Optional[Union[str, List[str]]]): Specific benchmarks to compute stats for.
    Returns:
        Dict[str, Dict[str, float]]: Scaling statistics for each numerical feature.
    """
    numerical_feats = {feat: [] for feat in NUMERICAL_FEATURES}

    for kernel_graph in kernel_graphs:
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


def extract_base_graphs(benchmark_info_dict: Dict[str, Dict[str, Any]]) -> Dict[str, KernelGraph]:
    from estimators.common.llvm_md_collector import extract_array_and_loop_md
    
    kernel_info_dict = {}
    for bench_name, bench_info in benchmark_info_dict.items():
        sol_dir = bench_info['base_solution_dir']
        top_level_name = bench_info['top_level']
        ir_dir = f"{sol_dir}/.autopilot/db"
        try:
            array_md_dict, loop_md_dict = extract_array_and_loop_md(ir_dir)
            kernel_info_dict[bench_name] = KernelGraph(
                solution_dir=sol_dir, 
                top_level_name=top_level_name, 
                array_md_dict=array_md_dict,
                loop_md_dict=loop_md_dict,
                benchmark_name=bench_name
            )
        except Exception as e:
            print(f"Error extracting array info for {bench_name} in {sol_dir}: {e}")
            continue

    return kernel_info_dict


def update_with_directives(
    base_kernel_graph: KernelGraph, 
    directives_tcl_path: str,
    vitis_log_path: Optional[str] = None
) -> KernelGraph:
    kernel_graph = copy.deepcopy(base_kernel_graph)
    directives = parse_tcl_directives(directives_tcl_path)

    for dct, args in directives:
        if dct not in DIRECTIVES or "off" in args:
            continue

        if dct == "array_partition":
            function_name = args.get("location", "")
            target_name = args.get("variable")
            if target_name is None:
                print("Warning: No variable specified for array partition.")
                continue

            node = find_array_node(kernel_graph, target_name, function_name)
            if node is None:
                print(f"Warning: Variable '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue

            ap_type = args.get("type", "complete")

            if ap_type == "cyclic":
                node.feature_dict["partition_type"] = [1, 0, 0]
            elif ap_type == "block":
                node.feature_dict["partition_type"] = [0, 1, 0]
            else:
                node.feature_dict["partition_type"] = [0, 0, 1]

            ap_dim = int(args.get("dim", 0))
            if ap_dim > node.num_dims:
                ap_dim = 0
            elif ap_dim > MAX_ARRAY_DIM:
                ap_dim = MAX_ARRAY_DIM

            array_dims = node.feature_dict['original_array_dims']

            if ap_type == "complete":
                if ap_dim == 0:
                    ap_factor = node.array_size
                else:
                    ap_factor = array_dims[ap_dim - 1]

                partition_size = node.array_size // ap_factor
                if partition_size < 1024:
                    node.feature_dict["is_large_array"] = 0
            else:
                ap_factor = int(args.get("factor", 0))
                if ap_dim == 0:
                    ap_dim = node.num_dims

                target_dim_size = array_dims[ap_dim - 1]
                non_target_dim_prod = 1
                for i in range(node.num_dims):
                    if i != ap_dim - 1:
                        non_target_dim_prod *= array_dims[i]

                ceil_partition_dim_size = math.ceil(target_dim_size / float(ap_factor))
                ceil_partition_size = ceil_partition_dim_size * non_target_dim_prod

                last_partition_dim_size = target_dim_size % ap_factor

                uneven = last_partition_dim_size != 0
                node.feature_dict["is_unevenly_partitioned"] = int(uneven)

                if ceil_partition_size < 1024:
                    node.feature_dict["is_large_array"] = 0
                elif uneven:
                    last_partition_size = last_partition_dim_size * non_target_dim_prod
                    if last_partition_size < 1024:
                        if (node.node_type in ["internal_mem", "port"] 
                            and not node.is_top_level_port):
                            node.feature_dict["has_hybrid_impl"] = 1

            node.feature_dict["array_partition"] = 1
            node.feature_dict["partition_factor"] = ap_factor
            node.feature_dict["partition_dim"][ap_dim] = 1

            ap_feats = [
                "array_partition", "partition_type", "partition_dim", 
                "partition_factor", "is_large_array", 
                "is_unevenly_partitioned", "has_hybrid_impl"
            ]
            matching_ports = node.matching_ports.copy()

            while matching_ports:
                port_id = matching_ports.pop()
                port_node = kernel_graph.nodes[port_id]

                for feat in ap_feats:
                    if feat in port_node.feature_dict:
                        port_node.feature_dict[feat] = node.feature_dict[feat]

                matching_ports.extend(port_node.matching_ports)
        else:
            location = args["location"]
            if "/" in location:
                function_name, target_name = location.split("/")
            else:
                function_name = location
                target_name = location

            if dct not in ["inline", "dataflow"]:
                node = find_region_node(kernel_graph, target_name, function_name)
                if node is None:
                    if dct == "loop_merge":
                        node = find_function_node(kernel_graph, function_name)
                        if node is None:
                            print(f"Warning: Function '{function_name}' not found in nodes.")
                            continue
                    else:
                        print(f"Warning: Region '{target_name}' "
                              f"(function '{function_name}') not found in nodes.")
                        continue
            else:
                node = find_function_node(kernel_graph, function_name)
                if node is None:
                    print(f"Warning: Function '{function_name}' not found in nodes.")
                    continue

            if dct == "pipeline":
                node.feature_dict["pipeline"] = 1
                _unroll_pipelined_subloops(kernel_graph, node)
            elif dct == "unroll":
                if node.feature_dict["unroll"] != 1:
                    trip_count = node.feature_dict.get("trip_count", 0)
                    unroll_factor = int(args.get("factor", 0))
                    if unroll_factor <= 0 or (trip_count > 0 and unroll_factor > trip_count):
                        unroll_factor = trip_count
                    node.feature_dict["unroll_factor"] = unroll_factor
                    node.feature_dict["unroll"] = 1
            else:
                node.feature_dict[dct] = 1

    # Note: The subsequent logic is needed only because our dataset were not
    # generated entirely with all needed directives disabled. For future datasets
    # and for inference during the DSE heuristic, this logic should be skipped
    # since it relies on the Vitis log file, which will not be available.
    
    if not vitis_log_path:
        return kernel_graph
    
    if not os.path.exists(vitis_log_path):
        print(f"Warning: Vitis log file '{vitis_log_path}' does not exist.")
        return kernel_graph
    
    auto_dcts = extract_auto_dcts_from_log(vitis_log_path)
    auto_inline = auto_dcts.get("inline", set())
    auto_pipeline = auto_dcts.get("pipeline", set())
    auto_loop_flatten = auto_dcts.get("loop_flatten", set())

    for function_name in auto_inline:
        node = find_function_node(kernel_graph, function_name)
        if node is not None:
            node.feature_dict["inline"] = 1
            continue

    for loop_name in auto_pipeline:
        for node in kernel_graph.nodes.values():
            if node.node_type == 'region' and node.name == loop_name:
                node.feature_dict["auto_pipeline"] = 1
                _unroll_pipelined_subloops(kernel_graph, node)
                break

    for loop_name, function_name in auto_loop_flatten:
        node = find_region_node(kernel_graph, loop_name, function_name)
        if node is not None:
            node.feature_dict["loop_flatten"] = 1
            
    return kernel_graph


def plot_kernel_graph(kernel_graph: KernelGraph, output_path: str):
    import networkx as nx
    import matplotlib.pyplot as plt
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch
    
    ncolor_dict = {
        "op": "#6f85ff",
        "internal_mem": "#46e6c3",
        "port": "#ac64ff",
        "const": "#ff93db",
        "block": "#fff16e",
        "region": "#ff9f50",
        "function": "#ff5151",
    }
    ecolor_dict = {
        "1": "#4854c0",
        "2": "#12a59e",
        "3": "#ac7d27",
        "4": "#a03a33",
        "hier": "#858585",
        "hier_rev": "#858585",
        "call": "#c2509c",
        "ret": "#c2509c",
        "arg": "#8439af"
    }

    G = nx.DiGraph()

    for edge in kernel_graph.edges.values():
        ecolor = ecolor_dict.get(edge.etype, "#ffffff")
        G.add_edge(edge.src, edge.dst, color=ecolor)
    
    for node_id, node in kernel_graph.nodes.items():
        ncolor = ncolor_dict.get(node.node_type, "#ffffff")
        G.add_node(node_id, label=node.label, color=ncolor)
        
    nlabels = {node: G.nodes[node]['label'] for node in list(G)}

    ecolors = [G.edges[edge]['color'] for edge in list(G.edges())]
    ncolors = [G.nodes[node]['color'] for node in list(G)]

    node_legend = [
        Patch(color=color, label=ntype) 
        for ntype, color in ncolor_dict.items() 
    ]
    edge_legend = [
        Patch(color=color, label=etype)
        for etype, color in ecolor_dict.items() 
    ]

    pos = nx.kamada_kawai_layout(G, scale=2)

    plt.figure(figsize=(16, 12))
    nx.draw_networkx(
        G, pos, labels=nlabels, node_color=ncolors, 
        edge_color=ecolors, style="dashed", node_size=150, 
        font_size=8, arrowsize=9, width=.9, alpha=.7
    )
    plt.legend(
        handles=node_legend + edge_legend, loc='lower center', 
        bbox_to_anchor=(0.5, -0.13), ncol=3, fontsize=8, frameon=False
    )
    plt.axis('off')
    
    if output_path:
        plt.savefig(output_path, format='png', bbox_inches='tight', dpi=300)
        print(f"Kernel graph saved to {output_path}")
    else:
        plt.show()


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


def find_function_node(kernel_info, function_name):
    for node in kernel_info.nodes.values():
        if (node.node_type == 'function' 
            and (node.original_name == function_name or node.name == function_name)):
            return node
        

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
    from pathlib import Path
    from estimators.common.llvm_md_collector import extract_array_and_loop_md

    with open('data/benchmark_info.json', 'r') as f:
        bench_info_dict = json.load(f)

    base_sols_dir = Path('data/base_solutions')
    output_dir = Path('data/kernel_graphs')

    for bench_name, bench_info in bench_info_dict.items():
        solution_dir = Path(bench_info['base_solution_dir'])
        ir_dir = solution_dir / '.autopilot/db'

        array_md, loop_md = extract_array_and_loop_md(ir_dir)
        
        graph = KernelGraph(
            solution_dir=str(solution_dir),
            top_level_name=bench_info['top_level'],
            array_md_dict=array_md,
            loop_md_dict=loop_md,
            benchmark_name=bench_name
        )
        output_path = output_dir / f"{bench_name}_graph.json"
        graph.save_as_json(output_path)
        print(f"Saved graph for {bench_name} to {output_path}")

        plot_kernel_graph(graph, output_path=None)

    print("All kernel graphs have been generated and saved.")