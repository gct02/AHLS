#ifndef GSM_ADD_H
#define GSM_ADD_H

#include "gsm_private.h"

#define saturate(x) \
    ((x) < MIN_WORD ? MIN_WORD : (x) > MAX_WORD ? MAX_WORD : (x))

word gsm_add(word a, word b);
word gsm_mult(word a, word b);
word gsm_mult_r(word a, word b);
word gsm_abs(word a);
word gsm_norm(longword a);
word gsm_div(word num, word denum);

#endif // GSM_ADD_H