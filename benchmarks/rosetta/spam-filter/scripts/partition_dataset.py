N_SAMPLES = 5000
N_FEATURES_PER_SAMPLE = 1024

N_TRAINING_FILES = 40
N_TEST_FILES = 10
N_SAMPLES_PER_OUTPUT_FILE = int(N_SAMPLES / (N_TRAINING_FILES + N_TEST_FILES))

labels_file = open("original_dataset/shuffledlabels.txt", "r")
features_file = open("original_dataset/shuffledfeats.txt", "r")

train_out_features_file_name_base = "inputs/training/training_feats_"
train_out_labels_file_name_base = "inputs/training/training_labels_"
test_out_features_file_name_base = "inputs/test/test_feats_"
test_out_labels_file_name_base = "inputs/test/test_labels_"

for i in range(1, N_TRAINING_FILES + 1):
    out_features_file = open(train_out_features_file_name_base + str(i) + ".txt", "w")
    out_labels_file = open(train_out_labels_file_name_base + str(i) + ".txt", "w")

    for _ in range(N_SAMPLES_PER_OUTPUT_FILE):
        features = "".join(features_file.readlines(N_FEATURES_PER_SAMPLE))
        label = labels_file.readline()

        out_features_file.write(features)
        out_labels_file.write(label)
    
    out_features_file.close()
    out_labels_file.close()

for i in range(1, N_TEST_FILES + 1):
    out_features_file = open(test_out_features_file_name_base + str(i) + ".txt", "w")
    out_labels_file = open(test_out_labels_file_name_base + str(i) + ".txt", "w")

    for _ in range(N_SAMPLES_PER_OUTPUT_FILE):
        features = "".join(features_file.readlines(N_FEATURES_PER_SAMPLE))
        label = labels_file.readline()

        out_features_file.write(features)
        out_labels_file.write(label)
    
    out_features_file.close()
    out_labels_file.close()

labels_file.close()
features_file.close()

