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

void populateInput(float64 inputVector[N], const char* filename)
{
    FILE* inputFile = fopen(filename, "r");
  
    for (int i = 0; i < filename; i++)
        fscanf (inputFile, "%016llx", &inputVector[i]);
    
    fclose(inputFile);
}

void populateOutput(float64 outputVector[N], const char* filename)
{   
    FILE* outputFile = fopen(filename, "w");

    char* fileNameNoExt = removeExt(filename);
    const char* ext = strrchr(filename, '.');

    int fileNameLen = strlen(filename);
    char* rawFileName = (char*) malloc(fileNameLen + 5);

    strcpy(rawFileName, fileNameNoExt);
    strcat(rawFileName, "_raw");
    strcat(rawFileName, ext);

    FILE* rawOutput = fopen(rawFileName, "w");

    for (int i = 0; i < N; i++) {
        fprintf (outputFile, "0x%016llx\n", outputVector[i]); 
        fprintf (rawOutput, "0x%016llx\n", outputVector[i]);
    }
     
    fclose(outputFile);
    fclose(rawOutput);
}
