# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm.h" 1





void
adpcm_main (const int input_samples[8000], int compressed[8000/2], int result[8000]);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/iolib/populate_io.h" 1



void populateInput (int *inputVector, int numElts, const char *fileName);
void populateOutput (int *outputVector, int numElts, const char *fileName);
# 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2

int test_data[8000];
int compressed[8000/2];
int result[8000];

int main(int argc, char **argv)
{
  populateInput(test_data, 8000, argv[1]);
  adpcm_main (test_data, compressed, result);
  populateOutput(result, 8000/2, argv[2]);

  return 0;
}
