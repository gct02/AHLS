import struct, random
from math import pi

def float64_to_hex(f):
    return hex(struct.unpack('<Q', struct.pack('<d', f))[0])

if __name__ == "__main__":
    N_TRAINING_INPUTS = 16000
    N_TEST_INPUTS = 4000
    INPUT_VEC_SIZE = 36

    MIN = 0.0
    MAX = 2.0

    for i in range(1, N_TRAINING_INPUTS + 1):
        with open("inputs/training/input_%d.txt" % i, "w") as f:
            for _ in range(INPUT_VEC_SIZE):
                x = random.uniform(MIN, MAX) * pi
                f.write(float64_to_hex(x)[2:])
                f.write("\n")

    for i in range(1, N_TEST_INPUTS + 1):
        with open("inputs/test/input_%d.txt" % i, "w") as f:
            for _ in range(INPUT_VEC_SIZE):
                x = random.uniform(MIN, MAX) * pi
                f.write(float64_to_hex(x)[2:])
                f.write("\n")

