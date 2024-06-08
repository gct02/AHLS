/*===============================================================*/
/*                                                               */
/*                       rendering.h                             */
/*                                                               */
/*              Software version for 3D Rendering                */
/*                                                               */
/*===============================================================*/

#ifndef __RENDERING_H__
#define __RENDERING_H__

#include "typedefs.h"

void rendering(
    Triangle_3D* triangle_3ds, 
    bit8 output[MAX_X][MAX_Y], 
    int num_triangles);

#endif