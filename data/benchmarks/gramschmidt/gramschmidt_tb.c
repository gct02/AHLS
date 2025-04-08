#include <stdio.h>
#include "gramshmidt.h"

// Array initialization.
void init_array(double A[1000][1200], double R[1200][1200], double Q[1000][1200]) 
{
  int i, j;

  for (i = 0; i < 1000; i++)
  {
    for (j = 0; j < 1200; j++) 
    {
      A[i][j] = (((double)((i * j) % 1000) / 1000) * 100) + 10;
      Q[i][j] = 0.0;
    }
  }
  for (i = 0; i < 1200; i++)
  {
    for (j = 0; j < 1200; j++)
    {
      R[i][j] = 0.0;
    }
  }
}

void print_array(double A[1000][1200], double R[1200][1200], double Q[1000][1200])
{
  int i, j;

  for (i = 0; i < 1000; i++)
  {
    for (j = 0; j < 1200; j++)
    {
      printf("%f ", A[i][j]);
    }
    printf("\n");
  }
  printf("\n");

  for (i = 0; i < 1200; i++)
  {
    for (j = 0; j < 1200; j++)
    {
      printf("%f ", R[i][j]);
    }
    printf("\n");
  }
  printf("\n");

  for (i = 0; i < 1000; i++)
  {
    for (j = 0; j < 1200; j++)
    {
      printf("%f ", Q[i][j]);
    }
    printf("\n");
  }
}

int main(int argc, char** argv)
{
  double A[1000][1200];
  double R[1200][1200];
  double Q[1000][1200];

  init_array(A, R, Q);
  kernel_gramschmidt(A, R, Q);

  print_array(A, R, Q);
  return 0;
}