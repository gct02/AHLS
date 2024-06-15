/*===============================================================*/
/*                                                               */
/*                       3d_rendering.cpp                        */
/*                                                               */
/*      Main host function for the 3D Rendering application.     */
/*                                                               */
/*===============================================================*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// other headers
#include "iolib/populate_io.h"
#include "typedefs.h"
#include "rendering.h"

int main(int argc, char** argv)
{
  int num_3d_tri = atoi(argv[2]);
  Triangle_3D* triangle_3ds = NULL;
  bit8 output[MAX_X][MAX_Y];

  populateInput(argv[1], &triangle_3ds, num_3d_tri);
  rendering(triangle_3ds, output, num_3d_tri);
  populateOutput(output, argv[3]);

  return 0;
}