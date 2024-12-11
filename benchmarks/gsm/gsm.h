#ifndef GSM_H
#define GSM_H

#include "gsm_private.h"

/* top-level function */
/* s: 0..159 signals IN/OUT */
/* LARc: 0..7 LARc's OUT    */
void Gsm_LPC_Analysis(word *s, word *LARc);

#endif // GSM_H