#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "populate_io.h"

void populateInput (int *inputVector, int numElts, const char *fileName)
{
    FILE* inputFile = fopen(fileName, "r");  
  
    for (int i = 0; i < numElts; i++)
        fscanf (inputFile, "%x", &inputVector[i]);
    
    fclose(inputFile);
}

void populateOutput (int *outputVector, int numElts, const char *fileName)
{   
    FILE* outputFile = fopen(fileName, "w");

    for (int i = 0; i < numElts; i++)
        fprintf (outputFile, "%x\n", outputVector[i]); 
     
    fclose(outputFile);
}
