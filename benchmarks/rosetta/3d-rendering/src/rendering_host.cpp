/*===============================================================*/
/*                                                               */
/*                       3d_rendering.cpp                        */
/*                                                               */
/*      Main host function for the 3D Rendering application.     */
/*                                                               */
/*===============================================================*/

// other headers
#include "iolib/populate_io.h"
#include "typedefs.h"
#include "rendering.h"

int main(int argc, char** argv)
{
  Triangle_3D triangle_3ds[NUM_3D_TRI]; // input
  bit8 output[MAX_X][MAX_Y]; // output

  populateInput(argv[1], triangle_3ds);
  rendering(triangle_3ds, output);
  populateOutput(output, argv[2]);

  return 0;
}