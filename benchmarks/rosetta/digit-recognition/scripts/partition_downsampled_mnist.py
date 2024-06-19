
'''
Partition the original MNIST dataset (with 60000 training samples and 10000 test samples) 
into 20 subsets, each with 3000 training samples and 500 test samples.
'''

N_TRAINING_SUBSETS = 16
N_TEST_SUBSETS = 4
UINT64_SIZE = 8
DIGIT_WIDTH = 4
DIGIT_SIZE = UINT64_SIZE * DIGIT_WIDTH

training_samples_file = open("downsampled_dataset/downsampled_mnist_train.dat", "rb")
training_labels_file = open("downsampled_dataset/downsampled_mnist_train_labels.dat", "rb")
test_samples_file = open("downsampled_dataset/downsampled_mnist_test.dat", "rb")
test_labels_file = open("downsampled_dataset/downsampled_mnist_test_labels.dat", "rb")

training_samples_base_name = "inputs/training/training_samples_"
training_labels_base_name = "inputs/training/training_labels_"
test_samples_base_name = "inputs/training/test_samples_"
test_labels_base_name = "inputs/training/test_labels_"

for i in range(1, N_TRAINING_SUBSETS + 1):
    training_samples_file_i = open(training_samples_base_name + str(i) + ".dat", "wb")
    training_labels_file_i = open(training_labels_base_name + str(i) + ".dat", "wb")
    test_samples_file_i = open(test_samples_base_name + str(i) + ".dat", "wb")
    test_labels_file_i = open(test_labels_base_name + str(i) + ".dat", "wb")

    training_samples_i = training_samples_file.read(DIGIT_SIZE * 3000)
    training_labels_i = training_labels_file.read(3000)
    test_samples_i = test_samples_file.read(DIGIT_SIZE * 500)
    test_labels_i = test_labels_file.read(500)

    training_samples_file_i.write(training_samples_i)
    training_labels_file_i.write(training_labels_i)
    test_samples_file_i.write(test_samples_i)
    test_labels_file_i.write(test_labels_i)

    training_samples_file_i.close()
    training_labels_file_i.close()
    test_samples_file_i.close()
    test_labels_file_i.close()

training_samples_base_name = "inputs/test/training_samples_"
training_labels_base_name = "inputs/test/training_labels_"
test_samples_base_name = "inputs/test/test_samples_"
test_labels_base_name = "inputs/test/test_labels_"

for i in range(1, N_TEST_SUBSETS + 1):
    training_samples_file_i = open(training_samples_base_name + str(i) + ".dat", "wb")
    training_labels_file_i = open(training_labels_base_name + str(i) + ".dat", "wb")
    test_samples_file_i = open(test_samples_base_name + str(i) + ".dat", "wb")
    test_labels_file_i = open(test_labels_base_name + str(i) + ".dat", "wb")

    training_samples_i = training_samples_file.read(DIGIT_SIZE * 3000)
    training_labels_i = training_labels_file.read(3000)
    test_samples_i = test_samples_file.read(DIGIT_SIZE * 500)
    test_labels_i = test_labels_file.read(500)

    training_samples_file_i.write(training_samples_i)
    training_labels_file_i.write(training_labels_i)
    test_samples_file_i.write(test_samples_i)
    test_labels_file_i.write(test_labels_i)

    training_samples_file_i.close()
    training_labels_file_i.close()
    test_samples_file_i.close()
    test_labels_file_i.close()

training_samples_file.close()
training_labels_file.close()
test_samples_file.close()
test_labels_file.close()





        
    



