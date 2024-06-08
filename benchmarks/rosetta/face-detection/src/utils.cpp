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

  std::ifstream input_file(argv[1]);
  if (!input_file.is_open()) 
  {
    std::cerr << "Failed to open input file: " << argv[1] << std::endl;
    exit(-1);
  }

  input_file.read((char*)Data, IMAGE_HEIGHT * IMAGE_WIDTH);
  input_file.close();
}
