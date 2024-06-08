/*===============================================================*/
/*                                                               */
/*                    digit_recognition.cpp                      */
/*                                                               */
/*   Main host function for the Digit Recognition application.   */
/*                                                               */
/*===============================================================*/

// standard C/C++ headers
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <string>
#include <time.h>
#include <sys/time.h>

#include "digitrec.h"

// other headers
#include "utils.h"
#include "typedefs.h"
#include "check_result.h"

int main(int argc, char ** argv)
{
  printf("Digit Recognition Application\n");

  // timers
  struct timeval start, end;

  int num_test = 0, num_training = 0;
  DigitType* training_data = NULL;
  DigitType* testing_data = NULL;
  LabelType* training_labels = NULL;
  LabelType* expected = NULL;

  // parse command line arguments
  parse_command_line_args(argc, argv, num_training, num_test, &training_data, &testing_data, &training_labels, &expected);

  if (num_training <= 0 || num_test <= 0 || training_data == NULL || testing_data == NULL || expected == NULL) 
  {
    printf("Invalid input data\n");
    return EXIT_FAILURE;
  }

  // create space for the result
  LabelType* result = new LabelType[num_test];

  // software version
  gettimeofday(&start, NULL);
  DigitRec(training_data, testing_data, training_labels, result, num_test, num_training);
  gettimeofday(&end, NULL);

  // check results  
  printf("Checking results:\n");
  check_results(result, expected, num_test);
    
  // print time
  long long elapsed = (end.tv_sec - start.tv_sec) * 1000000LL + end.tv_usec - start.tv_usec;   
  printf("elapsed time: %lld us\n", elapsed);

  delete []result;

  return EXIT_SUCCESS;
}
