'''
Resize input image to 320x240, convert it to greyscale
and save it as a PNG file.
'''

from PIL import Image
from sys import argv

input_image_path = argv[1] # *.png or *.jpg
output_image_path = argv[2] # *.png only

# Resize the image to 320x240 (size used by the face detection benchmark)
new_width  = 320
new_height = 240

img = Image.open(argv[1]).convert('L')
img = img.resize((new_width, new_height), Image.LANCZOS)
img.save(output_image_path)