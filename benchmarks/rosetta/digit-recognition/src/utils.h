/*===============================================================*/
/*                                                               */
/*                           utils.h                             */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include "typedefs.h"

void print_usage(char* filename);

void parse_command_line_args(
  int argc, char** argv, 
  int& num_training, 
  int& num_test, 
  DigitType** training_data, 
  DigitType** test_data, 
  LabelType** expected);