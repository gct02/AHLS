/*===============================================================*/
/*                                                               */
/*                        spam_filter.cpp                        */
/*                                                               */
/*      Main host function for the Spam Filter application.      */
/*                                                               */
/*===============================================================*/

#include <cstdio>
#include <cstdlib>

// other headers
#include "typedefs.h"
#include "iolib/populate_io.h"
#include "sgd.h"

int main(int argc, char *argv[]) 
{
  setbuf(stdout, NULL);

  DataType*    data_points  = new DataType[DATA_SET_SIZE];
  LabelType*   labels       = new LabelType  [NUM_SAMPLES];
  FeatureType* param_vector = new FeatureType[NUM_FEATURES];

  populateInput(argv[1], argv[2], data_points, labels);

  // reset parameter vector
  for (int i = 0; i < NUM_FEATURES; i++)
    param_vector[i] = 0;

  SgdLR(data_points, labels, param_vector);

  populateOutput(param_vector, data_points, labels);

  delete []data_points;
  delete []labels;
  delete []param_vector;

  return 0;
}