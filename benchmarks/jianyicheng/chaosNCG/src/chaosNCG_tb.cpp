#include "chaosNCG.h"
#include <stdio.h>
#include <stdlib.h>

unsigned short lfsr = 0xACE1u;
unsigned bit;

unsigned _rand()
{
	bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
	return lfsr =  (lfsr >> 1) | (bit << 15);
}

int main(){
	int I = 10, bo = 900, M[2000], X = 250, Y = 250, params[2], buffer[2000];
	params[0] = 127;
	params[1] = 41;
	for (int i = 0; i < 2000; i++){
		M[i] = _rand()%2000;
		buffer[i] = _rand()%2000;
	}

	chaosNCG(I, bo, M, X, Y, 127, 41, buffer);
	return 0;
}

