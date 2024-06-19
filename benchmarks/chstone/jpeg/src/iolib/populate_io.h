#ifndef __JPEG_POPULATE_IO_H__
#define __JPEG_POPULATE_IO_H__

#include "../constants.h"

void populateInput(unsigned char* inputVector, int* jpegSize, const char* filename);
void populateOutput(unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE], const char* filename);

#endif // __JPEG_POPULATE_IO_H__