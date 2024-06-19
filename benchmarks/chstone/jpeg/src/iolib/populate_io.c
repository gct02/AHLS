#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "populate_io.h"

char* removeExt(const char* fileName) {
    if (fileName == NULL) return NULL;

    char *retStr = (char*) malloc(strlen (fileName) + 1);
    if (retStr == NULL) return NULL;

    char *lastExt;
    
    strcpy (retStr, fileName);
    lastExt = strrchr (retStr, '.');
    if (lastExt != NULL)
        *lastExt = '\0';

    return retStr;
}

void populateInput (unsigned char *inputVector, int* jpegSize, const char *filename)
{
    FILE* inputFile = fopen(filename, "r");    
    fscanf (inputFile, "%i", jpegSize); 
    int i;
    for (i = 0; i < *jpegSize; i++)
        fscanf (inputFile, "%hhu", &inputVector[i]);
    fclose(inputFile);
}


void populateOutput (unsigned char outputVector[RGB_NUM][BMP_OUT_SIZE], const char *filename)
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

    int i, j;
    for (i = 0; i < RGB_NUM; i++){
		for (j = 0; j < BMP_OUT_SIZE; j++){
            fprintf (outputFile, "%hhu\n", outputVector[i][j]); 
            fprintf (rawOutput, "%hhu\n", outputVector[i][j]); 
        }
    }     
    fclose(outputFile);
    fclose(rawOutput);
}