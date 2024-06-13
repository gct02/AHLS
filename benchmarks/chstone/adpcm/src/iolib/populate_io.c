#include <stdlib.h>
#include <stdio.h>

void populateInput (int *inputVector, int numElts, const char *fileName)
{
    FILE* inputFile = fopen(fileName, "r");  
  
    int i;
    for (i = 0; i < numElts; i++)
        fscanf (inputFile, "%x", &inputVector[i]);
    
    fclose(inputFile);
}

void populateOutput (int *outputVector, int numElts)
{   
    FILE* outputFile = fopen("raw_output.txt", "w");

    int i;
    for (i = 0; i < numElts; i++)
        fprintf (outputFile, "%x\n", outputVector[i]); 
     
    fclose(outputFile);
}
