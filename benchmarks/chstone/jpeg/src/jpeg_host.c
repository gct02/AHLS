#include "iolib/populate_io.h"
#include "jpeg2bmp.h"

int main(int argc, char** argv) 
{
    int jpegSize = 0;
    unsigned char inputVector[JPEG_MAX_SIZE];
    unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE];
    int main_result;

    // Read the input data (which is a vector of jpegSize values, 
    // representing the pixels of the image)
    populateInput(inputVector, &jpegSize, argv[1]);

    // Call the HLS top function
    jpeg2bmp(inputVector, jpegSize, outputVector);

    // Write the output data (which is a vector of RGB_NUM vectors of BMP_OUT_SIZE values,
    // representing the pixels of the image)
    populateOutput(outputVector, argv[2]);

    return 0;
}