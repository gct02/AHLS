#ifndef __JPEG2BMP_H__
#define __JPEG2BMP_H__

#include "constants.h"

void jpeg2bmp(
    unsigned char inputVector[JPEG_MAX_SIZE], 
    int jpegSize, 
    unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE]);

#endif // __JPEG2BMP_H__