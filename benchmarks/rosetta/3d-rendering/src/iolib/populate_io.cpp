#include <stdio.h>
#include <stdlib.h>
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

void populateInput(const char* filename, Triangle_3D triangle_3ds[NUM_3D_TRI]) 
{
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Failed to open input file!\n");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < NUM_3D_TRI; i++) {
        fscanf(file, "%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu\n", 
               &triangle_3ds[i].x0, &triangle_3ds[i].y0, &triangle_3ds[i].z0, 
               &triangle_3ds[i].x1, &triangle_3ds[i].y1, &triangle_3ds[i].z1, 
               &triangle_3ds[i].x2, &triangle_3ds[i].y2, &triangle_3ds[i].z2);
    }
}

void populateOutput(bit8 output[MAX_X][MAX_Y], const char* filename)
{
    // Print result
    FILE* ofile = fopen(filename, "w");

    if (ofile == NULL) {
        printf("Failed to open output file!\n");
        exit(EXIT_FAILURE);
    }

    char* filenameNoExt = removeExt(filename);
    const char* ext = strrchr(filename, '.');

    int filenameLen = strlen(filename);
    char* rawFilename = (char*) malloc(filenameLen + 5);

    strcpy(rawFilename, filenameNoExt);
    strcat(rawFilename, "_raw");
    strcat(rawFilename, ext);

    FILE* rawOutput = fopen(rawFilename, "w");

    if (rawOutput == NULL) {
        printf("Failed to open output file!\n");
        exit(EXIT_FAILURE);
    }

    fprintf(ofile, "Image After Rendering: \n");
    for (int j = MAX_X - 1; j >= 0; j -- ) {
        for (int i = 0; i < MAX_Y; i ++ ) {
            fprintf(rawOutput, "%d ", output[i][j]);
            int pix = output[i][j];
            if (pix)
                fprintf(ofile, "1");
            else
                fprintf(ofile, "0");
        }
        fprintf(ofile, "\n");
        fprintf(rawOutput, "\n");
    }
    
    fclose(ofile);
    fclose(rawOutput);
}