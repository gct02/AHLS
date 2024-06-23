# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/populate_io.h" 1



# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/../constants.h" 1
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/populate_io.h" 2

void populateInput(unsigned char* inputVector, int* jpegSize, const char* filename);
void populateOutput(unsigned char outputVector[3][(128 * 128)], const char* filename);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.h" 1





void jpeg2bmp(
    unsigned char inputVector[6496],
    int jpegSize,
    unsigned char outputVector[3][(128 * 128)]);
# 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2

int main(int argc, char** argv)
{
    int jpegSize = 0;
    unsigned char inputVector[6496];
    unsigned char outputVector[3][(128 * 128)];
    int main_result;



    populateInput(inputVector, &jpegSize, argv[1]);


    jpeg2bmp(inputVector, jpegSize, outputVector);



    populateOutput(outputVector, argv[2]);

    return 0;
}
