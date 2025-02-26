/*===============================================================*/
/*                                                               */
/*                        typedefs.h                             */
/*                                                               */
/*        Defines types and constants for host function          */
/*                                                               */
/*===============================================================*/

#ifndef OPTICAL_FLOW_H
#define OPTICAL_FLOW_H

const int MAX_HEIGHT = 436;
const int MAX_WIDTH = 1024;

// basic typedefs
typedef float pixel_t;
typedef float outer_pixel_t;
typedef float vel_pixel_t;

typedef struct{
	pixel_t x;
	pixel_t y;
	pixel_t z;
}gradient_t;

typedef struct{
    outer_pixel_t val[6];
}outer_t; 

typedef struct{
    outer_pixel_t val[6];
}tensor_t;

typedef struct{
    vel_pixel_t x;
    vel_pixel_t y;
}velocity_t;

// convolution filters
const int GRAD_WEIGHTS[] =  {1,-8,0,8,-1};
const pixel_t GRAD_FILTER[] = {0.0755, 0.133, 0.1869, 0.2903, 0.1869, 0.133, 0.0755};
const pixel_t TENSOR_FILTER[] = {0.3243, 0.3513, 0.3243};

// top-level function
void optical_flow(pixel_t frame0[MAX_HEIGHT][MAX_WIDTH],
                  pixel_t frame1[MAX_HEIGHT][MAX_WIDTH],
                  pixel_t frame2[MAX_HEIGHT][MAX_WIDTH],
                  pixel_t frame3[MAX_HEIGHT][MAX_WIDTH],
                  pixel_t frame4[MAX_HEIGHT][MAX_WIDTH],
                  velocity_t outputs[MAX_HEIGHT][MAX_WIDTH]);

#endif