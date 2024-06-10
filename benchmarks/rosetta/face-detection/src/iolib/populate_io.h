#ifndef __FACE_DETECT_POPULATE_IO_H__
#define __FACE_DETECT_POPULATE_IO_H__

#include "../typedefs.h"

#ifdef __cplusplus
extern "C" {
#endif

void populateInput(const char* filename, unsigned char input_image[IMAGE_HEIGHT][IMAGE_WIDTH]);
void populateOutput(
    int result_size, 
    int result_x[RESULT_SIZE], 
    int result_y[RESULT_SIZE], 
    int result_w[RESULT_SIZE],  
    int result_h[RESULT_SIZE],
    unsigned char Data[IMAGE_HEIGHT][IMAGE_WIDTH]);

#ifdef __cplusplus
}
#endif

#endif