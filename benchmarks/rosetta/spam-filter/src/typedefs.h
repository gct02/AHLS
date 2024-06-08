/*===============================================================*/
/*                                                               */
/*                          typedefs.h                           */
/*                                                               */
/*              Constant definitions and typedefs.               */
/*                                                               */
/*===============================================================*/

#ifndef __TYPEDEFS_H__
#define __TYPEDEFS_H__

// dataset information
const int NUM_FEATURES  = 1024;
const int NUM_SAMPLES   = 5000;
const int NUM_TRAINING  = 4500;
const int NUM_TESTING   = 500;
const int STEP_SIZE     = 60000; 
const int NUM_EPOCHS    = 5;
const int DATA_SET_SIZE = NUM_FEATURES * NUM_SAMPLES;

// software version uses C++ built-in datatypes
typedef float FeatureType;
typedef float DataType;
typedef unsigned char LabelType;
// and uses math functions to compute sigmoid values
// no need to declare special datatype for sigmoid

#define PAR_FACTOR 32

#endif