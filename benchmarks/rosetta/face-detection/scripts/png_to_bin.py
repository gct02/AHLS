from PIL import Image
import numpy as np

with Image.open('result.png') as image:
    img_array = np.array(image, dtype=np.uint8)

with open('result_binary.bin', 'wb') as f:
    f.write(img_array.tobytes())