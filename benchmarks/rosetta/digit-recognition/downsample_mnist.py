'''
To create a dataset to be used as input to Rosetta's digit recognition benchmark, 
each MNIST image have to be downsampled to a 14x14 image whose pixels are represented 
by a single bit. This script performs this downsampling and saves the resulting dataset
'''

import numpy as np
import struct, math, sys
from keras.api.datasets import mnist

np.set_printoptions(threshold=sys.maxsize)

def resize(image_as_ndarray):
    '''
    Resize a 28x28 image to a 14x14 image by averaging the values of each 2x2 block of pixels
    '''
    resized_image = np.zeros((14, 14))
    for i in range(14):
        for j in range(14):
            resized_image[i, j] = np.mean(image_as_ndarray[2*i:2*(i+1), 2*j:2*(j+1)])
    return resized_image

def binarize(image_as_ndarray, threshold=128):
    '''
    Binarize a 14x14 image by setting to 1 all pixels with value greater than a threshold
    '''
    return np.where(image_as_ndarray > threshold, 1, 0)

def process_image(image_as_ndarray):
    '''
    Resize and binarize a 28x28 image. Return it as an array with 4 64-bit integers
    '''
    downscaled_image = binarize(resize(image_as_ndarray))

    # Add padding bits to make the image 256 bits long
    downscaled_image = np.concatenate([downscaled_image.flatten(), np.zeros(60, dtype=int)])[::-1]
    
    # Pack the image in 64-bit integers and return it
    return np.packbits(downscaled_image.reshape((-1, 64)).astype(np.uint8), bitorder='little').view(np.uint64)[::-1]

if __name__ == '__main__':
    # Load the MNIST dataset
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    # Resize the images
    x_train_downscaled = np.array([process_image(image) for image in x_train])
    x_test_downscaled = np.array([process_image(image) for image in x_test])
    
    # Save the dataset
    with open('data/downsampled_mnist_train.dat', 'wb') as f:
        for image in x_train_downscaled:
            for i in range(4):
                f.write(struct.pack('Q', image[i]))

    with open('data/downsampled_mnist_test.dat', 'wb') as f:
        for image in x_test_downscaled:
            for i in range(4):
                f.write(struct.pack('Q', image[i]))
    
    with open('data/downsampled_mnist_train_labels.dat', 'wb') as f:
        for label in y_train:
            f.write(label)

    with open('data/downsampled_mnist_test_labels.dat', 'wb') as f:
        for label in y_test:
            f.write(label)