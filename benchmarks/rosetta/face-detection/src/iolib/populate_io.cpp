#include <stdio.h>
#include <stdlib.h>
#include "../image.h"
#include "populate_io.h"

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
    unsigned char Data[IMAGE_HEIGHT][IMAGE_WIDTH])
{
    FILE* ofile = fopen("output.txt", "w");

    if (ofile == NULL) {
        printf("Error: could not open output file\n");
        exit(1);
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
    }
    fclose(ofile);
   
    printf("\n-- saving output image [Start] --\r\n"); 

    // Draw the rectangles onto the images and save the outputs.
    for(int i = 0; i < result_size ; i++ ) {
        MyRect r = result[i];
        drawRectangle(Data, r);
    }

    int flag = writePgm("output_image.pgm", Data); 

    printf("\n-- saving output image [Done] --\r\n");
}