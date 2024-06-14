#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../image.h"
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

void populateInput(const char* filename, unsigned char input_image[IMAGE_HEIGHT][IMAGE_WIDTH])
{
    FILE* file = fopen(filename, "rb");
    if (file == NULL) {
        printf("Error: could not open file %s\n", filename);
        exit(1);
    }

    for (int i = 0; i < IMAGE_HEIGHT; i++)
        for (int j = 0; j < IMAGE_WIDTH; j++)
            fread(&input_image[i][j], sizeof(unsigned char), 1, file);
        
    fclose(file);
}

void populateOutput(
    int result_size, 
    int result_x[RESULT_SIZE], 
    int result_y[RESULT_SIZE], 
    int result_w[RESULT_SIZE],  
    int result_h[RESULT_SIZE],
    unsigned char Data[IMAGE_HEIGHT][IMAGE_WIDTH],
    const char* filename)
{
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

    fprintf(ofile, "\nresult_size = %d\n", result_size);

    MyRect result[RESULT_SIZE];

    for (int j = 0; j < RESULT_SIZE; j++) {
        result[j].x = result_x[j];
        result[j].y = result_y[j];
        result[j].width = result_w[j];
        result[j].height = result_h[j];
    }

    for( int i=0 ; i < result_size ; i++ ) {
        fprintf(ofile, "\n [Test Bench (main) ] detected rects: ");
        fprintf(ofile, "%d %d %d %d\n", result[i].x, result[i].y, result[i].width, result[i].height);
        fprintf(rawOutput, "%d %d %d %d\n", result[i].x, result[i].y, result[i].width, result[i].height);
    }
    fclose(ofile);
    fclose(rawOutput);
   
    printf("\n-- saving output image [Start] --\r\n"); 

    // Draw the rectangles onto the images and save the outputs.
    for(int i = 0; i < result_size ; i++ ) {
        MyRect r = result[i];
        drawRectangle(Data, r);
    }

    int flag = writePgm("output_image.pgm", Data); 

    printf("\n-- saving output image [Done] --\r\n");
}