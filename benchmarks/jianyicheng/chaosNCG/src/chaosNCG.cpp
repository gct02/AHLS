#include "chaosNCG.h"

void chaosNCG(int I, int bo, int M[2000], int X, int Y, int params0, int params1, int buffer[2000]){
	int bound = 2*bo;
	int p0 = params0;
	int p1 = params1;
	for (int i = 0; i < bound; i += 2) {
	  int a = M[I+i-2], b = M[I+i+2];
	  int b0 = buffer[a], b1 = buffer[b];
      int pp0, pp1, out0, out1;
      g(b0, b1, p0, p1, X, Y, &pp0, &pp1, &out0, &out1);
	  buffer[a] = out0;
      p0 = pp0;
      p1 = pp1;
	  buffer[b] = out1;
	}
}

