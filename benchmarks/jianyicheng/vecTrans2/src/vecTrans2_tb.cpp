#include "vecTrans2.h"
#include <stdlib.h>
#include <stdio.h>

unsigned short lfsr = 0xACE1u;
unsigned bit;

unsigned _rand()
{
	bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
	return lfsr =  (lfsr >> 1) | (bit << 15);
}


int main(void){
      int A[1024], b[1024];

      for(int j = 0; j < 1024; ++j){
        A[j] = j % 50-25;
        b[j] = _rand()%1024;
      }

      vecTrans2(A, b);
}
