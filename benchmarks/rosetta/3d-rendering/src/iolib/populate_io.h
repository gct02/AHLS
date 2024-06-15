#ifndef __RENDERING_POPULATE_IO_H__
#define __RENDERING_POPULATE_IO_H__

#include "../typedefs.h"

#ifdef __cplusplus
extern "C" {
#endif

void populateInput(const char* filename, Triangle_3D** triangle_3ds, int num_3d_tri);
void populateOutput(bit8 output[MAX_X][MAX_Y], const char* filename);

#ifdef __cplusplus
}
#endif

#endif