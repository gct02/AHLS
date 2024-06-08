/*===============================================================*/
/*                                                               */
/*                          utils.cpp                            */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include <string>
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <iostream>
#include <fstream>

#include "utils.h"

#define CSIM_DEBUG

void print_usage(char* filename)
{
  printf("usage: %s input_triangles_file\n", filename);
}

void parse_command_line_args(int argc, char** argv, int& num_triangles, Triangle_3D** triangles)
{
  num_triangles = 0;
  
  if (argc < 2)
  {
    print_usage(argv[0]);
    exit(-1);
  }

  #ifdef CSIM_DEBUG
  std::cout << "Reading input file: " << argv[1] << std::endl;
  #endif

  // Open the input file
  std::ifstream infile(argv[1]);
  if (!infile.is_open())
  {
    printf("Error: failed to open input file\n");
    exit(-1);
  }

  infile >> num_triangles;

  #ifdef CSIM_DEBUG
  std::cout << "Number of triangles: " << num_triangles << std::endl;
  #endif

  if (num_triangles <= 0)
  {
    printf("Error: invalid number of triangles\n");
    exit(-1);
  }

  *triangles = new Triangle_3D[num_triangles];
  int x0, y0, z0, x1, y1, z1, x2, y2, z2;

  #ifdef CSIM_DEBUG
  std::cout << "Reading triangle data..." << std::endl;
  #endif

  for (int i = 0; i < num_triangles; i++)
  {
    infile >> x0 >> y0 >> z0 >> x1 >> y1 >> z1 >> x2 >> y2 >> z2;
    (*triangles)[i].x0 = x0;
    (*triangles)[i].y0 = y0;
    (*triangles)[i].z0 = z0;
    (*triangles)[i].x1 = x1;
    (*triangles)[i].y1 = y1;
    (*triangles)[i].z1 = z1;
    (*triangles)[i].x2 = x2;
    (*triangles)[i].y2 = y2;
    (*triangles)[i].z2 = z2;
  }

  infile.close();
}