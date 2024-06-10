#ifndef __SPAM_POPULATE_IO_H__
#define __SPAM_POPULATE_IO_H__

#include "../typedefs.h"

#ifdef __cplusplus
extern "C" {
#endif

void populateInput(const char* str_points_filepath, const char* str_labels_filepath, DataType data_points[DATA_SET_SIZE], LabelType labels[NUM_SAMPLES]);
void populateOutput(FeatureType* param_vector, DataType* data_points, LabelType* labels);

#ifdef __cplusplus
}
#endif

#endif