import os
import json
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from typing import Optional, Dict, List, Any

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import (
    extract_metrics,
    extract_module_utilization,
    AREA_METRICS
)

NODE_TYPES = [
    'op', 'port', 'internal_mem',
    'const', 'block', 'region'
]
EDGE_TYPES = [
    # Data flow
    ('op', 'data', 'op'),
    ('port', 'data', 'op'),
    ('const', 'data', 'op'),
    ('internal_mem', 'data', 'op'),

    # Argument passing (for arrays)
    ('port', 'data', 'port'),
    ('internal_mem', 'data', 'port'),

    # Store edges (for arrays)
    ('op', 'store', 'port'),
    ('op', 'store', 'internal_mem'),

    # Memory allocation (for arrays)
    ('op', 'alloca', 'internal_mem'),

    # Control flow
    ('block', 'control', 'op'),
    ('block', 'control', 'block'),

    # Call flow
    ('op', 'control', 'region'),
    ('region', 'control', 'op'),

    # Hierarchies
    ('region', 'hier', 'region'),
    ('region', 'hier', 'block'),
    ('region', 'hier', 'op'),
    ('block', 'hier', 'op')
]

MAX_ARRAY_DIM = 4
MAX_LOOP_DEPTH = 5
INLINE_THRESHOLD = 30

