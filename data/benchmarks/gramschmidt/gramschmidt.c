/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */

/* gramschmidt.c: this file is part of PolyBench/C */

// #include <math.h>
// #include "gramshmidt.h"

// Main computational kernel.
// QR Decomposition with Modified Gram Schmidt:
// http://www.inf.ethz.ch/personal/gander/
void kernel_gramschmidt(double A[1000][1200], double R[1200][1200], double Q[1000][1200])
{
  int i, j, k;
  double nrm;

  kernel_gramschmidt_loop1:
  for (k = 0; k < 1200; k++)
  {
    nrm = 0.0;
    kernel_gramschmidt_loop1_1:
    for (i = 0; i < 1000; i++)
    {
      nrm += A[i][k] * A[i][k];
    }
    R[k][k] = sqrt(nrm);
    kernel_gramschmidt_loop1_2:
    for (i = 0; i < 1000; i++)
    {
      Q[i][k] = A[i][k] / R[k][k];
    }
    kernel_gramschmidt_loop1_2:
    for (j = k + 1; j < 1200; j++)
    {
      R[k][j] = 0.0;
      kernel_gramschmidt_loop1_2_1:
      for (i = 0; i < 1000; i++)
      {
        R[k][j] += Q[i][k] * A[i][j];
      }
      kernel_gramschmidt_loop1_2_2:
      for (i = 0; i < 1000; i++)
      {
        A[i][j] = A[i][j] - Q[i][k] * R[k][j];
      }
    }
  }
}