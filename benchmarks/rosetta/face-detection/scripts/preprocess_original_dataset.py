from pathlib import Path
from PIL import Image
import numpy as np
import os

directory = os.fsencode('original_dataset')

DEST_WIDTH = 320
DEST_HEIGHT = 240

N_SAMPLES = 3400
N_TRAINING_SAMPLES = 2720
N_TEST_SAMPLES = 680

i = 1

output_base_name = "inputs/training/training_img_"

for file in os.listdir(directory):
    filename = os.fsdecode(file)
    if filename.endswith(".png") or filename.endswith(".jpg"):
        with Image.open('original_dataset/' + filename).convert('L') as img:
            img = img.resize((DEST_WIDTH, DEST_HEIGHT), Image.LANCZOS)
            img_array = np.array(img, dtype=np.uint8)
            with open(output_base_name + str(i) + '.bin', 'wb') as f:
                f.write(img_array.tobytes())
            i += 1
            if i > N_TRAINING_SAMPLES:
                output_base_name = "inputs/test/test_img_"
                i = 1
    else:
        continue