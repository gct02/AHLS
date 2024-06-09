#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include "adpcm.h"

void print_usage()
{
  printf("Usage: adpcm input_samples_file\n");
}

void parse_command_line(int argc, char **argv, int** samples, int* num_samples)
{
  if (argc != 2)
  {
    print_usage();
    exit(1);
  }

  FILE* fp = fopen(argv[1], "r");
  if (fp == NULL)
  {
    printf("Error opening input file\n");
    exit(1);
  }

  *num_samples = 0;
  fscanf(fp, "%d", num_samples);
  if (*num_samples <= 0)
  {
    printf("Invalid number of samples\n");
    fclose(fp);
    exit(1);
  }

  *samples = (int*)malloc(*num_samples * sizeof(int));
  for (int i = 0; i < *num_samples; i++)
  {
    fscanf(fp, "%x", &(*samples)[i]);
  }

  fclose(fp);
}

int main(int argc, char **argv) {
  int* input_samples = NULL;
  int num_samples = 0;

  parse_command_line(argc, argv, &input_samples, &num_samples);

  if (input_samples == NULL)
  {
    printf("Error reading input samples\n");
    exit(1);
  }

  FILE* fp;
  fp = fopen("outputs.txt", "w");

  if (fp == NULL)
  {
    printf("Error opening output file\n");
    exit(1);
  }

  int* compressed = (int*)malloc(num_samples / 2 * sizeof(int));
  int* result = (int*)malloc(num_samples * sizeof(int));

  adpcm_main (input_samples, compressed, result, num_samples);

  for (int i = 0; i < num_samples; i++)
  {
    fprintf(fp, "%d ", result[i]);
  }

  free(input_samples);
  free(compressed);
  free(result);

  fclose(fp);
  return 0;
}