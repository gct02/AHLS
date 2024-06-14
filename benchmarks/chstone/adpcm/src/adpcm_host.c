#include "adpcm.h"
#include "iolib/populate_io.h"

int test_data[SIZE];
int compressed[SIZE/2]; 
int result[SIZE];

int main(int argc, char **argv) 
{
  populateInput(test_data, SIZE, argv[1]);
  adpcm_main (test_data, compressed, result);
  populateOutput(result, SIZE/2, argv[2]);

  return 0;
}