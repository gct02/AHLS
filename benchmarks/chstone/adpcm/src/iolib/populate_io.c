#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "populate_io.h"

char* removeExt(const char* filename) {
    if (filename == NULL) return NULL;

    char *retStr = (char*) malloc(strlen (filename) + 1);
    if (retStr == NULL) return NULL;

    char *lastExt;
    
    strcpy (retStr, filename);
    lastExt = strrchr (retStr, '.');
    if (lastExt != NULL)
        *lastExt = '\0';

    return retStr;
}

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

    char* fileNameNoExt = removeExt(fileName);
    const char* ext = strrchr(fileName, '.');

    int fileNameLen = strlen(fileName);
    char* rawFileName = (char*) malloc(fileNameLen + 5);

    strcpy(rawFileName, fileNameNoExt);
    strcat(rawFileName, "_raw");
    strcat(rawFileName, ext);

    FILE* rawOutput = fopen(rawFileName, "w");

    for (int i = 0; i < numElts; i++) {
        fprintf (outputFile, "%d\n", outputVector[i]); 
        fprintf (rawOutput, "%d\n", outputVector[i]);
    }
     
    fclose(outputFile);
    fclose(rawOutput);
}
