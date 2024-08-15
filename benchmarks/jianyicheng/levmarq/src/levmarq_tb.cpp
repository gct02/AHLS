#include "levmarq.h"
#include <stdlib.h>
#include <stdio.h>

unsigned short lfsr = 0xACE1u;
unsigned bit;

unsigned _rand()
{
	bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
	return lfsr =  (lfsr >> 1) | (bit << 15);
}

int main(){
	int ny;
	float dysq[1024];
	int npar;
	float g[128];
	float weight;
	float d[128];
	float y[1024];
	float h[16384];

	ny = 1024;
	npar = 128;
	for (int i = 0; i < 1024; i++){
		dysq[i] = _rand();
		y[i] = _rand();
	}

	for (int i = 0; i < 128; i++){
		g[i] = _rand();
		d[i] = 0.0f;
	}

	for (int i = 0; i < 16384; i++){
		h[i] = 0.0f;
	}

	levmarq(1, ny, dysq,  npar,  g,  d,  y,  h);
	return 0;
}
