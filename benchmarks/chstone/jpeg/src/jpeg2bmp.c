#include "jpeg2bmp.h"

#include "jpeg_decode.h"

void jpeg2bmp(
    unsigned char inputVector[JPEG_MAX_SIZE], 
    int jpegSize, 
    unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE]) 
{
    // Buffer for reading JPEG file
    unsigned char JpegFileBuf[JPEG_FILE_SIZE];

    int outImageWidth, outImageHeight;
    int outCompVpos[RGB_NUM], outCompHpos[RGB_NUM];

    int main_result;

    for (int i = 0; i < jpegSize; i++) {
        JpegFileBuf[i] = inputVector[i];
    }
    jpeg_decode(JpegFileBuf, outputVector, outImageWidth, outImageHeight, outCompVpos, outCompHpos);
}