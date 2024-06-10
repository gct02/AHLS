/*===============================================================*/
/*                                                               */
/*                         digitrec.h                            */
/*                                                               */
/*              Software version for digit recognition           */
/*                                                               */
/*===============================================================*/

#ifndef __DIGITREC_H__
#define __DIGITREC_H__

#include "typedefs.h"

void DigitRec(
  const DigitType training_samples[NUM_TRAINING * DIGIT_WIDTH], 
  const DigitType test_set[NUM_TEST * DIGIT_WIDTH],
  const LabelType training_labels[NUM_TRAINING],
  LabelType results[NUM_TEST]);

#endif
