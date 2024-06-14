#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "populate_io.h"

// data structure only used in this file
typedef struct DataSet_s 
{
  DataType* data_points;
  LabelType* labels;
  FeatureType* parameter_vector;
  size_t num_data_points;
  size_t num_features;
} DataSet;

char* removeExt(const char* filename) {
    if (filename == NULL) return NULL;

    char *retStr = (char*) malloc(strlen (filename) + 1);
    if (retStr == NULL) return NULL;

    char *lastExt;
    
    strcpy (retStr, filename);
    lastExt = strrchr (retStr, '.');
    if (lastExt != NULL)
        *lastExt = '\0';

    return retStr;
}

// sub-functions for result checking
// dot product
float dotProduct(FeatureType* param_vector, DataType* data_point_i, const size_t num_features)
{
  FeatureType result = 0.0f;

  for (int i = 0; i < num_features; i ++ )
    result += param_vector[i] * data_point_i[i];

  return result;
}

// predict
LabelType getPrediction(FeatureType* parameter_vector, DataType* data_point_i, size_t num_features, const double treshold = 0) 
{
  float parameter_vector_dot_x_i = dotProduct(parameter_vector, data_point_i, num_features);
  if (parameter_vector_dot_x_i > treshold)
    return 1;
  else
    return 0;
}

// compute error rate
double computeErrorRate(
    DataSet data_set,
    double& cumulative_true_positive_rate,
    double& cumulative_false_positive_rate,
    double& cumulative_error)
{
  size_t true_positives = 0, true_negatives = 0, false_positives = 0, false_negatives = 0;

  for (size_t i = 0; i < data_set.num_data_points; i++) 
  {
    LabelType prediction = getPrediction(data_set.parameter_vector, &data_set.data_points[i * data_set.num_features], data_set.num_features);
    if (prediction != data_set.labels[i])
    {
      if (prediction == 1)
        false_positives++;
      else
        false_negatives++;
    } 
    else 
    {
      if (prediction == 1)
        true_positives++;
      else
        true_negatives++;
    }
  }

  double error_rate = (double)(false_positives + false_negatives) / data_set.num_data_points;

  cumulative_true_positive_rate += (double)true_positives / (true_positives + false_negatives);
  cumulative_false_positive_rate += (double)false_positives / (false_positives + true_negatives);
  cumulative_error += error_rate;

  return error_rate;
}

void populateInput(const char* str_points_filepath, const char* str_labels_filepath, DataType data_points[DATA_SET_SIZE], LabelType labels[NUM_SAMPLES])
{
    FILE* data_file;
    FILE* label_file;

    data_file = fopen(str_points_filepath, "r");
    if (!data_file) {
        printf("Failed to open data file %s!\n", str_points_filepath);
        exit(1);
    }
    for (int i = 0; i < DATA_SET_SIZE; i++) {
        float tmp;
        fscanf(data_file, "%f", &tmp);
        data_points[i] = tmp;
    }
    fclose(data_file);

    label_file = fopen(str_labels_filepath, "r");
    if (!label_file) {
        printf("Failed to open label file %s!\n", str_labels_filepath);
        exit(1);
    }
    for (int i = 0; i < NUM_SAMPLES; i++) {
        int tmp;
        fscanf(label_file, "%d", &tmp);
        labels[i] = tmp;
    }
    fclose(label_file);
}

void populateOutput(FeatureType* param_vector, DataType* data_points, LabelType* labels, const char* filename) {
    FILE* ofile = fopen(filename, "w");

    if (ofile == NULL) {
        printf("Failed to open output file!\n");
        exit(EXIT_FAILURE);
    }

    char* filenameNoExt = removeExt(filename);
    const char* ext = strrchr(filename, '.');

    int filenameLen = strlen(filename);
    char* rawFilename = (char*) malloc(filenameLen + 5);

    strcpy(rawFilename, filenameNoExt);
    strcat(rawFilename, "_raw");
    strcat(rawFilename, ext);

    FILE* rawOutput = fopen(rawFilename, "w");

    if (rawOutput == NULL) {
        printf("Failed to open output file!\n");
        exit(EXIT_FAILURE);
    }

    fprintf(ofile, "\nmain parameter vector: \n");
    for(int i = 0; i < 30; i++)
      fprintf(ofile, "m[%d]: %f | ", i, param_vector[i]);

    fprintf(ofile, "\n\n");

    // Initialize benchmark variables
    double training_tpr = 0.0;
    double training_fpr = 0.0;
    double training_error = 0.0;
    double testing_tpr = 0.0;
    double testing_fpr = 0.0;
    double testing_error = 0.0;

    // Get Training error
    DataSet training_set;
    training_set.data_points = data_points;
    training_set.labels = labels;
    training_set.num_data_points = NUM_TRAINING;
    training_set.num_features = NUM_FEATURES;
    training_set.parameter_vector = param_vector;
    computeErrorRate(training_set, training_tpr, training_fpr, training_error);

    // Get Testing error
    DataSet testing_set;
    testing_set.data_points = &data_points[NUM_FEATURES * NUM_TRAINING];
    testing_set.labels = &labels[NUM_TRAINING];
    testing_set.num_data_points = NUM_TESTING;
    testing_set.num_features = NUM_FEATURES;
    testing_set.parameter_vector = param_vector;
    computeErrorRate(testing_set, testing_tpr, testing_fpr, testing_error);

    training_tpr *= 100.0;
    training_fpr *= 100.0;
    training_error *= 100.0;
    testing_tpr *= 100.0;
    testing_fpr *= 100.0;
    testing_error *= 100.0;

    fprintf(ofile, "Training TPR: %f\n", training_tpr);
    fprintf(ofile, "Training FPR: %f\n", training_fpr);
    fprintf(ofile, "Training Error: %f\n", training_error);
    fprintf(ofile, "Testing TPR: %f\n", testing_tpr);
    fprintf(ofile, "Testing FPR: %f\n", testing_fpr);
    fprintf(ofile, "Testing Error: %f\n", testing_error);
    fclose(ofile);

    fprintf(rawOutput, "%f %f %f %f %f %f\n", 
            training_tpr, training_fpr, training_error, 
            testing_tpr, testing_fpr, testing_error);
    fclose(rawOutput);
}