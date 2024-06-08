/*===============================================================*/
/*                                                               */
/*                          utils.cpp                            */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include <string>
#include <cstdlib>
#include <cstdio>
#include <getopt.h>
#include <iostream>
#include <fstream>

#include "utils.h"

void print_usage(char* filename)
{
    printf("usage: %s in_dataset_file\n", filename);
}

void parse_command_line_args(
    int argc,
    char** argv,
    unsigned char Data[IMAGE_HEIGHT][IMAGE_WIDTH]) 
{
  if (argc < 2) 
  {
    print_usage(argv[0]);
    exit(-1);
  }

  std::ifstream input_file(argv[1], std::ios::binary);
  if (!input_file.is_open()) 
  {
    std::cerr << "Failed to open input file: " << argv[1] << std::endl;
    exit(-1);
  }

  for (int i = 0; i < IMAGE_HEIGHT; i++)
  {
    for (int j = 0; j < IMAGE_WIDTH; j++)
    {
      input_file.read(reinterpret_cast<char*>(&Data[i][j]), sizeof(unsigned char));
    }
  }

  input_file.close();
}
