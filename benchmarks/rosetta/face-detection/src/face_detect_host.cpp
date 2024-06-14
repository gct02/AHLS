/*===============================================================*/
/*                                                               */
/*                       face_detect.cpp                         */
/*                                                               */
/*     Main host function for the Face Detection application.    */
/*                                                               */
/*===============================================================*/

// other headers
#include "typedefs.h"
#include "iolib/populate_io.h"
#include "face_detect.h"

int main(int argc, char ** argv) 
{
  // input
  unsigned char input_image[240][320];

  // outputs
  int result_x[RESULT_SIZE];
  int result_y[RESULT_SIZE];
  int result_w[RESULT_SIZE];
  int result_h[RESULT_SIZE];
  int res_size = 0;

  populateInput(argv[1], input_image);
  face_detect(input_image, result_x, result_y, result_w, result_h, &res_size);
  populateOutput(res_size, result_x, result_y, result_w, result_h, input_image, argv[2]);

  return 0;
}

