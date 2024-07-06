#ifndef __DFSIN_POPULATE_IO_H__
#define __DFSIN_POPULATE_IO_H__

#include "../softfloat.h"

#define N 36

void populateInput(float64 inputVector[N], const char* filename);
void populateOutput(float64 outputVector[N], const char* filename);

#endif