OPCODE_MAP = {
    # Memory operations
    'alloca': [1, 0, 0, 0, 0, 0, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'load': [1, 0, 0, 0, 0, 0, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'store': [1, 0, 0, 0, 0, 0, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'getelementptr': [1, 0, 0, 0, 0, 0, 0, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],

    # Control flow
    'br': [0, 1, 0, 0, 0, 0, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'ret': [0, 1, 0, 0, 0, 0, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'call': [0, 1, 0, 0, 0, 0, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'switch': [0, 1, 0, 0, 0, 0, 0, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],

    # Arithmetic (integer)
    'add': [0, 0, 1, 0, 0, 0, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'sub': [0, 0, 1, 0, 0, 0, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'mul': [0, 0, 1, 0, 0, 0, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],

    # Arithmetic (floating-point)
    'dadd': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'dsub': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'dmul': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'ddiv': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],
    'dsqrt': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'dexp': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 0, 0, 0, 0, 1, 0, 0, 0],
    'sitodp': [0, 0, 0, 1, 0, 0, 0, 0, 0] + [0, 0, 0, 0, 0, 0, 1, 0, 0],

    # Bitwise & logical
    'and': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'or': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'xor': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'shl': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],
    'lshr': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'ashr': [0, 0, 0, 0, 1, 0, 0, 0, 0] + [0, 0, 0, 0, 0, 1, 0, 0, 0],

    # Data selection & manipulation
    'phi': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'select': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'mux': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'sparsemux': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],
    'bitconcatenate': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'bitselect': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 0, 0, 0, 1, 0, 0, 0],
    'partselect': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 0, 0, 0, 0, 1, 0, 0],
    'insertvalue': [0, 0, 0, 0, 0 ,1, 0, 0, 0] + [0, 0, 0, 0, 0, 0, 0, 1, 0],
    'extractvalue': [0, 0, 0, 0, 0, 1, 0, 0, 0] + [0, 0, 0, 0, 0, 0, 0, 0, 1],

    # Casting & conversion
    'zext': [0, 0, 0, 0, 0, 0 ,1, 0, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'sext': [0, 0, 0, 0, 0, 0, 1, 0, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],
    'trunc': [0, 0, 0, 0, 0, 0, 1, 0, 0] + [0, 0, 1, 0, 0, 0, 0, 0, 0],
    'bitcast': [0, 0, 0, 0, 0, 0, 1, 0, 0] + [0, 0, 0, 1, 0, 0, 0, 0, 0],

    # Relational & specialized
    'icmp': [0, 0, 0, 0, 0, 0, 0, 1, 0] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'cttz': [0, 0, 0, 0, 0, 0, 0, 1, 0] + [0, 1, 0, 0, 0, 0, 0, 0, 0],

    # I/O operations
    'read': [0, 0, 0, 0, 0, 0, 0, 0, 1] + [1, 0, 0, 0, 0, 0, 0, 0, 0],
    'write': [0, 0, 0, 0, 0, 0, 0, 0, 1] + [0, 1, 0, 0, 0, 0, 0, 0, 0]
}
OPCODE_SIZE = 18


class Node(ABC):
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
    def __init__(self, element: ET.Element, function_name: str):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        if obj is None:
            raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
        
        self.id = findint(obj, 'id')
        if self.id is None:
            raise ValueError("Element does not contain 'id' tag")
        
        self.name = obj.findtext('name', '__unnamed__')
        self.rtl_name = obj.findtext('rtlName', '__unnamed__')
        self.function_name = function_name if function_name else '__unnamed__'

        self.label = f"{self.function_name}/{self.name}"
        self.feature_dict = {}

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
        loop_md: Optional[Dict[str, Any]] = None
    ):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        
        self.name = element.findtext('mNormTag', '')
        if not self.name:
            self.name = element.findtext('mTag', '__unnamed__').replace('.', '_')
            
        self.function_name = function_name
        self.is_loop = findint(element, 'mType', 0) == 1
        self.is_function = self.name == function_name and not self.is_loop
        if self.is_function:
            self.label = function_name
        else:
            norm_name = self.name.replace(' ', '_')
            self.label = f'{function_name}/{norm_name}'

        min_lat = max(0, findint(element, 'mMinLatency', 0))
        max_lat = max(min_lat, findint(element, 'mMaxLatency', 0))

        if self.is_loop:
            if loop_md is not None:
                is_top_level_loop = loop_md.get('IsTopLevel', 0)
                has_perfectly_nested_child = loop_md.get('HasPerfectlyNestedChild', 0)
                is_part_of_perfect_nest = loop_md.get('IsPartOfPerfectNest', 0)
                loop_depth = min(MAX_LOOP_DEPTH, loop_md.get('Depth', 0))
                if loop_depth <= 0:
                    loop_depth = 1
            else:
                is_top_level_loop = 0
                has_perfectly_nested_child = 0
                is_part_of_perfect_nest = 0
                loop_depth = 1

            min_tc = max(0, findint(element, 'mMinTripCount', 0))
            max_tc = max(min_tc, findint(element, 'mMaxTripCount', 0))
            ii = max(0, findint(element, 'mII', 0))

            if ii > 0:
                pipeline_type = [0, 0, 1] # Pipelined automatically by HLS
            else:
                pipeline_type = [1, 0, 0] # Not pipelined
        else:
            is_top_level_loop = 0
            has_perfectly_nested_child = 0
            is_part_of_perfect_nest = 0
            loop_depth = 0
            min_tc = 0
            max_tc = 0
            ii = 0
            pipeline_type = [1, 0, 0]

        encoded_loop_depth = [0] * (MAX_LOOP_DEPTH + 1)
        encoded_loop_depth[loop_depth] = 1

        self.feature_dict = {
            'is_loop': int(self.is_loop), 'is_function': int(self.is_function),
            'min_latency': min_lat, 'max_latency': max_lat,
            'min_trip_count': min_tc, 'max_trip_count': max_tc,
            'is_top_level_loop': is_top_level_loop,
            'has_perfectly_nested_child': has_perfectly_nested_child,
            'is_part_of_perfect_nest': is_part_of_perfect_nest,
            'loop_depth': encoded_loop_depth, 
            'achieved_ii_base': ii, 'target_ii': 0,
            'pipeline': pipeline_type,
            'unroll': [1, 0, 0], # Not unrolled 
            'unroll_factor': 0,
            'loop_merge': 0, 'loop_flatten': 0,
            'dataflow': 0, 'inline': 0,
        }
        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')
        self.operations = []
    
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
            'sub_regions': list(self.sub_regions),
            'blocks': list(self.blocks)
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
        is_top_level: bool,
        array_md: Optional[Dict[str, Any]] = None
    ):
        super().__init__(element, function_name)

        self.is_top_level = is_top_level

        if array_md is not None:
            self.is_array = True

            array_size = array_md['TotalSize']
            primitive_bitwidth = array_md['BaseBitwidth']
            base_type = array_md['BaseType']
            dims = array_md['Dimensions']
            num_dims = array_md['NumDimensions']

            original_array_size = array_md.get('OriginalTotalSize', array_size)
            original_primitive_bitwidth = array_md.get('OriginalBaseBitwidth', primitive_bitwidth)
            original_base_type = array_md.get('OriginalBaseType', base_type)
            original_dims = array_md.get('OriginalDimensions', dims)
            original_num_dims = array_md.get('OriginalNumDimensions', num_dims)

            if original_num_dims > MAX_ARRAY_DIM:
                # Truncate to MAX_ARRAY_DIM
                for i in range(original_num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                    original_dims[i - 1] *= original_dims[i]
                    original_dims.pop()
            elif original_num_dims < MAX_ARRAY_DIM:
                # Pad with 1s
                original_dims.extend([1] * (MAX_ARRAY_DIM - original_num_dims))
        else:
            if_type = findint(element, 'if_type', 0)
            self.is_array = if_type == 1

            primitive_bitwidth = max(0, findint(element, 'Value/bitwidth', 0))

            if self.is_array:
                array_size = max(1, findint(element, 'array_size', 0))
                base_type = '__unknown__'
                original_num_dims = 1
                original_dims = [primitive_bitwidth] + [1] * (MAX_ARRAY_DIM - 1)
            else:
                array_size = 0
                base_type = '__none__'
                original_num_dims = 0
                original_dims = [0] * MAX_ARRAY_DIM

            original_array_size = array_size
            original_primitive_bitwidth = primitive_bitwidth
            original_base_type = base_type

        self.array_size = original_array_size
        self.num_dims = original_num_dims

        direction = [0, 0, 0] # IN, OUT, BI
        direction[findint(element, 'direction', 2)] = 1

        self.feature_dict.update({
            'is_array': int(self.is_array),
            'is_top_level': int(is_top_level),
            'is_large_array': 1 if original_array_size >= 1024 else 0,
            'direction': direction,
            'array_size': original_array_size,
            'original_dims': original_dims,
            'original_primitive_bitwidth': original_primitive_bitwidth,
            'original_base_type': str(original_base_type),
            'primitive_bitwidth': primitive_bitwidth,
            'base_type': str(base_type),
            'array_partition': [1, 0, 0, 0], # Not partitioned
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0,
            'is_unevenly_partitioned': 0,
            'has_hybrid_impl': 0
        })

        self.matching_ports = []

    def as_dict(self):
        feature_dict = {}
        for key, value in self.feature_dict.items():
            if isinstance(value, list) and key != 'original_dims':
                feature_dict[key] = value.index(1) if 1 in value else -1
            else:
                feature_dict[key] = value

        node_as_dict = super().as_dict()
        node_as_dict['feature_dict'] = feature_dict
        node_as_dict['matching_ports'] = self.matching_ports

        return node_as_dict
    

class InternalMemNode(Node):
    def __init__(
        self,
        node_id: int,
        array_name: str,
        array_md: Dict[str, Any],
        function_name: str = '',
        is_global_mem: bool = False,
        utilization: Optional[Dict[str, int]] = None
    ):
        self.id = node_id
        self.name = array_name
        self.is_global_mem = is_global_mem
        self.is_array = True

        if is_global_mem:
            self.function_name = '__global__'
            self.label = self.name
        else:
            self.function_name = function_name if function_name else '__unnamed__'
            self.label = f'{self.function_name}/{self.name}'

        array_size = array_md['TotalSize']
        primitive_bitwidth = array_md['BaseBitwidth']
        base_type = array_md['BaseType']
        dims = array_md['Dimensions']
        num_dims = array_md['NumDimensions']

        original_array_size = array_md.get('OriginalTotalSize', array_size)
        original_primitive_bitwidth = array_md.get('OriginalBaseBitwidth', primitive_bitwidth)
        original_base_type = array_md.get('OriginalBaseType', base_type)
        original_dims = array_md.get('OriginalDimensions', dims)
        original_num_dims = array_md.get('OriginalNumDimensions', num_dims)

        if original_num_dims > MAX_ARRAY_DIM:
            # Truncate to MAX_ARRAY_DIM
            for i in range(original_num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                original_dims[i - 1] *= original_dims[i]
                original_dims.pop()
        elif original_num_dims < MAX_ARRAY_DIM:
            # Pad with 1s
            original_dims.extend([1] * (MAX_ARRAY_DIM - original_num_dims))

        self.array_size = original_array_size
        self.num_dims = original_num_dims

        self.feature_dict = {
            'is_global_mem': int(is_global_mem),
            'is_large_array': 1 if original_array_size >= 1024 else 0,
            'array_size': original_array_size,
            'original_dims': original_dims,
            'original_primitive_bitwidth': original_primitive_bitwidth,
            'original_base_type': str(original_base_type),
            'primitive_bitwidth': primitive_bitwidth,
            'base_type': str(base_type),
            'array_partition': [1, 0, 0, 0], # Not partitioned
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0,
            'is_unevenly_partitioned': 0,
            'has_hybrid_impl': 0
        }

        self.feature_dict.update({res: 0 for res in AREA_METRICS})
        if utilization is not None:
            for res in AREA_METRICS:
                self.feature_dict[res] = utilization.get(res, 0)

        self.matching_ports = []

    def as_dict(self):
        feature_dict = {}
        for key, value in self.feature_dict.items():
            if isinstance(value, list) and key != 'original_dims':
                feature_dict[key] = value.index(1) if 1 in value else -1
            else:
                feature_dict[key] = value
                
        return {
            'id': self.id,
            'label': self.label, 
            'feature_dict': feature_dict,
            'matching_ports': self.matching_ports
        }
    
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
        super().__init__(element, function_name)

        self.label = f'{self.function_name}/{self.name}'
        self.opcode = element.findtext('opcode', '__unknown__')
        self.core_name = element.findtext('Value/Obj/coreName', '__unknown__')

        encoded_opcode = OPCODE_MAP.get(self.opcode, [0] * OPCODE_SIZE)

        self.feature_dict.update({
            'opcode': encoded_opcode,
            'core_name': self.core_name,
            'delay': findfloat(element, 'm_delay', 0.0),
            'is_on_critical_path': int(findint(element, 'm_isOnCriticalPath', 0)),
            'is_start_of_path': int(findint(element, 'm_isStartOfPath', 0)),
            'primitive_bitwidth': max(0, findint(element, 'Value/bitwidth', 0))
        })

        self.feature_dict.update({res: 0 for res in AREA_METRICS})
        if utilization is not None:
            for res in AREA_METRICS:
                self.feature_dict[res] = utilization.get(res, 0)

        op_edges = element.find('oprand_edges') # ** This is not a typo **
        if op_edges is None:
            self.operand_edges = []
        else:
            self.operand_edges = [int(edge.text) for edge in op_edges.findall('item')]

    def as_dict(self):
        node_as_dict = super().as_dict()
        node_as_dict['feature_dict'] = {
            key: value for key, value in self.feature_dict.items() 
            if key not in ['opcode', 'core_name']
        }
        node_as_dict['opcode'] = self.opcode
        node_as_dict['core_name'] = self.core_name
        node_as_dict['operand_edges'] = self.operand_edges
        return node_as_dict
    

class ConstantNode(CDFGNode):
    def __init__(self, element: ET.Element, function_name: str):
        super().__init__(element, function_name)

        self.content = element.findtext('content', '')
        self.label = f'{self.function_name}/{self.name} ({self.content})'

        self.feature_dict.update({
            'primitive_bitwidth': findint(element, 'Value/bitwidth', 0),
            'const_type': str(element.findtext('const_type', '__unknown__')),
        })


class BlockNode(CDFGNode):
    def __init__(self, element: ET.Element, function: str):
        super().__init__(element, function)

        self.label = f"{self.function_name}/{self.name}"
        self.operations = self._extract_items(element, 'node_objs')

    def _extract_items(self, element, tag):
        parent_tag = element.find(tag)
        if parent_tag is None:
            return []
        return [int(item.text) for item in parent_tag.findall('item')]

    def as_dict(self):
        node_dict = super().as_dict()
        node_dict.update({'operations': list(self.operations)})
        return node_dict
    

class CDFG:
    def __init__(
        self,
        root: ET.Element,
        top_level_name: str,
        global_names: List[str],
        array_md_dict: Dict[str, Dict[str, Any]],
        loop_md_dict: Dict[str, Dict[str, Any]],
        utilization_dict: Dict[str, Dict[str, int]],
        offsets: Optional[Dict[str, int]] = None
    ):
        cdfg = root.find('syndb/cdfg')
        if cdfg is None:
            raise ValueError("CDFG not found in the XML file")
        
        cdfg_regions = root.find('syndb/cdfg_regions')
        if cdfg_regions is None:
            raise ValueError("CDFG regions not found in the XML file")
        
        self.nodes = {nt: [] for nt in NODE_TYPES}
        self.edges = {et: [] for et in EDGE_TYPES}

        self._offsets = offsets or {nt: 0 for nt in NODE_TYPES}
        self._node_id_map = {}

        self.name = cdfg.findtext('name')

        if self.name.endswith('_1'):
            self.original_name = self.name[:-2]
            self.unnormalized_name = self.original_name + '.1'
        else:
            self.original_name = self.name
            self.unnormalized_name = self.name

        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth', 0)
        self.is_top_level = self.original_name == top_level_name
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
        op_offset = self._offsets['op']
        internal_mem_offset = self._offsets['internal_mem']

        self._array_alloca_map = {}
        alloca_et = ('op', 'alloca', 'internal_mem')

        for elem in ops_and_mem.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            name = obj.findtext('name', '')
            rtl_name = obj.findtext('rtlName', '')
            
            opcode = elem.findtext('opcode', '')
            if opcode == 'GlobalMem':
                if name != '' and rtl_name != '' and name not in self.global_rtl_name_dict:
                    self.global_rtl_name_dict[name] = rtl_name
                continue # Skip global arrays for now

            utilization = utilization_dict.get(rtl_name) if rtl_name else None

            op_node = OperationNode(elem, self.original_name, utilization=utilization)
            self._node_id_map[op_node.id] = (op_offset, 'op')
            op_node.id = op_offset
            op_offset += 1
            self.nodes['op'].append(op_node)

            if opcode == 'alloca':
                function_name = None
                if f'{self.unnormalized_name}/{name}' in array_md_dict:
                    function_name = self.unnormalized_name
                elif f'{self.name}/{name}' in array_md_dict:
                    function_name = self.name
                elif f'{self.original_name}/{name}' in array_md_dict:
                    function_name = self.original_name

                if function_name is not None:
                    array_md = array_md_dict[f'{function_name}/{name}']

                    internal_mem_node = InternalMemNode(
                        internal_mem_offset, name, array_md, self.original_name,
                        is_global_mem=False, utilization=utilization
                    )
                    self._array_alloca_map[op_node.id] = internal_mem_offset
                    self.nodes['internal_mem'].append(internal_mem_node)
                    self.edges[alloca_et].append((op_node.id, internal_mem_offset))
                    internal_mem_offset += 1

    def _process_ports(self, ports, global_names, array_md_dict):
        port_offset = self._offsets['port']

        for elem in ports.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            name = obj.findtext('name', '')
            if name in global_names:
                continue # Skip global arrays for now

            function_name = None
            if f'{self.unnormalized_name}/{name}' in array_md_dict:
                function_name = self.unnormalized_name
            elif f'{self.name}/{name}' in array_md_dict:
                function_name = self.name
            elif f'{self.original_name}/name' in array_md_dict:
                function_name = self.original_name

            if function_name is not None:
                array_md = array_md_dict[f'{function_name}/{name}']
                port_node = PortNode(
                    elem, self.original_name, self.is_top_level, array_md 
                )
            else:
                port_node = PortNode(elem, self.original_name, self.is_top_level)

            self._node_id_map[port_node.id] = (port_offset, 'op')
            port_node.id = port_offset
            port_offset += 1
            self.nodes['port'].append(port_node)

    def _process_consts(self, consts):
        # Note: Constant nodes with type '4' and '6' are used to represent 
        # indices for getelementptr operations and call edges, respectivelly. 
        # Those will be removed later.
        const_offset = self._offsets['const']
        self._const_callee_name_map = {}
        self._gep_index_consts = []

        for elem in consts.findall('item'):
            node = ConstantNode(elem, self.original_name)
            if node.feature_dict['const_type'] == '4':
                self._gep_index_consts.append(node.id)
            elif node.feature_dict['const_type'] == '6':
                self._const_callee_name_map[node.id] = node.name
            else:
                self._node_id_map[node.id] = (const_offset, 'const')
                node.id = const_offset
                const_offset += 1
                self.nodes['const'].append(node)

    def _process_blocks(self, blocks):
        block_offset = self._offsets['block']
        op_offset = self._offsets['op']

        for elem in blocks.findall('item'):
            node = BlockNode(elem, self.original_name)
            self._node_id_map[node.id] = (block_offset, 'block')
            node.id = block_offset
            block_offset += 1

            updated_ops = []
            for op in node.operations:
                if op in self._node_id_map:
                    new_op, nt = self._node_id_map[op]
                    if nt == 'op':
                        updated_ops.append(new_op)

            node.operations = updated_ops

            node.feature_dict.update({
                f"block_{res}_sum": 0 for res in AREA_METRICS
            })
            num_ops_by_type = {
                'load': 0, 'store': 0, 'alloca': 0, 
                'getelementptr': 0, 'phi': 0, 'call': 0
            }
            is_on_critical_path = False
            is_start_of_path = False
            is_terminal = False

            for op in node.operations:
                op_node = self.nodes['op'][op - op_offset]

                for res in AREA_METRICS:
                    node.feature_dict[f"block_{res}_sum"] += op_node.feature_dict.get(res, 0)

                if op_node.opcode in num_ops_by_type:
                    num_ops_by_type[op_node.opcode] += 1
                elif op_node.opcode == 'ret':
                    is_terminal = True

                if op_node.feature_dict['is_on_critical_path']:
                    is_on_critical_path = True
                if op_node.feature_dict['is_start_of_path']:
                    is_start_of_path = True

            for opcode, count in num_ops_by_type.items():
                node.feature_dict[f'num_{opcode}s_in_block'] = count

            node.feature_dict['num_ops_in_block'] = len(node.operations)
            node.feature_dict['is_on_critical_path'] = int(is_on_critical_path)
            node.feature_dict['is_start_of_path'] = int(is_start_of_path)
            node.feature_dict['is_terminal'] = int(is_terminal)

            self.nodes['block'].append(node)

    def _process_regions(self, regions, loop_md_dict):
        region_offset = self._offsets['region']
        block_offset = self._offsets['block']
    
        for elem in regions.findall('item'):
            is_loop = findint(elem, 'mType', 0) == 1
            loop_md = None

            if is_loop:
                name = elem.findtext('mTag', '')
                if f'{self.unnormalized_name}/{name}' in loop_md_dict:
                    loop_md = loop_md_dict[f'{self.unnormalized_name}/{name}']
                elif f'{self.name}/{name}' in loop_md_dict:
                    loop_md = loop_md_dict[f'{self.name}/{name}']
                elif f'{self.original_name}/name' in loop_md_dict:
                    loop_md = loop_md_dict[f'{self.original_name}/{name}']

            node = RegionNode(elem, self.original_name, loop_md) 
            node.id += region_offset - 1
            node.sub_regions = [
                sub_region_id + region_offset - 1
                for sub_region_id in node.sub_regions
            ]
            node.blocks = [
                self._node_id_map[block_id][0] 
                for block_id in node.blocks 
                if block_id in self._node_id_map
            ]
            self.nodes['region'].append(node)

        for region_node in self.nodes['region']:
            all_sub_regions = self._get_all_sub_regions(region_node)

            all_blocks = set(region_node.blocks)
            for sub_region_id in all_sub_regions:
                sub_region = self.nodes['region'][sub_region_id - region_offset]
                all_blocks.update(sub_region.blocks)

            region_node.feature_dict.update(
                {f"region_{res}_sum": 0 for res in AREA_METRICS}
            )
            region_node.feature_dict.update({
                "num_ops_in_region": 0,
                "num_loads_in_region": 0,
                "num_stores_in_region": 0,
                "num_allocas_in_region": 0,
                "num_getelementptrs_in_region": 0,
                "num_phis_in_region": 0,
                "num_calls_in_region": 0
            })
            for block_id in all_blocks:
                block_node = self.nodes['block'][block_id - block_offset]
                for key, value in block_node.feature_dict.items():
                    if key.startswith('num_') or key.endswith('_sum'):
                        region_key = key.replace('block', 'region')
                        region_node.feature_dict[region_key] += value
            
            region_node.feature_dict['num_sub_regions'] = len(all_sub_regions)
            region_node.feature_dict['num_blocks'] = len(all_blocks)

            num_ops = region_node.feature_dict['num_ops_in_region']
            if region_node.is_function and num_ops < INLINE_THRESHOLD:
                region_node.feature_dict['is_small_function'] = 1
            else:
                region_node.feature_dict['is_small_function'] = 0

    def _parse_edges(self, cdfg):
        src_pointer_offset_ids = []
        dst_pointer_offset_ids = []

        for elem in cdfg.find('edges').findall('item'):
            rel = elem.findtext('edge_type', '')
            if rel == '2':
                rel = 'control'
            elif rel in ['1', '3', '4']:
                rel = 'data'
            else:
                print(f"Skipping unknown relation type: {rel}")
                continue

            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')
            if src is None or dst is None:
                continue

            if src in self._const_callee_name_map:
                dst, dst_nt = self._node_id_map.get(dst, (None, None))
                if dst is not None and dst_nt == 'op':
                    callee_name = self._const_callee_name_map[src]
                    self.function_calls.append((dst, callee_name))
                continue

            if src in self._gep_index_consts:
                dst, dst_nt = self._node_id_map.get(dst, (None, None))
                if dst is not None and dst_nt == 'op':
                    src_pointer_offset_ids.append((src, dst))
                continue

            if dst in self._gep_index_consts:
                src, src_nt = self._node_id_map.get(src, (None, None))
                if src is not None:
                    if src in self._array_alloca_map:
                        src = self._array_alloca_map[src]
                        src_nt = 'internal_mem'
                    dst_pointer_offset_ids.append(((src, src_nt), dst))
                continue

            src, src_nt = self._node_id_map.get(src, (None, None))
            dst, dst_nt = self._node_id_map.get(dst, (None, None))
            if src is None or dst is None:
                continue

            if src in self._array_alloca_map and rel == 'data':
                src = self._array_alloca_map[src]
                src_nt = 'internal_mem'

            et = (src_nt, rel, dst_nt)
            if et not in EDGE_TYPES:
                print(f"Skipping edge type: {et}")
                continue

            self.edges[et].append((src, dst))

        for (src, src_nt), dst_const in dst_pointer_offset_ids:
            for src_const, op in src_pointer_offset_ids:
                if src_const == dst_const:
                    self.edges[(src_nt, 'data', 'op')].append((src, op))

    def _build_hierarchy_edges(self):
        for i, region in enumerate(self.nodes['region']):
            for sub_region in region.sub_regions:
                self.edges[('region', 'hier', 'region')].append((region.id, sub_region))
            for block in region.blocks:
                self.edges[('region', 'hier', 'block')].append((region.id, block))
                block_node = self.nodes['block'][block - self._offsets['block']]
                for op in block_node.operations:
                    self.nodes['region'][i].operations.append(op)
                    self.edges[('region', 'hier', 'op')].append((region.id, op))
                    self.edges[('block', 'hier', 'op')].append((block, op))

    def _get_all_sub_regions(self, region_node):
        all_sub_regions = set(region_node.sub_regions)
        for sub_region in region_node.sub_regions:
            sub_region_node = self.nodes['region'][sub_region - self._offsets['region']]
            all_sub_regions.update(self._get_all_sub_regions(sub_region_node))
        return all_sub_regions
    
    def as_dict(self):
        return {
            'function_name': self.original_name,
            'ret_bitwidth': self.ret_bitwidth,
            'is_top_level': self.is_top_level,
            'function_calls': self.function_calls,
            'nodes': {
                nt: [n.as_dict() for n in nodes] 
                for nt, nodes in self.nodes.items()
            },
            'edges': {
                f"{et[0]}__{et[1]}__{et[2]}": edges 
                for et, edges in self.edges.items()
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

        self.nodes = {nt: [] for nt in NODE_TYPES}
        self.edges = {et: [] for et in EDGE_TYPES}

        self._offsets = {nt: 0 for nt in NODE_TYPES}
        self._cdfgs = {}

        self._process_adb_files(solution_dir, filtered)
        self._include_call_flow()
        self._update_array_info()

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
                utilization_dict=self.utilization_dict,
                offsets=self._offsets
            )
            self._global_rtl_name_dict.update(cdfg.global_rtl_name_dict)
            self._cdfgs[cdfg.unnormalized_name] = cdfg
            self._merge_cdfg_data(cdfg)

    def _merge_cdfg_data(self, cdfg):
        for nt, nodes in cdfg.nodes.items():
            self.nodes[nt].extend(nodes)
            self._offsets[nt] += len(nodes)

        for et, edges in cdfg.edges.items():
            self.edges[et].extend(edges)

    def _include_call_flow(self):
        call_et = ('op', 'control', 'region')
        ret_et = ('region', 'control', 'op')

        # Collect array operands from function calls
        operand_dict = {}
        for nt in ['internal_mem', 'port']:
            for src, dst in self.edges.get((nt, 'data', 'op'), []):
                src_node = self.nodes[nt][src]
                dst_node = self.nodes['op'][dst]
                if dst_node.opcode == 'call' and src_node.is_array:
                    if dst_node.id not in operand_dict:
                        operand_dict[dst_node.id] = []
                    operand_dict[dst_node.id].append((src_node.id, nt))

        for cdfg in self._cdfgs.values():
            for function_call in cdfg.function_calls:
                callee = function_call[1]
                if callee not in self._cdfgs:
                    continue

                callee_cdfg = self._cdfgs[callee]
                callee_region_node = callee_cdfg.nodes['region'][0]
                callee_region_id = callee_region_node.id

                call_op_id = function_call[0]
                call_op_node = self.nodes['op'][call_op_id]

                for src, nt in operand_dict.get(call_op_id, []):
                    src_node = self.nodes[nt][src]

                    # Find matching port in callee CDFG
                    for callee_port in callee_cdfg.nodes['port']:
                        if callee_port.name == src_node.name:
                            self.nodes[nt][src].matching_ports.append(callee_port.id)
                            self.edges[(nt, 'data', 'port')].append((src, callee_port.id))
                            break
            
                self.edges[call_et].append((call_op_id, callee_region_id))
                self.edges[ret_et].append((callee_region_id, call_op_id))

                callee_size = callee_region_node.feature_dict.get('num_ops_in_region', 0)
                call_op_node.feature_dict['callee_size'] = callee_size

        for op_node in self.nodes['op']:
            if 'callee_size' not in op_node.feature_dict or op_node.opcode != 'call':
                op_node.feature_dict['callee_size'] = 0

    def _update_array_info(self):
        num_internal_mem_nodes = len(self.nodes['internal_mem'])
        
        for array_name, array_md in self._global_array_md_dict.items():
            utilization = None
            if array_name in self._global_rtl_name_dict:
                rtl_name = self._global_rtl_name_dict[array_name]
                if rtl_name in self.utilization_dict:
                    utilization = self.utilization_dict[rtl_name]

            array_node = InternalMemNode(
                num_internal_mem_nodes, array_name, array_md,
                is_global_mem=True, utilization=utilization
            )
            num_internal_mem_nodes += 1

            self.nodes['internal_mem'].append(array_node)

            new_edges = []
            for store_info in array_md.get('Stores', []):
                function_name = store_info.get('FunctionName', '')
                idx = store_info.get('Index', -1)
                if not function_name or idx < 0 or function_name not in self._cdfgs:
                    continue

                cdfg = self._cdfgs[function_name]

                count = 0
                for op_node in cdfg.nodes['op']:
                    if op_node.opcode == 'store':
                        if count == idx:
                            new_edges.append((array_node.id, op_node.id))
                            break
                        count += 1

            for key in ['Loads', 'GEPs']:
                for op_info in array_md.get(key, []):
                    function_name = op_info.get('FunctionName', '')
                    inst_name = op_info.get('Name', '')
                    if not function_name or not inst_name or function_name not in self._cdfgs:
                        continue

                    cdfg = self._cdfgs[function_name]

                    for op_node in cdfg.nodes['op']:
                        if op_node.name == inst_name:
                            new_edges.append((array_node.id, op_node.id))
                            break

            self.edges[('internal_mem', 'data', 'op')].extend(new_edges)

        for array_label, array_md in self._local_array_md_dict.items():
            function_name, array_name = array_label.split('/')
            if function_name not in self._cdfgs:
                continue

            cdfg = self._cdfgs[function_name]

            array_node = None
            for port_node in cdfg.nodes['port']:
                if port_node.name == array_name:
                    array_node = port_node
                    break

            if array_node is None:
                continue

            new_edges = []
            for store_info in array_md.get('Stores', []):
                idx = store_info.get('Index', -1)
                if store_info.get('FunctionName', '') != function_name or idx < 0:
                    continue

                count = 0
                for op_node in cdfg.nodes['op']:
                    if op_node.opcode == 'store':
                        if count == idx:
                            new_edges.append((array_node.id, op_node.id))
                            break
                        count += 1

            for key in ['Loads', 'GEPs']:
                for op_info in array_md.get(key, []):
                    inst_name = op_info.get('Name', '')
                    if not inst_name or op_info.get('FunctionName', '') != function_name:
                        continue

                    for op_node in cdfg.nodes['op']:
                        if op_node.name == inst_name:
                            new_edges.append((array_node.id, op_node.id))
                            break

            for src, dst in new_edges:
                if not self._edge_exists(src, dst, ('port', 'data', 'op')):
                    self.edges[('port', 'data', 'op')].append((src, dst))

        new_edge_dict = {
            ('internal_mem', 'data', 'op'): [],
            ('port', 'data', 'op'): []
        }
        # Add a (Node -> Op) edge for each (Node -> GEP -> Op) path
        for nt in ['port', 'internal_mem']:
            for node, op in self.edges.get((nt, "data", "op"), []):
                op_node = self.nodes['op'][op]
                if op_node.opcode == 'getelementptr':
                    for src_op, dst_op in self.edges.get(("op", "data", "op"), []):
                        if src_op == op:
                            new_edge_dict[(nt, "data", "op")].append((node, dst_op))

        for et, edges in new_edge_dict.items():
            for src, dst in edges:
                if not self._edge_exists(src, dst, et):
                    self.edges[et].append((src, dst))

        # Add a (Store -> Array) edge for each (Array -> Store) edge
        for nt in ['port', 'internal_mem']:
            for array, op in self.edges.get((nt, "data", "op"), []):
                array_node = self.nodes[nt][array]
                op_node = self.nodes['op'][op]
                if array_node.is_array and op_node.opcode == 'store':
                    self.edges[('op', 'store', nt)].append((op, array))
            
    def _edge_exists(self, src, dst, et):
        return any(src == edge[0] and dst == edge[1] for edge in self.edges.get(et, []))
    
    def as_dict(self):
        node_dict = {
            nt: [n.as_dict() for n in nodes] 
            for nt, nodes in self.nodes.items()
        }
        edge_dict = {}
        for et, edges in self.edges.items():
            edges_with_labels = []
            for src, dst in edges:
                src_node = self.nodes[et[0]][src]
                dst_node = self.nodes[et[2]][dst]
                edges_with_labels.append({
                    'src': src,
                    'dst': dst,
                    'src_label': src_node.label,
                    'dst_label': dst_node.label
                })
            et_str = f"{et[0]}__{et[1]}__{et[2]}"
            edge_dict[et_str] = edges_with_labels

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