from enum import IntEnum

# Opcodes from LLVM (v7.0)
class Opcode(IntEnum):
    RET = 1
    BR = 2
    ADD = 11
    FADD = 12
    SUB = 13
    FSUB = 14
    MUL = 15
    FMUL = 16
    UDIV = 17
    SDIV = 18
    FDIV = 19
    UREM = 20
    SREM = 21
    FREM = 22
    SHL = 23
    LSHR = 24
    ASHR = 25
    AND = 26
    OR = 27
    XOR = 28
    ALLOCA = 29
    LOAD = 30
    STORE = 31
    GEP = 32
    TRUNC = 36
    ZEXT = 37
    SEXT = 38
    FPTRUNC = 43
    FPEXT = 44
    BITCAST = 47
    ICMP = 51
    FCMP = 52
    PHI = 53
    CALL = 54

# Type IDs from LLVM (v7.0)
class TypeID(IntEnum):
    VOID = 0
    HALF = 1
    FLOAT = 2
    DOUBLE = 3
    X86_FP80 = 4
    FP128 = 5
    PPC_FP128 = 6
    LABEL = 7
    METADATA = 8
    X86_MMX = 9
    TOKEN = 10
    INT = 11
    FUNCTION = 12
    STRUCT = 13
    ARRAY = 14
    POINTER = 15
    VECTOR = 16

# Hierarchical "one-hot-like" encoding of LLVM operations (12 bits)
# The first 5 bits represent the instruction category
# The next 5 bits represent the instruction type
# The 11th bit represents the instruction is a floating-point operation
# The 12th bit represents the instruction is signed
OP_ENCODING = {
    # Arithmetic
    Opcode.ADD:     [1,0,0,0,0, 1,0,0,0,0, 0,1],
    Opcode.FADD:    [1,0,0,0,0, 1,0,0,0,0, 1,0],
    Opcode.SUB:     [1,0,0,0,0, 0,1,0,0,0, 0,1],
    Opcode.FSUB:    [1,0,0,0,0, 0,1,0,0,0, 1,0],
    Opcode.MUL:     [1,0,0,0,0, 0,0,1,0,0, 0,1],
    Opcode.FMUL:    [1,0,0,0,0, 0,0,1,0,0, 1,0],
    Opcode.SDIV:    [1,0,0,0,0, 0,0,0,1,0, 0,1],
    Opcode.UDIV:    [1,0,0,0,0, 0,0,0,1,0, 0,0],
    Opcode.FDIV:    [1,0,0,0,0, 0,0,0,1,0, 1,0],
    Opcode.SREM:    [1,0,0,0,0, 0,0,0,0,1, 0,1],
    Opcode.UREM:    [1,0,0,0,0, 0,0,0,0,1, 0,0],
    Opcode.FREM:    [1,0,0,0,0, 0,0,0,0,1, 1,0],

    # Logical
    Opcode.SHL:     [0,1,0,0,0, 1,0,0,0,0, 0,0],
    Opcode.LSHR:    [0,1,0,0,0, 0,1,0,0,0, 0,0],
    Opcode.ASHR:    [0,1,0,0,0, 0,1,0,0,0, 0,1],
    Opcode.AND:     [0,1,0,0,0, 0,0,1,0,0, 0,0],
    Opcode.OR:      [0,1,0,0,0, 0,0,0,1,0, 0,0],
    Opcode.XOR:     [0,1,0,0,0, 0,0,0,0,1, 0,0],

    # Memory
    Opcode.ALLOCA:  [0,0,1,0,0, 1,0,0,0,0, 0,0],
    Opcode.LOAD:    [0,0,1,0,0, 0,1,0,0,0, 0,0],
    Opcode.STORE:   [0,0,1,0,0, 0,0,1,0,0, 0,0],
    Opcode.GEP:     [0,0,1,0,0, 0,0,0,1,0, 0,0],

    # Casts
    Opcode.TRUNC:   [0,0,0,1,0, 1,0,0,0,0, 0,0],
    Opcode.FPTRUNC: [0,0,0,1,0, 1,0,0,0,0, 1,0],
    Opcode.ZEXT:    [0,0,0,1,0, 0,1,0,0,0, 0,0],
    Opcode.SEXT:    [0,0,0,1,0, 0,1,0,0,0, 0,1],
    Opcode.FPEXT:   [0,0,0,1,0, 0,1,0,0,0, 1,0],
    Opcode.BITCAST: [0,0,0,1,0, 0,0,1,0,0, 0,0],

    # Control flow
    Opcode.BR:      [0,0,0,0,1, 1,0,0,0,0, 0,0],
    Opcode.RET:     [0,0,0,0,1, 0,1,0,0,0, 0,0],
    Opcode.CALL:    [0,0,0,0,1, 0,0,1,0,0, 0,0],
    Opcode.PHI:     [0,0,0,0,1, 0,0,0,1,0, 0,0],
    Opcode.ICMP:    [0,0,0,0,1, 0,0,0,0,1, 0,0],
    Opcode.FCMP:    [0,0,0,0,1, 0,0,0,0,1, 1,0]
}
NUM_OPCODES = len(list(Opcode))  # Number of opcodes
OP_ENCODING_SIZE = len(list(Opcode)[0])  # Size of the encoding

TYPE_ENCODING = {
    TypeID.INT:       [1,0,0,0,0,0],
    TypeID.HALF:      [0,1,0,0,0,0],
    TypeID.FLOAT:     [0,1,0,0,0,0],
    TypeID.DOUBLE:    [0,1,0,0,0,0],
    TypeID.X86_FP80:  [0,1,0,0,0,0],
    TypeID.FP128:     [0,1,0,0,0,0],
    TypeID.PPC_FP128: [0,1,0,0,0,0],
    TypeID.POINTER:   [0,0,1,0,0,0],
    TypeID.STRUCT:    [0,0,0,1,0,0],
    TypeID.VOID:      [0,0,0,0,1,0],
    TypeID.VECTOR:    [0,0,0,0,0,1],

    TypeID.ARRAY:     [0,0,0,0,0,1],
    TypeID.LABEL:     [0,0,0,0,0,1],
    TypeID.METADATA:  [0,0,0,0,0,1],
    TypeID.X86_MMX:   [0,0,0,0,0,1],
    TypeID.TOKEN:     [0,0,0,0,0,1],
    TypeID.FUNCTION:  [0,0,0,0,0,1]
}
NUM_TYPES = len(list(TypeID))  # Number of types
TYPE_ENCODING_SIZE = len(list(TypeID)[0])  # Size of the encoding

MAX_ARRAY_DIMS = 4 # Maximum number of dimensions for arrays