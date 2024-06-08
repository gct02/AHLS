/*===============================================================*/
/*                                                               */
/*                       3d_rendering.cpp                        */
/*                                                               */
/*      Main host function for the 3D Rendering application.     */
/*                                                               */
/*===============================================================*/

// standard C/C++ headers
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <string>
#include <time.h>
#include <sys/time.h>

// other headers
#include "utils.h"
#include "typedefs.h"
#include "check_result.h"

# include "rendering.h"

int main(int argc, char ** argv) 
{
  printf("3D Rendering Application\n");

  // timers
  struct timeval start, end;

  // Parse input data
  Triangle_3D* triangle_3ds = NULL;
  int num_triangles = 0;
  parse_command_line_args(argc, argv, num_triangles, &triangle_3ds);

  if (num_triangles <= 0 || triangle_3ds == NULL) 
  {
    printf("Error: invalid number of triangles\n");
    return EXIT_FAILURE;
  }
  // output
  bit8 output[MAX_X][MAX_Y];
  // run and time sw function
  gettimeofday(&start, 0);
  rendering(triangle_3ds, output, num_triangles);
  gettimeofday(&end, 0);

  // check results
  printf("Checking results:\n");
  check_results(output);
 
  // print time
  long long elapsed = (end.tv_sec - start.tv_sec) * 1000000LL + end.tv_usec - start.tv_usec;   
  printf("elapsed time: %lld us\n", elapsed);

  return EXIT_SUCCESS;
}