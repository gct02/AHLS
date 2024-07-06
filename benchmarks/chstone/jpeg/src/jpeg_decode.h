#ifndef __JPEG_DECODE_H__
#define __JPEG_DECODE_H__

#include "constants.h"

void jpeg_decode(
    unsigned char* readBuf,
    unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE],
    int OutData_image_width,
    int OutData_image_height,
    int OutData_comp_vpos[RGB_NUM],
    int OutData_comp_hpos[RGB_NUM]);

#endif // __JPEG_DECODE_H__