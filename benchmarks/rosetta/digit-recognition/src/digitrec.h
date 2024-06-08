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
  const DigitType* training_set, 
  const DigitType* test_set, 
  const LabelType* training_labels,
  LabelType* results, 
  int num_test, 
  int num_training);

#endif
