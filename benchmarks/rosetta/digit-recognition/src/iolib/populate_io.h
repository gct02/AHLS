#ifndef __DIGITREC_POPULATE_IO_H__
#define __DIGITREC_POPULATE_IO_H__

#include "../typedefs.h"

#ifdef __cplusplus
extern "C" {
#endif

void populateInput(
    const char* training_samples_filename, 
    const char* training_labels_filename,
    const char* test_samples_filename,
    const char* test_labels_filename,
    DigitType training_samples[NUM_TRAINING * DIGIT_WIDTH],
    LabelType training_labels[NUM_TRAINING],
    DigitType test_samples[NUM_TEST * DIGIT_WIDTH],
    LabelType test_labels[NUM_TEST]);

void populateOutput(LabelType result[NUM_TEST], LabelType expected[NUM_TEST], const char* filename);

#ifdef __cplusplus
}
#endif

#endif