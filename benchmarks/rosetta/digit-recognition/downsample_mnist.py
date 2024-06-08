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

if __name__ == '__main__':
    # Constants
    NUM_TRAINING_SAMPLES = 60000
    NUM_TEST_SAMPLES = 10000

    # Load the MNIST dataset
    (x_train, y_train), (x_test, y_test) = mnist.load_data()

    print(y_test)

    # Resize the images
    x_train_resized = np.array([resize(image) for image in x_train])
    x_test_resized = np.array([resize(image) for image in x_test])

    # Binarize the images
    x_train_binarized = np.array([binarize(image) for image in x_train_resized])
    x_test_binarized = np.array([binarize(image) for image in x_test_resized])

    # Transform each image in a 1D array
    x_train_binarized = np.array([image.flatten() for image in x_train_binarized])
    x_test_binarized = np.array([image.flatten() for image in x_test_binarized])

    # Add padding bits to make the images 256 bits long
    padding_size = 256 - x_train_binarized.shape[1]
    x_train_binarized = np.array([np.concatenate([image, np.zeros(padding_size, dtype=int)])[::-1] for image in x_train_binarized])
    x_test_binarized = np.array([np.concatenate([image, np.zeros(padding_size, dtype=int)])[::-1] for image in x_test_binarized])

    # Reshape the image arrays to be packed in 64-bit integers
    x_train_packed = np.array([np.packbits(image.reshape((-1, 64)).astype(np.uint8), bitorder='little').view(np.uint64)[::-1] for image in x_train_binarized])
    x_test_packed = np.array([np.packbits(image.reshape((-1, 64)).astype(np.uint8), bitorder='little').view(np.uint64)[::-1] for image in x_test_binarized])
    
    # Save the dataset
    with open('data/downsampled_mnist_train.dat', 'wb') as f:
        f.write(struct.pack('i', NUM_TRAINING_SAMPLES))
        for image in x_train_packed:
            for i in range(4):
                f.write(struct.pack('Q', image[i]))

    with open('data/downsampled_mnist_test.dat', 'wb') as f:
        f.write(struct.pack('i', NUM_TEST_SAMPLES))
        for image in x_test_packed:
            print(image)
            for i in range(4):
                f.write(struct.pack('Q', image[i]))
    
    with open('data/downsampled_mnist_train_labels.dat', 'wb') as f:
        for label in y_train:
            f.write(struct.pack('c', int(label).to_bytes(1, byteorder='little')))

    with open('data/downsampled_mnist_test_labels.dat', 'wb') as f:
        for label in y_test:
            f.write(struct.pack('c', int(label).to_bytes(1, byteorder='little')))