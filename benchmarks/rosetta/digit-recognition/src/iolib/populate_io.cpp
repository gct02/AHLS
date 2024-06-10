#include <stdio.h>
#include <stdlib.h>
#include "populate_io.h"

void populateInput(
    const char* training_samples_filename, 
    const char* training_labels_filename,
    const char* test_samples_filename,
    const char* test_labels_filename,
    DigitType training_samples[NUM_TRAINING * DIGIT_WIDTH],
    LabelType training_labels[NUM_TRAINING],
    DigitType test_samples[NUM_TEST * DIGIT_WIDTH],
    LabelType test_labels[NUM_TEST])
{
    FILE* training_samples_file = fopen(training_samples_filename, "rb");
    FILE* training_labels_file = fopen(training_labels_filename, "rb");
    FILE* test_samples_file = fopen(test_samples_filename, "rb");
    FILE* test_labels_file = fopen(test_labels_filename, "rb");

    if (!training_samples_file || !training_labels_file || !test_samples_file || !test_labels_file)
    {
        printf("Error opening files\n");
        exit(-1);
    }

    fread(training_samples, sizeof(DigitType), NUM_TRAINING * DIGIT_WIDTH, training_samples_file);
    fread(training_labels, sizeof(LabelType), NUM_TRAINING, training_labels_file);
    fread(test_samples, sizeof(DigitType), NUM_TEST * DIGIT_WIDTH, test_samples_file);
    fread(test_labels, sizeof(LabelType), NUM_TEST, test_labels_file);

    fclose(training_samples_file);
    fclose(training_labels_file);
    fclose(test_samples_file);
    fclose(test_labels_file);
}

void populateOutput(LabelType result[NUM_TEST], LabelType expected[NUM_TEST])
{
    int correct_cnt = 0;

    FILE* ofile = fopen("output.txt", "w");
    if (!ofile)
    {
        printf("Failed to create output file!\n");
        exit(-1);
    }

    for (int i = 0; i < NUM_TEST; i++)
    {
        if (result[i] != expected[i])
            fprintf(ofile, "Test %d: expected = %d, result = %d\n", i, expected[i], result[i]);
        else
            correct_cnt++;
    }

    fprintf(ofile, "\n\t %d / %d correct!\n", correct_cnt, NUM_TEST);
    fclose(ofile);
}
