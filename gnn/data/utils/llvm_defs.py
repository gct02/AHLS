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
    UNKNOWN = 0

# Type IDs from LLVM (v7.0)
class TypeID(IntEnum):
    HALF = 1
    FLOAT = 2
    DOUBLE = 3
    X86_FP80 = 4
    FP128 = 5
    PPC_FP128 = 6
    INT = 11
    STRUCT = 13
    ARRAY = 14
    POINTER = 15
    UNKNOWN = 0

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
    Opcode.FCMP:    [0,0,0,0,1, 0,0,0,0,1, 1,0],

    Opcode.UNKNOWN: [0,0,0,0,0, 0,0,0,0,0, 0,0]
}

TYPE_ENCODING = {
    TypeID.INT:       [1,0,0,0,0],
    TypeID.HALF:      [0,1,0,0,0],
    TypeID.FLOAT:     [0,1,0,0,0],
    TypeID.DOUBLE:    [0,1,0,0,0],
    TypeID.X86_FP80:  [0,1,0,0,0],
    TypeID.FP128:     [0,1,0,0,0],
    TypeID.PPC_FP128: [0,1,0,0,0],

    TypeID.POINTER:   [0,0,1,0,0],

    TypeID.ARRAY:     [0,0,0,1,0],
    TypeID.STRUCT:    [0,0,0,0,1],

    TypeID.UNKNOWN:   [0,0,0,0,0]
}

OP_ENCODING_SIZE = len(OP_ENCODING[Opcode.ADD])
TYPE_ENCODING_SIZE = len(TYPE_ENCODING[TypeID.INT])

# Maximum number of dimensions for arrays
MAX_ARRAY_DIMS = 4
