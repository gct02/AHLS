/*===============================================================*/
/*                                                               */
/*                    digit_recognition.cpp                      */
/*                                                               */
/*   Main host function for the Digit Recognition application.   */
/*                                                               */
/*===============================================================*/

// other headers
#include "typedefs.h"
#include "digitrec.h"
#include "iolib/populate_io.h"

int main(int argc, char ** argv)
{
  DigitType training_samples[NUM_TRAINING * DIGIT_WIDTH];
  DigitType testing_samples[NUM_TEST * DIGIT_WIDTH];
  LabelType training_labels[NUM_TRAINING];
  LabelType test_labels[NUM_TEST];
  LabelType result[NUM_TEST];

  populateInput(argv[1], argv[2], argv[3], argv[4], training_samples, training_labels, testing_samples, test_labels);
  DigitRec(training_samples, testing_samples, training_labels, result);
  populateOutput(result, test_labels);

  return 0;
}
