/*===============================================================*/
/*                                                               */
/*                          utils.cpp                            */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include <cstdio>
#include <getopt.h>
#include <stdlib.h>
#include <fstream>
#include <iostream>
#include <string>

#include "utils.h"

void print_usage(char* filename)
{
    printf("usage: %s -t training_samples -l training_labels -s test_samples -e test_labels\n", filename);
}

void parse_command_line_args(
  int argc, char** argv, 
  int& num_training, 
  int& num_test, 
  DigitType** training_data, 
  DigitType** test_data,
  LabelType** training_labels,
  LabelType** expected)
{
  int c = 0;
  std::string training_data_filename, test_data_filename, training_labels_filename, expected_filename;

  while ((c = getopt(argc, argv, "t:s:e:l:")) != -1) 
  {
    switch (c) 
    {
      case 't':
        training_data_filename = optarg;
        break;
      case 's':
        test_data_filename = optarg;
        break;
      case 'e':
        expected_filename = optarg;
        break;
      case 'l':
        training_labels_filename = optarg;
        break;
      case '?':
        if (optopt == 't' || optopt == 'e' || optopt == 's')
          fprintf (stderr, "Option -%c requires an argument.\n", optopt);
        else if (isprint (optopt))
          fprintf (stderr, "Unknown option `-%c'.\n", optopt);
        else
          fprintf (stderr, "Unknown option character `\\x%x'.\n", optopt);
        print_usage(argv[0]);
        exit(-1);
      default:
        print_usage(argv[0]);
        exit(-1);
    } // matching on arguments
  } // while args present

  if (training_data_filename.empty() || test_data_filename.empty() || expected_filename.empty())
  {
    print_usage(argv[0]);
    exit(-1);
  }

  // Open files
  std::ifstream training_data_file(training_data_filename.c_str());
  std::ifstream test_data_file(test_data_filename.c_str());
  std::ifstream expected_file(expected_filename.c_str());
  std::ifstream training_labels_file(training_labels_filename.c_str());

  if (!training_data_file.is_open() || !test_data_file.is_open() || !expected_file.is_open() || !training_labels_file.is_open())
  {
    printf("Error opening files\n");
    exit(-1);
  }

  // Read number of training and test samples
  training_data_file.read((char*)&num_training, sizeof(int));
  test_data_file.read((char*)&num_test, sizeof(int));

  if (num_training <= 0 || num_test <= 0)
  {
    printf("Invalid number of training or test samples\n");
    exit(-1);
  }

  // Allocate memory
  *training_data = new DigitType[num_training * DIGIT_WIDTH];
  *test_data = new DigitType[num_test * DIGIT_WIDTH];
  *training_labels = new LabelType[num_training];
  *expected = new LabelType[num_test];

  // Read training data
  for (int i = 0; i < num_training; i++)
  {
    for (int j = 0; j < DIGIT_WIDTH; j++)
    {
      training_data_file.read((char*)&(*training_data)[i * DIGIT_WIDTH + j], sizeof(DigitType));
    }
  }

  // Read test data
  for (int i = 0; i < num_test; i++)
  {
    for (int j = 0; j < DIGIT_WIDTH; j++)
    {
      test_data_file.read((char*)&(*test_data)[i * DIGIT_WIDTH + j], sizeof(DigitType));
    }
  }

  // Read training labels
  for (int i = 0; i < num_training; i++)
  {
    training_labels_file.read((char*)&(*training_labels)[i], sizeof(LabelType));
  }

  // Read expected results
  for (int i = 0; i < num_test; i++)
  {
    expected_file.read((char*)&(*expected)[i], sizeof(LabelType));
  }

  // Close files
  training_data_file.close();
  test_data_file.close();
  expected_file.close();
}
