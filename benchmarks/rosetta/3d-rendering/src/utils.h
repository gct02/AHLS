/*===============================================================*/
/*                                                               */
/*                           utils.h                             */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include "typedefs.h"

void print_usage(char* filename);

void parse_command_line_args(int argc, char** argv, int& num_triangles, Triangle_3D** triangles);

